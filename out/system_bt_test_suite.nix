{ cc_test }:
let

#  Bluetooth test suite for target
#  ========================================================
net_test_bluetooth = cc_test {
    name = "net_test_bluetooth";
    test_suites = ["device-tests"];
    defaults = ["fluoride_defaults"];
    include_dirs = ["system/bt"];
    srcs = [
        "adapter/adapter_unittest.cc"
        "adapter/bluetooth_test.cc"
        "gatt/gatt_test.cc"
        "gatt/gatt_unittest.cc"
    ];
    header_libs = ["libhardware_headers"];
    shared_libs = [
        "liblog"
        "libcutils"
        "libbinder"
        "libutils"
    ];
    static_libs = [
        "libbtcore"
        "libosi"
    ];
    whole_static_libs = [
        "libbluetoothtbd_hal"
    ];
};

#  Bluetooth test suite for target
#  ========================================================
net_test_rfcomm_suite = cc_test {
    name = "net_test_rfcomm_suite";
    defaults = ["fluoride_defaults"];
    include_dirs = ["system/bt"];
    srcs = [
        "adapter/bluetooth_test.cc"
        "rfcomm/rfcomm_test.cc"
        "rfcomm/rfcomm_unittest.cc"
    ];
    header_libs = ["libhardware_headers"];
    shared_libs = [
        "liblog"
        "libcutils"
        "libbinder"
        "libutils"
    ];
    static_libs = [
        "libbtcore"
        "libosi"
    ];
    whole_static_libs = [
        "libbluetoothtbd_hal"
    ];
};

in { inherit net_test_bluetooth net_test_rfcomm_suite; }
