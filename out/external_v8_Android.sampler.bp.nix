{ cc_library_static }:
let

#  GENERATED, do not edit
#  for changes, see genmakefiles.py
libv8sampler = cc_library_static {
    name = "libv8sampler";
    defaults = ["v8_defaults"];
    srcs = ["src/libsampler/sampler.cc"];
    local_include_dirs = [
        "src"
        "include"
    ];

    apex_available = [
        "com.android.art.debug"
        "com.android.art.release"
    ];
};

in { inherit libv8sampler; }
