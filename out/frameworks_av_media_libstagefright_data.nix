{ prebuilt_etc }:
let

"mediaswcodec.xml" = prebuilt_etc {
    name = "mediaswcodec.xml";
    src = "media_codecs_sw.xml";
    filename = "media_codecs.xml";
    installable = false;
};

in { inherit "mediaswcodec.xml"; }
