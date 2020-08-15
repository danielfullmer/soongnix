{ android_app }:
let

CertInstaller = android_app {
    name = "CertInstaller";
    srcs = [
        "src/com/android/certinstaller/CertInstaller.java"
        "src/com/android/certinstaller/CertInstallerMain.java"
        "src/com/android/certinstaller/CredentialHelper.java"
        "src/com/android/certinstaller/CredentialsInstallDialog.java"
        "src/com/android/certinstaller/Util.java"
        "src/com/android/certinstaller/ViewHelper.java"
        "src/com/android/certinstaller/WiFiInstaller.java"
    ];
    platform_apis = true;
    certificate = "platform";
};

in { inherit CertInstaller; }
