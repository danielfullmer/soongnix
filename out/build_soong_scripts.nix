{ python_binary_host, python_library_host, python_test_host }:
let

manifest_fixer = python_binary_host {
    name = "manifest_fixer";
    main = "manifest_fixer.py";
    srcs = [
        "manifest_fixer.py"
    ];
    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = false;
        };
    };
    libs = [
        "manifest_utils"
    ];
};

manifest_fixer_test = python_test_host {
    name = "manifest_fixer_test";
    main = "manifest_fixer_test.py";
    srcs = [
        "manifest_fixer_test.py"
        "manifest_fixer.py"
    ];
    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = false;
        };
    };
    libs = [
        "manifest_utils"
    ];
    test_suites = ["general-tests"];
};

manifest_utils = python_library_host {
    name = "manifest_utils";
    srcs = [
        "manifest.py"
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

manifest_check = python_binary_host {
    name = "manifest_check";
    main = "manifest_check.py";
    srcs = [
        "manifest_check.py"
    ];
    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = false;
        };
    };
    libs = [
        "manifest_utils"
    ];
};

manifest_check_test = python_test_host {
    name = "manifest_check_test";
    main = "manifest_check_test.py";
    srcs = [
        "manifest_check_test.py"
        "manifest_check.py"
    ];
    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = false;
        };
    };
    libs = [
        "manifest_utils"
    ];
    test_suites = ["general-tests"];
};

jsonmodify = python_binary_host {
    name = "jsonmodify";
    main = "jsonmodify.py";
    srcs = [
        "jsonmodify.py"
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

test_config_fixer = python_binary_host {
    name = "test_config_fixer";
    main = "test_config_fixer.py";
    srcs = [
        "test_config_fixer.py"
    ];
    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = false;
        };
    };
    libs = [
        "manifest_utils"
    ];
};

test_config_fixer_test = python_test_host {
    name = "test_config_fixer_test";
    main = "test_config_fixer_test.py";
    srcs = [
        "test_config_fixer_test.py"
        "test_config_fixer.py"
    ];
    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = false;
        };
    };
    libs = [
        "manifest_utils"
    ];
    test_suites = ["general-tests"];
};

lint-project-xml = python_binary_host {
    name = "lint-project-xml";
    main = "lint-project-xml.py";
    srcs = ["lint-project-xml.py"];
};

in { inherit jsonmodify lint-project-xml manifest_check manifest_check_test manifest_fixer manifest_fixer_test manifest_utils test_config_fixer test_config_fixer_test; }
