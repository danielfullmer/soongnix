{ cc_test }:
let

VtsHalAudioPolicyV1_0TargetTest = cc_test {
    name = "VtsHalAudioPolicyV1_0TargetTest";
    defaults = ["vts_target_tests_defaults"];
    srcs = [
        "ValidateEngineConfiguration.cpp"
    ];
    static_libs = [
        "libxml2"
        "liblog"
        "libmedia_helper"
        "libaudiopolicyengine_config"
        "libaudiopolicycomponents"
        "libaudiopolicyengineconfigurable_pfwwrapper"
        "android.hardware.audio.common.test.utility"
        "libparameter"
        "libpfw_utility"
        "libremote-processor"
        "libutils"
        "libcutils"
        "libhidlbase"
        "liblog"
        "libbase"
    ];
    shared_libs = [
        "libaudiofoundation"
    ];
    #  Use test_config for vts suite.
    #  TODO(b/146104851): Add auto-gen rules and remove it.
    test_config = "VtsHalAudioPolicyV1_0TargetTest.xml";
    cflags = [
        "-DXSD_DIR=\"/data/local/tmp\""
        "-DXSD_PFW_DIR=\"/data/local/tmp/Schemas\""
        "-Wall"
        "-Werror"
        "-Wno-unused-function"
        "-O0"
        "-g"
    ];
    data = [
        ":audio_policy_engine_conf_V1_0"
        ":audio_policy_engine_configurable_configuration_V1_0"
        ":audio_policy_engine_configurable_configuration_ComponentLibrary_V1_0"
        ":audio_policy_engine_configurable_configuration_ComponentTypeSet_V1_0"
        ":audio_policy_engine_configurable_configuration_ConfigurableDomain_V1_0"
        ":audio_policy_engine_configurable_configuration_ConfigurableDomains_V1_0"
        ":audio_policy_engine_configurable_configuration_FileIncluder_V1_0"
        ":audio_policy_engine_configurable_configuration_Parameter_V1_0"
        ":audio_policy_engine_configurable_configuration_ParameterFrameworkConfiguration_V1_0"
        ":audio_policy_engine_configurable_configuration_ParameterSettings_V1_0"
        ":audio_policy_engine_configurable_configuration_Subsystem_V1_0"
        ":audio_policy_engine_configurable_configuration_SystemClass_V1_0"
        ":audio_policy_engine_configurable_configuration_W3cXmlAttributes_V1_0"
    ];
    gtest = true;
    test_suites = [
        "general-tests"
        "vts"
    ];
};

in { inherit VtsHalAudioPolicyV1_0TargetTest; }
