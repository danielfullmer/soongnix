{ sh_binary }:
let

#  Copyright 2007 The Android Open Source Project
#

ime = sh_binary {
    name = "ime";
    src = "ime";
};

in { inherit ime; }
