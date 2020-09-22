{ xsd_config }:
let

audio_policy_engine_conf_V1_0 = xsd_config {
    name = "audio_policy_engine_conf_V1_0";
    srcs = ["audio_policy_engine_configuration.xsd"];
    package_name = "audio.policy.V1_0";
};

in { inherit audio_policy_engine_conf_V1_0; }
