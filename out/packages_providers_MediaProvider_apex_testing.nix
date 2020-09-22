{ apex_test }:
let

"test_com.android.mediaprovider" = apex_test {
    name = "test_com.android.mediaprovider";
    visibility = [
        "//system/apex/tests"
    ];
    defaults = ["com.android.mediaprovider-defaults"];
    manifest = "test_manifest.json";
    #  Test APEX, should never be installed
    installable = false;
    apps = ["MediaProvider"];
};

in { inherit "test_com.android.mediaprovider"; }
