{ cc_library_static }:
let

libpdfium-formfiller = cc_library_static {
    name = "libpdfium-formfiller";
    defaults = ["pdfium-core"];

    visibility = ["//external/pdfium:__subpackages__"];

    header_libs = [
        "libpdfium-constants"
    ];

    static_libs = [
        "libpdfium-page"
        "libpdfium-fpdfdoc"
        "libpdfium-fxcrt"
        "libpdfium-fxge"
        "libpdfium-pwl"
    ];

    srcs = [
        "cffl_button.cpp"
        "cffl_checkbox.cpp"
        "cffl_combobox.cpp"
        "cffl_formfiller.cpp"
        "cffl_interactiveformfiller.cpp"
        "cffl_listbox.cpp"
        "cffl_pushbutton.cpp"
        "cffl_radiobutton.cpp"
        "cffl_textfield.cpp"
        "cffl_textobject.cpp"
    ];
};

in { inherit libpdfium-formfiller; }
