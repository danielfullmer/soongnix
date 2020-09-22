{ sh_binary }:
let

#  Copyright 2007 The Android Open Source Project
#

pm = sh_binary {
    name = "pm";
    src = "pm";
};

in { inherit pm; }
