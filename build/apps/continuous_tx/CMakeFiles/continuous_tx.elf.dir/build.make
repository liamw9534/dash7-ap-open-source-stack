# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /media/sf_Virtualbox-shared/oss-7/stack

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /media/sf_Virtualbox-shared/oss-7/build

# Include any dependencies generated for this target.
include apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/depend.make

# Include the progress variables for this target.
include apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/progress.make

# Include the compile flags for this target's objects.
include apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/flags.make

apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/continuous_tx.c.obj: apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/flags.make
apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/continuous_tx.c.obj: /media/sf_Virtualbox-shared/oss-7/stack/apps/continuous_tx/continuous_tx.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/media/sf_Virtualbox-shared/oss-7/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/continuous_tx.c.obj"
	cd /media/sf_Virtualbox-shared/oss-7/build/apps/continuous_tx && /home/liam/Documents/toolchain/gcc-arm-none-eabi-8-2018-q4-major/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/continuous_tx.elf.dir/continuous_tx.c.obj   -c /media/sf_Virtualbox-shared/oss-7/stack/apps/continuous_tx/continuous_tx.c

apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/continuous_tx.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/continuous_tx.elf.dir/continuous_tx.c.i"
	cd /media/sf_Virtualbox-shared/oss-7/build/apps/continuous_tx && /home/liam/Documents/toolchain/gcc-arm-none-eabi-8-2018-q4-major/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /media/sf_Virtualbox-shared/oss-7/stack/apps/continuous_tx/continuous_tx.c > CMakeFiles/continuous_tx.elf.dir/continuous_tx.c.i

apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/continuous_tx.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/continuous_tx.elf.dir/continuous_tx.c.s"
	cd /media/sf_Virtualbox-shared/oss-7/build/apps/continuous_tx && /home/liam/Documents/toolchain/gcc-arm-none-eabi-8-2018-q4-major/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /media/sf_Virtualbox-shared/oss-7/stack/apps/continuous_tx/continuous_tx.c -o CMakeFiles/continuous_tx.elf.dir/continuous_tx.c.s

apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/continuous_tx.c.obj.requires:

.PHONY : apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/continuous_tx.c.obj.requires

apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/continuous_tx.c.obj.provides: apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/continuous_tx.c.obj.requires
	$(MAKE) -f apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/build.make apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/continuous_tx.c.obj.provides.build
.PHONY : apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/continuous_tx.c.obj.provides

apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/continuous_tx.c.obj.provides.build: apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/continuous_tx.c.obj


apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/version.c.obj: apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/flags.make
apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/version.c.obj: apps/continuous_tx/version.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/media/sf_Virtualbox-shared/oss-7/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/version.c.obj"
	cd /media/sf_Virtualbox-shared/oss-7/build/apps/continuous_tx && /home/liam/Documents/toolchain/gcc-arm-none-eabi-8-2018-q4-major/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/continuous_tx.elf.dir/version.c.obj   -c /media/sf_Virtualbox-shared/oss-7/build/apps/continuous_tx/version.c

apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/version.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/continuous_tx.elf.dir/version.c.i"
	cd /media/sf_Virtualbox-shared/oss-7/build/apps/continuous_tx && /home/liam/Documents/toolchain/gcc-arm-none-eabi-8-2018-q4-major/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /media/sf_Virtualbox-shared/oss-7/build/apps/continuous_tx/version.c > CMakeFiles/continuous_tx.elf.dir/version.c.i

apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/version.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/continuous_tx.elf.dir/version.c.s"
	cd /media/sf_Virtualbox-shared/oss-7/build/apps/continuous_tx && /home/liam/Documents/toolchain/gcc-arm-none-eabi-8-2018-q4-major/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /media/sf_Virtualbox-shared/oss-7/build/apps/continuous_tx/version.c -o CMakeFiles/continuous_tx.elf.dir/version.c.s

apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/version.c.obj.requires:

.PHONY : apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/version.c.obj.requires

apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/version.c.obj.provides: apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/version.c.obj.requires
	$(MAKE) -f apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/build.make apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/version.c.obj.provides.build
.PHONY : apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/version.c.obj.provides

apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/version.c.obj.provides.build: apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/version.c.obj


# Object files for target continuous_tx.elf
continuous_tx_elf_OBJECTS = \
"CMakeFiles/continuous_tx.elf.dir/continuous_tx.c.obj" \
"CMakeFiles/continuous_tx.elf.dir/version.c.obj"

# External object files for target continuous_tx.elf
continuous_tx_elf_EXTERNAL_OBJECTS =

apps/continuous_tx/continuous_tx.elf: apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/continuous_tx.c.obj
apps/continuous_tx/continuous_tx.elf: apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/version.c.obj
apps/continuous_tx/continuous_tx.elf: apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/build.make
apps/continuous_tx/continuous_tx.elf: framework/libframework.a
apps/continuous_tx/continuous_tx.elf: apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/media/sf_Virtualbox-shared/oss-7/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable continuous_tx.elf"
	cd /media/sf_Virtualbox-shared/oss-7/build/apps/continuous_tx && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/continuous_tx.elf.dir/link.txt --verbose=$(VERBOSE)
	cd /media/sf_Virtualbox-shared/oss-7/build/apps/continuous_tx && /home/liam/Documents/toolchain/gcc-arm-none-eabi-8-2018-q4-major/bin/arm-none-eabi-objcopy -O binary continuous_tx.elf continuous_tx.bin

# Rule to build all files generated by this target.
apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/build: apps/continuous_tx/continuous_tx.elf

.PHONY : apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/build

apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/requires: apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/continuous_tx.c.obj.requires
apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/requires: apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/version.c.obj.requires

.PHONY : apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/requires

apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/clean:
	cd /media/sf_Virtualbox-shared/oss-7/build/apps/continuous_tx && $(CMAKE_COMMAND) -P CMakeFiles/continuous_tx.elf.dir/cmake_clean.cmake
.PHONY : apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/clean

apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/depend:
	cd /media/sf_Virtualbox-shared/oss-7/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /media/sf_Virtualbox-shared/oss-7/stack /media/sf_Virtualbox-shared/oss-7/stack/apps/continuous_tx /media/sf_Virtualbox-shared/oss-7/build /media/sf_Virtualbox-shared/oss-7/build/apps/continuous_tx /media/sf_Virtualbox-shared/oss-7/build/apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/continuous_tx/CMakeFiles/continuous_tx.elf.dir/depend

