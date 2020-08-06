{ aidl_interface, cc_binary, cc_defaults, cc_library_static, cc_test, genrule }:
let

tidy_errors = [
    "performance-faster-string-find"
    "performance-for-range-copy"
    "performance-implicit-conversion-in-loop"
    "performance-move-const-arg"
    "performance-move-constructor-init"
    "performance-noexcept-move-constructor"
    "performance-unnecessary-value-param"
];

apex_flags_defaults = cc_defaults {
    name = "apex_flags_defaults";
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
        "-Wno-unused-parameter"

        #  Some extra flags.
        "-fstrict-aliasing"
        "-Wredundant-decls"
        "-Wshadow"
        "-Wstrict-aliasing"
        "-Wthread-safety"
        "-Wthread-safety-negative"
        "-Wunreachable-code"
        "-Wunreachable-code-break"
        "-Wunreachable-code-return"
        "-Wunused"
        "-Wused-but-marked-unused"
    ];
    tidy = true;
    tidy_checks = tidy_errors;
    tidy_checks_as_errors = tidy_errors;
    tidy_flags = [
        "-format-style='file'"
        "--header-filter='system/apex/'"
    ];
};

apex_defaults = cc_defaults {
    name = "apex_defaults";
    defaults = ["apex_flags_defaults"];
    shared_libs = [
        "libbase"
        "libcrypto"
        "libjsoncpp"
        "libprotobuf-cpp-full"
        "libziparchive"
        "libcutils"
    ];
    static_libs = [
        "lib_apex_session_state_proto"
        "lib_apex_manifest_proto"
    ];
    static = {
        whole_static_libs = ["libc++fs"];
    };
    shared = {
        static_libs = ["libc++fs"];
    };
};

apex_aidl_interface = aidl_interface {
    name = "apex_aidl_interface";
    srcs = [
        "aidl/android/apex/ApexInfo.aidl"
        "aidl/android/apex/ApexInfoList.aidl"
        "aidl/android/apex/ApexSessionInfo.aidl"
        "aidl/android/apex/IApexService.aidl"
    ];
    local_include_dir = "aidl";
    backend = {
        java = {
            sdk_version = "28";
        };
        ndk = {
            enabled = false;
        };
    };
};

apexd = cc_binary {
    name = "apexd";
    defaults = [
        "apex_defaults"
        "libapexservice-deps"
    ];
    srcs = [
        "apexd_main.cpp"
    ];
    static_libs = [
        "libapex"
        "libapexd"
        "libapexd_checkpoint_vold"
        "libapexservice"
        "libavb"
        "libdm"
        "libvold_binder"
    ];
    shared_libs = [
        "libselinux"
    ];
    init_rc = ["apexd.rc"];
    #  Just like the init, apexd should be able to run without
    #  any APEX activated. To do so, it uses the bootstrap linker
    #  and the bootstrap bionic libraries.
    bootstrap = true;
    target = {
        android = {
            ldflags = ["-Wl,--rpath,/system/\${LIB}/bootstrap"];
        };
    };
};

libapexd = cc_library_static {
    name = "libapexd";
    defaults = ["apex_defaults"];
    srcs = [
        "apex_database.cpp"
        "apexd.cpp"
        "apexd_loop.cpp"
        "apexd_prepostinstall.cpp"
        "apexd_private.cpp"
        "apexd_prop.cpp"
        "apexd_session.cpp"
    ];
    static_libs = [
        "libapex"
        "libavb"
        "libdm"
    ];
    whole_static_libs = ["com.android.sysprop.apex"];
    shared_libs = [
        "libselinux"
    ];
    export_include_dirs = ["."];
};

libapexd_checkpoint_vold = cc_library_static {
    name = "libapexd_checkpoint_vold";
    defaults = ["apex_defaults"];
    srcs = ["apexd_checkpoint_vold.cpp"];
    static_libs = [
        "libbase"
        "libutils"
        "libvold_binder"
    ];
    export_include_dirs = ["."];
};

libapexservice-deps = cc_defaults {
    name = "libapexservice-deps";
    shared_libs = [
        "apex_aidl_interface-cpp"
        "libbinder"
        "libutils"
    ];
};

libapexservice = cc_library_static {
    name = "libapexservice";
    defaults = [
        "apex_defaults"
        "libapexservice-deps"
    ];
    srcs = ["apexservice.cpp"];
    static_libs = ["libapexd"];
};

libapex = cc_library_static {
    name = "libapex";
    defaults = ["apex_defaults"];
    srcs = [
        "apex_file.cpp"
        "apex_key.cpp"
        "apex_manifest.cpp"
        "apex_shim.cpp"
    ];
    static_libs = ["libavb"];
    host_supported = true;
    target = {
        darwin = {
            enabled = false;
        };
    };
    header_libs = [
        "libutils_headers"
    ];
    export_header_lib_headers = [
        "libutils_headers"
    ];
    product_variables = {
        debuggable = {
            cflags = ["-DDEBUG_ALLOW_BUNDLED_KEY"];
        };
    };
};

apex_database_test = cc_test {
    name = "apex_database_test";
    defaults = ["apex_defaults"];
    srcs = ["apex_database_test.cpp"];
    host_supported = true;
    target = {
        darwin = {
            enabled = false;
        };
    };
    shared_libs = ["libbase"];
    test_suites = ["device-tests"];
};

apex_file_test = cc_test {
    name = "apex_file_test";
    defaults = ["apex_defaults"];
    data = [
        ":apex.apexd_test"
        ":apex.apexd_test_no_inst_key"
        "apexd_testdata/com.android.apex.test_package.avbpubkey"
    ];
    srcs = [
        "apex_file_test.cpp"
    ];
    host_supported = true;
    target = {
        darwin = {
            enabled = false;
        };
    };
    static_libs = [
        "libapex"
        "libavb"
    ];
    shared_libs = ["libziparchive"];
    test_suites = ["device-tests"];
};

apex_manifest_test = cc_test {
    name = "apex_manifest_test";
    defaults = ["apex_defaults"];
    srcs = [
        "apex_manifest_test.cpp"
    ];
    host_supported = true;
    target = {
        darwin = {
            enabled = false;
        };
    };
    static_libs = [
        "libapex"
        "libavb"
    ];
    test_suites = ["device-tests"];
};

gen_bad_apexes = genrule {
    #  Generates an apex which has a different manifest outside the filesystem
    #  image.
    name = "gen_bad_apexes";
    out = ["apex.apexd_test_manifest_mismatch.apex"];
    srcs = [":apex.apexd_test"];
    tools = [
        "soong_zip"
        "zipalign"
    ];
    cmd = "unzip -q $(in) -d $(genDir) && " +
        "sed -i -e 's/\"version\": 1/\"version\": 137/' $(genDir)/apex_manifest.json && " +
        "$(location soong_zip) -d -C $(genDir) -D $(genDir) " +
        "-s apex_manifest.json -s apex_payload.img -s apex_pubkey " +
        "-o $(genDir)/unaligned.apex && " +
        "$(location zipalign) -f 4096 $(genDir)/unaligned.apex " +
        "$(genDir)/apex.apexd_test_manifest_mismatch.apex";
};

gen_corrupt_apex = genrule {
    #  Generates an apex with a corrupted filesystem image, which should cause
    #  dm-verity verification to fail
    name = "gen_corrupt_apex";
    out = ["apex.apexd_test_corrupt_apex.apex"];
    srcs = [":apex.apexd_test"];
    tools = [
        "soong_zip"
        "zipalign"
    ];
    cmd = "unzip -q $(in) -d $(genDir) && " +
        "dd if=/dev/zero of=$(genDir)/apex_payload.img conv=notrunc bs=1024 seek=16 count=1 && " +
        "$(location soong_zip) -d -C $(genDir) -D $(genDir) " +
        "-s apex_manifest.json -s apex_payload.img -s apex_pubkey " +
        "-o $(genDir)/unaligned.apex && " +
        "$(location zipalign) -f 4096 $(genDir)/unaligned.apex " +
        "$(genDir)/apex.apexd_test_corrupt_apex.apex";
};

apexservice_test = cc_test {
    name = "apexservice_test";
    defaults = ["apex_defaults"];
    cflags = [
        #  Otherwise libgmock won't compile.
        "-Wno-used-but-marked-unused"
    ];
    data = [
        ":apex.apexd_test"
        ":apex.apexd_test_different_app"
        ":apex.apexd_test_v2"
        ":apex.apexd_test_no_inst_key"
        ":apex.apexd_test_preinstall"
        ":apex.apexd_test_postinstall"
        ":apex.apexd_test_prepostinstall.fail"
        ":gen_bad_apexes"
        ":gen_corrupt_apex"
        ":com.android.apex.cts.shim.v1_prebuilt"
        ":com.android.apex.cts.shim.v2_prebuilt"
        ":com.android.apex.cts.shim.v2_wrong_sha_prebuilt"
        ":com.android.apex.cts.shim.v2_additional_file_prebuilt"
        ":com.android.apex.cts.shim.v2_additional_folder_prebuilt"
        ":com.android.apex.cts.shim.v2_with_pre_install_hook_prebuilt"
        ":com.android.apex.cts.shim.v2_with_post_install_hook_prebuilt"
    ];
    srcs = ["apexservice_test.cpp"];
    host_supported = false;
    compile_multilib = "first";
    static_libs = [
        "apex_aidl_interface-cpp"
        "libapex"
        "libapexd"
        "libavb"
        "libdm"
        "libgmock"
        "libvold_binder"
    ];
    shared_libs = [
        "libbinder"
        "libselinux"
        "libutils"
    ];
    test_suites = ["device-tests"];
    test_config = "apexservice_test_config.xml";
};

in { inherit apex_aidl_interface apex_database_test apex_defaults apex_file_test apex_flags_defaults apex_manifest_test apexd apexservice_test gen_bad_apexes gen_corrupt_apex libapex libapexd libapexd_checkpoint_vold libapexservice libapexservice-deps; }
