macro (add_sources)
    file (RELATIVE_PATH _relPath "${CMAKE_SOURCE_DIR}" "${CMAKE_CURRENT_SOURCE_DIR}")
    foreach (_src ${ARGN})
        if (_relPath)
            list (APPEND SOURCE_FILES "${_relPath}/${_src}")
        else()
            list (APPEND SOURCE_FILES "${_src}")
        endif()
    endforeach()
    if (_relPath)
        # propagate SOURCE_FILES to parent directory
        set (SOURCE_FILES ${SOURCE_FILES} PARENT_SCOPE)
    endif()
endmacro()

macro (add_tests)
    file (RELATIVE_PATH _relPath1 "${CMAKE_SOURCE_DIR}" "${CMAKE_CURRENT_SOURCE_DIR}")
    foreach (_src1 ${ARGN})
        if (_relPath1)
            list (APPEND TEST_FILES "${_relPath1}/${_src1}")
        else()
            list (APPEND TEST_FILES "${_src1}")
        endif()
    endforeach()
    if (_relPath1)
        # propagate TEST_FILES to parent directory
        set (TEST_FILES ${TEST_FILES} PARENT_SCOPE)
    endif()
endmacro()
