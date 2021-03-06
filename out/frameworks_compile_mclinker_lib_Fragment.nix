{ cc_library_static }:
let

libmcldFragment = cc_library_static {
    name = "libmcldFragment";
    defaults = ["mcld-defaults"];
    host_supported = true;
    srcs = [
        "AlignFragment.cpp"
        "FillFragment.cpp"
        "Fragment.cpp"
        "FragmentRef.cpp"
        "NullFragment.cpp"
        "RegionFragment.cpp"
        "Relocation.cpp"
        "Stub.cpp"
    ];
};

in { inherit libmcldFragment; }
