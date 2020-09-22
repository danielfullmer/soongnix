{ rust_library_host_rlib, rust_test_host }:
let

#  This file is generated by cargo2android.py, added defaults.

kvm_sys_tests_kvm_sys = rust_test_host {
    name = "kvm_sys_tests_kvm_sys";
    defaults = ["crosvm_defaults"];
    crate_name = "kvm_sys";
    srcs = ["src/lib.rs"];
    relative_install_path = "kvm_sys_tests";
    test_suites = ["general-tests"];
    auto_gen_config = true;
    rlibs = [
        "liblibc"
        "libsys_util"
    ];
};

kvm_sys_tests_sanity = rust_test_host {
    name = "kvm_sys_tests_sanity";
    defaults = ["crosvm_defaults"];
    crate_name = "sanity";
    srcs = ["tests/sanity.rs"];
    relative_install_path = "kvm_sys_tests";
    test_suites = ["general-tests"];
    auto_gen_config = true;
    rlibs = [
        "libkvm_sys"
        "liblibc"
        "libsys_util"
    ];
};

libkvm_sys = rust_library_host_rlib {
    name = "libkvm_sys";
    defaults = ["crosvm_defaults"];
    crate_name = "kvm_sys";
    srcs = ["src/lib.rs"];
    rlibs = [
        "liblibc"
        "libsys_util"
    ];
};

in { inherit kvm_sys_tests_kvm_sys kvm_sys_tests_sanity libkvm_sys; }
