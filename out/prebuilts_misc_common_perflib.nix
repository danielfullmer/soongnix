{ java_import_host }:
let

perflib-prebuilt = java_import_host {
    name = "perflib-prebuilt";
    jars = ["perflib-prebuilt.jar"];
};

in { inherit perflib-prebuilt; }
