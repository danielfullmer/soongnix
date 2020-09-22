{ genrule }:
let

current-api-xml = genrule {
    name = "current-api-xml";
    tools = ["metalava"];
    srcs = ["current.txt"];
    out = ["current.api"];
    cmd = "$(location metalava) --no-banner -convert2xmlnostrip $(in) $(out)";
};

in { inherit current-api-xml; }
