{ android_app_certificate, apex, apex_defaults, apex_key }:
let

"com.android.telephony-defaults" = apex_defaults {
    name = "com.android.telephony-defaults";

    #  optional. if unspecified, a default one is auto-generated
    androidManifest = "AndroidManifest.xml";

    # java_libs: ["telephony-common", "ims-common", "voip-common"],
    # apps: ["TeleService", "StkLib", "ONSLib"],

    key = "com.android.telephony.key";
    certificate = ":com.android.telephony.certificate";
};

"com.android.telephony" = apex {
    name = "com.android.telephony";
    manifest = "apex_manifest.json";
    # apps: ["StkLib"],

    defaults = ["com.android.telephony-defaults"];
};

"com.android.telephony.key" = apex_key {
    name = "com.android.telephony.key";
    public_key = "com.android.telephony.avbpubkey";
    private_key = "com.android.telephony.pem";
};

"com.android.telephony.certificate" = android_app_certificate {
    name = "com.android.telephony.certificate";
    #  This will use com.android.telephony.x509.pem (the cert) and
    #  com.android.telephony.pk8 (the private key)
    certificate = "com.android.telephony";
};

in { inherit "com.android.telephony" "com.android.telephony-defaults" "com.android.telephony.certificate" "com.android.telephony.key"; }
