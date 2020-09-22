{ sh_binary }:
let

#  Copyright 2013 The Android Open Source Project
#

wm = sh_binary {
    name = "wm";
    src = "wm";
};

in { inherit wm; }
