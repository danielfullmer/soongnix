{ java_import }:
let

"zxing-core-1.7" = java_import {
    name = "zxing-core-1.7";
    host_supported = true;
    installable = false;
    jars = ["core.jar"];
};

in { inherit "zxing-core-1.7"; }
