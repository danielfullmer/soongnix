{ android_app }:
let

MediaProviderDialogsTool = android_app {
    name = "MediaProviderDialogsTool";
    manifest = "AndroidManifest.xml";
    srcs = ["src/com/android/providers/media/tools/dialogs/DialogsActivity.java"];
    sdk_version = "system_current";
};

in { inherit MediaProviderDialogsTool; }
