/*
 * The PHY layer API
 *  Created on: Nov 23, 2012
 *  Authors:
 * 		maarten.weyn@artesis.be
 *  	glenn.ergeerts@artesis.be
 */
#include "dll.h"
#include "../log.h"
#include <string.h>

static dll_rx_callback_t dll_rx_callback;
static dll_tx_callback_t dll_tx_callback;

dll_rx_res_t dll_res;

u8 timeout_listen; // TL


Dll_State_Enum dll_state;

static bool check_subnet(u8 device_subnet, u8 frame_subnet)
{
	if (frame_subnet & 0xF0 != 0xF0)
	{
		if (frame_subnet & 0xF0 != device_subnet & 0xF0)
			return 0;
	}

	if (frame_subnet & device_subnet & 0x0F != device_subnet & 0x0F)
			return 0;

	return 1;
}

static void phy_tx_callback()
{
	log_print_string("TX OK", 5);
}

static void phy_rx_callback(phy_rx_res_t* res)
{
	// Data Link Filtering

	// CRC Validation
	if (!res->crc_ok)
	{
		log_print_string("CRC ERROR", 9);
		return;
	}

	// Subnet Matching do not parse it yet
	if (dll_state == DllStateScanBackgroundFrame)
	{
		if (!check_subnet(0xFF, res->data[0])) // TODO: get device_subnet from datastore
		{
			log_print_string("Subnet mismatch", 15);
			return;
		}
	} else if (dll_state == DllStateScanForegroundFrame)
	{
		if (!check_subnet(0xFF, res->data[3])) // TODO: get device_subnet from datastore
		{
			log_print_string("Subnet mismatch", 15);
			return;
		}
	} else
	{
		log_print_string("You fool, you can't be here", 27);
	}

	// Optional Link Quality Assessment

	// parse packet
	dll_res.rssi = res->rssi;
	dll_res.lqi = res->lqi;

	if (dll_state == DllStateScanBackgroundFrame)
	{
		dll_background_frame_t frame;
		frame.subnet = res->data[0];
		memcpy(frame.payload, res->data+1, 4);

		dll_res.frame_type = FrameTypeBackgroundFrame;
		dll_res.frame = &frame;
	} else
	{
		dll_foreground_frame_t frame;
		frame.length = res->data[0];

		dll_foreground_frame_header_t frame_header;
		frame_header.tx_eirp = res->data[1] * 0.5 - 40;
		frame_header.subnet = res->data[2];
		frame_header.frame_ctl = res->data[3];

		frame.frame_header = &frame_header;

		u8 data_pointer = 4;

		if (frame_header.frame_ctl & 0x80) // Listen
			timeout_listen = 10;
		else
			timeout_listen = 0;

		if (frame_header.frame_ctl & 0x40) // DLLS present
		{
			// TODO parse DLLS Header
			frame.dlls_header = NULL;
		} else {
			frame.dlls_header = NULL;
		}

		if (frame_header.frame_ctl & 0x20) // Enable Addressing
		{
			// Address Control Header
			dll_foreground_frame_address_ctl_header_t address_ctl;
			address_ctl.dialogId = res->data[data_pointer++];
			address_ctl.flags = res->data[data_pointer++];
			frame.address_ctl_header = &address_ctl;

			u8 addressing = (address_ctl.flags & 0xC0) >> 6;
			u8 vid = (address_ctl.flags & 0x20) >> 5;
			u8 nls = (address_ctl.flags & 0x10) >> 4;
			// TODO parse Source ID Header

			u8 id_uid[8];
			if (vid)
			{
				memcpy(res->data + data_pointer, &id_uid, 2);
				data_pointer += 2;
			} else {
				memcpy(res->data + data_pointer, &id_uid, 8);
				data_pointer += 8;
			}
			frame.source_id_header = (u8*) &id_uid;

			if (addressing == 0 && nls == 0)
			{
				u8 id_target[8];
				if (vid)
				{
					memcpy(res->data + data_pointer, &id_target, 2);
					data_pointer += 2;
				} else {
					memcpy(res->data + data_pointer, &id_target, 8);
					data_pointer += 8;
				}
				frame.target_id_header = (u8*) &id_target;
			} else {
				frame.target_id_header = NULL;
			}
		} else {
			frame.address_ctl_header = NULL;
			frame.source_id_header = NULL;
		}

		if (frame_header.frame_ctl & 0x10) // Frame continuity
		{
			// TODO handle more than 1 frame
		}

		if (frame_header.frame_ctl & 0x08) // CRC 32
		{
			// TODO support CRC32
		}

		if (frame_header.frame_ctl & 0x04) // Note Mode 2
		{
			// Not supported
		}

		// Frame Type
		//u8 ffType = frame_header.frame_ctl & 0x03;

		frame.payload_length = frame.length-data_pointer;
		u8 payload[249];

		memcpy(&payload, res->data + data_pointer, frame.payload_length);
		frame.payload = (u8*) &payload;

		dll_res.frame_type = FrameTypeForegroundFrame;
		dll_res.frame = (u8*) &frame;
	}

	dll_rx_callback(&dll_res);

}

void dll_init()
{
	phy_init();
	phy_set_tx_callback(&phy_tx_callback);
	phy_set_rx_callback(&phy_rx_callback);

	dll_state = DllStateNone;
}

void dll_set_tx_callback(dll_tx_callback_t cb)
{
	dll_tx_callback = cb;
}
void dll_set_rx_callback(dll_rx_callback_t cb)
{
	dll_rx_callback = cb;
}


void dll_channel_scan_series(dll_channel_scan_series_t* css)
{
	// TODO implement timing
	// TODO allow multiple values

	phy_rx_cfg_t rx_cfg;
	rx_cfg.timeout = css->values->timout_scan_detect; // timeout
	rx_cfg.multiple = 0; // multiple TODO
	rx_cfg.spectrum_id = css->values->channel_id; // spectrum ID TODO
	rx_cfg.coding_scheme = 0; // coding scheme TODO
	rx_cfg.rssi_min = 0; // RSSI min filter TODO
	if (css->values->scan_type == FrameTypeForegroundFrame)
	{
		rx_cfg.sync_word_class = 1;
		dll_state = DllStateScanForegroundFrame;
	} else {
		rx_cfg.sync_word_class = 0;
		dll_state = DllStateScanBackgroundFrame;
	}

	phy_rx_start(&rx_cfg);
}
