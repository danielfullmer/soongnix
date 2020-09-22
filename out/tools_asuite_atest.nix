{ java_library_host, python_binary_host, python_defaults, python_library_host, python_test_host, tradefed_binary_host }:
let

#  Copyright 2019 The Android Open Source Project
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

#  Set of error prone rules to ensure code quality
#  PackageLocation check requires the androidCompatible=false otherwise it does not do anything.
atest-tradefed-shell = java_library_host {
    name = "atest-tradefed-shell";
};

atest-tradefed = tradefed_binary_host {
    name = "atest-tradefed";
    short_name = "ATEST";
    full_name = "ATest Test Suite";
    static_libs = ["atest-tradefed-shell"];
};

atest_py3_default = python_defaults {
    name = "atest_py3_default";
    pkg_path = "atest";
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

atest = python_binary_host {
    name = "atest";
    main = "atest.py";
    srcs = [
        "__init__.py"
        "asuite_metrics.py"
        "atest.py"
        "atest_arg_parser.py"
        "atest_arg_parser_unittest.py"
        "atest_decorator.py"
        "atest_enum.py"
        "atest_error.py"
        "atest_execution_info.py"
        "atest_execution_info_unittest.py"
        "atest_integration_tests.py"
        "atest_metrics.py"
        "atest_run_unittests.py"
        "atest_unittest.py"
        "atest_utils.py"
        "atest_utils_unittest.py"
        "bug_detector.py"
        "bug_detector_unittest.py"
        "cli_translator.py"
        "cli_translator_unittest.py"
        "constants.py"
        "constants_default.py"
        "module_info.py"
        "module_info_unittest.py"
        "result_reporter.py"
        "result_reporter_unittest.py"
        "test_finder_handler.py"
        "test_finder_handler_unittest.py"
        "test_mapping.py"
        "test_mapping_unittest.py"
        "test_runner_handler.py"
        "test_runner_handler_unittest.py"
        "unittest_constants.py"
        "unittest_utils.py"
        "metrics/__init__.py"
        "metrics/clearcut_client.py"
        "metrics/metrics.py"
        "metrics/metrics_base.py"
        "metrics/metrics_utils.py"
        "proto/__init__.py"
        "proto/clientanalytics_pb2.py"
        "proto/common_pb2.py"
        "proto/external_user_log_pb2.py"
        "proto/internal_user_log_pb2.py"
        "test_finders/__init__.py"
        "test_finders/cache_finder.py"
        "test_finders/cache_finder_unittest.py"
        "test_finders/example_finder.py"
        "test_finders/module_finder.py"
        "test_finders/module_finder_unittest.py"
        "test_finders/suite_plan_finder.py"
        "test_finders/suite_plan_finder_unittest.py"
        "test_finders/test_finder_base.py"
        "test_finders/test_finder_utils.py"
        "test_finders/test_finder_utils_unittest.py"
        "test_finders/test_info.py"
        "test_finders/tf_integration_finder.py"
        "test_finders/tf_integration_finder_unittest.py"
        "test_runners/__init__.py"
        "test_runners/atest_tf_test_runner.py"
        "test_runners/atest_tf_test_runner_unittest.py"
        "test_runners/event_handler.py"
        "test_runners/event_handler_unittest.py"
        "test_runners/example_test_runner.py"
        "test_runners/regression_test_runner.py"
        "test_runners/robolectric_test_runner.py"
        "test_runners/robolectric_test_runner_unittest.py"
        "test_runners/suite_plan_test_runner.py"
        "test_runners/suite_plan_test_runner_unittest.py"
        "test_runners/test_runner_base.py"
        "test_runners/vts_tf_test_runner.py"
        "test_runners/vts_tf_test_runner_unittest.py"
        "tools/__init__.py"
        "tools/atest_tools.py"
        "tools/atest_tools_unittest.py"
    ];
    exclude_srcs = [
        "atest_arg_parser_unittest.py"
        "atest_execution_info_unittest.py"
        "atest_unittest.py"
        "atest_utils_unittest.py"
        "bug_detector_unittest.py"
        "cli_translator_unittest.py"
        "module_info_unittest.py"
        "result_reporter_unittest.py"
        "test_finder_handler_unittest.py"
        "test_mapping_unittest.py"
        "test_runner_handler_unittest.py"
        "test_finders/cache_finder_unittest.py"
        "test_finders/module_finder_unittest.py"
        "test_finders/suite_plan_finder_unittest.py"
        "test_finders/test_finder_utils_unittest.py"
        "test_finders/tf_integration_finder_unittest.py"
        "test_runners/atest_tf_test_runner_unittest.py"
        "test_runners/event_handler_unittest.py"
        "test_runners/robolectric_test_runner_unittest.py"
        "test_runners/suite_plan_test_runner_unittest.py"
        "test_runners/vts_tf_test_runner_unittest.py"
        "tools/atest_tools_unittest.py"

        "proto/clientanalytics_pb2.py"
        "proto/common_pb2.py"
        "proto/external_user_log_pb2.py"
        "proto/internal_user_log_pb2.py"
        "proto/__init__.py"
    ];
    libs = [
        "atest_py3_proto"
    ];
    data = [
        "tools/updatedb_darwin.sh"
        ":asuite_version"
    ];
    #  Make atest's built name to atest-dev
    stem = "atest-dev";
    defaults = ["atest_py3_default"];
    dist = {
        targets = ["droidcore"];
    };
};

atest_py3_proto = python_library_host {
    name = "atest_py3_proto";
    defaults = ["atest_py3_default"];
    srcs = [
        "proto/clientanalytics.proto"
        "proto/common.proto"
        "proto/external_user_log.proto"
        "proto/internal_user_log.proto"
    ];
    proto = {
        canonical_path_from_root = false;
    };
};

#  Exclude atest_updatedb_unittest due to it's a test for ATest's wrapper
#  of updatedb, but there's no updatedb binary on test server.
atest_unittests = python_test_host {
    name = "atest_unittests";
    main = "atest_run_unittests.py";
    pkg_path = "atest";
    srcs = [
        "__init__.py"
        "asuite_metrics.py"
        "atest.py"
        "atest_arg_parser.py"
        "atest_arg_parser_unittest.py"
        "atest_decorator.py"
        "atest_enum.py"
        "atest_error.py"
        "atest_execution_info.py"
        "atest_execution_info_unittest.py"
        "atest_integration_tests.py"
        "atest_metrics.py"
        "atest_run_unittests.py"
        "atest_unittest.py"
        "atest_utils.py"
        "atest_utils_unittest.py"
        "bug_detector.py"
        "bug_detector_unittest.py"
        "cli_translator.py"
        "cli_translator_unittest.py"
        "constants.py"
        "constants_default.py"
        "module_info.py"
        "module_info_unittest.py"
        "result_reporter.py"
        "result_reporter_unittest.py"
        "test_finder_handler.py"
        "test_finder_handler_unittest.py"
        "test_mapping.py"
        "test_mapping_unittest.py"
        "test_runner_handler.py"
        "test_runner_handler_unittest.py"
        "unittest_constants.py"
        "unittest_utils.py"
        "metrics/__init__.py"
        "metrics/clearcut_client.py"
        "metrics/metrics.py"
        "metrics/metrics_base.py"
        "metrics/metrics_utils.py"
        "proto/__init__.py"
        "proto/clientanalytics_pb2.py"
        "proto/common_pb2.py"
        "proto/external_user_log_pb2.py"
        "proto/internal_user_log_pb2.py"
        "test_finders/__init__.py"
        "test_finders/cache_finder.py"
        "test_finders/cache_finder_unittest.py"
        "test_finders/example_finder.py"
        "test_finders/module_finder.py"
        "test_finders/module_finder_unittest.py"
        "test_finders/suite_plan_finder.py"
        "test_finders/suite_plan_finder_unittest.py"
        "test_finders/test_finder_base.py"
        "test_finders/test_finder_utils.py"
        "test_finders/test_finder_utils_unittest.py"
        "test_finders/test_info.py"
        "test_finders/tf_integration_finder.py"
        "test_finders/tf_integration_finder_unittest.py"
        "test_runners/__init__.py"
        "test_runners/atest_tf_test_runner.py"
        "test_runners/atest_tf_test_runner_unittest.py"
        "test_runners/event_handler.py"
        "test_runners/event_handler_unittest.py"
        "test_runners/example_test_runner.py"
        "test_runners/regression_test_runner.py"
        "test_runners/robolectric_test_runner.py"
        "test_runners/robolectric_test_runner_unittest.py"
        "test_runners/suite_plan_test_runner.py"
        "test_runners/suite_plan_test_runner_unittest.py"
        "test_runners/test_runner_base.py"
        "test_runners/vts_tf_test_runner.py"
        "test_runners/vts_tf_test_runner_unittest.py"
        "tools/__init__.py"
        "tools/atest_tools.py"
        "tools/atest_tools_unittest.py"
    ];
    data = [
        "tools/updatedb_darwin.sh"
        "unittest_data/AndroidTest.xml"
        "unittest_data/CtsUiDeviceTestCases.xml"
        "unittest_data/KernelTest.xml"
        "unittest_data/VtsAndroidTest.xml"
        "unittest_data/cache_root/"
        "unittest_data/cc_path_testing/"
        "unittest_data/class_file_path_testing/"
        "unittest_data/gts_auth_key.json"
        "unittest_data/integration_dir_testing/"
        "unittest_data/module-info.json"
        "unittest_data/path_testing/"
        "unittest_data/path_testing_empty/"
        "unittest_data/test_config/"
        "unittest_data/test_mapping/"
        "unittest_data/vts_plan_files/"
        "unittest_data/vts_push_files/"
        "unittest_data/cache_root/78ea54ef315f5613f7c11dd1a87f10c7.cache"
        "unittest_data/cache_root/cd66f9f5ad63b42d0d77a9334de6bb73.cache"
        "unittest_data/cc_path_testing/PathTesting.cpp"
        "unittest_data/class_file_path_testing/hello_world_test.cc"
        "unittest_data/class_file_path_testing/hello_world_test.cpp"
        "unittest_data/class_file_path_testing/hello_world_test.java"
        "unittest_data/class_file_path_testing/hello_world_test.kt"
        "unittest_data/class_file_path_testing/hello_world_test.other"
        "unittest_data/integration_dir_testing/int_dir1/"
        "unittest_data/integration_dir_testing/int_dir2/"
        "unittest_data/integration_dir_testing/int_dir1/int_dir_testing.xml"
        "unittest_data/integration_dir_testing/int_dir2/int_dir_testing.xml"
        "unittest_data/path_testing/PathTesting.java"
        "unittest_data/test_config/a.xml"
        "unittest_data/test_mapping/folder1/"
        "unittest_data/test_mapping/folder2/"
        "unittest_data/test_mapping/folder3/"
        "unittest_data/test_mapping/folder5/"
        "unittest_data/test_mapping/folder6/"
        "unittest_data/test_mapping/test_mapping_sample"
        "unittest_data/test_mapping/folder1/test_mapping_sample"
        "unittest_data/test_mapping/folder2/test_mapping_sample"
        "unittest_data/test_mapping/folder3/folder4/"
        "unittest_data/test_mapping/folder3/test_mapping_sample"
        "unittest_data/test_mapping/folder3/folder4/test_mapping_sample"
        "unittest_data/test_mapping/folder5/test_mapping_sample"
        "unittest_data/test_mapping/folder6/test_mapping_sample_golden"
        "unittest_data/test_mapping/folder6/test_mapping_sample_with_comments"
        "unittest_data/vts_plan_files/vts-aa.xml"
        "unittest_data/vts_plan_files/vts-bb.xml"
        "unittest_data/vts_plan_files/vts-cc.xml"
        "unittest_data/vts_plan_files/vts-dd.xml"
        "unittest_data/vts_plan_files/vts-staging-default.xml"
        "unittest_data/vts_push_files/push_file1.push"
        "unittest_data/vts_push_files/push_file2.push"
        "unittest_data/path_testing_empty/.empty_file"
    ];
    exclude_srcs = [

        "proto/clientanalytics_pb2.py"
        "proto/common_pb2.py"
        "proto/external_user_log_pb2.py"
        "proto/internal_user_log_pb2.py"
        "proto/__init__.py"
        "tools/atest_updatedb_unittest.py"
    ];
    libs = [
        "atest_py3_proto"
    ];
    test_config = "atest_unittests.xml";
    test_suites = ["general-tests"];
    defaults = ["atest_py3_default"];
};

atest_integration_tests = python_test_host {
    name = "atest_integration_tests";
    main = "atest_integration_tests.py";
    pkg_path = "atest";
    srcs = [
        "atest_integration_tests.py"
    ];
    data = [
        "INTEGRATION_TESTS"
    ];
    test_config = "atest_integration_tests.xml";
    test_suites = ["general-tests"];
    defaults = ["atest_py3_default"];
};

in { inherit atest atest-tradefed atest-tradefed-shell atest_integration_tests atest_py3_default atest_py3_proto atest_unittests; }
