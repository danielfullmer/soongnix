{ cc_library_shared }:
let

#  Copyright 2005 The Android Open Source Project
#
#  Android.mk for TinyXml.
#
#  Add -DTIXML_USE_STL to CFLAGS to use STL.
#

#  For the device
#  =====================================================
libtinyxml = cc_library_shared {
    name = "libtinyxml";

    srcs = [
        "tinyxml.cpp"
        "tinyxmlparser.cpp"
        "tinyxmlerror.cpp"
        "tinystr.cpp"
    ];

    vendor = true;

    cflags = [
        "-Wno-implicit-fallthrough"
        "-Wno-logical-op-parentheses"
        "-Wno-missing-braces"
        "-Wno-undefined-bool-conversion"
        "-Werror"
    ];
};

in { inherit libtinyxml; }
