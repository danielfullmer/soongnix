{ art_global_defaults, cc_library_static }:
let

#  Inherit image values.
libartimagevalues_defaults = art_global_defaults {
    name = "libartimagevalues_defaults";
};

libartimagevalues = cc_library_static {
    name = "libartimagevalues";
    defaults = ["libartimagevalues_defaults"];
    srcs = ["art_image_values.cpp"];
    export_include_dirs = ["."];
    cflags = ["-Wconversion"];
};

in { inherit libartimagevalues libartimagevalues_defaults; }
