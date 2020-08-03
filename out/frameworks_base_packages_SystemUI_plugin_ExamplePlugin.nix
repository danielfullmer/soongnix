{ android_app }:
let

ExamplePlugin = android_app {

    name = "ExamplePlugin";

    libs = ["SystemUIPluginLib"];

    certificate = "platform";
    optimize = {
        enabled = false;
    };

    srcs = ["src/**/*.java"];

};

in { inherit ExamplePlugin; }
