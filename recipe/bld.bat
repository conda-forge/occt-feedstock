cmake -S . -B build  -G Ninja ^
      -D CMAKE_INSTALL_PREFIX:FILEPATH=$PREFIX ^
      -D CMAKE_PREFIX_PATH:FILEPATH=$PREFIX ^
      -D 3RDPARTY_DIR:FILEPATH=$PREFIX ^
      -D BUILD_MODULE_Draw:BOOL=OFF ^
      -D USE_TBB:BOOL=ON ^
      -D CMAKE_BUILD_TYPE:STRING="Release" ^
      -D BUILD_RELEASE_DISABLE_EXCEPTIONS=OFF ^
      -D USE_VTK:BOOL=ON

if errorlevel 1 exit 1
cmake --build build -- TKG3d TKBool TKXmlTObj TKStdL TKIVtk TKSTEP209 TKShHealing TKLCAF TKSTL TKFeat TKOffset TKGeomBase TKXCAF

if errorlevel 1 exit 1
FOR /f "tokens=2" %%R IN ('findstr "_COMPILER_ _STATIC_LIBRARY_" rules.ninja') DO (
    ninja -t clean -r %%~R
)

if errorlevel 1 exit 1
cmake --build build -- install

if errorlevel 1 exit 1
