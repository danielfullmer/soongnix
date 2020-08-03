{ python_binary_host }:
let

kconfig_xml_fixup = python_binary_host {
    name = "kconfig_xml_fixup";
    main = "kconfig_xml_fixup.py";

    srcs = [
        "kconfig_xml_fixup.py"
    ];

    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = false;
        };
    };
};

in { inherit kconfig_xml_fixup; }
