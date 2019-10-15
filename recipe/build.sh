mkdir build
cd build

cmake -G "Ninja" \
      -D CMAKE_INSTALL_PREFIX:FILEPATH=$PREFIX \
      -D CMAKE_PREFIX_PATH:FILEPATH=$PREFIX \
      -D 3RDPARTY_DIR:FILEPATH=$PREFIX \
      -D BUILD_MODULE_Draw:BOOL=OFF \
      -D USE_TBB:BOOL=ON \
      -D CMAKE_BUILD_TYPE:STRING="Release" \
      ..

ninja install
