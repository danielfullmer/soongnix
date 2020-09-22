{ android_app }:
let

ExamplePlugin = android_app {

    name = "ExamplePlugin";

    libs = ["SystemUIPluginLib"];

    certificate = "platform";
    optimize = {
        enabled = false;
    };

    srcs = [
        "src/com/android/systemui/plugin/testoverlayplugin/CustomView.java"
        "src/com/android/systemui/plugin/testoverlayplugin/PluginSettings.java"
        "src/com/android/systemui/plugin/testoverlayplugin/SampleOverlayPlugin.java"
    ];

    platform_apis = true;
};

in { inherit ExamplePlugin; }
