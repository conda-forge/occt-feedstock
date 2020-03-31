dir
rmdir /S /Q data
rmdir /S /Q dox
rmdir /S /Q samples
df -h

cmake -S . -B build  -G Ninja ^
      -D CMAKE_INSTALL_PREFIX:FILEPATH=$PREFIX ^
      -D CMAKE_PREFIX_PATH:FILEPATH=$PREFIX ^
      -D 3RDPARTY_DIR:FILEPATH=$PREFIX ^
      -D BUILD_MODULE_Draw:BOOL=OFF ^
      -D USE_TBB:BOOL=ON ^
      -D CMAKE_BUILD_TYPE:STRING="Release" ^
      -D BUILD_RELEASE_DISABLE_EXCEPTIONS=OFF ^
      -D USE_VTK:BOOL=ON
df -h
bash -c "cd ../../..; find"
if errorlevel 1 exit 1

cmake --build build -- install
df -h
if errorlevel 1 exit 1
