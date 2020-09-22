{ android_app_certificate, apex, apex_defaults, apex_key }:
let

"com.android.mediaprovider" = apex {
    name = "com.android.mediaprovider";
    defaults = ["com.android.mediaprovider-defaults"];
    manifest = "apex_manifest.json";
    apps = ["MediaProvider"];
    prebuilts = ["media-provider-platform-compat-config"];
};

"com.android.mediaprovider-defaults" = apex_defaults {
    name = "com.android.mediaprovider-defaults";
    java_libs = ["framework-mediaprovider"];
    key = "com.android.mediaprovider.key";
    certificate = ":com.android.mediaprovider.certificate";
    file_contexts = ":com.android.mediaprovider-file_contexts";
};

"com.android.mediaprovider.key" = apex_key {
    name = "com.android.mediaprovider.key";
    public_key = "com.android.mediaprovider.avbpubkey";
    private_key = "com.android.mediaprovider.pem";
};

"com.android.mediaprovider.certificate" = android_app_certificate {
    name = "com.android.mediaprovider.certificate";
    certificate = "com.android.mediaprovider";
};

in { inherit "com.android.mediaprovider" "com.android.mediaprovider-defaults" "com.android.mediaprovider.certificate" "com.android.mediaprovider.key"; }
