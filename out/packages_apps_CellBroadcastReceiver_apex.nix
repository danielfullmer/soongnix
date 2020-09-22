{ android_app_certificate, apex, apex_defaults, apex_key }:
let

"com.android.cellbroadcast-defaults" = apex_defaults {
    name = "com.android.cellbroadcast-defaults";
    updatable = true;
    min_sdk_version = "R";

    manifest = "apex_manifest.json";

    #  optional. if unspecified, a default one is auto-generated
    androidManifest = "AndroidManifest.xml";

    key = "com.android.cellbroadcast.key";
    certificate = ":com.android.cellbroadcast.certificate";
};

"com.android.cellbroadcast.key" = apex_key {
    name = "com.android.cellbroadcast.key";
    public_key = "com.android.cellbroadcast.avbpubkey";
    private_key = "com.android.cellbroadcast.pem";
};

"com.android.cellbroadcast.certificate" = android_app_certificate {
    name = "com.android.cellbroadcast.certificate";
    certificate = "com.android.cellbroadcast";
};

"com.android.cellbroadcast" = apex {
    name = "com.android.cellbroadcast";
    defaults = ["com.android.cellbroadcast-defaults"];
    apps = [
        "CellBroadcastApp"
        "CellBroadcastServiceModule"
    ];
};

in { inherit "com.android.cellbroadcast" "com.android.cellbroadcast-defaults" "com.android.cellbroadcast.certificate" "com.android.cellbroadcast.key"; }
