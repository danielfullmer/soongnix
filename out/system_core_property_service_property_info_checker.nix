{ cc_binary }:
let

property_info_checker = cc_binary {
    name = "property_info_checker";
    host_supported = true;
    static_executable = true;
    cpp_std = "experimental";
    static_libs = [
        "libpropertyinfoserializer"
        "libpropertyinfoparser"
        "libbase"
        "liblog"
        "libsepol"
    ];
    srcs = ["property_info_checker.cpp"];
};

in { inherit property_info_checker; }
