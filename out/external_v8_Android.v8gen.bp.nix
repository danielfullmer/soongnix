{ filegroup }:
let

#  GENERATED, do not edit
#  for changes, see genmakefiles.py
v8_js_lib_files = filegroup {
    name = "v8_js_lib_files";
    srcs = [
        "src/js/macros.py"
        "src/messages.h"
        "src/js/prologue.js"
        "src/js/array.js"
        "src/js/typedarray.js"
        "src/js/intl.js"
    ];
};

in { inherit v8_js_lib_files; }
