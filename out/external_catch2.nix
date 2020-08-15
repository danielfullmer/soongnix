{ cc_defaults, cc_library_static, cc_test }:
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

libcatch2-defaults = cc_defaults {
    name = "libcatch2-defaults";
    host_supported = true;
    local_include_dirs = ["include"]; #  cc_test ignores export_include_dirs
    export_include_dirs = ["include"];
    srcs = [
        "include/catch_with_main.cpp"
        "include/internal/catch_approx.cpp"
        "include/internal/catch_assertionhandler.cpp"
        "include/internal/catch_assertionresult.cpp"
        "include/internal/catch_benchmark.cpp"
        "include/internal/catch_capture_matchers.cpp"
        "include/internal/catch_commandline.cpp"
        "include/internal/catch_common.cpp"
        "include/internal/catch_config.cpp"
        "include/internal/catch_console_colour.cpp"
        "include/internal/catch_context.cpp"
        "include/internal/catch_debug_console.cpp"
        "include/internal/catch_debugger.cpp"
        "include/internal/catch_decomposer.cpp"
        "include/internal/catch_enforce.cpp"
        "include/internal/catch_errno_guard.cpp"
        "include/internal/catch_exception_translator_registry.cpp"
        "include/internal/catch_fatal_condition.cpp"
        "include/internal/catch_generators.cpp"
        "include/internal/catch_interfaces_capture.cpp"
        "include/internal/catch_interfaces_config.cpp"
        "include/internal/catch_interfaces_exception.cpp"
        "include/internal/catch_interfaces_registry_hub.cpp"
        "include/internal/catch_interfaces_reporter.cpp"
        "include/internal/catch_interfaces_runner.cpp"
        "include/internal/catch_interfaces_testcase.cpp"
        "include/internal/catch_leak_detector.cpp"
        "include/internal/catch_list.cpp"
        "include/internal/catch_matchers.cpp"
        "include/internal/catch_matchers_floating.cpp"
        "include/internal/catch_matchers_generic.cpp"
        "include/internal/catch_matchers_string.cpp"
        "include/internal/catch_message.cpp"
        "include/internal/catch_output_redirect.cpp"
        "include/internal/catch_polyfills.cpp"
        "include/internal/catch_random_number_generator.cpp"
        "include/internal/catch_registry_hub.cpp"
        "include/internal/catch_reporter_registry.cpp"
        "include/internal/catch_result_type.cpp"
        "include/internal/catch_run_context.cpp"
        "include/internal/catch_section.cpp"
        "include/internal/catch_section_info.cpp"
        "include/internal/catch_session.cpp"
        "include/internal/catch_singletons.cpp"
        "include/internal/catch_startup_exception_registry.cpp"
        "include/internal/catch_stream.cpp"
        "include/internal/catch_string_manip.cpp"
        "include/internal/catch_stringref.cpp"
        "include/internal/catch_tag_alias.cpp"
        "include/internal/catch_tag_alias_autoregistrar.cpp"
        "include/internal/catch_tag_alias_registry.cpp"
        "include/internal/catch_test_case_info.cpp"
        "include/internal/catch_test_case_registry_impl.cpp"
        "include/internal/catch_test_case_tracker.cpp"
        "include/internal/catch_test_registry.cpp"
        "include/internal/catch_test_spec.cpp"
        "include/internal/catch_test_spec_parser.cpp"
        "include/internal/catch_timer.cpp"
        "include/internal/catch_tostring.cpp"
        "include/internal/catch_totals.cpp"
        "include/internal/catch_uncaught_exceptions.cpp"
        "include/internal/catch_version.cpp"
        "include/internal/catch_wildcard_pattern.cpp"
        "include/internal/catch_xmlwriter.cpp"
        "include/reporters/catch_reporter_bases.cpp"
        "include/reporters/catch_reporter_compact.cpp"
        "include/reporters/catch_reporter_console.cpp"
        "include/reporters/catch_reporter_junit.cpp"
        "include/reporters/catch_reporter_listening.cpp"
        "include/reporters/catch_reporter_xml.cpp"
    ];
    exclude_srcs = ["include/catch_with_main.cpp"];
};

#  !!! IMPORTANT: Use 'whole_static_libs' or the linker will dead-code-eliminate
#  parts of the important code (the console and junit reporters).

#  Android users: libcatch2-main is what you want 99% of the time.
#  Using the pre-defined main speeds up compilation significantly.
#  If for some reason you want to provide your own `main`, use "libcatch2"
#  See also docs/configuration.md
libcatch2-main = cc_library_static {
    name = "libcatch2-main";
    defaults = [
        "libcatch2-defaults"
    ];
    srcs = [
        "include/catch_with_main.cpp"
    ];
};

#  libcatch2 without the pre-defined main.
#  This is only useful if your program will define its own main.
libcatch2 = cc_library_static {
    name = "libcatch2";
    defaults = [
        "libcatch2-defaults"
    ];
    cflags = ["-DCATCH_CONFIG_DISABLE_EXCEPTIONS"];
};

#  This rule can be used by other external/ projects that depend on catch2
#  without turning off exceptions.
libcatch2-upstream = cc_library_static {
    name = "libcatch2-upstream";
    defaults = [
        "libcatch2-defaults"
    ];
    cflags = ["-fexceptions"];
};

#  Configurations meant for validating upstream. Not intended to be used by anything else.

libcatch2-defaults-tests = cc_defaults {
    name = "libcatch2-defaults-tests";
    host_supported = true;
    srcs = [
        "projects/SelfTest/TestMain.cpp"
        "projects/SelfTest/CompileTimePerfTests/10.tests.cpp"
        "projects/SelfTest/CompileTimePerfTests/100.tests.cpp"
        "projects/SelfTest/CompileTimePerfTests/All.tests.cpp"
        "projects/SelfTest/IntrospectiveTests/CmdLine.tests.cpp"
        "projects/SelfTest/IntrospectiveTests/GeneratorsImpl.tests.cpp"
        "projects/SelfTest/IntrospectiveTests/PartTracker.tests.cpp"
        "projects/SelfTest/IntrospectiveTests/String.tests.cpp"
        "projects/SelfTest/IntrospectiveTests/TagAlias.tests.cpp"
        "projects/SelfTest/IntrospectiveTests/Xml.tests.cpp"
        "projects/SelfTest/SurrogateCpps/catch_console_colour.cpp"
        "projects/SelfTest/SurrogateCpps/catch_debugger.cpp"
        "projects/SelfTest/SurrogateCpps/catch_interfaces_reporter.cpp"
        "projects/SelfTest/SurrogateCpps/catch_option.cpp"
        "projects/SelfTest/SurrogateCpps/catch_stream.cpp"
        "projects/SelfTest/SurrogateCpps/catch_test_case_tracker.cpp"
        "projects/SelfTest/SurrogateCpps/catch_test_spec.cpp"
        "projects/SelfTest/SurrogateCpps/catch_xmlwriter.cpp"
        "projects/SelfTest/UsageTests/Approx.tests.cpp"
        "projects/SelfTest/UsageTests/BDD.tests.cpp"
        "projects/SelfTest/UsageTests/Benchmark.tests.cpp"
        "projects/SelfTest/UsageTests/Class.tests.cpp"
        "projects/SelfTest/UsageTests/Compilation.tests.cpp"
        "projects/SelfTest/UsageTests/Condition.tests.cpp"
        "projects/SelfTest/UsageTests/Decomposition.tests.cpp"
        "projects/SelfTest/UsageTests/EnumToString.tests.cpp"
        "projects/SelfTest/UsageTests/Exception.tests.cpp"
        "projects/SelfTest/UsageTests/Generators.tests.cpp"
        "projects/SelfTest/UsageTests/Matchers.tests.cpp"
        "projects/SelfTest/UsageTests/Message.tests.cpp"
        "projects/SelfTest/UsageTests/Misc.tests.cpp"
        "projects/SelfTest/UsageTests/ToStringChrono.tests.cpp"
        "projects/SelfTest/UsageTests/ToStringGeneral.tests.cpp"
        "projects/SelfTest/UsageTests/ToStringOptional.tests.cpp"
        "projects/SelfTest/UsageTests/ToStringPair.tests.cpp"
        "projects/SelfTest/UsageTests/ToStringTuple.tests.cpp"
        "projects/SelfTest/UsageTests/ToStringVariant.tests.cpp"
        "projects/SelfTest/UsageTests/ToStringVector.tests.cpp"
        "projects/SelfTest/UsageTests/ToStringWhich.tests.cpp"
        "projects/SelfTest/UsageTests/Tricky.tests.cpp"
        "projects/SelfTest/UsageTests/VariadicMacros.tests.cpp"
    ];
    #  This directory just re-includes existing tests 100x over.
    #  This is extremely slow to build, we don't lose coverage by excluding it.
    exclude_srcs = [
        "projects/SelfTest/CompileTimePerfTests/10.tests.cpp"
        "projects/SelfTest/CompileTimePerfTests/100.tests.cpp"
        "projects/SelfTest/CompileTimePerfTests/All.tests.cpp"
    ];
};

#  Upstream config: Exceptions are enabled.
#  This should be validated first after an upstream merge.
libcatch2-tests-upstream = cc_test {
    name = "libcatch2-tests-upstream";
    defaults = [
        "libcatch2-defaults-tests"
    ];

    gtest = false;
    cflags = ["-fexceptions"];

    whole_static_libs = [
        "libcatch2-upstream"
    ];
};

#  Android config: Exceptions are disabled.
#  This should be validated second after an upstream merge.
libcatch2-tests = cc_test {
    name = "libcatch2-tests";
    defaults = [
        "libcatch2-defaults-tests"
    ];
    cflags = [
        "-DCATCH_CONFIG_DISABLE_EXCEPTIONS"
        "-Wno-unused-function"
    ];
    gtest = false;
    whole_static_libs = [
        "libcatch2"
    ];
};

in { inherit libcatch2 libcatch2-defaults libcatch2-defaults-tests libcatch2-main libcatch2-tests libcatch2-tests-upstream libcatch2-upstream; }
