{ phony }:
let

shell_and_utilities = phony {
    name = "shell_and_utilities";
    required = [
        "shell_and_utilities_system"
        "shell_and_utilities_recovery"
        "shell_and_utilities_vendor"
    ];
};

shell_and_utilities_system = phony {
    name = "shell_and_utilities_system";
    required = [
        "auditctl"
        "awk"
        "bc"
        "bzip2"
        "ldd"
        "logwrapper"
        "mini-keyctl"
        "mkshrc"
        "newfs_msdos"
        "reboot"
        "sh"
        "simpleperf"
        "simpleperf_app_runner"
        "tcpdump"
        "toolbox"
        "toybox"
        "ziptool"
    ];
};

shell_and_utilities_recovery = phony {
    name = "shell_and_utilities_recovery";
    required = [
        "sh.recovery"
        "toolbox.recovery"
        "toybox.recovery"
        "unzip.recovery"
    ];
};

shell_and_utilities_vendor = phony {
    name = "shell_and_utilities_vendor";
    required = [
        "awk_vendor"
        "logwrapper_vendor"
        "mkshrc_vendor"
        "sh_vendor"
        "toolbox_vendor"
        "toybox_vendor"
    ];
};

in { inherit shell_and_utilities shell_and_utilities_recovery shell_and_utilities_system shell_and_utilities_vendor; }
