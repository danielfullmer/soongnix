{ cc_binary, cc_library_shared }:
let

#  service library
libmediatranscodingservice = cc_library_shared {
    name = "libmediatranscodingservice";

    srcs = ["MediaTranscodingService.cpp"];

    shared_libs = [
        "libbase"
        "libbinder_ndk"
        "liblog"
        "libmediatranscoding"
        "libutils"
    ];

    static_libs = [
        "mediatranscoding_aidl_interface-ndk_platform"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];
};

mediatranscoding = cc_binary {
    name = "mediatranscoding";

    srcs = [
        "main_mediatranscodingservice.cpp"
    ];

    shared_libs = [
        "libbase"
        #  TODO(hkuang): Use libbinder_ndk
        "libbinder"
        "libutils"
        "liblog"
        "libbase"
        "libmediatranscoding"
        "libmediatranscodingservice"
    ];

    static_libs = [
        "mediatranscoding_aidl_interface-ndk_platform"
    ];

    target = {
        android = {
            product_variables = {
                malloc_not_svelte = {
                    #  Scudo increases memory footprint, so only enable on
                    #  non-svelte devices.
                    shared_libs = ["libc_scudo"];
                };
            };
        };
    };

    init_rc = ["mediatranscoding.rc"];

    cflags = [
        "-Werror"
        "-Wall"
    ];
};

in { inherit libmediatranscodingservice mediatranscoding; }
