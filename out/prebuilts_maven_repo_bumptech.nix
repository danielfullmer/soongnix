{ java_import }:
let

glide-prebuilt = java_import {
    name = "glide-prebuilt";
    jars = [
        "com/github/bumptech/glide/glide/4.8.0/glide-4.8.0.jar"
        "com/github/bumptech/glide/disklrucache/4.8.0/disklrucache-4.8.0.jar"
        "com/github/bumptech/glide/gifdecoder/4.8.0/gifdecoder-4.8.0.jar"
    ];
    jetifier = true;
    notice = "LICENSE";
};

in { inherit glide-prebuilt; }
