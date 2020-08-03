{ java_import_host }:
let

ddmlib-prebuilt = java_import_host {
    name = "ddmlib-prebuilt";
    jars = ["ddmlib-prebuilt.jar"];
    installable = true;
};

in { inherit ddmlib-prebuilt; }
