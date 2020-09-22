{ cc_binary }:
let

common_CFLAGS = [
    "-Wall"
    "-Werror"
    "-Wshadow"
];

secilc = cc_binary {
    name = "secilc";
    host_supported = true;
    cflags = common_CFLAGS;
    srcs = ["secilc.c"];
    static_libs = ["libsepol"];
    stl = "none";
    #  secilc is a program that is executed very early by init.
    #  Since it is before the mount namespaces are setup, /system/bin/linker
    #  and /system/lib/libc.so point to the mount points where nothing
    #  is mounted on yet. Therefore, secilc has to have explicit knowledge about
    #  the paths where the bootstrap Bionic is. bootstrap:true sets DT_INTERP to
    #  /system/bin/bootstrap/linker.
    bootstrap = true;
};

in { inherit secilc; }
