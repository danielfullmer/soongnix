{ android_app_certificate, apex, apex_key }:
let

"com.android.bluetooth.updatable" = apex {
    name = "com.android.bluetooth.updatable";

    manifest = "apex_manifest.json";

    native_shared_libs = [
        "libbluetooth_jni"
        "libbluetooth"
    ];
    apps = ["Bluetooth"];

    compile_multilib = "both";

    key = "com.android.bluetooth.updatable.key";
    certificate = ":com.android.bluetooth.updatable.certificate";
};

"com.android.bluetooth.updatable.key" = apex_key {
    name = "com.android.bluetooth.updatable.key";
    public_key = "com.android.bluetooth.updatable.avbpubkey";
    private_key = "com.android.bluetooth.updatable.pem";
};

"com.android.bluetooth.updatable.certificate" = android_app_certificate {
    name = "com.android.bluetooth.updatable.certificate";
    certificate = "com.android.bluetooth.updatable";
};

in { inherit "com.android.bluetooth.updatable" "com.android.bluetooth.updatable.certificate" "com.android.bluetooth.updatable.key"; }
