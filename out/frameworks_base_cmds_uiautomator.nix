{ filegroup, genrule }:
let

uiautomator-last-released-api = genrule {
    name = "uiautomator-last-released-api";
    srcs = [
        "api/16.txt"
        "api/17.txt"
        "api/current.txt"
        "api/removed.txt"
    ];
    cmd = "cp -f $$(echo $(in) | tr \" \" \"\\n\" | sort -n | tail -1) $(genDir)/last-released-api.txt";
    out = [
        "last-released-api.txt"
    ];
};

uiautomator-current-api = filegroup {
    name = "uiautomator-current-api";
    srcs = ["api/current.txt"];
};

uiautomator-removed-api = filegroup {
    name = "uiautomator-removed-api";
    srcs = ["api/removed.txt"];
};

in { inherit uiautomator-current-api uiautomator-last-released-api uiautomator-removed-api; }
