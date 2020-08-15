{ java_binary_host }:
let

#  Copyright 2006 The Android Open Source Project
#

BugReport = java_binary_host {
    name = "BugReport";
    wrapper = "bugreport";
    manifest = "manifest-library.mf";
    srcs = [
        "src/com/android/bugreport/Main.java"
        "src/com/android/bugreport/Options.java"
        "src/com/android/bugreport/anr/Anr.java"
        "src/com/android/bugreport/anr/AnrParser.java"
        "src/com/android/bugreport/bugreport/Bugreport.java"
        "src/com/android/bugreport/bugreport/BugreportParser.java"
        "src/com/android/bugreport/bugreport/MetadataParser.java"
        "src/com/android/bugreport/bugreport/ProcessInfo.java"
        "src/com/android/bugreport/bugreport/ThreadInfo.java"
        "src/com/android/bugreport/cpuinfo/CpuUsage.java"
        "src/com/android/bugreport/cpuinfo/CpuUsageParser.java"
        "src/com/android/bugreport/cpuinfo/CpuUsageSnapshot.java"
        "src/com/android/bugreport/html/Renderer.java"
        "src/com/android/bugreport/inspector/DeadlockDetector.java"
        "src/com/android/bugreport/inspector/Inspector.java"
        "src/com/android/bugreport/logcat/LogLine.java"
        "src/com/android/bugreport/logcat/Logcat.java"
        "src/com/android/bugreport/logcat/LogcatParser.java"
        "src/com/android/bugreport/monkey/MonkeyLogParser.java"
        "src/com/android/bugreport/stacks/JavaStackFrameSnapshot.java"
        "src/com/android/bugreport/stacks/KernelStackFrameSnapshot.java"
        "src/com/android/bugreport/stacks/LockSnapshot.java"
        "src/com/android/bugreport/stacks/NativeStackFrameSnapshot.java"
        "src/com/android/bugreport/stacks/ProcessSnapshot.java"
        "src/com/android/bugreport/stacks/ProcessSnapshotParser.java"
        "src/com/android/bugreport/stacks/StackFrameSnapshot.java"
        "src/com/android/bugreport/stacks/ThreadSnapshot.java"
        "src/com/android/bugreport/stacks/ThreadSnapshotParser.java"
        "src/com/android/bugreport/stacks/VmTraces.java"
        "src/com/android/bugreport/stacks/VmTracesParser.java"
        "src/com/android/bugreport/util/ArgParser.java"
        "src/com/android/bugreport/util/Line.java"
        "src/com/android/bugreport/util/Lines.java"
        "src/com/android/bugreport/util/Utils.java"
    ];
    java_resource_dirs = ["resources"];
    static_libs = ["jsilver"];
};

in { inherit BugReport; }
