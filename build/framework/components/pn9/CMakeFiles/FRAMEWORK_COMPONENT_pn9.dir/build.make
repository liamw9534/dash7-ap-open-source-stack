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
include framework/components/pn9/CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/depend.make

# Include the progress variables for this target.
include framework/components/pn9/CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/progress.make

# Include the compile flags for this target's objects.
include framework/components/pn9/CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/flags.make

framework/components/pn9/CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/pn9.c.obj: framework/components/pn9/CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/flags.make
framework/components/pn9/CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/pn9.c.obj: /media/sf_Virtualbox-shared/oss-7/stack/framework/components/pn9/pn9.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/media/sf_Virtualbox-shared/oss-7/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object framework/components/pn9/CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/pn9.c.obj"
	cd /media/sf_Virtualbox-shared/oss-7/build/framework/components/pn9 && /home/liam/Documents/toolchain/gcc-arm-none-eabi-8-2018-q4-major/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/pn9.c.obj   -c /media/sf_Virtualbox-shared/oss-7/stack/framework/components/pn9/pn9.c

framework/components/pn9/CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/pn9.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/pn9.c.i"
	cd /media/sf_Virtualbox-shared/oss-7/build/framework/components/pn9 && /home/liam/Documents/toolchain/gcc-arm-none-eabi-8-2018-q4-major/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /media/sf_Virtualbox-shared/oss-7/stack/framework/components/pn9/pn9.c > CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/pn9.c.i

framework/components/pn9/CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/pn9.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/pn9.c.s"
	cd /media/sf_Virtualbox-shared/oss-7/build/framework/components/pn9 && /home/liam/Documents/toolchain/gcc-arm-none-eabi-8-2018-q4-major/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /media/sf_Virtualbox-shared/oss-7/stack/framework/components/pn9/pn9.c -o CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/pn9.c.s

framework/components/pn9/CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/pn9.c.obj.requires:

.PHONY : framework/components/pn9/CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/pn9.c.obj.requires

framework/components/pn9/CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/pn9.c.obj.provides: framework/components/pn9/CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/pn9.c.obj.requires
	$(MAKE) -f framework/components/pn9/CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/build.make framework/components/pn9/CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/pn9.c.obj.provides.build
.PHONY : framework/components/pn9/CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/pn9.c.obj.provides

framework/components/pn9/CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/pn9.c.obj.provides.build: framework/components/pn9/CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/pn9.c.obj


FRAMEWORK_COMPONENT_pn9: framework/components/pn9/CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/pn9.c.obj
FRAMEWORK_COMPONENT_pn9: framework/components/pn9/CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/build.make

.PHONY : FRAMEWORK_COMPONENT_pn9

# Rule to build all files generated by this target.
framework/components/pn9/CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/build: FRAMEWORK_COMPONENT_pn9

.PHONY : framework/components/pn9/CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/build

framework/components/pn9/CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/requires: framework/components/pn9/CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/pn9.c.obj.requires

.PHONY : framework/components/pn9/CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/requires

framework/components/pn9/CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/clean:
	cd /media/sf_Virtualbox-shared/oss-7/build/framework/components/pn9 && $(CMAKE_COMMAND) -P CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/cmake_clean.cmake
.PHONY : framework/components/pn9/CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/clean

framework/components/pn9/CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/depend:
	cd /media/sf_Virtualbox-shared/oss-7/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /media/sf_Virtualbox-shared/oss-7/stack /media/sf_Virtualbox-shared/oss-7/stack/framework/components/pn9 /media/sf_Virtualbox-shared/oss-7/build /media/sf_Virtualbox-shared/oss-7/build/framework/components/pn9 /media/sf_Virtualbox-shared/oss-7/build/framework/components/pn9/CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : framework/components/pn9/CMakeFiles/FRAMEWORK_COMPONENT_pn9.dir/depend

