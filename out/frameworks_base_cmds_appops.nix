{ sh_binary }:
let

#  Copyright 2014 The Android Open Source Project

appops = sh_binary {
    name = "appops";
    src = "appops";
};

in { inherit appops; }
