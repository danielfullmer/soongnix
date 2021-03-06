{ cc_library_static }:
let

libpdfiumpwl = cc_library_static {
    name = "libpdfiumpwl";
    defaults = ["pdfium-core"];

    static_libs = [
        "libpdfiumfxcrt"
    ];

    srcs = [
        "fpdfsdk/pwl/cpwl_appstream.cpp"
        "fpdfsdk/pwl/cpwl_button.cpp"
        "fpdfsdk/pwl/cpwl_caret.cpp"
        "fpdfsdk/pwl/cpwl_combo_box.cpp"
        "fpdfsdk/pwl/cpwl_edit.cpp"
        "fpdfsdk/pwl/cpwl_edit_ctrl.cpp"
        "fpdfsdk/pwl/cpwl_edit_impl.cpp"
        "fpdfsdk/pwl/cpwl_font_map.cpp"
        "fpdfsdk/pwl/cpwl_icon.cpp"
        "fpdfsdk/pwl/cpwl_list_box.cpp"
        "fpdfsdk/pwl/cpwl_list_impl.cpp"
        "fpdfsdk/pwl/cpwl_scroll_bar.cpp"
        "fpdfsdk/pwl/cpwl_special_button.cpp"
        "fpdfsdk/pwl/cpwl_timer.cpp"
        "fpdfsdk/pwl/cpwl_timer_handler.cpp"
        "fpdfsdk/pwl/cpwl_wnd.cpp"
    ];

    include_dirs = [
        "external/freetype/include"
        "external/freetype/include/freetype"
    ];
};

in { inherit libpdfiumpwl; }
