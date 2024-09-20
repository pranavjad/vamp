# cmake_minimum_required(VERSION 3.12.0)
# project(minimal-test VERSION 0.1.0)

# set(CMAKE_CXX_STANDARD 17)


# add_compile_options(-Wall -Wextra)
# add_executable(main scripts/cpp/device_test.cpp)

# add_library(Metal INTERFACE)

# find_library(APPLE_FWK_FOUNDATION Foundation REQUIRED)
# find_library(APPLE_FWK_QUARTZ_CORE QuartzCore REQUIRED)
# find_library(APPLE_FWK_METAL Metal REQUIRED)
# find_library(APPLE_FWK_METAL_KIT MetalKit REQUIRED)
# find_library(APPLE_FWK_APP_KIT AppKit REQUIRED)

# target_include_directories(Metal INTERFACE
#     ${CMAKE_CURRENT_SOURCE_DIR}/metal-cpp
# )

# target_compile_definitions(Metal INTERFACE
#     NS_PRIVATE_IMPLEMENTATION
#     CA_PRIVATE_IMPLEMENTATION
#     MTL_PRIVATE_IMPLEMENTATION
#     MTK_PRIVATE_IMPLEMENTATION
# )

# target_link_libraries(Metal INTERFACE
#     ${APPLE_FWK_FOUNDATION}
#     ${APPLE_FWK_QUARTZ_CORE}
#     ${APPLE_FWK_METAL}
#     ${APPLE_FWK_METAL_KIT}
#     ${APPLE_FWK_APP_KIT}
# )

# target_link_libraries(main PUBLIC Metal)



cmake_minimum_required(VERSION 3.16...3.22)

option(VAMP_LTO "Use LTO." ON)
option(VAMP_FORCE_COLORED_OUTPUT "Always produce ANSI-colored output." ON)
option(VAMP_FORCE_CLANG "Force the use of Clang." OFF)

option(VAMP_BUILD_OMPL_DEMO "Build VAMP C++ OMPL Integration Demo Script" OFF)
option(VAMP_OMPL_PATH "Search Path for OMPL Installation - Only Needed for Demo Script" "")

# option(VAMP_METAL_CPP_PATH "Path to Metal C++ headers" "")
option(VAMP_BUILD_GPU_DEMO "Build VAMP C++ Batched Collision Checking on GPU Script" ON)
set(VAMP_METAL_CPP_PATH "/Users/pranavj/Documents/coding/zaklab/vamp/metal-cpp")
set(CMAKE_FRAMEWORK_PATH /System/Library/Frameworks /Library/Frameworks)
set(MTL_CAPTURE_ENABLED 1)


if(VAMP_FORCE_CLANG)
  find_program(CLANG "clang")
  find_program(CLANGPP "clang++")

  set(CMAKE_C_COMPILER ${CLANG} CACHE STRING "C compiler" FORCE)
  set(CMAKE_CXX_COMPILER ${CLANGPP} CACHE STRING "C++ compiler" FORCE)
endif()

if(VAMP_FORCE_COLORED_OUTPUT)
  if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    add_compile_options(-fdiagnostics-color=always)
  elseif(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
    add_compile_options(-fcolor-diagnostics)
  endif()
endif()

project(
    vamp
    VERSION 0.2
    LANGUAGES C CXX
)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
set(CMAKE_BUILD_WITH_INSTALL_RPATH ON)

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
include(CompilerSettings)
include(FetchInitCPM)
include(Dependencies)

# metal stuff
add_library(Metal INTERFACE)

find_library(APPLE_FWK_FOUNDATION Foundation REQUIRED)
find_library(APPLE_FWK_QUARTZ_CORE QuartzCore REQUIRED)
find_library(APPLE_FWK_METAL Metal REQUIRED)
find_library(APPLE_FWK_METAL_KIT MetalKit REQUIRED)
find_library(APPLE_FWK_APP_KIT AppKit REQUIRED)

target_include_directories(Metal INTERFACE
    ${CMAKE_CURRENT_SOURCE_DIR}/metal-cpp
)

target_compile_definitions(Metal INTERFACE
    NS_PRIVATE_IMPLEMENTATION
    CA_PRIVATE_IMPLEMENTATION
    MTL_PRIVATE_IMPLEMENTATION
    MTK_PRIVATE_IMPLEMENTATION
)

target_link_libraries(Metal INTERFACE
    ${APPLE_FWK_FOUNDATION}
    ${APPLE_FWK_QUARTZ_CORE}
    ${APPLE_FWK_METAL}
    ${APPLE_FWK_METAL_KIT}
    ${APPLE_FWK_APP_KIT}
)
# end metal stuff

list(APPEND VAMP_EXT_SOURCES
  src/impl/vamp/bindings/python.cc
  src/impl/vamp/bindings/environment.cc
  src/impl/vamp/bindings/settings.cc
)

list(APPEND VAMP_ROBOT_MODULES
  sphere
  ur5
  panda
  fetch
  baxter
)

foreach(robot_name IN LISTS VAMP_ROBOT_MODULES)
  list(APPEND VAMP_EXT_SOURCES "src/impl/vamp/bindings/${robot_name}.cc")
endforeach()

list(APPEND VAMP_EXT_INCLUDES
  ${NIGH_INCLUDE_DIRS}
  ${PDQSORT_INCLUDE_DIRS}
  src/impl
)

nanobind_add_module(_core_ext
    NB_STATIC
    STABLE_ABI
    NOMINSIZE
    ${VAMP_EXT_SOURCES}
)

target_include_directories(_core_ext
    SYSTEM PRIVATE
    ${VAMP_EXT_INCLUDES}
    # ${VAMP_METAL_CPP_PATH}
)

target_link_libraries(_core_ext
    PRIVATE
    Eigen3::Eigen
)
target_link_libraries(_core_ext
    PUBLIC
    Metal
)


if($ENV{GITHUB_ACTIONS})
  set(STUB_PREFIX "")
else()
  set(STUB_PREFIX "${CMAKE_BINARY_DIR}/stubs/")
endif()

nanobind_add_stub(
  vamp_stub
  MODULE _core_ext
  OUTPUT "${STUB_PREFIX}__init__.pyi"
  PYTHON_PATH $<TARGET_FILE_DIR:_core_ext>
  DEPENDS _core_ext
  VERBOSE
)

foreach(robot_name IN LISTS VAMP_ROBOT_MODULES)
  nanobind_add_stub(
    "vamp_${robot_name}_stub"
    MODULE "_core_ext.${robot_name}"
    OUTPUT "${STUB_PREFIX}${robot_name}.pyi"
    PYTHON_PATH $<TARGET_FILE_DIR:_core_ext>
    DEPENDS _core_ext
    VERBOSE
  )
endforeach()

install(
  TARGETS _core_ext
  LIBRARY
  DESTINATION vamp/_core
)

install(
  FILES "${STUB_PREFIX}__init__.pyi"
  DESTINATION "${CMAKE_SOURCE_DIR}/src/vamp/_core"
)

foreach(robot_name IN LISTS VAMP_ROBOT_MODULES)
  install(
    FILES "${STUB_PREFIX}${robot_name}.pyi"
    DESTINATION "${CMAKE_SOURCE_DIR}/src/vamp/_core"
  )
endforeach()

if(VAMP_BUILD_OMPL_DEMO)
  find_package(ompl QUIET PATHS ${VAMP_OMPL_PATH})

  if(ompl_FOUND)
    add_executable(vamp_ompl_integration scripts/cpp/ompl_integration.cc)
    target_link_libraries(vamp_ompl_integration PRIVATE ompl::ompl Eigen3::Eigen)
    target_include_directories(vamp_ompl_integration SYSTEM PRIVATE ${VAMP_EXT_INCLUDES})
  else()
    message(WARNING "OMPL not found! Cannot build OMPL demo.")
  endif()
endif()

if(VAMP_BUILD_GPU_DEMO)
  set(METAL_SHADER_SOURCE ${CMAKE_CURRENT_SOURCE_DIR}/src/impl/vamp/robots/sphere/cc.metal)
  set(METAL_IR_FILE ${CMAKE_CURRENT_BINARY_DIR}/cc.ir)
  set(METAL_LIB_FILE ${CMAKE_CURRENT_BINARY_DIR}/CollisionChecking.metallib)

  add_custom_command(
    OUTPUT ${METAL_IR_FILE}
    COMMAND xcrun -sdk macosx metal -I. -o ${METAL_IR_FILE} -c ${METAL_SHADER_SOURCE}
    DEPENDS ${METAL_SHADER_SOURCE}
    COMMENT "Compiling Metal shader to IR"
  )

  add_custom_command(
    OUTPUT ${METAL_LIB_FILE}
    COMMAND xcrun -sdk macosx metallib -o ${METAL_LIB_FILE} ${METAL_IR_FILE}
    DEPENDS ${METAL_IR_FILE}
    COMMENT "Compiling IR to Metal library"
  )

  add_custom_target(
    metal_shaders
    DEPENDS ${METAL_LIB_FILE}
  )

  add_executable(vamp_gpu_demo scripts/cpp/batched_cc.cpp)
  target_link_libraries(vamp_gpu_demo 
    PUBLIC 
    Metal
    Eigen3::Eigen
  )
  target_include_directories(vamp_gpu_demo 
    SYSTEM PRIVATE 
    ${VAMP_EXT_INCLUDES}
    ${CMAKE_CURRENT_SOURCE_DIR}/metal-cpp
  )

  add_dependencies(vamp_gpu_demo metal_shaders)

  add_custom_command(
    TARGET vamp_gpu_demo POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy
            ${METAL_LIB_FILE}
            $<TARGET_FILE_DIR:vamp_gpu_demo>/CollisionChecking.metallib
    COMMENT "Copying Metal library to output directory"
  )
endif()

add_compile_options(-Wall -Wextra)
add_executable(device_test scripts/cpp/device_test.cpp)
target_link_libraries(device_test PUBLIC Metal)
