{ cc_library, cc_library_static, genrule, llndk_library, ndk_library }:
let

#
#  libdl
#
libdl_static = cc_library_static {
    name = "libdl_static";
    defaults = ["linux_bionic_supported"];
    recovery_available = true;

    srcs = [
        "libdl.cpp"
        "libdl_cfi.cpp"
    ];

    cflags = [
        "-Wall"
        "-Wextra"
        "-Wunused"
        "-Werror"
    ];

    #  For private/CFIShadow.h.
    include_dirs = ["bionic/libc"];

    stl = "none";
    system_shared_libs = [];

    sanitize = {
        never = true;
    };
};

libdl = cc_library {
    name = "libdl";
    recovery_available = true;
    static_ndk_lib = true;

    defaults = ["linux_bionic_supported"];

    #  NOTE: --exclude-libs=libgcc.a makes sure that any symbols libdl.so pulls from
    #  libgcc.a are made static to libdl.so.  This in turn ensures that libraries that
    #  a) pull symbols from libgcc.a and b) depend on libdl.so will not rely on libdl.so
    #  to provide those symbols, but will instead pull them from libgcc.a.  Specifically,
    #  we use this property to make sure libc.so has its own copy of the code from
    #  libgcc.a it uses.
    #
    #  DO NOT REMOVE --exclude-libs!

    ldflags = [
        "-Wl,--exclude-libs=libgcc.a"
        "-Wl,--exclude-libs=libgcc_stripped.a"
        "-Wl,--exclude-libs=libclang_rt.builtins-arm-android.a"
        "-Wl,--exclude-libs=libclang_rt.builtins-aarch64-android.a"
        "-Wl,--exclude-libs=libclang_rt.builtins-x86-android.a"
        "-Wl,--exclude-libs=libclang_rt.builtins-x86_64-android.a"
    ];

    #  for x86, exclude libgcc_eh.a for the same reasons as above
    arch = {
        arm = {
            version_script = ":libdl.arm.map";
            pack_relocations = false;
            ldflags = ["-Wl,--hash-style=both"];
        };
        arm64 = {
            version_script = ":libdl.arm64.map";
        };
        x86 = {
            pack_relocations = false;
            ldflags = [
                "-Wl,--exclude-libs=libgcc_eh.a"
                "-Wl,--hash-style=both"
            ];
            version_script = ":libdl.x86.map";
        };
        x86_64 = {
            ldflags = ["-Wl,--exclude-libs=libgcc_eh.a"];
            version_script = ":libdl.x86_64.map";
        };
    };
    shared = {
        whole_static_libs = ["libdl_static"];
    };
    static = {
        srcs = ["libdl_static.cpp"];
    };
    cflags = [
        "-Wall"
        "-Wextra"
        "-Wunused"
        "-Werror"
    ];
    stl = "none";

    nocrt = true;
    system_shared_libs = [];

    #  Opt out of native_coverage when opting out of system_shared_libs
    native_coverage = false;

    #  This is placeholder library the actual implementation is (currently)
    #  provided by the linker.
    shared_libs = ["ld-android"];

    sanitize = {
        never = true;
    };

    stubs = {
        symbol_file = "libdl.map.txt";
        versions = ["10000"];
    };
};

libdl_android = cc_library {
    name = "libdl_android";

    defaults = ["linux_bionic_supported"];
    recovery_available = true;

    #  NOTE: --exclude-libs=libgcc.a makes sure that any symbols libdl.so pulls from
    #  libgcc.a are made static to libdl.so.  This in turn ensures that libraries that
    #  a) pull symbols from libgcc.a and b) depend on libdl.so will not rely on libdl.so
    #  to provide those symbols, but will instead pull them from libgcc.a.  Specifically,
    #  we use this property to make sure libc.so has its own copy of the code from
    #  libgcc.a it uses.
    #
    #  DO NOT REMOVE --exclude-libs!

    ldflags = [
        "-Wl,--exclude-libs=libgcc.a"
        "-Wl,--exclude-libs=libgcc_stripped.a"
        "-Wl,--exclude-libs=libclang_rt.builtins-arm-android.a"
        "-Wl,--exclude-libs=libclang_rt.builtins-aarch64-android.a"
        "-Wl,--exclude-libs=libclang_rt.builtins-x86-android.a"
        "-Wl,--exclude-libs=libclang_rt.builtins-x86_64-android.a"
    ];

    #  for x86, exclude libgcc_eh.a for the same reasons as above
    arch = {
        x86 = {
            ldflags = [
                "-Wl,--exclude-libs=libgcc_eh.a"
            ];
        };
        x86_64 = {
            ldflags = ["-Wl,--exclude-libs=libgcc_eh.a"];
        };
    };

    srcs = ["libdl_android.cpp"];
    version_script = "libdl_android.map.txt";

    cflags = [
        "-Wall"
        "-Wextra"
        "-Wunused"
        "-Werror"
    ];

    stl = "none";

    nocrt = true;
    system_shared_libs = [];

    #  Opt out of native_coverage when opting out of system_shared_libs
    native_coverage = false;

    #  This is placeholder library the actual implementation is (currently)
    #  provided by the linker.
    shared_libs = ["ld-android"];

    sanitize = {
        never = true;
    };

    stubs = {
        symbol_file = "libdl_android.map.txt";
        versions = ["10000"];
    };
};

libdl = ndk_library {
    name = "libdl";
    symbol_file = "libdl.map.txt";
    first_version = "9";
};

libdl = llndk_library {
    name = "libdl";
    symbol_file = "libdl.map.txt";
};

"libdl.arm.map" = genrule {
    name = "libdl.arm.map";
    out = ["libdl.arm.map"];
    srcs = ["libdl.map.txt"];
    tool_files = [":bionic-generate-version-script"];
    cmd = "$(location :bionic-generate-version-script) arm $(in) $(out)";
};

"libdl.arm64.map" = genrule {
    name = "libdl.arm64.map";
    out = ["libdl.arm64.map"];
    srcs = ["libdl.map.txt"];
    tool_files = [":bionic-generate-version-script"];
    cmd = "$(location :bionic-generate-version-script) arm64 $(in) $(out)";
};

"libdl.x86.map" = genrule {
    name = "libdl.x86.map";
    out = ["libdl.x86.map"];
    srcs = ["libdl.map.txt"];
    tool_files = [":bionic-generate-version-script"];
    cmd = "$(location :bionic-generate-version-script) x86 $(in) $(out)";
};

"libdl.x86_64.map" = genrule {
    name = "libdl.x86_64.map";
    out = ["libdl.x86_64.map"];
    srcs = ["libdl.map.txt"];
    tool_files = [":bionic-generate-version-script"];
    cmd = "$(location :bionic-generate-version-script) x86_64 $(in) $(out)";
};

in { inherit "libdl.arm.map" "libdl.arm64.map" "libdl.x86.map" "libdl.x86_64.map" libdl libdl_android libdl_static; }
