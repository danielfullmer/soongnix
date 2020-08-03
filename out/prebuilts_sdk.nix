{ droiddoc_exported_dir, filegroup, genrule, prebuilt_apis }:
let

subdirs = ["tools"];

api-version-xml = filegroup {
    name = "api-version-xml";
    srcs = [
        "*/public/api/android.txt"
        "*/public/api/android.xml"
    ];
};

current-support-api = filegroup {
    name = "current-support-api";
    srcs = [
        "current/support-api.txt"
    ];
};

metalava-sdk-android-jars = filegroup {
    name = "metalava-sdk-android-jars";
    srcs = [
        "**/android.jar"
    ];
};

sdk-dir = droiddoc_exported_dir {
    name = "sdk-dir";
    path = ".";
};

last-released-public-api = genrule {
    name = "last-released-public-api";
    srcs = [
        "28/public/api/android.txt"
    ];
    cmd = "cp -f $$(echo $(in) | tr \" \" \"\\n\" | sort -t/ -k3 -n | tail -1) $(genDir)/last-released-api.txt";
    out = [
        "last-released-api.txt"
    ];
};

last-released-system-api = genrule {
    name = "last-released-system-api";
    srcs = [
        "28/system/api/android.txt"
    ];
    cmd = "cp -f $$(echo $(in) | tr \" \" \"\\n\" | sort -t/ -k3 -n | tail -1) $(genDir)/last-released-api.txt";
    out = [
        "last-released-api.txt"
    ];
};

public-api-incompatibilities-with-last-released = genrule {
    name = "public-api-incompatibilities-with-last-released";
    srcs = [
        "*/public/api/incompatibilities.txt"
    ];
    cmd = "cp -f $$(echo $(in) | tr \" \" \"\\n\" | sort -t/ -k3 -n | tail -1) $(genDir)/incompatibilities.txt";
    out = [
        "incompatibilities.txt"
    ];
};

system-api-incompatibilities-with-last-released = genrule {
    name = "system-api-incompatibilities-with-last-released";
    srcs = [
        "*/system/api/incompatibilities.txt"
    ];
    cmd = "cp -f $$(echo $(in) | tr \" \" \"\\n\" | sort -t/ -k3 -n | tail -1) $(genDir)/incompatibilities.txt";
    out = [
        "incompatibilities.txt"
    ];
};

sdk = prebuilt_apis {
    name = "sdk";
    api_dirs = [
        "1"
        "2"
        "3"
        "4"
        "5"
        "6"
        "7"
        "8"
        "9"
        "10"
        "11"
        "12"
        "13"
        "14"
        "15"
        "16"
        "17"
        "18"
        "19"
        "20"
        "21"
        "22"
        "23"
        "24"
        "25"
        "26"
        "27"
        "28"
        "29"
        "current"
    ];
};

in { inherit api-version-xml current-support-api last-released-public-api last-released-system-api metalava-sdk-android-jars public-api-incompatibilities-with-last-released sdk sdk-dir system-api-incompatibilities-with-last-released; }
