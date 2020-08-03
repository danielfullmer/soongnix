{ cc_defaults, cc_library_shared, cc_test }:
let

build_version_test_defaults = cc_defaults {
    name = "build_version_test_defaults";
    use_version_lib = true;
    host_supported = true;
    dist = {
        targets = ["test_build_version_test"];
    };
    target = {
        android_arm = {
            dist = {
                dir = "android/arm";
            };
        };
        android_arm64 = {
            dist = {
                dir = "android/arm64";
            };
        };
        android_x86 = {
            dist = {
                dir = "android/x86";
            };
        };
        android_x86_64 = {
            dist = {
                dir = "android/x86_64";
            };
        };
        darwin = {
            dist = {
                dir = "host/";
            };
        };
        linux_glibc_x86 = {
            dist = {
                dir = "host32/";
            };
        };
        linux_glibc_x86_64 = {
            dist = {
                dir = "host/";
            };
        };
        windows = {
            enabled = true;
        };
        windows_x86_64 = {
            dist = {
                dest = "win64/build_ver_test.exe";
            };
        };
    };
};

build_version_test = cc_test {
    name = "build_version_test";
    defaults = ["build_version_test_defaults"];
    srcs = ["build_version_test.cpp"];
    target = {
        android = {
            shared_libs = ["libbuild_version_test"];
        };
        not_windows = {
            shared_libs = ["libbuild_version_test"];
        };
        host = {
            dist = {
                suffix = "_host";
            };
        };
    };
};

libbuild_version_test = cc_library_shared {
    name = "libbuild_version_test";
    defaults = ["build_version_test_defaults"];
    srcs = ["build_version_test_lib.cpp"];
    target = {
        windows = {
            enabled = false;
        };
    };
};

in { inherit build_version_test build_version_test_defaults libbuild_version_test; }
