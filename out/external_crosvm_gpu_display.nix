{ cc_library_host_static, rust_library_host_rlib, wayland_protocol_codegen }:
let

#  This file is manually copied from old Android.bp

#  cargo2android.py limitations:
#    does not handle "-l dylib=wayland-client" yet
#    does not generate cc_library module yet
#    does not generate wayland_protocol_codegen module yet

libgpu_display = rust_library_host_rlib {
    name = "libgpu_display";
    defaults = ["crosvm_defaults"];
    crate_name = "gpu_display";
    srcs = ["src/lib.rs"];

    rlibs = [
        "libdata_model"
        "liblibc"
        "libsys_util"
    ];
    static_libs = ["libdisplay_wl"];
};

libdisplay_wl = cc_library_host_static {
    name = "libdisplay_wl";
    c_std = "c11";
    srcs = ["src/display_wl.c"];

    generated_sources = ["gpu_display_protocol_sources"];
    generated_headers = ["gpu_display_client_protocol_headers"];
    export_generated_headers = ["gpu_display_client_protocol_headers"];

    static_libs = ["libwayland_client"];
};

gpu_display_protocol_sources = wayland_protocol_codegen {
    name = "gpu_display_protocol_sources";
    cmd = "$(location wayland_scanner) code < $(in) > $(out)";
    suffix = ".c";
    srcs = [
        "protocol/aura-shell.xml"
        "protocol/linux-dmabuf-unstable-v1.xml"
        "protocol/viewporter.xml"
        "protocol/xdg-shell-unstable-v6.xml"
    ];
    tools = ["wayland_scanner"];
};

gpu_display_client_protocol_headers = wayland_protocol_codegen {
    name = "gpu_display_client_protocol_headers";
    cmd = "$(location wayland_scanner) client-header < $(in) > $(out)";
    suffix = ".h";
    srcs = [
        "protocol/aura-shell.xml"
        "protocol/linux-dmabuf-unstable-v1.xml"
        "protocol/viewporter.xml"
        "protocol/xdg-shell-unstable-v6.xml"
    ];
    tools = ["wayland_scanner"];
};

in { inherit gpu_display_client_protocol_headers gpu_display_protocol_sources libdisplay_wl libgpu_display; }
