{ java_import_host }:
let

nimbus_jose_jwt = java_import_host {
    name = "nimbus_jose_jwt";
    jars = ["nimbus-jose-jwt-4.33.jar"];
};

in { inherit nimbus_jose_jwt; }
