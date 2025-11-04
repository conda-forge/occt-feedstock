# a little test to see if occt is installed
cmake_minimum_required(VERSION 3.15)
project(occt_test_cmake NONE)

option(OCCT_VERSION "Required OCCT version")
find_package(OpenCASCADE "${OCCT_VERSION}" REQUIRED)
message(STATUS "Found OpenCASCADE version: ${OpenCASCADE_MAJOR_VERSION}.${OpenCASCADE_MINOR_VERSION}.${OpenCASCADE_MAINTENANCE_VERSION}")
