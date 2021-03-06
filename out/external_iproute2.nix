{ cc_defaults, cc_library_headers }:
let

NETNS_RUN_DIR = "/mnt/run";

iproute2_headers = cc_library_headers {
    name = "iproute2_headers";
    export_include_dirs = ["include"];
};

iproute2_defaults = cc_defaults {
    name = "iproute2_defaults";

    header_libs = ["iproute2_headers"];

    cflags = [
        "-O2"
        "-g"
        "-W"
        "-Wall"
        "-Wno-pointer-arith"
        "-Wno-sign-compare"
        "-Wno-unused-parameter"
        "-Werror"

        "-DHAVE_ERRNO_H"
        "-DHAVE_EXT2_IOCTLS"
        "-DHAVE_GETPAGESIZE"
        "-DHAVE_LINUX_FD_H"
        "-DHAVE_LSEEK64"
        "-DHAVE_LSEEK64_PROTOTYPE"
        "-DHAVE_MMAP"
        "-DHAVE_NETINET_IN_H"
        "-DHAVE_SELINUX"
        "-DHAVE_SETNS"
        "-DHAVE_STDLIB_H"
        "-DHAVE_STRDUP"
        "-DHAVE_SYS_IOCTL_H"
        "-DHAVE_SYS_MMAN_H"
        "-DHAVE_SYS_MOUNT_H"
        "-DHAVE_SYS_PRCTL_H"
        "-DHAVE_SYS_RESOURCE_H"
        "-DHAVE_SYS_SELECT_H"
        "-DHAVE_SYS_STAT_H"
        "-DHAVE_SYS_TYPES_H"
        "-DHAVE_TYPE_SSIZE_T"
        "-DHAVE_UNISTD_H"
        "-DHAVE_UTIME_H"

        "-DNO_SHARED_LIBS"
    ];
};

in { inherit iproute2_defaults iproute2_headers; }
