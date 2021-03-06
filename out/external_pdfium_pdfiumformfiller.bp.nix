{ cc_library_static }:
let

libpdfiumformfiller = cc_library_static {
    name = "libpdfiumformfiller";
    defaults = ["pdfium-core"];

    static_libs = [
        "libpdfiumfxcrt"
    ];

    srcs = [
        "fpdfsdk/formfiller/cba_fontmap.cpp"
        "fpdfsdk/formfiller/cffl_button.cpp"
        "fpdfsdk/formfiller/cffl_checkbox.cpp"
        "fpdfsdk/formfiller/cffl_combobox.cpp"
        "fpdfsdk/formfiller/cffl_formfiller.cpp"
        "fpdfsdk/formfiller/cffl_interactiveformfiller.cpp"
        "fpdfsdk/formfiller/cffl_listbox.cpp"
        "fpdfsdk/formfiller/cffl_pushbutton.cpp"
        "fpdfsdk/formfiller/cffl_radiobutton.cpp"
        "fpdfsdk/formfiller/cffl_textfield.cpp"
        "fpdfsdk/formfiller/cffl_textobject.cpp"
    ];

    include_dirs = [
        "external/freetype/include"
        "external/freetype/include/freetype"
    ];
};

in { inherit libpdfiumformfiller; }
