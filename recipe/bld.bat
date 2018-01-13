mkdir build
cd build

cmake .. -G "Ninja" ^
    -DCMAKE_PREFIX_PATH:FILEPATH="%LIBRARY_PREFIX%" ^
    -DCMAKE_INSTALL_PREFIX:FILEPATH="%LIBRARY_PREFIX%" ^
    -DINSTALL_DIR_LAYOUT="Unix" ^
    rem -D3RDPARTY_DIR:FILEPATH="%LIBRARY_PREFIX%" ^
    rem -DTK_LIBRARY_PATH:FILEPATH="%LIBRARY_PREFIX%" ^
    rem -DTCL_LIBRARY_PATH_PARENT="%LIBRARY_PREFIX%" ^
    -DCMAKE_BUILD_TYPE="Release"

if errorlevel 1 exit 1

ninja install
if errorlevel 1 exit 1
