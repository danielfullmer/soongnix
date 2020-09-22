{ android_app_certificate, prebuilt_etc }:
let

#  AOSP test certificate
aosp-testkey = android_app_certificate {
    name = "aosp-testkey";
    certificate = "testkey";
};

#  Google-owned certificate for CTS testing, since we can't trust arbitrary keys on release devices.
fsverity-release-cert-der = prebuilt_etc {
    name = "fsverity-release-cert-der";
    src = "fsverity-release.x509.der";
    sub_dir = "security/fsverity";
    filename_from_src = true;
};

in { inherit aosp-testkey fsverity-release-cert-der; }
