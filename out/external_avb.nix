{ cc_binary, cc_defaults, cc_library, cc_library_headers, cc_library_host_static, cc_library_static, cc_test_host, genrule, python_binary_host, python_library_host, python_test_host }:
let

#
#  Copyright (C) 2017 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#

subdirs = [
    "test"
    "tools"
];

avb_defaults = cc_defaults {
    name = "avb_defaults";
    cflags = [
        "-D_FILE_OFFSET_BITS=64"
        "-D_POSIX_C_SOURCE=199309L"
        "-Wa,--noexecstack"
        "-Werror"
        "-Wall"
        "-Wextra"
        "-Wformat=2"
        "-Wmissing-prototypes"
        "-Wno-psabi"
        "-Wno-unused-parameter"
        "-Wno-format"
        "-ffunction-sections"
        "-fstack-protector-strong"
        "-g"
        "-DAVB_ENABLE_DEBUG"
        "-DAVB_COMPILATION"
    ];
    cppflags = [
        "-Wnon-virtual-dtor"
        "-fno-strict-aliasing"
    ];
    ldflags = [
        "-Wl,--gc-sections"
        "-rdynamic"
    ];
    target = {
        darwin = {
            enabled = false;
        };
    };
};

avb_sources = cc_defaults {
    name = "avb_sources";
    srcs = [
        "libavb/avb_chain_partition_descriptor.c"
        "libavb/avb_cmdline.c"
        "libavb/avb_crc32.c"
        "libavb/avb_crypto.c"
        "libavb/avb_descriptor.c"
        "libavb/avb_footer.c"
        "libavb/avb_hash_descriptor.c"
        "libavb/avb_hashtree_descriptor.c"
        "libavb/avb_kernel_cmdline_descriptor.c"
        "libavb/avb_property_descriptor.c"
        "libavb/avb_rsa.c"
        "libavb/avb_sha256.c"
        "libavb/avb_sha512.c"
        "libavb/avb_slot_verify.c"
        "libavb/avb_util.c"
        "libavb/avb_vbmeta_image.c"
        "libavb/avb_version.c"
    ];
};

avbtool = python_binary_host {
    name = "avbtool";
    srcs = [":avbtool_py"];
    main = "avbtool.py";
    required = ["fec"];
    version = {
        py2 = {
            enabled = true;
            embedded_launcher = true;
        };
        py3 = {
            enabled = false;
        };
    };
};

aftltool_py = genrule {
    name = "aftltool_py";
    srcs = ["aftltool"];
    out = ["aftltool.py"];
    cmd = "cp $(in) $(out)";
};

aftl_proto = python_library_host {
    name = "aftl_proto";
    srcs = [
        "proto/__init__.py"
        "proto/aftl_pb2.py"
        "proto/aftl_pb2_grpc.py"
        "proto/api_pb2.py"
        "proto/api_pb2_grpc.py"
        "proto/trillian_pb2.py"
        "proto/trillian_pb2_grpc.py"
        "proto/aftl_google/__init__.py"
        "proto/aftl_google/api/__init__.py"
        "proto/aftl_google/api/annotations_pb2.py"
        "proto/aftl_google/api/annotations_pb2_grpc.py"
        "proto/aftl_google/api/http_pb2.py"
        "proto/aftl_google/api/http_pb2_grpc.py"
        "proto/aftl_google/rpc/__init__.py"
        "proto/aftl_google/rpc/status_pb2.py"
        "proto/aftl_google/rpc/status_pb2_grpc.py"
        "proto/crypto/__init__.py"
        "proto/crypto/keyspb/__init__.py"
        "proto/crypto/keyspb/keyspb_pb2.py"
        "proto/crypto/keyspb/keyspb_pb2_grpc.py"
        "proto/crypto/sigpb/__init__.py"
        "proto/crypto/sigpb/sigpb_pb2.py"
        "proto/crypto/sigpb/sigpb_pb2_grpc.py"
    ];
    version = {
        py2 = {
            enabled = true;
            #  This is needs to be false due to b/146057182#comment5.
            embedded_launcher = false;
        };
        py3 = {
            enabled = false;
        };
    };
};

aftltool = python_binary_host {
    name = "aftltool";
    srcs = [
        ":aftltool_py"
        ":avbtool_py"
    ];
    libs = [
        "aftl_proto"
    ];
    main = "aftltool.py";
    required = ["fec"];
    version = {
        py2 = {
            enabled = true;
            embedded_launcher = false;
        };
        py3 = {
            enabled = false;
        };
    };
};

aftltool_test = python_test_host {
    name = "aftltool_test";
    main = "aftltool_test.py";
    srcs = [
        ":aftltool_py"
        ":avbtool_py"
        "aftltool_test.py"
    ];
    libs = [
        "aftl_proto"
    ];
    data = [
        "test/data/aftl_descriptor.bin"
        "test/data/aftl_descriptor_multi.bin"
        "test/data/aftl_key_bytes.bin"
        "test/data/aftl_log_key_bytes.bin"
        "test/data/aftl_log_sig.bin"
        "test/data/aftl_verify_full.img"
        "test/data/aftl_verify_vbmeta.bin"
        "test/data/atx_metadata.bin"
        "test/data/atx_permanent_attributes.bin"
        "test/data/atx_pik_certificate.bin"
        "test/data/atx_product_id.bin"
        "test/data/atx_psk_certificate.bin"
        "test/data/atx_puk_certificate.bin"
        "test/data/atx_unlock_challenge.bin"
        "test/data/atx_unlock_credential.bin"
        "test/data/find_aftl_descriptor.bin"
        "test/data/large_blob.bin"
        "test/data/small_blob.bin"
        "test/data/test_file.bin"
        "test/data/test_file.bin.sparse"
        "test/data/testkey_atx_pik.pem"
        "test/data/testkey_atx_prk.pem"
        "test/data/testkey_atx_psk.pem"
        "test/data/testkey_atx_puk.pem"
        "test/data/testkey_rsa2048.pem"
        "test/data/testkey_rsa4096.pem"
        "test/data/testkey_rsa8192.pem"
        "test/data/aftltool/aftl_input_vbmeta.img"
        "test/data/aftltool/aftl_output_vbmeta_with_1_icp.img"
        "test/data/aftltool/aftl_output_vbmeta_with_2_icp_different_logs.img"
        "test/data/aftltool/aftl_output_vbmeta_with_2_icp_same_log.img"
        "test/data/aftltool/aftl_pubkey_1.pub"
        "test/data/aftltool/aftl_pubkey_2.pub"
    ];
    test_suites = ["general-tests"];
    version = {
        py2 = {
            enabled = true;
            #  This is needs to be false due to b/146057182#comment5.
            embedded_launcher = false;
        };
        py3 = {
            enabled = false;
        };
    };
};

avbtool_py = genrule {
    name = "avbtool_py";
    srcs = ["avbtool"];
    out = ["avbtool.py"];
    cmd = "cp $(in) $(out)";
};

#  Build libavb - this is a static library that depends
#  on only libc and doesn't drag in any other dependencies.
libavb = cc_library_static {
    name = "libavb";
    defaults = [
        "avb_defaults"
        "avb_sources"
    ];
    host_supported = true;
    recovery_available = true;
    header_libs = [
        "avb_headers"
    ];
    export_header_lib_headers = ["avb_headers"];
    target = {
        linux = {
            srcs = ["libavb/avb_sysdeps_posix.c"];
        };
        linux_glibc = {
            cflags = ["-fno-stack-protector"];
        };
    };
};

#  Build libavb_user for the target - in addition to libavb, it
#  includes libavb_ab, libavb_user and also depends on libbase and
#  libfs_mgr.
libavb_user = cc_library_static {
    name = "libavb_user";
    defaults = [
        "avb_defaults"
        "avb_sources"
    ];
    recovery_available = true;
    header_libs = [
        "avb_headers"
    ];
    export_header_lib_headers = ["avb_headers"];
    shared_libs = ["libbase"];
    static_libs = ["libfs_mgr"];
    cflags = [
        "-DAVB_AB_I_UNDERSTAND_LIBAVB_AB_IS_DEPRECATED"
    ];
    srcs = [
        "libavb/avb_sysdeps_posix.c"
        "libavb_ab/avb_ab_flow.c"
        "libavb_user/avb_ops_user.cpp"
        "libavb_user/avb_user_verity.c"
        "libavb_user/avb_user_verification.c"
    ];
};

avbctl = cc_binary {
    name = "avbctl";
    defaults = ["avb_defaults"];
    static_libs = [
        "libavb_user"
        "libfs_mgr"
    ];
    shared_libs = ["libbase"];
    srcs = ["tools/avbctl/avbctl.cc"];
};

libavb_ab_host = cc_library_host_static {
    name = "libavb_ab_host";
    defaults = ["avb_defaults"];
    header_libs = [
        "avb_headers"
    ];
    export_header_lib_headers = ["avb_headers"];
    cflags = [
        "-fno-stack-protector"
        "-DAVB_AB_I_UNDERSTAND_LIBAVB_AB_IS_DEPRECATED"
    ];
    srcs = ["libavb_ab/avb_ab_flow.c"];
};

libavb_aftl_host = cc_library_host_static {
    name = "libavb_aftl_host";
    defaults = [
        "avb_defaults"
        "avb_sources"
    ];
    header_libs = ["avb_headers"];
    export_header_lib_headers = ["avb_headers"];
    cflags = [
        "-fno-stack-protector"
    ];
    srcs = [
        "libavb_aftl/avb_aftl_util.c"
        "libavb_aftl/avb_aftl_validate.c"
        "libavb_aftl/avb_aftl_verify.c"
    ];
};

libavb_atx_host = cc_library_host_static {
    name = "libavb_atx_host";
    defaults = ["avb_defaults"];
    header_libs = [
        "avb_headers"
    ];
    export_header_lib_headers = ["avb_headers"];
    cflags = [
        "-fno-stack-protector"
    ];
    srcs = ["libavb_atx/avb_atx_validate.c"];
};

libavb_host_sysdeps = cc_library_host_static {
    name = "libavb_host_sysdeps";
    defaults = ["avb_defaults"];
    header_libs = [
        "avb_headers"
    ];
    export_header_lib_headers = ["avb_headers"];
    srcs = ["libavb/avb_sysdeps_posix.c"];
};

libavb_things_example = cc_library_host_static {
    name = "libavb_things_example";
    defaults = ["avb_defaults"];
    header_libs = [
        "avb_headers"
    ];
    export_header_lib_headers = ["avb_headers"];
    srcs = ["examples/things/avb_atx_slot_verify.c"];
};

libavb_host_unittest = cc_test_host {
    name = "libavb_host_unittest";
    defaults = ["avb_defaults"];
    required = [
        "simg2img"
        "img2simg"
        "avbtool"
    ];
    data = [
        "avbtool"
        "test/avbtool_signing_helper_test.py"
        "test/avbtool_signing_helper_with_files_test.py"
        "test/data/aftl_descriptor.bin"
        "test/data/aftl_descriptor_multi.bin"
        "test/data/aftl_key_bytes.bin"
        "test/data/aftl_log_key_bytes.bin"
        "test/data/aftl_log_sig.bin"
        "test/data/aftl_verify_full.img"
        "test/data/aftl_verify_vbmeta.bin"
        "test/data/aftltool/"
        "test/data/atx_metadata.bin"
        "test/data/atx_permanent_attributes.bin"
        "test/data/atx_pik_certificate.bin"
        "test/data/atx_product_id.bin"
        "test/data/atx_psk_certificate.bin"
        "test/data/atx_puk_certificate.bin"
        "test/data/atx_unlock_challenge.bin"
        "test/data/atx_unlock_credential.bin"
        "test/data/find_aftl_descriptor.bin"
        "test/data/large_blob.bin"
        "test/data/small_blob.bin"
        "test/data/test_file.bin"
        "test/data/test_file.bin.sparse"
        "test/data/testkey_atx_pik.pem"
        "test/data/testkey_atx_prk.pem"
        "test/data/testkey_atx_psk.pem"
        "test/data/testkey_atx_puk.pem"
        "test/data/testkey_rsa2048.pem"
        "test/data/testkey_rsa4096.pem"
        "test/data/testkey_rsa8192.pem"
    ];
    test_config = "test/libavb_host_unittest.xml";
    test_suites = ["general-tests"];
    static_libs = [
        "libavb"
        "libavb_ab_host"
        "libavb_aftl_host"
        "libavb_atx_host"
        "libavb_things_example"
        "libgmock_host"
        "libgtest_host"
    ];
    shared_libs = [
        "libbase"
        "libchrome"
        "libcrypto"
    ];
    cflags = [
        "-Wno-missing-prototypes"
        "-DAVB_AB_I_UNDERSTAND_LIBAVB_AB_IS_DEPRECATED"
    ];
    srcs = [
        "test/avb_ab_flow_unittest.cc"
        "test/avb_aftl_util_unittest.cc"
        "test/avb_aftl_validate_unittest.cc"
        "test/avb_aftl_verify_unittest.cc"
        "test/avb_atx_validate_unittest.cc"
        "test/avb_atx_slot_verify_unittest.cc"
        "test/avb_slot_verify_unittest.cc"
        "test/avb_unittest_util.cc"
        "test/avb_util_unittest.cc"
        "test/avb_vbmeta_image_unittest.cc"
        "test/avbtool_unittest.cc"
        "test/fake_avb_ops.cc"
        "test/avb_sysdeps_posix_testing.cc"
    ];
};

libavb_host_user_code_test = cc_library_host_static {
    name = "libavb_host_user_code_test";
    defaults = ["avb_defaults"];
    cflags = [
        "-DAVB_AB_I_UNDERSTAND_LIBAVB_AB_IS_DEPRECATED"
    ];
    srcs = ["test/user_code_test.cc"];
};

"bootctrl.avb" = cc_library {
    name = "bootctrl.avb";
    defaults = ["avb_defaults"];
    relative_install_path = "hw";
    static_libs = [
        "libavb_user"
        "libfs_mgr"
    ];
    shared_libs = [
        "libbase"
        "libcutils"
    ];
    cflags = [
        "-DAVB_AB_I_UNDERSTAND_LIBAVB_AB_IS_DEPRECATED"
    ];
    srcs = ["boot_control/boot_control_avb.c"];
};

avb_headers = cc_library_headers {
    name = "avb_headers";
    host_supported = true;
    recovery_available = true;
    export_include_dirs = ["."];
    target = {
        windows = {
            enabled = true;
        };
    };
};

in { inherit "bootctrl.avb" aftl_proto aftltool aftltool_py aftltool_test avb_defaults avb_headers avb_sources avbctl avbtool avbtool_py libavb libavb_ab_host libavb_aftl_host libavb_atx_host libavb_host_sysdeps libavb_host_unittest libavb_host_user_code_test libavb_things_example libavb_user; }
