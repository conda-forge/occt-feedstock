mkdir build
cd build

if [ `uname` == Darwin ]; then
    CXXFLAGS="$CXXFLAGS -std=c++11"
fi

cmake -G "Ninja" \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -D3RDPARTY_DIR=$PREFIX \
      -DBUILD_MODULE_Draw=OFF \
      -DUSE_TBB=ON \
      -DUSE_FREEIMAGE=ON \
      -DCMAKE_BUILD_TYPE="Release" \
      ..

ninja install
