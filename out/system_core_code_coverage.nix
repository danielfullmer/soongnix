{ prebuilt_etc }:
let

"code_coverage.policy" = prebuilt_etc {
    name = "code_coverage.policy";
    sub_dir = "seccomp_policy";
    filename_from_src = true;
    arch = {
        arm = {
            src = "empty_policy/code_coverage.arm.policy";
            product_variables = {
                native_coverage = {
                    src = "seccomp_policy/code_coverage.arm.policy";
                };
            };
        };
        arm64 = {
            src = "empty_policy/code_coverage.arm64.policy";
            product_variables = {
                native_coverage = {
                    src = "seccomp_policy/code_coverage.arm64.policy";
                };
            };
        };
        x86 = {
            src = "empty_policy/code_coverage.x86.policy";
            product_variables = {
                native_coverage = {
                    src = "seccomp_policy/code_coverage.x86.policy";
                };
            };
        };
        x86_64 = {
            src = "empty_policy/code_coverage.x86_64.policy";
            product_variables = {
                native_coverage = {
                    src = "seccomp_policy/code_coverage.x86_64.policy";
                };
            };
        };
    };
    required = [
        "code_coverage.policy.other"
    ];
};

"code_coverage.policy.other" = prebuilt_etc {
    name = "code_coverage.policy.other";
    sub_dir = "seccomp_policy";
    filename_from_src = true;
    arch = {
        arm = {
            src = "empty_policy/code_coverage.arm64.policy";
            product_variables = {
                native_coverage = {
                    src = "seccomp_policy/code_coverage.arm64.policy";
                };
            };
        };
        arm64 = {
            src = "empty_policy/code_coverage.arm.policy";
            product_variables = {
                native_coverage = {
                    src = "seccomp_policy/code_coverage.arm.policy";
                };
            };
        };
        x86 = {
            src = "empty_policy/code_coverage.x86_64.policy";
            product_variables = {
                native_coverage = {
                    src = "seccomp_policy/code_coverage.x86_64.policy";
                };
            };
        };
        x86_64 = {
            src = "empty_policy/code_coverage.x86.policy";
            product_variables = {
                native_coverage = {
                    src = "seccomp_policy/code_coverage.x86.policy";
                };
            };
        };
    };
};

in { inherit "code_coverage.policy" "code_coverage.policy.other"; }
