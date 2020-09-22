{ android_app }:
let

AliasActivity = android_app {
    name = "AliasActivity";
    installable = false;
    srcs = [];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit AliasActivity; }
