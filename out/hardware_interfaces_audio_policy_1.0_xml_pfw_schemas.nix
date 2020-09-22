{ genrule, xsd_config }:
let

audio_policy_engine_configurable_configuration_V1_0 = xsd_config {
    name = "audio_policy_engine_configurable_configuration_V1_0";
    srcs = ["AllSchemas.xsd"];
    package_name = "audio.policy.configurable.V1_0";
};

#  Unfortunately, all rules only have a single output, thus
#  it is needed to create a rule per XSD file.

audio_policy_engine_configurable_configuration_ComponentLibrary_V1_0 = genrule {
    name = "audio_policy_engine_configurable_configuration_ComponentLibrary_V1_0";
    srcs = ["ComponentLibrary.xsd"];
    out = [
        "audio_policy_engine_configurable_configuration_ComponentLibrary_V1_0.xsd"
    ];
    cmd = "cp -f $(in) $(genDir)/audio_policy_engine_configurable_configuration_ComponentLibrary_V1_0.xsd";
};

audio_policy_engine_configurable_configuration_ComponentTypeSet_V1_0 = genrule {
    name = "audio_policy_engine_configurable_configuration_ComponentTypeSet_V1_0";
    srcs = ["ComponentTypeSet.xsd"];
    out = [
        "audio_policy_engine_configurable_configuration_ComponentTypeSet_V1_0.xsd"
    ];
    cmd = "cp -f $(in) $(genDir)/audio_policy_engine_configurable_configuration_ComponentTypeSet_V1_0.xsd";
};

audio_policy_engine_configurable_configuration_ConfigurableDomain_V1_0 = genrule {
    name = "audio_policy_engine_configurable_configuration_ConfigurableDomain_V1_0";
    srcs = ["ConfigurableDomain.xsd"];
    out = [
        "audio_policy_engine_configurable_configuration_ConfigurableDomain_V1_0.xsd"
    ];
    cmd = "cp -f $(in) $(genDir)/audio_policy_engine_configurable_configuration_ConfigurableDomain_V1_0.xsd";
};

audio_policy_engine_configurable_configuration_ConfigurableDomains_V1_0 = genrule {
    name = "audio_policy_engine_configurable_configuration_ConfigurableDomains_V1_0";
    srcs = ["ConfigurableDomains.xsd"];
    out = [
        "audio_policy_engine_configurable_configuration_ConfigurableDomains_V1_0.xsd"
    ];
    cmd = "cp -f $(in) $(genDir)/audio_policy_engine_configurable_configuration_ConfigurableDomains_V1_0.xsd";
};

audio_policy_engine_configurable_configuration_FileIncluder_V1_0 = genrule {
    name = "audio_policy_engine_configurable_configuration_FileIncluder_V1_0";
    srcs = ["FileIncluder.xsd"];
    out = [
        "audio_policy_engine_configurable_configuration_FileIncluder_V1_0.xsd"
    ];
    cmd = "cp -f $(in) $(genDir)/audio_policy_engine_configurable_configuration_FileIncluder_V1_0.xsd";
};

audio_policy_engine_configurable_configuration_Parameter_V1_0 = genrule {
    name = "audio_policy_engine_configurable_configuration_Parameter_V1_0";
    srcs = ["Parameter.xsd"];
    out = [
        "audio_policy_engine_configurable_configuration_Parameter_V1_0.xsd"
    ];
    cmd = "cp -f $(in) $(genDir)/audio_policy_engine_configurable_configuration_Parameter_V1_0.xsd";
};

audio_policy_engine_configurable_configuration_ParameterFrameworkConfiguration_V1_0 = genrule {
    name = "audio_policy_engine_configurable_configuration_ParameterFrameworkConfiguration_V1_0";
    srcs = ["ParameterFrameworkConfiguration.xsd"];
    out = [
        "audio_policy_engine_configurable_configuration_ParameterFrameworkConfiguration_V1_0.xsd"
    ];
    cmd = "cp -f $(in) $(genDir)/audio_policy_engine_configurable_configuration_ParameterFrameworkConfiguration_V1_0.xsd";
};

audio_policy_engine_configurable_configuration_ParameterSettings_V1_0 = genrule {
    name = "audio_policy_engine_configurable_configuration_ParameterSettings_V1_0";
    srcs = ["ParameterSettings.xsd"];
    out = [
        "audio_policy_engine_configurable_configuration_ParameterSettings_V1_0.xsd"
    ];
    cmd = "cp -f $(in) $(genDir)/audio_policy_engine_configurable_configuration_ParameterSettings_V1_0.xsd";
};

audio_policy_engine_configurable_configuration_Subsystem_V1_0 = genrule {
    name = "audio_policy_engine_configurable_configuration_Subsystem_V1_0";
    srcs = ["Subsystem.xsd"];
    out = [
        "audio_policy_engine_configurable_configuration_Subsystem_V1_0.xsd"
    ];
    cmd = "cp -f $(in) $(genDir)/audio_policy_engine_configurable_configuration_Subsystem_V1_0.xsd";
};

audio_policy_engine_configurable_configuration_SystemClass_V1_0 = genrule {
    name = "audio_policy_engine_configurable_configuration_SystemClass_V1_0";
    srcs = ["SystemClass.xsd"];
    out = [
        "audio_policy_engine_configurable_configuration_SystemClass_V1_0.xsd"
    ];
    cmd = "cp -f $(in) $(genDir)/audio_policy_engine_configurable_configuration_SystemClass_V1_0.xsd";
};

audio_policy_engine_configurable_configuration_W3cXmlAttributes_V1_0 = genrule {
    name = "audio_policy_engine_configurable_configuration_W3cXmlAttributes_V1_0";
    srcs = ["W3cXmlAttributes.xsd"];
    out = [
        "audio_policy_engine_configurable_configuration_W3cXmlAttributes_V1_0.xsd"
    ];
    cmd = "cp -f $(in) $(genDir)/audio_policy_engine_configurable_configuration_W3cXmlAttributes_V1_0.xsd";
};

in { inherit audio_policy_engine_configurable_configuration_ComponentLibrary_V1_0 audio_policy_engine_configurable_configuration_ComponentTypeSet_V1_0 audio_policy_engine_configurable_configuration_ConfigurableDomain_V1_0 audio_policy_engine_configurable_configuration_ConfigurableDomains_V1_0 audio_policy_engine_configurable_configuration_FileIncluder_V1_0 audio_policy_engine_configurable_configuration_ParameterFrameworkConfiguration_V1_0 audio_policy_engine_configurable_configuration_ParameterSettings_V1_0 audio_policy_engine_configurable_configuration_Parameter_V1_0 audio_policy_engine_configurable_configuration_Subsystem_V1_0 audio_policy_engine_configurable_configuration_SystemClass_V1_0 audio_policy_engine_configurable_configuration_V1_0 audio_policy_engine_configurable_configuration_W3cXmlAttributes_V1_0; }
