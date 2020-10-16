REM Remove /GL to make this build fit 10G
set "CXXFLAGS=%CXXFLAGS:-GL=%"

cmake -S . -B build  -G Ninja ^
      -D CMAKE_PREFIX_PATH:FILEPATH="%LIBRARY_PREFIX%" ^
      -D CMAKE_INSTALL_PREFIX:FILEPATH="%LIBRARY_PREFIX%" ^
      -D INSTALL_DIR_LAYOUT="Unix" ^
      -D BUILD_MODULE_Draw=OFF ^
      -D 3RDPARTY_DIR:FILEPATH="%LIBRARY_PREFIX%" ^
      -D CMAKE_BUILD_TYPE="Release" ^
      -D USE_TBB=ON ^
      -D BUILD_RELEASE_DISABLE_EXCEPTIONS=OFF ^
      -D USE_VTK:BOOL=ON ^
      -D 3RDPARTY_VTK_LIBRARY_DIR:FILEPATH="%LIBRARY_PREFIX%/lib" ^
      -D 3RDPARTY_VTK_DLL_DIR:FILEPATH="%LIBRARY_PREFIX%/bin" ^
      -D 3RDPARTY_VTK_INCLUDE_DIR:FILEPATH="%LIBRARY_PREFIX%/include/vtk-9.0" ^
      -D VTK_RENDERING_BACKEND:STRING="OpenGL2" ^
      -D USE_FREEIMAGE:BOOL=ON

if errorlevel 1 exit 1

cmake --build build -- -v install

if errorlevel 1 exit 1
