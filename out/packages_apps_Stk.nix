{ android_app }:
let

#  Copyright 2007-2008 The Android Open Source Project

Stk = android_app {
    name = "Stk";
    libs = ["telephony-common"];
    static_libs = ["com.google.android.material_material"];
    srcs = [
        "src/com/android/stk/BootCompletedReceiver.java"
        "src/com/android/stk/StkApp.java"
        "src/com/android/stk/StkAppInstaller.java"
        "src/com/android/stk/StkAppService.java"
        "src/com/android/stk/StkCmdReceiver.java"
        "src/com/android/stk/StkDialogActivity.java"
        "src/com/android/stk/StkDigitsKeyListener.java"
        "src/com/android/stk/StkInputActivity.java"
        "src/com/android/stk/StkLauncherActivity.java"
        "src/com/android/stk/StkMain.java"
        "src/com/android/stk/StkMenuActivity.java"
        "src/com/android/stk/StkMenuAdapter.java"
        "src/com/android/stk/StkMenuConfig.java"
        "src/com/android/stk/ToneDialog.java"
        "src/com/android/stk/TonePlayer.java"
    ];
    platform_apis = true;
    certificate = "platform";
};

in { inherit Stk; }
