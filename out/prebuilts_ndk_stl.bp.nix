{ ndk_prebuilt_shared_stl, ndk_prebuilt_static_stl }:
let

libcxx_includes = [
    "current/sources/cxx-stl/llvm-libc++/include"
    "current/sources/cxx-stl/llvm-libc++abi/include"
];

ndk_libandroid_support = ndk_prebuilt_static_stl {
    name = "ndk_libandroid_support";
    export_include_dirs = [
        "current/sources/android/support/include"
    ];
    arch = {
        arm64 = {
            enabled = false;
        };
        x86_64 = {
            enabled = false;
        };
    };
};

"ndk_libc++abi" = ndk_prebuilt_static_stl {
    name = "ndk_libc++abi";
};

#  The LLVM libunwind unwinder. This unwinder is only used for arm32.
ndk_libunwind = ndk_prebuilt_static_stl {
    name = "ndk_libunwind";
    enabled = false;
    arch = {
        arm = {
            enabled = true;
        };
    };
};

"ndk_libc++_static" = ndk_prebuilt_static_stl {
    name = "ndk_libc++_static";
    export_include_dirs = libcxx_includes;
};

"ndk_libc++_shared" = ndk_prebuilt_shared_stl {
    name = "ndk_libc++_shared";
    export_include_dirs = libcxx_includes;
};

in { inherit "ndk_libc++_shared" "ndk_libc++_static" "ndk_libc++abi" ndk_libandroid_support ndk_libunwind; }
