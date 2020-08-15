{ cc_defaults, cc_library_headers, cc_test }:
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

librxcpp = cc_library_headers {
    name = "librxcpp";
    host_supported = true;
    export_include_dirs = ["Rx/v2/src"];
};

librxcpp-tests-defaults = cc_defaults {
    name = "librxcpp-tests-defaults";
    host_supported = true;
    srcs = [
        "Rx/v2/test/test.cpp"
        "Rx/v2/test/operators/all.cpp"
        "Rx/v2/test/operators/amb.cpp"
        "Rx/v2/test/operators/amb_variadic.cpp"
        "Rx/v2/test/operators/any.cpp"
        "Rx/v2/test/operators/buffer.cpp"
        "Rx/v2/test/operators/combine_latest.cpp"
        "Rx/v2/test/operators/concat.cpp"
        "Rx/v2/test/operators/concat_map.cpp"
        "Rx/v2/test/operators/contains.cpp"
        "Rx/v2/test/operators/debounce.cpp"
        "Rx/v2/test/operators/default_if_empty.cpp"
        "Rx/v2/test/operators/delay.cpp"
        "Rx/v2/test/operators/distinct.cpp"
        "Rx/v2/test/operators/distinct_until_changed.cpp"
        "Rx/v2/test/operators/element_at.cpp"
        "Rx/v2/test/operators/exists.cpp"
        "Rx/v2/test/operators/filter.cpp"
        "Rx/v2/test/operators/finally.cpp"
        "Rx/v2/test/operators/flat_map.cpp"
        "Rx/v2/test/operators/group_by.cpp"
        "Rx/v2/test/operators/ignore_elements.cpp"
        "Rx/v2/test/operators/is_empty.cpp"
        "Rx/v2/test/operators/lift.cpp"
        "Rx/v2/test/operators/map.cpp"
        "Rx/v2/test/operators/merge.cpp"
        "Rx/v2/test/operators/merge_delay_error.cpp"
        "Rx/v2/test/operators/observe_on.cpp"
        "Rx/v2/test/operators/on_error_resume_next.cpp"
        "Rx/v2/test/operators/pairwise.cpp"
        "Rx/v2/test/operators/publish.cpp"
        "Rx/v2/test/operators/reduce.cpp"
        "Rx/v2/test/operators/repeat.cpp"
        "Rx/v2/test/operators/replay.cpp"
        "Rx/v2/test/operators/retry.cpp"
        "Rx/v2/test/operators/sample.cpp"
        "Rx/v2/test/operators/scan.cpp"
        "Rx/v2/test/operators/sequence_equal.cpp"
        "Rx/v2/test/operators/skip.cpp"
        "Rx/v2/test/operators/skip_last.cpp"
        "Rx/v2/test/operators/skip_until.cpp"
        "Rx/v2/test/operators/skip_while.cpp"
        "Rx/v2/test/operators/start_with.cpp"
        "Rx/v2/test/operators/subscribe_on.cpp"
        "Rx/v2/test/operators/switch_if_empty.cpp"
        "Rx/v2/test/operators/switch_on_next.cpp"
        "Rx/v2/test/operators/take.cpp"
        "Rx/v2/test/operators/take_last.cpp"
        "Rx/v2/test/operators/take_until.cpp"
        "Rx/v2/test/operators/take_while.cpp"
        "Rx/v2/test/operators/tap.cpp"
        "Rx/v2/test/operators/time_interval.cpp"
        "Rx/v2/test/operators/timeout.cpp"
        "Rx/v2/test/operators/timestamp.cpp"
        "Rx/v2/test/operators/window.cpp"
        "Rx/v2/test/operators/window_toggle.cpp"
        "Rx/v2/test/operators/with_latest_from.cpp"
        "Rx/v2/test/operators/zip.cpp"
        "Rx/v2/test/sources/create.cpp"
        "Rx/v2/test/sources/defer.cpp"
        "Rx/v2/test/sources/empty.cpp"
        "Rx/v2/test/sources/interval.cpp"
        "Rx/v2/test/sources/scope.cpp"
        "Rx/v2/test/sources/timer.cpp"
        "Rx/v2/test/subjects/subject.cpp"
        "Rx/v2/test/subscriptions/coroutine.cpp"
        "Rx/v2/test/subscriptions/observer.cpp"
        "Rx/v2/test/subscriptions/subscription.cpp"
    ];
    header_libs = ["librxcpp"];
    gtest = false;
};

librxcpp-tests-upstream = cc_test {
    #  "Upstream" config. Use exceptions.
    #  Ensure that if we update from upstream later that the merged code
    #  is still working on Android.
    name = "librxcpp-tests-upstream";
    defaults = ["librxcpp-tests-defaults"];
    whole_static_libs = ["libcatch2-upstream"];
    #  Allow exceptions for all the use of try/catch/throw in rxcpp.
    cflags = ["-fexceptions"];
};

librxcpp-tests = cc_test {
    #  "AOSP" config. Disable exceptions.
    #  Anything in AOSP using librxcpp will use it as this config, so
    #  that's what we really care about testing.
    name = "librxcpp-tests";
    defaults = ["librxcpp-tests-defaults"];
    whole_static_libs = ["libcatch2"];
};

in { inherit librxcpp librxcpp-tests librxcpp-tests-defaults librxcpp-tests-upstream; }
