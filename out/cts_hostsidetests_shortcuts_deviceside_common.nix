{ java_library }:
let

hostsidetests-shortcuts-deviceside-common = java_library {
    name = "hostsidetests-shortcuts-deviceside-common";
    srcs = ["src/android/content/pm/cts/shortcut/device/common/ShortcutManagerDeviceTestBase.java"];
    libs = [
        "android.test.base.stubs"
        "ShortcutManagerTestUtils"
        "compatibility-device-util-axt"
    ];
};

in { inherit hostsidetests-shortcuts-deviceside-common; }
