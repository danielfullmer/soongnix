{ cc_library_headers }:
let

#  Copyright 2017 The Android Open Source Project

#  All the libraries under this directory export their headers as relative
#  paths to this directory (external/e2fsprogs/lib). This is a helper headers
#  only library to allow exporting
libext2-headers = cc_library_headers {
    name = "libext2-headers";
    host_supported = true;
    recovery_available = true;
    target = {
        windows = {
            enabled = true;
        };
    };
    export_include_dirs = ["."];
};

subdirs = [
    "*"
];

in { inherit libext2-headers; }
