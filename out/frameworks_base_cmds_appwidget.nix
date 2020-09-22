{ java_binary }:
let

#  Copyright 2014 The Android Open Source Project

appwidget = java_binary {
    name = "appwidget";
    wrapper = "appwidget";
    srcs = ["src/com/android/commands/appwidget/AppWidget.java"];
};

in { inherit appwidget; }
