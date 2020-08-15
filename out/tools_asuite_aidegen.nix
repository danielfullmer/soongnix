{ python_binary_host, python_defaults, python_library_host, python_test_host }:
let

#  Copyright (C) 2018 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

aidegen_default = python_defaults {
    name = "aidegen_default";
    pkg_path = "aidegen";
    version = {
        py2 = {
            enabled = false;
            embedded_launcher = false;
        };
        py3 = {
            enabled = true;
            embedded_launcher = false;
        };
    };
};

aidegen = python_binary_host {
    name = "aidegen";
    #  Make aidegen's built name to aidegen-dev
    stem = "aidegen-dev";
    defaults = ["aidegen_default"];
    main = "aidegen_main.py";
    srcs = [
        "__init__.py"
        "aidegen_main.py"
        "aidegen_main_unittest.py"
        "aidegen_run_unittests.py"
        "constant.py"
        "unittest_constants.py"
        "lib/__init__.py"
        "lib/aidegen_metrics.py"
        "lib/android_dev_os.py"
        "lib/android_dev_os_unittest.py"
        "lib/common_util.py"
        "lib/common_util_unittest.py"
        "lib/config.py"
        "lib/errors.py"
        "lib/ide_util.py"
        "lib/ide_util_unittest.py"
        "lib/module_info_util.py"
        "lib/module_info_util_unittest.py"
        "lib/project_file_gen.py"
        "lib/project_file_gen_unittest.py"
        "lib/project_info.py"
        "lib/project_info_unittest.py"
        "lib/source_locator.py"
        "lib/source_locator_unittest.py"
    ];
    data = [
        "templates/eclipse/"
        "templates/idea/"
        "templates/jdkTable/"
        "templates/module-template.iml"
        "templates/eclipse/eclipse.xml"
        "templates/eclipse/project.xml"
        "templates/idea/codeStyles/"
        "templates/idea/compiler.xml"
        "templates/idea/copyright/"
        "templates/idea/misc.xml"
        "templates/idea/modules.xml"
        "templates/idea/vcs.xml"
        "templates/idea/codeStyles/codeStyleConfig.xml"
        "templates/idea/copyright/Apache_2.xml"
        "templates/idea/copyright/profiles_settings.xml"
        "templates/jdkTable/jdk.table.xml"
        "templates/jdkTable/mac.jdk.table.xml"
        "templates/jdkTable/part.jdk.table.xml"
        "templates/jdkTable/part.mac.jdk.table.xml"
    ];
    libs = [
        "atest_module_info"
        "asuite_cc_client"
    ];
    dist = {
        targets = ["droidcore"];
    };
};

aidegen_lib = python_library_host {
    name = "aidegen_lib";
    defaults = ["aidegen_default"];
    srcs = [
        "aidegen_main.py"
        "constant.py"
        "unittest_constants.py"
        "lib/__init__.py"
        "lib/aidegen_metrics.py"
        "lib/android_dev_os.py"
        "lib/android_dev_os_unittest.py"
        "lib/common_util.py"
        "lib/common_util_unittest.py"
        "lib/config.py"
        "lib/errors.py"
        "lib/ide_util.py"
        "lib/ide_util_unittest.py"
        "lib/module_info_util.py"
        "lib/module_info_util_unittest.py"
        "lib/project_file_gen.py"
        "lib/project_file_gen_unittest.py"
        "lib/project_info.py"
        "lib/project_info_unittest.py"
        "lib/source_locator.py"
        "lib/source_locator_unittest.py"
    ];
};

aidegen_unittests = python_test_host {
    name = "aidegen_unittests";
    main = "aidegen_run_unittests.py";
    pkg_path = "aidegen";
    srcs = [
        "__init__.py"
        "aidegen_main.py"
        "aidegen_main_unittest.py"
        "aidegen_run_unittests.py"
        "constant.py"
        "unittest_constants.py"
        "lib/__init__.py"
        "lib/aidegen_metrics.py"
        "lib/android_dev_os.py"
        "lib/android_dev_os_unittest.py"
        "lib/common_util.py"
        "lib/common_util_unittest.py"
        "lib/config.py"
        "lib/errors.py"
        "lib/ide_util.py"
        "lib/ide_util_unittest.py"
        "lib/module_info_util.py"
        "lib/module_info_util_unittest.py"
        "lib/project_file_gen.py"
        "lib/project_file_gen_unittest.py"
        "lib/project_info.py"
        "lib/project_info_unittest.py"
        "lib/source_locator.py"
        "lib/source_locator_unittest.py"
    ];
    data = [
        "templates/eclipse/"
        "templates/idea/"
        "templates/jdkTable/"
        "templates/module-template.iml"
        "templates/eclipse/eclipse.xml"
        "templates/eclipse/project.xml"
        "templates/idea/codeStyles/"
        "templates/idea/compiler.xml"
        "templates/idea/copyright/"
        "templates/idea/misc.xml"
        "templates/idea/modules.xml"
        "templates/idea/vcs.xml"
        "templates/idea/codeStyles/codeStyleConfig.xml"
        "templates/idea/copyright/Apache_2.xml"
        "templates/idea/copyright/profiles_settings.xml"
        "templates/jdkTable/jdk.table.xml"
        "templates/jdkTable/mac.jdk.table.xml"
        "templates/jdkTable/part.jdk.table.xml"
        "templates/jdkTable/part.mac.jdk.table.xml"
        "test_data/android_facet.iml"
        "test_data/android_project/"
        "test_data/dependencies.iml"
        "test_data/eclipse.classpath"
        "test_data/module_dependency.iml"
        "test_data/modules.xml"
        "test_data/out/"
        "test_data/packages/"
        "test_data/project/"
        "test_data/project_facet.iml"
        "test_data/source.iml"
        "test_data/test.iml"
        "test_data/vcs.xml"
        "test_data/android_project/AndroidManifest.xml"
        "test_data/out/soong/"
        "test_data/packages/apps/"
        "test_data/packages/apps/test/"
        "test_data/packages/apps/test/src/"
        "test_data/packages/apps/test/test.jar"
        "test_data/packages/apps/test/tests/"
        "test_data/packages/apps/test/src/main/"
        "test_data/packages/apps/test/src/main/java/"
        "test_data/packages/apps/test/src/main/java/com/"
        "test_data/packages/apps/test/src/main/java/com/android/"
        "test_data/packages/apps/test/src/main/java/com/android/java.java"
        "test_data/packages/apps/test/src/main/java/com/android/wrong_package.java"
        "test_data/packages/apps/test/tests/com/"
        "test_data/packages/apps/test/tests/test.srcjar"
        "test_data/packages/apps/test/tests/test_second.jar"
        "test_data/packages/apps/test/tests/com/android/"
        "test_data/packages/apps/test/tests/com/android/test.java"
        "test_data/project/level11/"
        "test_data/project/level12/"
        "test_data/project/test.java"
        "test_data/project/level11/level21/"
        "test_data/project/level11/level22/"
        "test_data/project/level11/level21/a.java"
        "test_data/project/level11/level22/level31/"
        "test_data/project/level11/level22/level31/c.java"
        "test_data/project/level12/level22/"
        "test_data/project/level12/level22/b_test.java"
    ];
    libs = [
        "py-mock"
        "asuite_cc_client"
    ];
    test_config = "aidegen_unittests.xml";
    test_suites = ["general-tests"];
    defaults = ["aidegen_default"];
};

in { inherit aidegen aidegen_default aidegen_lib aidegen_unittests; }
