{ sh_binary }:
let

#  Copyright 2011 The Android Open Source Project
#

settings = sh_binary {
    name = "settings";
    src = "settings";
};

in { inherit settings; }
