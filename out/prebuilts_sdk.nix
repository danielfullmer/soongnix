{ droiddoc_exported_dir, filegroup, genrule, prebuilt_apis }:
let

subdirs = ["tools"];

api-version-xml = filegroup {
    name = "api-version-xml";
    srcs = [
        "1/public/api/android.txt"
        "10/public/api/android.txt"
        "11/public/api/android.txt"
        "12/public/api/android.txt"
        "13/public/api/android.txt"
        "14/public/api/android.txt"
        "15/public/api/android.txt"
        "16/public/api/android.txt"
        "17/public/api/android.txt"
        "18/public/api/android.txt"
        "19/public/api/android.txt"
        "2/public/api/android.txt"
        "20/public/api/android.txt"
        "21/public/api/android.txt"
        "22/public/api/android.txt"
        "23/public/api/android.txt"
        "24/public/api/android.txt"
        "25/public/api/android.txt"
        "26/public/api/android.txt"
        "27/public/api/android.txt"
        "28/public/api/android.txt"
        "29/public/api/android.txt"
        "3/public/api/android.txt"
        "4/public/api/android.txt"
        "5/public/api/android.txt"
        "6/public/api/android.txt"
        "7/public/api/android.txt"
        "8/public/api/android.txt"
        "9/public/api/android.txt"

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
        "10/public/android.jar"
        "11/public/android.jar"
        "12/public/android.jar"
        "13/public/android.jar"
        "14/public/android.jar"
        "15/public/android.jar"
        "16/public/android.jar"
        "17/public/android.jar"
        "18/public/android.jar"
        "19/public/android.jar"
        "20/public/android.jar"
        "21/public/android.jar"
        "22/public/android.jar"
        "23/public/android.jar"
        "23/system/android.jar"
        "24/public/android.jar"
        "25/public/android.jar"
        "26/public/android.jar"
        "27/public/android.jar"
        "28/public/android.jar"
        "28/system/android.jar"
        "29/public/android.jar"
        "29/system/android.jar"
        "29/test/android.jar"
        "4/public/android.jar"
        "5/public/android.jar"
        "6/public/android.jar"
        "7/public/android.jar"
        "8/public/android.jar"
        "9/public/android.jar"
        "current/core/android.jar"
        "current/public/android.jar"
        "current/system/android.jar"
        "current/test/android.jar"
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
        "29/public/api/incompatibilities.txt"
    ];
    cmd = "cp -f $$(echo $(in) | tr \" \" \"\\n\" | sort -t/ -k3 -n | tail -1) $(genDir)/incompatibilities.txt";
    out = [
        "incompatibilities.txt"
    ];
};

system-api-incompatibilities-with-last-released = genrule {
    name = "system-api-incompatibilities-with-last-released";
    srcs = [
        "29/system/api/incompatibilities.txt"
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
