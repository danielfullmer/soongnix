{ java_import_host }:
let

ninepatch-prebuilt = java_import_host {
    name = "ninepatch-prebuilt";
    jars = ["ninepatch-prebuilt.jar"];
};

in { inherit ninepatch-prebuilt; }
