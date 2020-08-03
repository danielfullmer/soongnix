{ java_import_host }:
let

layoutlib_api-prebuilt = java_import_host {
    name = "layoutlib_api-prebuilt";
    jars = ["layoutlib_api-prebuilt.jar"];
    installable = true;
};

in { inherit layoutlib_api-prebuilt; }
