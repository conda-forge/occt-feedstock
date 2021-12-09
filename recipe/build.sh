CMAKE_ARGS=()

if [[ "$build_variant" == "egl" ]]; then
      CMAKE_ARGS+=(
            "-DEGL_INCLUDE_DIR:PATH=${BUILD_PREFIX}/${HOST}/sysroot/usr/include"
            "-DEGL_LIBRARY:FILEPATH=${BUILD_PREFIX}/${HOST}/sysroot/usr/lib/libEGL.so.1"
            "-DOPENGL_egl_LIBRARY:FILEPATH=${BUILD_PREFIX}/${HOST}/sysroot/usr/lib/libEGL.so.1"
            "-DEGL_opengl_LIBRARY:FILEPATH=${BUILD_PREFIX}/${HOST}/sysroot/usr/lib64/libGL.so"
            "-DOPENGL_opengl_LIBRARY:FILEPATH=${BUILD_PREFIX}/${HOST}/sysroot/usr/lib64/libGL.so"
      )
fi

cmake -S . -B build  -G Ninja \
      -D CMAKE_FIND_ROOT_PATH="$PREFIX;$BUILD_PREFIX/$HOST/sysroot" \
      -D CMAKE_INSTALL_PREFIX:FILEPATH=$PREFIX \
      -D CMAKE_PREFIX_PATH:FILEPATH=$PREFIX \
      -D 3RDPARTY_DIR:FILEPATH=$PREFIX \
      -D BUILD_MODULE_Draw:BOOL=OFF \
      -D USE_TBB:BOOL=OFF \
      -D CMAKE_BUILD_TYPE:STRING="Release" \
      -D BUILD_RELEASE_DISABLE_EXCEPTIONS=OFF \
      -D USE_VTK:BOOL=ON \
      -D 3RDPARTY_VTK_LIBRARY_DIR:FILEPATH=$PREFIX/lib \
      -D 3RDPARTY_VTK_INCLUDE_DIR:FILEPATH=$PREFIX/include/vtk-9.1 \
      -D VTK_RENDERING_BACKEND:STRING="OpenGL2" \
      -D USE_FREEIMAGE:BOOL=ON \
      -D USE_RAPIDJSON:BOOL=ON \
      "${CMAKE_ARGS[@]}"

cmake --build build -- install
