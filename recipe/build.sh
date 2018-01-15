mkdir build
cd build

if [ `uname` == Darwin ]; then
    CXXFLAGS="$CXXFLAGS -std=c++11"
fi

cmake .. \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -D3RDPARTY_DIR=$PREFIX \
      -D3RDPARTY_TK_DIR=$PREFIX \
      -D3RDPARTY_TCL_DIR=$PREFIX \
      -D3RDPARTY_TK_INCLUDE_DIR=$PREFIX/include \
      -D3RDPARTY_TCL_INCLUDE_DIR=$PREFIX/include \
      -D3RDPARTY_TK_LIBRARY_DIR=$PREFIX/lib \
      -D3RDPARTY_TCL_LIBRARY_DIR=$PREFIX/lib \
      -D3RDPARTY_
      -DUSE_TBB=ON \
      -DUSE_FREEIMAGE=ON \
      -DCMAKE_BUILD_TYPE="Release" \

make -j${CPU_COUNT} 2>&1 | tee output.txt
make -j${CPU_COUNT} install
