/* * OSS-7 - An opensource implementation of the DASH7 Alliance Protocol for ultra
 * lowpower wireless sensor communication
 *
 * Copyright 2015 University of Antwerp
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*!
 * \file shell.c
 * \author glenn.ergeerts@uantwerpen.be
 */


#include "shell.h"


#define CMD_BUFFER_SIZE 256
#define CMD_HANDLER_REGISTRATIONS_COUNT 3 // TODO configurable using cmake

#include "hwuart.h"
#include "scheduler.h"
#include "hwsystem.h"
#include "debug.h"


static uint8_t cmd_buffer[CMD_BUFFER_SIZE] = { 0 };
static fifo_t cmd_fifo;
static cmd_handler_registration_t cmd_handler_registrations[CMD_HANDLER_REGISTRATIONS_COUNT];

static void process_shell_cmd(char cmd)
{
    switch(cmd)
    {
        case 'R':
            hw_reset();
            break;
        default:
            // TODO log
            break;
    }
}

static cmd_handler_t get_cmd_handler_callback(int8_t id)
{
    for(uint8_t i = 0; i < CMD_HANDLER_REGISTRATIONS_COUNT; i++)
    {
        if(cmd_handler_registrations[i].id == id)
            return cmd_handler_registrations[i].cmd_handler_callback;
    }

    assert(false);
}

// TODO doc
// ATx\r : shell command, where x is a char which maps to a command.
// List of supported commands:
// - R: reboot device
// AT$<command handler id> : command to be handled by the command handler specified. The command handler id is a byte < 65 (non ASCII)
// The handlers are passed the command fifo (including the header) and are responsible for pop()-ing the bytes which are processed by the handler.
// When the fifo does not yet contain a full command which can be processed by the specific handler nothing should be popped and the handler will
// called again later when more data is received.
static void process_cmd_fifo()
{
    if(fifo_get_size(&cmd_fifo) >= SHELL_CMD_HEADER_SIZE)
    {
        uint8_t cmd_header[SHELL_CMD_HEADER_SIZE];
        fifo_peek(&cmd_fifo, cmd_header, 0, SHELL_CMD_HEADER_SIZE);
        if(cmd_header[0] != 'A' || cmd_header[1] != 'T')
        {
            // unexpected data, pop and return
            // TODO log?
            fifo_pop(&cmd_fifo, cmd_header, 1);
            sched_post_task(&process_cmd_fifo);
            return;
        }

        if(cmd_header[2] != '$')
        {
            process_shell_cmd(cmd_header[2]);
            fifo_pop(&cmd_fifo, cmd_header, SHELL_CMD_HEADER_SIZE);
        }
        else
        {
            get_cmd_handler_callback(cmd_header[3])(&cmd_fifo);
        }

        sched_post_task(&process_cmd_fifo);
    }
}

static void uart_rx_cb(char data)
{
    error_t err;
    err = fifo_put(&cmd_fifo, &data, 1); assert(err == SUCCESS);
    if(!sched_is_scheduled(&process_cmd_fifo))
        sched_post_task(&process_cmd_fifo);
}

void shell_init()
{
    for(uint8_t i = 0; i < CMD_HANDLER_REGISTRATIONS_COUNT; i++)
    {
        cmd_handler_registrations[i].id = -1;
        cmd_handler_registrations[i].cmd_handler_callback = NULL;
    }

    fifo_init(&cmd_fifo, cmd_buffer, sizeof(cmd_buffer));

    uart_set_rx_interrupt_callback(&uart_rx_cb);
    uart_rx_interrupt_enable(true);

    sched_register_task(&process_cmd_fifo);
}

void shell_register_handler(cmd_handler_registration_t handler_registration)
{
    assert(handler_registration.id < 64);
    assert(handler_registration.cmd_handler_callback != NULL);

    int8_t empty_index = -1;
    for(uint8_t i = 0; i < CMD_HANDLER_REGISTRATIONS_COUNT; i++)
    {
        // always loop over all values to check if already registered
        int8_t current_id = cmd_handler_registrations[i].id;
        if(current_id == -1 && empty_index == -1)
            empty_index = i;

        assert(current_id != handler_registration.id); // already registered
    }

    assert(empty_index != -1); // no empty spot found

    cmd_handler_registrations[empty_index] = handler_registration;
}

void shell_return_output(shell_cmd_handler_id_t origin, uint8_t *data, uint8_t length)
{
    // TODO queue and shedule a task to do the actual transmit
    uart_transmit_data(origin);
    uart_transmit_message(data, length);
}