{ java_binary }:
let

#  Copyright 2007 The Android Open Source Project
#

svc = java_binary {
    name = "svc";
    wrapper = "svc";
    srcs = [
        "src/com/android/commands/svc/BluetoothCommand.java"
        "src/com/android/commands/svc/NfcCommand.java"
        "src/com/android/commands/svc/PowerCommand.java"
        "src/com/android/commands/svc/Svc.java"
        "src/com/android/commands/svc/SystemServerCommand.java"
        "src/com/android/commands/svc/UsbCommand.java"
    ];
};

in { inherit svc; }
