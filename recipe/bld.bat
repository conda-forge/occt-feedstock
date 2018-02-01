mkdir build
cd build

cmake .. -G "Ninja" ^
    -DCMAKE_PREFIX_PATH:FILEPATH="%LIBRARY_PREFIX%" ^
    -DCMAKE_INSTALL_PREFIX:FILEPATH="%LIBRARY_PREFIX%" ^
    -DINSTALL_DIR_LAYOUT="Unix" ^
    -DBUILD_MODULE_Draw=OFF ^
    -D3RDPARTY_DIR:FILEPATH="%LIBRARY_PREFIX%" ^
    -D3RDPARTY_TK_DIR:FILEPATH="%LIBRARY_PREFIX%" ^
    -DCMAKE_BUILD_TYPE="Release"

if errorlevel 1 exit 1
ninja install
if errorlevel 1 exit 1
