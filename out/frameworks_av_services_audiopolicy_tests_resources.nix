{ filegroup }:
let

audiopolicytest_configuration_files = filegroup {
    name = "audiopolicytest_configuration_files";
    srcs = [
        "test_audio_policy_configuration.xml"
        "test_audio_policy_primary_only_configuration.xml"
        "test_tv_apm_configuration.xml"
    ];
};

in { inherit audiopolicytest_configuration_files; }
