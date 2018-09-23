mkdir build
cd build

cmake .. -G "Ninja" ^
    -DCMAKE_PREFIX_PATH:FILEPATH="%LIBRARY_PREFIX%" ^
    -DCMAKE_INSTALL_PREFIX:FILEPATH="%LIBRARY_PREFIX%" ^
    -DINSTALL_DIR_LAYOUT="Unix" ^
    -DBUILD_MODULE_Draw=OFF ^
    -D3RDPARTY_DIR:FILEPATH="%LIBRARY_PREFIX%" ^
    -DCMAKE_BUILD_TYPE="Release" ^
    -DUSE_TBB=ON

if errorlevel 1 exit 1
ninja install
if errorlevel 1 exit 1
