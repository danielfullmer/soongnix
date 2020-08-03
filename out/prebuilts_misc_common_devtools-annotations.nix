{ java_import_host }:
let

devtools-annotations-prebuilt = java_import_host {
    name = "devtools-annotations-prebuilt";
    jars = ["devtools-annotations-prebuilt.jar"];
};

in { inherit devtools-annotations-prebuilt; }
