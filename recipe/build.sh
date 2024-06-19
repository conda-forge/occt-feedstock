cmake -S . -B build  -G Ninja \
      -D CMAKE_FIND_ROOT_PATH="$PREFIX;$BUILD_PREFIX/$HOST/sysroot" \
      -D CMAKE_INSTALL_PREFIX:FILEPATH=$PREFIX \
      -D CMAKE_PREFIX_PATH:FILEPATH=$PREFIX \
      -D 3RDPARTY_DIR:FILEPATH=$PREFIX \
      -D BUILD_MODULE_Draw:BOOL=OFF \
      -D USE_TBB:BOOL=OFF \
      -D CMAKE_BUILD_TYPE:STRING="Release" \
      -D BUILD_RELEASE_DISABLE_EXCEPTIONS=OFF \
      -D USE_VTK:BOOL=$USE_VTK \
      -D 3RDPARTY_VTK_LIBRARY_DIR:FILEPATH=$PREFIX/lib \
      -D 3RDPARTY_VTK_INCLUDE_DIR:FILEPATH=$PREFIX/include/vtk-9.2 \
      -D VTK_RENDERING_BACKEND:STRING="OpenGL2" \
      -D USE_FREEIMAGE:BOOL=ON \
      -D USE_RAPIDJSON:BOOL=ON \
      -D BUILD_RELEASE_DISABLE_EXCEPTIONS:BOOL=OFF \
      -D QT_HOST_PATH:STRING="${PREFIX}"

cmake --build build -- install
