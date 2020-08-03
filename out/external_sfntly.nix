{ cc_library_static }:
let

libsfntly = cc_library_static {
    name = "libsfntly";
    host_supported = true;
    srcs = [
        "cpp/src/sfntly/data/byte_array.cc"
        "cpp/src/sfntly/data/font_data.cc"
        "cpp/src/sfntly/data/font_input_stream.cc"
        "cpp/src/sfntly/data/font_output_stream.cc"
        "cpp/src/sfntly/data/growable_memory_byte_array.cc"
        "cpp/src/sfntly/data/memory_byte_array.cc"
        "cpp/src/sfntly/data/readable_font_data.cc"
        "cpp/src/sfntly/data/writable_font_data.cc"
        "cpp/src/sfntly/font.cc"
        "cpp/src/sfntly/font_factory.cc"
        "cpp/src/sfntly/port/file_input_stream.cc"
        "cpp/src/sfntly/port/lock.cc"
        "cpp/src/sfntly/port/memory_input_stream.cc"
        "cpp/src/sfntly/port/memory_output_stream.cc"
        "cpp/src/sfntly/table/bitmap/big_glyph_metrics.cc"
        "cpp/src/sfntly/table/bitmap/bitmap_glyph.cc"
        "cpp/src/sfntly/table/bitmap/bitmap_glyph_info.cc"
        "cpp/src/sfntly/table/bitmap/bitmap_size_table.cc"
        "cpp/src/sfntly/table/bitmap/composite_bitmap_glyph.cc"
        "cpp/src/sfntly/table/bitmap/ebdt_table.cc"
        "cpp/src/sfntly/table/bitmap/eblc_table.cc"
        "cpp/src/sfntly/table/bitmap/ebsc_table.cc"
        "cpp/src/sfntly/table/bitmap/glyph_metrics.cc"
        "cpp/src/sfntly/table/bitmap/index_sub_table.cc"
        "cpp/src/sfntly/table/bitmap/index_sub_table_format1.cc"
        "cpp/src/sfntly/table/bitmap/index_sub_table_format2.cc"
        "cpp/src/sfntly/table/bitmap/index_sub_table_format3.cc"
        "cpp/src/sfntly/table/bitmap/index_sub_table_format4.cc"
        "cpp/src/sfntly/table/bitmap/index_sub_table_format5.cc"
        "cpp/src/sfntly/table/bitmap/simple_bitmap_glyph.cc"
        "cpp/src/sfntly/table/bitmap/small_glyph_metrics.cc"
        "cpp/src/sfntly/table/byte_array_table_builder.cc"
        "cpp/src/sfntly/table/core/cmap_table.cc"
        "cpp/src/sfntly/table/core/font_header_table.cc"
        "cpp/src/sfntly/table/core/horizontal_device_metrics_table.cc"
        "cpp/src/sfntly/table/core/horizontal_header_table.cc"
        "cpp/src/sfntly/table/core/horizontal_metrics_table.cc"
        "cpp/src/sfntly/table/core/maximum_profile_table.cc"
        "cpp/src/sfntly/table/core/name_table.cc"
        "cpp/src/sfntly/table/core/os2_table.cc"
        "cpp/src/sfntly/table/font_data_table.cc"
        "cpp/src/sfntly/table/generic_table_builder.cc"
        "cpp/src/sfntly/table/header.cc"
        "cpp/src/sfntly/table/subtable.cc"
        "cpp/src/sfntly/table/table.cc"
        "cpp/src/sfntly/table/table_based_table_builder.cc"
        "cpp/src/sfntly/table/truetype/glyph_table.cc"
        "cpp/src/sfntly/table/truetype/loca_table.cc"
        "cpp/src/sfntly/tag.cc"
        "cpp/src/sample/chromium/font_subsetter.cc"
        "cpp/src/sample/chromium/subsetter_impl.cc"
    ];

    shared_libs = [
        "libandroidicu"
    ];

    cflags = [
        "-fstack-protector"
        "--param=ssp-buffer-size=4"
        "-Werror"
        "-fno-exceptions"
        "-fno-strict-aliasing"
        "-Wall"
        "-Wno-unused-parameter"
        "-Wno-missing-field-initializers"
        "-fvisibility=hidden"
        "-fno-tree-sra"
        "-Wno-psabi"
        "-ffunction-sections"
        "-funwind-tables"
        "-g"
        "-fno-short-enums"
        "-finline-limit=64"
        "-Wa,--noexecstack"
        "-U_FORTIFY_SOURCE"
        "-Wno-extra"
        "-Wno-ignored-qualifiers"
        "-Wno-type-limits"
        "-Os"
        "-fno-ident"
        "-fdata-sections"
        "-ffunction-sections"
        "-fomit-frame-pointer"

        "-DANGLE_DX11"
        "-D_FILE_OFFSET_BITS=64"
        "-DNO_TCMALLOC"
        "-DDISCARDABLE_MEMORY_ALWAYS_SUPPORTED_NATIVELY"
        "-DSYSTEM_NATIVELY_SIGNALS_MEMORY_PRESSURE"
        "-DDISABLE_NACL"
        "-DCHROMIUM_BUILD"
        "-DUSE_LIBJPEG_TURBO=1"
        "-DUSE_PROPRIETARY_CODECS"
        "-DENABLE_CONFIGURATION_POLICY"
        "-DENABLE_GPU=1"
        "-DUSE_OPENSSL=1"
        "-DENABLE_EGLIMAGE=1"
        "-DSFNTLY_NO_EXCEPTION"
        "-DU_USING_ICU_NAMESPACE=0"
        "-D__STDC_CONSTANT_MACROS"
        "-D__STDC_FORMAT_MACROS"
        "-DANDROID"
        "-D__GNU_SOURCE=1"
        "-D_STLP_USE_PTR_SPECIALIZATIONS=1"
        "-DCHROME_BUILD_ID='\"\"'"
        "-DNDEBUG"
        "-DNVALGRIND"
        "-DDYNAMIC_ANNOTATIONS_ENABLED=0"
        "-D_FORTIFY_SOURCE=2"
    ];

    cppflags = [
        "-fno-threadsafe-statics"
        "-fvisibility-inlines-hidden"
        "-Wsign-compare"
        "-Wno-abi"
        "-Wno-error=c++0x-compat"
        "-Wno-non-virtual-dtor"
        "-Wno-sign-promo"
    ];

    debug = {
        cflags = [
            "-UNDEBUG"
            "-UNVALGRIND"
            "-DDYNAMIC_ANNOTATIONS_ENABLED=1"
            "-DWTF_USE_DYNAMIC_ANNOTATIONS=1"
            "-D_DEBUG"
        ];
    };

    export_include_dirs = ["cpp/src"];

    target = {
        android = {
            cflags = ["-fPIC"];
        };
        not_windows = {
            cflags = ["-fPIC"];
        };
        windows = {
            enabled = true;
            #  "-fstack-protector" is not used by default on Windows, and enabling it
            #  on one library only prevents this library from being linked successfully
            #  when used as a dependency. So we disable it for Windows.
            cflags = ["-fno-stack-protector"];
        };
    };
};

in { inherit libsfntly; }
