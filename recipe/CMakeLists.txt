# a little test to see if occt is installed
cmake_minimum_required(VERSION 3.5)

find_package(OpenCASCADE 7.2.0)
if (OpenCASCADE_MAJOR_VERSION)
  message(STATUS " Found OpenCASCADE version: ${OpenCASCADE_MAJOR_VERSION}.${OpenCASCADE_MINOR_VERSION}.${OpenCASCADE_MAINTENANCE_VERSION}")
else(OpenCASCADE_MAJOR_VERSION)
  message(ERROR "could not find OpenCASCADE")
endif(OpenCASCADE_MAJOR_VERSION)