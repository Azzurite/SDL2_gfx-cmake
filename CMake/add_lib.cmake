function (add_library_to_build library)
	if (${ARGC} GREATER 0)
		find_package(${library} REQUIRED COMPONENTS ${ARGN})
	else()
		find_package(${library} REQUIRED)
	endif()

	if (NOT ${library}_FOUND)
		message(SEND_ERROR "${library} not found! Adjust or provide a Find${library}.cmake!")
		return()
	endif (NOT ${library}_FOUND)

	set(STATIC_LIBRARIES ${STATIC_LIBRARIES} ${${library}_LIBRARIES} PARENT_SCOPE)

	include_directories(${${library}_INCLUDE_DIRS})
endfunction()
