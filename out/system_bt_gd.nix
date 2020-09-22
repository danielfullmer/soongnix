{ cc_benchmark, cc_binary, cc_defaults, cc_fuzz, cc_library, cc_library_host_shared, cc_test, filegroup, genrule }:
let

gd_defaults = cc_defaults {
    name = "gd_defaults";
    target = {
        android = {
            test_config_template = "AndroidTestTemplate.xml";
            cflags = [
                "-DOS_ANDROID"
                "-DOS_LINUX_GENERIC"
            ];
            shared_libs = [
                "liblog"
            ];
        };
        host = {
            cflags = [
                "-DOS_LINUX"
                "-DOS_LINUX_GENERIC"
            ];
        };
        darwin = {
            enabled = false;
        };
    };
    cpp_std = "c++17";
    cflags = [
        "-DEXPORT_SYMBOL=__attribute__((visibility(\"default\")))"
        "-fvisibility=hidden"
        "-DLOG_NDEBUG=1"
        "-DGOOGLE_PROTOBUF_NO_RTTI"
        "-Wno-unused-parameter"
        "-Wno-unused-result"
    ];
    conlyflags = [
        "-std=c99"
    ];
    sanitize = {
        misc_undefined = ["bounds"];
    };
};

#  Enables code coverage for a set of source files. Must be combined with
#  "clang_coverage_bin" in order to work. See //test/gen_coverage.py for more information
#  on generating code coverage.
gd_clang_file_coverage = cc_defaults {
    name = "gd_clang_file_coverage";
    target = {
        host = {
            clang_cflags = [
                "-fprofile-instr-generate"
                "-fcoverage-mapping"
            ];
        };
    };
};

#  Enabled code coverage on a binary. These flags allow libraries that were
#  compiled with "clang_file_coverage" to be properly linked together in
#  order to create a binary that will create a profraw file when ran. Note
#  these flags themselves don't enable code coverage for the source files
#  compiled in the binary. See //test/gen_coverage.py for more information
#  on generating code coverage.
gd_clang_coverage_bin = cc_defaults {
    name = "gd_clang_coverage_bin";
    target = {
        host = {
            ldflags = [
                "-fprofile-instr-generate"
                "-fcoverage-mapping"
            ];
        };
    };
};

libbluetooth_gd = cc_library {
    name = "libbluetooth_gd";
    defaults = [
        "gd_defaults"
        "gd_clang_file_coverage"
    ];
    host_supported = true;
    target = {
        linux = {
            srcs = [
                ":BluetoothOsSources_linux_generic"
            ];
        };
        host = {
            srcs = [
                ":BluetoothHalSources_hci_rootcanal"
            ];
        };
        android = {
            srcs = [
                ":BluetoothHalSources_hci_android_hidl"
            ];
            shared_libs = [
                "android.hardware.bluetooth@1.0"
                "libhidlbase"
                "libutils"
            ];
        };
    };
    srcs = [
        "stack_manager.cc"
        "module.cc"
        ":BluetoothAttSources"
        ":BluetoothCommonSources"
        ":BluetoothCryptoToolboxSources"
        ":BluetoothHalSources"
        ":BluetoothHciSources"
        ":BluetoothL2capSources"
        ":BluetoothNeighborSources"
        ":BluetoothPacketSources"
        ":BluetoothShimSources"
        ":BluetoothSecuritySources"
        ":BluetoothStorageSources"
    ];
    generated_headers = [
        "BluetoothGeneratedPackets_h"
    ];
    shared_libs = [
        "libchrome"
    ];
};

bluetooth_stack_with_facade = cc_binary {
    name = "bluetooth_stack_with_facade";
    defaults = [
        "gd_defaults"
    ];
    host_supported = true;
    srcs = [
        "facade/facade_main.cc"
        "facade/grpc_root_server.cc"
        "facade/read_only_property_server.cc"
        "grpc/grpc_module.cc"
        ":BluetoothFacade_hci_hal"
        ":BluetoothFacade_hci_layer"
        ":BluetoothFacade_l2cap_layer"
        ":BluetoothFacade_neighbor"
        ":BluetoothFacade_security_layer"
    ];
    generated_headers = [
        "BluetoothGeneratedPackets_h"
        "BluetoothFacadeGeneratedStub_h"
    ];
    generated_sources = [
        "BluetoothFacadeGeneratedStub_cc"
    ];
    static_libs = [
        "libbluetooth_gd"
    ];
    shared_libs = [
        "libchrome"
        "libgrpc++_unsecure"
        "libprotobuf-cpp-full"
    ];
    target = {
        android = {
            shared_libs = [
                "android.hardware.bluetooth@1.0"
                "libhidlbase"
                "libutils"
            ];
        };
        host = {
            required = [
                "root-canal"
            ];
        };
    };
    sanitize = {
        address = true;
    };
};

bluetooth_test_gd = cc_test {
    name = "bluetooth_test_gd";
    test_suites = ["device-tests"];
    defaults = [
        "gd_defaults"
        "gd_clang_coverage_bin"
    ];
    host_supported = true;
    target = {
        linux = {
            srcs = [
                ":BluetoothOsTestSources_linux_generic"
            ];
        };
        host = {
            srcs = [
                ":BluetoothHalTestSources_hci_rootcanal"
            ];
        };
        android = {
            srcs = [
                ":BluetoothHalTestSources_hci_android_hidl"
            ];
            shared_libs = [
                "android.hardware.bluetooth@1.0"
                "libhidlbase"
                "libutils"
            ];
        };
    };
    srcs = [
        "module_unittest.cc"
        "stack_manager_unittest.cc"
        ":BluetoothAttTestSources"
        ":BluetoothCommonTestSources"
        ":BluetoothCryptoToolboxTestSources"
        ":BluetoothHciTestSources"
        ":BluetoothL2capTestSources"
        ":BluetoothNeighborTestSources"
        ":BluetoothPacketTestSources"
        ":BluetoothSecurityTestSources"
        ":BluetoothShimTestSources"
        ":BluetoothStorageTestSources"
    ];
    generated_headers = [
        "BluetoothGeneratedPackets_h"
    ];
    static_libs = [
        "libbluetooth_gd"
        "libgmock"
    ];
    shared_libs = [
        "libchrome"
    ];
    sanitize = {
        address = true;
    };
};

bluetooth_packet_parser_test = cc_test {
    name = "bluetooth_packet_parser_test";
    test_suites = ["device-tests"];
    defaults = [
        "gd_defaults"
        "gd_clang_coverage_bin"
    ];
    host_supported = true;
    srcs = [
        ":BluetoothPacketSources"
        ":BluetoothPacketParserTestPacketTestSources"
    ];
    generated_headers = [
        "BluetoothPacketParserTestPacketPdlGen_h"
    ];
    sanitize = {
        address = true;
        cfi = true;
    };
};

bluetooth_gd_fuzz_test = cc_fuzz {
    name = "bluetooth_gd_fuzz_test";
    defaults = ["gd_defaults"];
    srcs = [
        "fuzz_test.cc"
        ":BluetoothHciFuzzTestSources"
        ":BluetoothL2capFuzzTestSources"
    ];
    static_libs = [
        "libbluetooth_gd"
        "libchrome"
        "libgmock"
        "libgtest"
    ];
    host_supported = true;
    generated_headers = [
        "BluetoothGeneratedPackets_h"
    ];
    target = {
        android = {
            shared_libs = [
                "android.hardware.bluetooth@1.0"
                "libhidlbase"
                "libutils"
            ];
        };
    };
};

bluetooth_benchmark_gd = cc_benchmark {
    name = "bluetooth_benchmark_gd";
    defaults = ["gd_defaults"];
    host_supported = true;
    srcs = [
        "benchmark.cc"
        ":BluetoothOsBenchmarkSources"
    ];
    static_libs = [
        "libbluetooth_gd"
    ];
    shared_libs = [
        "libchrome"
    ];
};

BluetoothHciClassSources = filegroup {
    name = "BluetoothHciClassSources";
    srcs = [
        "hci/address.cc"
        "hci/class_of_device.cc"
    ];
};

BluetoothGeneratedPackets_h = genrule {
    name = "BluetoothGeneratedPackets_h";
    tools = [
        "bluetooth_packetgen"
    ];
    cmd = "$(location bluetooth_packetgen) --include=system/bt/gd --out=$(genDir) $(in)";
    srcs = [
        "hci/hci_packets.pdl"
        "l2cap/l2cap_packets.pdl"
        "security/smp_packets.pdl"
    ];
    out = [
        "hci/hci_packets.h"
        "l2cap/l2cap_packets.h"
        "security/smp_packets.h"
    ];
};

BluetoothGeneratedPackets_python3_cc = genrule {
    name = "BluetoothGeneratedPackets_python3_cc";
    tools = [
        "bluetooth_packetgen"
    ];
    cmd = "$(location bluetooth_packetgen) --include=system/bt/gd --out=$(genDir) --num_shards=5 $(in)";
    srcs = [
        "hci/hci_packets.pdl"
        "l2cap/l2cap_packets.pdl"
        "security/smp_packets.pdl"
    ];
    out = [
        "hci/hci_packets_python3.cc"
        "hci/hci_packets_python3_shard_0.cc"
        "hci/hci_packets_python3_shard_1.cc"
        "hci/hci_packets_python3_shard_2.cc"
        "hci/hci_packets_python3_shard_3.cc"
        "hci/hci_packets_python3_shard_4.cc"
        "l2cap/l2cap_packets_python3.cc"
        "l2cap/l2cap_packets_python3_shard_0.cc"
        "l2cap/l2cap_packets_python3_shard_1.cc"
        "l2cap/l2cap_packets_python3_shard_2.cc"
        "l2cap/l2cap_packets_python3_shard_3.cc"
        "l2cap/l2cap_packets_python3_shard_4.cc"
        "security/smp_packets_python3.cc"
        "security/smp_packets_python3_shard_0.cc"
        "security/smp_packets_python3_shard_1.cc"
        "security/smp_packets_python3_shard_2.cc"
        "security/smp_packets_python3_shard_3.cc"
        "security/smp_packets_python3_shard_4.cc"
    ];
};

BluetoothFacadeProto = filegroup {
    name = "BluetoothFacadeProto";
    srcs = [
        "facade/common.proto"
        "facade/rootservice.proto"
        "hal/facade.proto"
        "hci/facade/facade.proto"
        "hci/facade/acl_manager_facade.proto"
        "hci/facade/controller_facade.proto"
        "hci/facade/le_acl_manager_facade.proto"
        "hci/facade/le_advertising_manager_facade.proto"
        "hci/facade/le_scanning_manager_facade.proto"
        "neighbor/facade/facade.proto"
        "l2cap/classic/facade.proto"
        "security/facade.proto"
    ];
};

BluetoothFacadeGeneratedStub_h = genrule {
    name = "BluetoothFacadeGeneratedStub_h";
    tools = [
        "aprotoc"
        "protoc-gen-grpc-cpp-plugin"
    ];
    cmd = "$(location aprotoc) -Isystem/bt/gd -Iexternal/protobuf/src --plugin=protoc-gen-grpc=$(location protoc-gen-grpc-cpp-plugin) $(in) --grpc_out=$(genDir) --cpp_out=$(genDir)";
    srcs = [
        ":BluetoothFacadeProto"
    ];
    out = [
        "facade/common.grpc.pb.h"
        "facade/common.pb.h"
        "facade/rootservice.grpc.pb.h"
        "facade/rootservice.pb.h"
        "hal/facade.grpc.pb.h"
        "hal/facade.pb.h"
        "hci/facade/facade.grpc.pb.h"
        "hci/facade/facade.pb.h"
        "hci/facade/acl_manager_facade.grpc.pb.h"
        "hci/facade/acl_manager_facade.pb.h"
        "hci/facade/controller_facade.grpc.pb.h"
        "hci/facade/controller_facade.pb.h"
        "hci/facade/le_acl_manager_facade.grpc.pb.h"
        "hci/facade/le_acl_manager_facade.pb.h"
        "hci/facade/le_advertising_manager_facade.grpc.pb.h"
        "hci/facade/le_advertising_manager_facade.pb.h"
        "hci/facade/le_scanning_manager_facade.grpc.pb.h"
        "hci/facade/le_scanning_manager_facade.pb.h"
        "l2cap/classic/facade.grpc.pb.h"
        "l2cap/classic/facade.pb.h"
        "neighbor/facade/facade.grpc.pb.h"
        "neighbor/facade/facade.pb.h"
        "security/facade.grpc.pb.h"
        "security/facade.pb.h"
    ];
};

BluetoothFacadeGeneratedStub_cc = genrule {
    name = "BluetoothFacadeGeneratedStub_cc";
    tools = [
        "aprotoc"
        "protoc-gen-grpc-cpp-plugin"
    ];
    cmd = "$(location aprotoc) -Isystem/bt/gd -Iexternal/protobuf/src --plugin=protoc-gen-grpc=$(location protoc-gen-grpc-cpp-plugin) $(in) --grpc_out=$(genDir) --cpp_out=$(genDir)";
    srcs = [
        ":BluetoothFacadeProto"
    ];
    out = [
        "facade/common.grpc.pb.cc"
        "facade/common.pb.cc"
        "facade/rootservice.grpc.pb.cc"
        "facade/rootservice.pb.cc"
        "hal/facade.grpc.pb.cc"
        "hal/facade.pb.cc"
        "hci/facade/facade.grpc.pb.cc"
        "hci/facade/facade.pb.cc"
        "hci/facade/acl_manager_facade.grpc.pb.cc"
        "hci/facade/acl_manager_facade.pb.cc"
        "hci/facade/controller_facade.grpc.pb.cc"
        "hci/facade/controller_facade.pb.cc"
        "hci/facade/le_acl_manager_facade.grpc.pb.cc"
        "hci/facade/le_acl_manager_facade.pb.cc"
        "hci/facade/le_advertising_manager_facade.grpc.pb.cc"
        "hci/facade/le_advertising_manager_facade.pb.cc"
        "hci/facade/le_scanning_manager_facade.grpc.pb.cc"
        "hci/facade/le_scanning_manager_facade.pb.cc"
        "l2cap/classic/facade.grpc.pb.cc"
        "l2cap/classic/facade.pb.cc"
        "neighbor/facade/facade.grpc.pb.cc"
        "neighbor/facade/facade.pb.cc"
        "security/facade.grpc.pb.cc"
        "security/facade.pb.cc"
    ];
};

BluetoothFacadeAndCertGeneratedStub_py = genrule {
    name = "BluetoothFacadeAndCertGeneratedStub_py";
    tools = [
        "aprotoc"
        "protoc-gen-grpc-python-plugin"
        "soong_zip"
    ];
    cmd = "$(location aprotoc) -Isystem/bt/gd -Iexternal/protobuf/src --plugin=protoc-gen-grpc=$(location protoc-gen-grpc-python-plugin) $(in) --grpc_out=$(genDir) --python_out=$(genDir); " +
        "touch $(genDir)/facade/__init__.py; " +
        "touch $(genDir)/hal/__init__.py; " +
        "touch $(genDir)/hci/__init__.py; " +
        "touch $(genDir)/hci/facade/__init__.py; " +
        "touch $(genDir)/l2cap/classic/__init__.py; " +
        "touch $(genDir)/neighbor/facade/__init__.py; " +
        "touch $(genDir)/security/__init__.py; " +
        "$(location soong_zip) -C $(genDir) -D $(genDir) -o $(out)";
    srcs = [
        ":BluetoothFacadeProto"
    ];
    out = ["bluetooth_cert_generated_py.zip"];
    dist = {
        targets = ["bluetooth_stack_with_facade"];
    };

};

bluetooth_py3_native_extension_defaults = cc_defaults {
    name = "bluetooth_py3_native_extension_defaults";
    include_dirs = [
        "external/python/cpython3/Include"
    ];
    target = {
        android = {
            include_dirs = ["external/python/cpython3/android/bionic/pyconfig"];
        };
        android_arm = {
            cflags = ["-DSOABI=\"cpython-38android-arm-android-bionic\""];
            suffix = ".cpython-38android-arm-android-bionic";
        };
        android_arm64 = {
            cflags = ["-DSOABI=\"cpython-38android-arm64-android-bionic\""];
            suffix = ".cpython-38android-arm64-android-bionic";
        };
        android_x86 = {
            cflags = ["-DSOABI=\"cpython-38android-x86-android-bionic\""];
            suffix = ".cpython-38android-x86-android-bionic";
        };
        android_x86_64 = {
            cflags = ["-DSOABI=\"cpython-38android-x86_64-android-bionic\""];
            suffix = ".cpython-38android-x86_64-android-bionic";
        };
        #  Regenerate include dirs with android_regen.sh
        darwin_x86_64 = {
            include_dirs = ["external/python/cpython3/android/darwin_x86_64/pyconfig"];
            cflags = [
                "-Wno-deprecated-declarations"
                "-Wno-pointer-arith"
                "-DSOABI=\"cpython-38android-x86_64-darwin\""
            ];
            suffix = ".cpython-38android-x86_64-darwin";
        };
        linux_bionic = {
            #  NB linux_bionic is a 'host' architecture but it uses the bionic libc like 'android'
            #  targets so use the android pyconfig.
            include_dirs = ["external/python/cpython3/android/bionic/pyconfig"];
            cflags = ["-DSOABI=\"cpython-38android-x86_64-linux-bionic\""];
            suffix = ".cpython-38android-x86_64-linux-bionic";
        };
        linux_glibc_x86 = {
            enabled = false;
        };
        linux_glibc_x86_64 = {
            include_dirs = ["external/python/cpython3/android/linux_x86_64/pyconfig"];
            cflags = ["-DSOABI=\"cpython-38android-x86_64-linux-gnu\""];
            #  Commenting out the Linux suffix so that cpython-38-x86_64-linux-gnu
            #  Python 3.8 can also import the untagged .so library per PEP 3149
            #  Keep this change until Android py3-cmd can run ACTS, gRPC and can
            #  Export Python native symbols such as PyType_Type
            #  suffix: ".cpython-38android-x86_64-linux-gnu",
        };
        windows = {
            enabled = false;
        };
    };
    allow_undefined_symbols = true;
};

bluetooth_packets_python3 = cc_library_host_shared {
    name = "bluetooth_packets_python3";
    defaults = [
        "gd_defaults"
        "bluetooth_py3_native_extension_defaults"
    ];
    srcs = [
        "packet/python3_module.cc"
        "l2cap/fcs.cc"
        ":BluetoothPacketSources"
        "hci/address.cc"
        "hci/class_of_device.cc"
    ];
    generated_headers = [
        "BluetoothGeneratedPackets_h"
    ];
    generated_sources = [
        "BluetoothGeneratedPackets_python3_cc"
    ];
    header_libs = [
        "pybind11_headers"
    ];
    cflags = [
        "-fexceptions"
    ];
    rtti = true;
};

in { inherit BluetoothFacadeAndCertGeneratedStub_py BluetoothFacadeGeneratedStub_cc BluetoothFacadeGeneratedStub_h BluetoothFacadeProto BluetoothGeneratedPackets_h BluetoothGeneratedPackets_python3_cc BluetoothHciClassSources bluetooth_benchmark_gd bluetooth_gd_fuzz_test bluetooth_packet_parser_test bluetooth_packets_python3 bluetooth_py3_native_extension_defaults bluetooth_stack_with_facade bluetooth_test_gd gd_clang_coverage_bin gd_clang_file_coverage gd_defaults libbluetooth_gd; }
