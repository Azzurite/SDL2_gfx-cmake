cmake_minimum_required(VERSION 2.8.12.1)

###########################################################################
## Project Settings                                                      ##
## ----------------                                                      ##
## Can be changed across projects                                        ##
###########################################################################
set(PROJECT_NAME "SDL2_gfx")
set(IS_LIBRARY true)
include(CMake/user_defined_settings.cmake)

###########################################################################
## Project build                                                         ##
## -------------                                                         ##
## Should probably not be changed across projects.                       ##
###########################################################################
project(${PROJECT_NAME})


###### Compiler flags ######
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++1y -Wall -pedantic -Wextra")
set(CMAKE_CXX_FLAGS_DEBUG "-Og -ggdb -DDEBUG")


######################################
##       Assemble executables       ##
######################################
include(CMake/add_source_files.cmake)

###### Main executable ######
add_subdirectory("src")

include_directories("src")

include(CMake/add_lib.cmake)
add_library_to_build(SDL2)

set(CMAKE_SHARED_LIBRARY_PREFIX "")

if (IS_LIBRARY)
	add_library(${PROJECT_NAME} SHARED ${SOURCE_FILES})
else()
	add_executable(${PROJECT_NAME} src/Main.cpp ${SOURCE_FILES})
endif()
target_link_libraries(${PROJECT_NAME} ${STATIC_LIBRARIES})

#logging
get_property(dirs DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY INCLUDE_DIRECTORIES)
message(STATUS "src_include_dirs: ${dirs}")
message(STATUS "linked libraries:  ${STATIC_LIBRARIES}")
