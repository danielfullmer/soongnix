{ xsd_config }:
let

audio_effects_conf_V5_0 = xsd_config {
    name = "audio_effects_conf_V5_0";
    srcs = ["audio_effects_conf.xsd"];
    package_name = "audio.effects.V5_0";
};

in { inherit audio_effects_conf_V5_0; }
