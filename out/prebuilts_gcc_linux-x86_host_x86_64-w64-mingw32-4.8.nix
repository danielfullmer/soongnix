{ filegroup }:
let

mingw-libwinpthread-notice = filegroup {
    name = "mingw-libwinpthread-notice";
    srcs = ["licenses/mingw-w64-svn-r5861/mingw-w64-libraries/winpthreads/COPYING"];
};

in { inherit mingw-libwinpthread-notice; }
