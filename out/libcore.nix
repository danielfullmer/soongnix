{ genrule }:
let

build = [
    "JavaLibrary.bp"
    "NativeCode.bp"
];

notices-for-framework-stubs = genrule {
    name = "notices-for-framework-stubs";
    tool_files = [
        "NOTICE"
        "ojluni/NOTICE"
    ];
    cmd = "cp -f $(location NOTICE) $(genDir)/NOTICES/libcore-NOTICE && cp -f $(location ojluni/NOTICE) $(genDir)/NOTICES/ojluni-NOTICE";
    out = [
        "NOTICES/libcore-NOTICE"
        "NOTICES/ojluni-NOTICE"
    ];
};

in { inherit notices-for-framework-stubs; }
