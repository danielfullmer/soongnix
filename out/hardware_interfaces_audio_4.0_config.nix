{ xsd_config }:
let

audio_policy_configuration_V4_0 = xsd_config {
    name = "audio_policy_configuration_V4_0";
    srcs = ["audio_policy_configuration.xsd"];
    package_name = "audio.policy.configuration.V4_0";
};

in { inherit audio_policy_configuration_V4_0; }
