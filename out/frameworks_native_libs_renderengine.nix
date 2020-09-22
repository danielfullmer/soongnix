{ cc_defaults, cc_library_static, filegroup }:
let

renderengine_defaults = cc_defaults {
    name = "renderengine_defaults";
    cflags = [
        "-DLOG_TAG=\"RenderEngine\""
        "-Wall"
        "-Werror"
        "-Wthread-safety"
        "-Wunused"
        "-Wunreachable-code"
    ];
};

librenderengine_defaults = cc_defaults {
    name = "librenderengine_defaults";
    defaults = ["renderengine_defaults"];
    cflags = [
        "-DGL_GLEXT_PROTOTYPES"
        "-DEGL_EGLEXT_PROTOTYPES"
    ];
    shared_libs = [
        "libbase"
        "libcutils"
        "libEGL"
        "libGLESv1_CM"
        "libGLESv2"
        "libgui"
        "liblog"
        "libnativewindow"
        "libprocessgroup"
        "libsync"
        "libui"
        "libutils"
    ];
    local_include_dirs = ["include"];
    export_include_dirs = ["include"];
};

librenderengine_sources = filegroup {
    name = "librenderengine_sources";
    srcs = [
        "Description.cpp"
        "Mesh.cpp"
        "RenderEngine.cpp"
        "Texture.cpp"
    ];
};

librenderengine_gl_sources = filegroup {
    name = "librenderengine_gl_sources";
    srcs = [
        "gl/GLESRenderEngine.cpp"
        "gl/GLExtensions.cpp"
        "gl/GLFramebuffer.cpp"
        "gl/GLImage.cpp"
        "gl/GLShadowTexture.cpp"
        "gl/GLShadowVertexGenerator.cpp"
        "gl/GLSkiaShadowPort.cpp"
        "gl/GLVertexBuffer.cpp"
        "gl/ImageManager.cpp"
        "gl/Program.cpp"
        "gl/ProgramCache.cpp"
        "gl/filters/BlurFilter.cpp"
        "gl/filters/GenericProgram.cpp"
    ];
};

librenderengine = cc_library_static {
    name = "librenderengine";
    defaults = ["librenderengine_defaults"];
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    double_loadable = true;
    clang = true;
    cflags = [
        "-fvisibility=hidden"
        "-Werror=format"
    ];
    srcs = [
        ":librenderengine_sources"
        ":librenderengine_gl_sources"
    ];
    lto = {
        thin = true;
    };
};

librenderengine_mocks = cc_library_static {
    name = "librenderengine_mocks";
    defaults = ["librenderengine_defaults"];
    srcs = [
        "mock/Framebuffer.cpp"
        "mock/Image.cpp"
        "mock/RenderEngine.cpp"
    ];
    static_libs = [
        "libgtest"
        "libgmock"
    ];
    local_include_dirs = ["include"];
    export_include_dirs = ["include"];
};

in { inherit librenderengine librenderengine_defaults librenderengine_gl_sources librenderengine_mocks librenderengine_sources renderengine_defaults; }
