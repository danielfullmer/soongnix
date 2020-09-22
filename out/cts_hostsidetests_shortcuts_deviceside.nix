{ java_defaults }:
let

hostsidetests-shortcuts-deviceside-defaults = java_defaults {
    name = "hostsidetests-shortcuts-deviceside-defaults";
    static_libs = [
        "hostsidetests-shortcuts-deviceside-common"
        "ShortcutManagerTestUtils"
    ];
    libs = ["android.test.base.stubs"];
    sdk_version = "test_current";
};

in { inherit hostsidetests-shortcuts-deviceside-defaults; }
