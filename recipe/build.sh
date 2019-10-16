mkdir build
cd build

cmake -G "Ninja" \
      -D CMAKE_INSTALL_PREFIX=$PREFIX \
      -D CMAKE_PREFIX_PATH=$PREFIX \
      -D 3RDPARTY_DIR=$PREFIX \
      -D BUILD_MODULE_Draw=OFF \
      -D USE_TBB=ON \
      -D CMAKE_BUILD_TYPE="Release" \
      ..

ninja install
