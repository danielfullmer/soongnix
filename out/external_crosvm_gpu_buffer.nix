{ rust_library_host_rlib }:
let

#  This file is generated by cargo2android.py.

libgpu_buffer = rust_library_host_rlib {
    name = "libgpu_buffer";
    defaults = ["crosvm_defaults"];
    crate_name = "gpu_buffer";
    srcs = ["src/lib.rs"];
    rlibs = [
        "libdata_model"
        "libsys_util"
    ];
};

in { inherit libgpu_buffer; }