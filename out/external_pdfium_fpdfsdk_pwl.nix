{ cc_library_static }:
let

libpdfium-pwl = cc_library_static {
    name = "libpdfium-pwl";
    defaults = ["pdfium-core"];

    visibility = ["//external/pdfium:__subpackages__"];

    header_libs = [
        "libpdfium-constants"
    ];

    static_libs = [
        "libpdfium-font"
        "libpdfium-render"
        "libpdfium-fpdfdoc"
        "libpdfium-fxcrt"
        "libpdfium-fxge"
    ];

    srcs = [
        "cpwl_button.cpp"
        "cpwl_caret.cpp"
        "cpwl_combo_box.cpp"
        "cpwl_combo_box_embeddertest.cpp"
        "cpwl_edit.cpp"
        "cpwl_edit_ctrl.cpp"
        "cpwl_edit_embeddertest.cpp"
        "cpwl_edit_impl.cpp"
        "cpwl_icon.cpp"
        "cpwl_list_box.cpp"
        "cpwl_list_impl.cpp"
        "cpwl_scroll_bar.cpp"
        "cpwl_special_button.cpp"
        "cpwl_wnd.cpp"
    ];

    include_dirs = [
        "external/freetype/include"
        "external/freetype/include/freetype"
    ];
};

in { inherit libpdfium-pwl; }
