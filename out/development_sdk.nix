{ genrule }:
let

platform_tools_version = genrule {
    name = "platform_tools_version";
    cmd = "sed 's/$\${PLATFORM_SDK_VERSION}/0/ ; s/^Pkg.Revision=\\(.*\\)/#define PLATFORM_TOOLS_VERSION \"\\1\"/p ; d' $(in) > $(out)";
    srcs = ["plat_tools_source.prop_template"];
    out = ["platform_tools_version.h"];
};

in { inherit platform_tools_version; }
