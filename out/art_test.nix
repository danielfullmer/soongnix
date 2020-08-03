{ art_cc_defaults, art_cc_library, art_cc_test_library, cc_defaults, cc_library_static, filegroup, java_genrule }:
let

#
#  Copyright (C) 2016 The Android Open Source Project
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
#

art_test_defaults = art_cc_defaults {
    name = "art_test_defaults";
    host_supported = true;
    target = {
        android_arm = {
            relative_install_path = "art/arm";
        };
        android_arm64 = {
            relative_install_path = "art/arm64";
        };
        android_mips = {
            relative_install_path = "art/mips";
        };
        android_mips64 = {
            relative_install_path = "art/mips64";
        };
        android_x86 = {
            relative_install_path = "art/x86";
        };
        android_x86_64 = {
            relative_install_path = "art/x86_64";
        };
        darwin = {
            enabled = false;
        };
    };
    cflags = [
        "-Wno-frame-larger-than="
    ];
};

art_gtest_defaults = art_cc_defaults {
    name = "art_gtest_defaults";
    test_per_src = true;
    #  These really are gtests, but the gtest library comes from libart-gtest.so
    gtest = false;
    defaults = [
        "art_test_defaults"
        "art_debug_defaults"
        "art_defaults"
    ];

    shared_libs = [
        "libartd"
        "libartd-disassembler"
        "libvixld"
        "libart-gtest"
        "libdexfiled"
        "libprofiled"
        "libartbased"

        "libbase"
        "libicuuc"
        "libicui18n"
        "libnativehelper"
        "libz"
    ];
    whole_static_libs = [
        "libsigchain"
    ];

    target = {
        linux = {
            ldflags = [
                #  Allow jni_compiler_test to find Java_MyClassNatives_bar
                #  within itself using dlopen(NULL, ...).
                #  Mac OS linker doesn't understand --export-dynamic.
                "-Wl,--export-dynamic"
                "-Wl,-u,Java_MyClassNatives_bar"
                "-Wl,-u,Java_MyClassNatives_sbar"
            ];
            cflags = [
                #  gtest issue
                "-Wno-used-but-marked-unused"
                "-Wno-deprecated"
                "-Wno-missing-noreturn"
            ];
        };
        host = {
            shared_libs = [
                "libziparchive"
            ];
        };
        android = {
            shared_libs = [
                "liblog"
            ];
        };
    };
};

libart-gtest-defaults = art_cc_defaults {
    name = "libart-gtest-defaults";
    host_supported = true;
    defaults = [
        "art_debug_defaults"
        "art_defaults"
    ];
    shared_libs = [
        "libartd"
        "libartd-compiler"
        "libdexfiled"
        "libprofiled"
        "libartbased"
    ];
    static_libs = [
        "libgtest"
    ];
    target = {
        android32 = {
            cflags = ["-DART_TARGET_NATIVETEST_DIR=/data/nativetest/art"];
        };
        android64 = {
            cflags = ["-DART_TARGET_NATIVETEST_DIR=/data/nativetest64/art"];
        };
        linux = {
            cflags = [
                #  gtest issue
                "-Wno-used-but-marked-unused"
                "-Wno-deprecated"
                "-Wno-missing-noreturn"
            ];
        };
        darwin = {
            enabled = false;
        };
    };
};

libart-gtest = art_cc_library {
    name = "libart-gtest";
    host_supported = true;
    whole_static_libs = [
        "libart-compiler-gtest"
        "libart-runtime-gtest"
        "libartbase-art-gtest"
        "libgtest"
    ];
    shared_libs = [
        "libartd"
        "libartd-compiler"
        "libdexfiled"
        "libprofiled"
        "libartbased"
        "libbase"
        "libbacktrace"
    ];
    target = {
        darwin = {
            enabled = false;
        };
    };
};

libartagent-defaults = cc_defaults {
    name = "libartagent-defaults";
    defaults = [
        "art_test_defaults"
        "art_defaults"
    ];
    shared_libs = [
        "libbacktrace"
        "libbase"
        "libnativehelper"
    ];
};

libartagent = art_cc_test_library {
    name = "libartagent";
    srcs = ["900-hello-plugin/load_unload.cc"];
    defaults = ["libartagent-defaults"];
    shared_libs = [
        "libart"
        "libdexfile"
        "libprofile"
        "libartbase"
    ];
};

libartagentd = art_cc_test_library {
    name = "libartagentd";
    srcs = ["900-hello-plugin/load_unload.cc"];
    defaults = [
        "art_debug_defaults"
        "libartagent-defaults"
    ];
    shared_libs = [
        "libartd"
        "libdexfiled"
        "libprofiled"
        "libartbased"
    ];
};

libtiagent-base-defaults = art_cc_defaults {
    name = "libtiagent-base-defaults";
    defaults = [
        "art_test_defaults"
        "art_defaults"
        #  Not derived from libartagent-defaults for NDK.
    ];
    srcs = [
        #  These are the ART-independent parts.
        "ti-agent/agent_common.cc"
        "ti-agent/agent_startup.cc"
        "ti-agent/jni_binder.cc"
        "ti-agent/jvmti_helper.cc"
        "ti-agent/test_env.cc"
        "ti-agent/breakpoint_helper.cc"
        "ti-agent/common_helper.cc"
        "ti-agent/frame_pop_helper.cc"
        "ti-agent/locals_helper.cc"
        "ti-agent/monitors_helper.cc"
        "ti-agent/redefinition_helper.cc"
        "ti-agent/suspension_helper.cc"
        "ti-agent/stack_trace_helper.cc"
        "ti-agent/threads_helper.cc"
        "ti-agent/trace_helper.cc"
        "ti-agent/exceptions_helper.cc"
        #  This is the list of non-special OnLoad things and excludes BCI and anything that depends
        #  on ART internals.
        "903-hello-tagging/tagging.cc"
        "904-object-allocation/tracking.cc"
        "905-object-free/tracking_free.cc"
        "906-iterate-heap/iterate_heap.cc"
        "907-get-loaded-classes/get_loaded_classes.cc"
        "908-gc-start-finish/gc_callbacks.cc"
        "910-methods/methods.cc"
        "911-get-stack-trace/stack_trace.cc"
        "912-classes/classes.cc"
        "913-heaps/heaps.cc"
        "918-fields/fields.cc"
        "920-objects/objects.cc"
        "922-properties/properties.cc"
        "923-monitors/monitors.cc"
        "924-threads/threads.cc"
        "925-threadgroups/threadgroups.cc"
        "927-timers/timers.cc"
        "928-jni-table/jni_table.cc"
        "929-search/search.cc"
        "931-agent-thread/agent_thread.cc"
        "933-misc-events/misc_events.cc"
        "945-obsolete-native/obsolete_native.cc"
        "983-source-transform-verify/source_transform.cc"
        "984-obsolete-invoke/obsolete_invoke.cc"
        "986-native-method-bind/native_bind.cc"
        "987-agent-bind/agent_bind.cc"
        "988-method-trace/trace_fib.cc"
        "989-method-trace-throw/method_trace.cc"
        "991-field-trace-2/field_trace.cc"
        "992-source-data/source_file.cc"
        "993-breakpoints/breakpoints.cc"
        "996-breakpoint-obsolete/obsolete_breakpoints.cc"
        "1900-track-alloc/alloc.cc"
        "1901-get-bytecodes/bytecodes.cc"
        "1905-suspend-native/native_suspend.cc"
        "1908-suspend-native-resume-self/native_suspend_resume.cc"
        "1909-per-agent-tls/agent_tls.cc"
        "1914-get-local-instance/local_instance.cc"
        "1919-vminit-thread-start-timing/vminit.cc"
        "1920-suspend-native-monitor/native_suspend_monitor.cc"
        "1921-suspend-native-recursive-monitor/native_suspend_recursive_monitor.cc"
        "1922-owned-monitors-info/owned_monitors.cc"
        "1924-frame-pop-toggle/frame_pop_toggle.cc"
        "1926-missed-frame-pop/frame_pop_missed.cc"
        "1927-exception-event/exception_event.cc"
        "1930-monitor-info/monitor.cc"
        "1932-monitor-events-misc/monitor_misc.cc"
        "1934-jvmti-signal-thread/signal_threads.cc"
        "1939-proxy-frames/local_instance.cc"
        "1941-dispose-stress/dispose_stress.cc"
        "1942-suspend-raw-monitor-exit/native_suspend_monitor.cc"
        "1943-suspend-raw-monitor-wait/native_suspend_monitor.cc"
        "1946-list-descriptors/descriptors.cc"
        "1950-unprepared-transform/unprepared_transform.cc"
        "1951-monitor-enter-no-suspend/raw_monitor.cc"
        "1953-pop-frame/pop_frame.cc"
        "1957-error-ext/lasterror.cc"
        "1962-multi-thread-events/multi_thread_events.cc"
    ];
    #  Use NDK-compatible headers for ctstiagent.
    header_libs = [
        "libopenjdkjvmti_headers"
    ];
    include_dirs = ["art/test/ti-agent"];
};

libtiagent-defaults = art_cc_defaults {
    name = "libtiagent-defaults";
    defaults = [
        "libtiagent-base-defaults"
        "libartagent-defaults"
    ];
    srcs = [
        #  This is to get the IsInterpreted native method.
        "common/stack_inspect.cc"
        "common/runtime_state.cc"
        "ti-agent/common_load.cc"
        #  This includes the remaining test functions. We should try to refactor things to
        #  make this list smaller.
        "901-hello-ti-agent/basics.cc"
        "909-attach-agent/attach.cc"
        "912-classes/classes_art.cc"
        "936-search-onload/search_onload.cc"
        "980-redefine-object/redef_object.cc"
        "983-source-transform-verify/source_transform_art.cc"
        "1940-ddms-ext/ddm_ext.cc"
        "1944-sudden-exit/sudden_exit.cc"
        #  "1952-pop-frame-jit/pop_frame.cc",
        "1959-redefine-object-instrument/fake_redef_object.cc"
        "1960-obsolete-jit-multithread-native/native_say_hi.cc"
    ];
    static_libs = [
        "libz"
        "slicer_no_rtti"
    ];
};

libtiagent = art_cc_test_library {
    name = "libtiagent";
    defaults = ["libtiagent-defaults"];
    shared_libs = [
        "libart"
        "libdexfile"
        "libprofile"
        "libartbase"
    ];
};

libtiagentd = art_cc_test_library {
    name = "libtiagentd";
    defaults = [
        "art_debug_defaults"
        "libtiagent-defaults"
    ];
    shared_libs = [
        "libartd"
        "libdexfiled"
        "libprofiled"
        "libartbased"
    ];
};

libctstiagent = cc_library_static {
    name = "libctstiagent";
    defaults = ["libtiagent-base-defaults"];
    host_supported = false;
    srcs = [
        "983-source-transform-verify/source_transform_slicer.cc"
    ];
    whole_static_libs = [
        "slicer_ndk_no_rtti"
    ];
    static_libs = [
        "libbase_ndk"
    ];
    shared_libs = [
        "libz" #  for slicer (using adler32).
    ];
    sdk_version = "current";
    stl = "c++_static";
    include_dirs = [
        #  This is needed to resolve the base/ header file in libdexfile. Unfortunately there are
        #  many problems with how we export headers that are making doing this the 'right' way
        #  difficult.
        #  TODO: move those headers to art/ rather than under runtime.
        "art/runtime"
        #  NDK headers aren't available in platform NDK builds.
        "libnativehelper/include_jni"
    ];
    export_include_dirs = ["ti-agent"];
};

libtistress-srcs = art_cc_defaults {
    name = "libtistress-srcs";
    defaults = ["libartagent-defaults"];
    srcs = [
        "ti-stress/stress.cc"
    ];
    header_libs = ["libopenjdkjvmti_headers"];
};

libtistress-defaults = art_cc_defaults {
    name = "libtistress-defaults";
    defaults = ["libtistress-srcs"];
    shared_libs = [
        "libbase"
        "slicer_no_rtti"
    ];
};

libtistress = art_cc_test_library {
    name = "libtistress";
    defaults = ["libtistress-defaults"];
    shared_libs = ["libartbase"];
};

libtistressd = art_cc_test_library {
    name = "libtistressd";
    defaults = [
        "art_debug_defaults"
        "libtistress-defaults"
    ];
    shared_libs = ["libartbased"];
};

libtistress-static-defaults = art_cc_defaults {
    name = "libtistress-static-defaults";
    defaults = [
        "libtistress-srcs"
        "libart_static_defaults"
    ];
    static_libs = ["slicer_no_rtti"];
};

libtistresss = art_cc_test_library {
    name = "libtistresss";
    defaults = ["libtistress-static-defaults"];
    static_libs = ["libartbase"];
};

libtistressds = art_cc_test_library {
    name = "libtistressds";
    defaults = [
        "art_debug_defaults"
        "libtistress-static-defaults"
    ];
    static_libs = ["libartbased"];
};

libarttest-defaults = cc_defaults {
    name = "libarttest-defaults";
    defaults = [
        "art_test_defaults"
        "art_defaults"
    ];
    srcs = [
        "004-JniTest/jni_test.cc"
        "004-ReferenceMap/stack_walk_refmap_jni.cc"
        "004-SignalTest/signaltest.cc"
        "004-StackWalk/stack_walk_jni.cc"
        "004-ThreadStress/thread_stress.cc"
        "004-UnsafeTest/unsafe_test.cc"
        "044-proxy/native_proxy.cc"
        "051-thread/thread_test.cc"
        "1337-gc-coverage/gc_coverage.cc"
        "136-daemon-jni-shutdown/daemon_jni_shutdown.cc"
        "137-cfi/cfi.cc"
        "139-register-natives/regnative.cc"
        "141-class-unload/jni_unload.cc"
        "148-multithread-gc-annotations/gc_coverage.cc"
        "149-suspend-all-stress/suspend_all.cc"
        "154-gc-loop/heap_interface.cc"
        "167-visit-locks/visit_locks.cc"
        "169-threadgroup-jni/jni_daemon_thread.cc"
        "172-app-image-twice/debug_print_class.cc"
        "1945-proxy-method-arguments/get_args.cc"
        "203-multi-checkpoint/multi_checkpoint.cc"
        "305-other-fault-handler/fault_handler.cc"
        "454-get-vreg/get_vreg_jni.cc"
        "457-regs/regs_jni.cc"
        "461-get-reference-vreg/get_reference_vreg_jni.cc"
        "466-get-live-vreg/get_live_vreg_jni.cc"
        "497-inlining-and-class-loader/clear_dex_cache.cc"
        "543-env-long-ref/env_long_ref.cc"
        "566-polymorphic-inlining/polymorphic_inline.cc"
        "570-checker-osr/osr.cc"
        "595-profile-saving/profile-saving.cc"
        "596-app-images/app_images.cc"
        "596-monitor-inflation/monitor_inflation.cc"
        "597-deopt-new-string/deopt.cc"
        "616-cha-unloading/cha_unload.cc"
        "626-const-class-linking/clear_dex_cache_types.cc"
        "642-fp-callees/fp_callees.cc"
        "647-jni-get-field-id/get_field_id.cc"
        "656-annotation-lookup-generic-jni/test.cc"
        "661-oat-writer-layout/oat_writer_layout.cc"
        "664-aget-verifier/aget-verifier.cc"
        "667-jit-jni-stub/jit_jni_stub_test.cc"
        "674-hiddenapi/hiddenapi.cc"
        "692-vdex-inmem-loader/vdex_inmem_loader.cc"
        "708-jit-cache-churn/jit.cc"
        "720-thread-priority/thread_priority.cc"
        "800-smali/jni.cc"
        "909-attach-agent/disallow_debugging.cc"
        "1001-app-image-regions/app_image_regions.cc"
        "1002-notify-startup/startup_interface.cc"
        "1947-breakpoint-redefine-deopt/check_deopt.cc"
        "common/runtime_state.cc"
        "common/stack_inspect.cc"
    ];
    shared_libs = [
        "libbacktrace"
        "libbase"
        "libnativehelper"
    ];
};

libarttest = art_cc_test_library {
    name = "libarttest";
    defaults = ["libarttest-defaults"];
    shared_libs = [
        "libart"
        "libdexfile"
        "libprofile"
        "libartbase"
    ];
};

libarttestd = art_cc_test_library {
    name = "libarttestd";
    defaults = [
        "art_debug_defaults"
        "libarttest-defaults"
    ];
    shared_libs = [
        "libartd"
        "libdexfiled"
        "libprofiled"
        "libartbased"
    ];
};

libnativebridgetest = art_cc_test_library {
    name = "libnativebridgetest";
    shared_libs = ["libart"];
    defaults = [
        "art_test_defaults"
        "art_debug_defaults"
        "art_defaults"
    ];
    header_libs = ["libnativebridge-headers"];
    srcs = ["115-native-bridge/nativebridge.cc"];
};

art_cts_jvmti_test_library = filegroup {
    name = "art_cts_jvmti_test_library";
    srcs = [
        #  shim classes. We use one that exposes the common functionality.
        "902-hello-transformation/src/art/Redefinition.java"
        "903-hello-tagging/src/art/Main.java"
        "989-method-trace-throw/src/art/Trace.java"
        "993-breakpoints/src/art/Breakpoint.java"
        "1902-suspend/src/art/Suspension.java"
        "1911-get-local-var-table/src/art/Locals.java"
        "1912-get-set-local-primitive/src/art/StackTrace.java"
        "1923-frame-pop/src/art/FramePop.java"
        "1927-exception-event/src/art/Exceptions.java"
        "1930-monitor-info/src/art/Monitors.java"
        "1934-jvmti-signal-thread/src/art/Threads.java"

        #  Actual test classes.
        "901-hello-ti-agent/src/art/Test901.java"
        "902-hello-transformation/src/art/Test902.java"
        "903-hello-tagging/src/art/Test903.java"
        "904-object-allocation/src/art/Test904.java"
        "905-object-free/src/art/Test905.java"
        "906-iterate-heap/src/art/Test906.java"
        "907-get-loaded-classes/src/art/Test907.java"
        "907-get-loaded-classes/src/art/Cerr.java"
        "908-gc-start-finish/src/art/Test908.java"
        "910-methods/src/art/Test910.java"
        "911-get-stack-trace/src/art/Test911.java"
        "911-get-stack-trace/src/art/AllTraces.java"
        "911-get-stack-trace/src/art/ControlData.java"
        "911-get-stack-trace/src/art/Frames.java"
        "911-get-stack-trace/src/art/OtherThread.java"
        "911-get-stack-trace/src/art/PrintThread.java"
        "911-get-stack-trace/src/art/Recurse.java"
        "911-get-stack-trace/src/art/SameThread.java"
        "911-get-stack-trace/src/art/ThreadListTraces.java"
        "912-classes/src-art/art/Test912.java"
        "912-classes/src-art/art/DexData.java"
        "913-heaps/src/art/Test913.java"
        "914-hello-obsolescence/src/art/Test914.java"
        "915-obsolete-2/src/art/Test915.java"
        "917-fields-transformation/src/art/Test917.java"
        "918-fields/src/art/Test918.java"
        "919-obsolete-fields/src/art/Test919.java"
        "920-objects/src/art/Test920.java"
        "922-properties/src/art/Test922.java"
        "923-monitors/src/art/Test923.java"
        "924-threads/src/art/Test924.java"
        "925-threadgroups/src/art/Test925.java"
        "926-multi-obsolescence/src/art/Test926.java"
        "927-timers/src/art/Test927.java"
        "928-jni-table/src/art/Test928.java"
        "930-hello-retransform/src/art/Test930.java"
        "931-agent-thread/src/art/Test931.java"
        "932-transform-saves/src/art/Test932.java"
        "933-misc-events/src/art/Test933.java"
        "940-recursive-obsolete/src/art/Test940.java"
        "942-private-recursive/src/art/Test942.java"
        "944-transform-classloaders/src/art/Test944.java"
        "945-obsolete-native/src/art/Test945.java"
        "947-reflect-method/src/art/Test947.java"
        "951-threaded-obsolete/src/art/Test951.java"
        "982-ok-no-retransform/src/art/Test982.java"
        "983-source-transform-verify/src/art/Test983.java"
        "984-obsolete-invoke/src/art/Test984.java"
        "985-re-obsolete/src/art/Test985.java"
        "986-native-method-bind/src/art/Test986.java"
        "988-method-trace/src/art/Test988.java"
        "988-method-trace/src/art/Test988Intrinsics.java"
        "989-method-trace-throw/src/art/Test989.java"
        "990-field-trace/src/art/Test990.java"
        "991-field-trace-2/src/art/Test991.java"
        "992-source-data/src/art/Test992.java"
        "992-source-data/src/art/Target2.java"
        "993-breakpoints/src/art/Test993.java"
        "994-breakpoint-line/src/art/Test994.java"
        "995-breakpoints-throw/src/art/Test995.java"
        "996-breakpoint-obsolete/src/art/Test996.java"
        "997-single-step/src/art/Test997.java"
        "1900-track-alloc/src/art/Test1900.java"
        "1901-get-bytecodes/src/art/Test1901.java"
        "1902-suspend/src/art/Test1902.java"
        "1903-suspend-self/src/art/Test1903.java"
        "1904-double-suspend/src/art/Test1904.java"
        "1906-suspend-list-me-first/src/art/Test1906.java"
        "1907-suspend-list-self-twice/src/art/Test1907.java"
        "1908-suspend-native-resume-self/src/art/Test1908.java"
        "1909-per-agent-tls/src/art/Test1909.java"
        "1910-transform-with-default/src/art/Test1910.java"
        "1911-get-local-var-table/src/art/Test1911.java"
        "1912-get-set-local-primitive/src/art/Test1912.java"
        "1913-get-set-local-objects/src/art/Test1913.java"
        "1914-get-local-instance/src/art/Test1914.java"
        "1915-get-set-local-current-thread/src/art/Test1915.java"
        "1916-get-set-current-frame/src/art/Test1916.java"
        "1917-get-stack-frame/src/art/Test1917.java"
        "1920-suspend-native-monitor/src/art/Test1920.java"
        "1921-suspend-native-recursive-monitor/src/art/Test1921.java"
        "1922-owned-monitors-info/src/art/Test1922.java"
        "1923-frame-pop/src/art/Test1923.java"
        "1924-frame-pop-toggle/src/art/Test1924.java"
        "1925-self-frame-pop/src/art/Test1925.java"
        "1926-missed-frame-pop/src/art/Test1926.java"
        "1927-exception-event/src/art/Test1927.java"
        "1928-exception-event-exception/src/art/Test1928.java"
        "1930-monitor-info/src/art/Test1930.java"
        "1931-monitor-events/src/art/Test1931.java"
        "1932-monitor-events-misc/src/art/Test1932.java"
        "1933-monitor-current-contended/src/art/Test1933.java"
        "1934-jvmti-signal-thread/src/art/Test1934.java"
        "1936-thread-end-events/src/art/Test1936.java"
        "1937-transform-soft-fail/src/art/Test1937.java"
        "1939-proxy-frames/src/art/Test1939.java"
        "1941-dispose-stress/src/art/Test1941.java"
        "1942-suspend-raw-monitor-exit/src/art/Test1942.java"
        "1943-suspend-raw-monitor-wait/src/art/Test1943.java"
        "1953-pop-frame/src/art/Test1953.java"
        "1958-transform-try-jit/src/art/Test1958.java"
        "1962-multi-thread-events/src/art/Test1962.java"
    ];
};

#  CTS test runner in cts/hostsidetests/jvmti looks for an expected test
#  result for the test NN in the file results.NN.expected.txt while in the
#  source tree each expected test result is in the NN-xxxx/expected.txt.
#  Copy+rename them them to a temporary directory and them zip them.
expected_cts_outputs = java_genrule {
    name = "expected_cts_outputs";
    srcs = [
        "901-hello-ti-agent/expected.txt"
        "902-hello-transformation/expected.txt"
        "903-hello-tagging/expected.txt"
        "904-object-allocation/expected.txt"
        "905-object-free/expected.txt"
        "906-iterate-heap/expected.txt"
        "907-get-loaded-classes/expected.txt"
        "908-gc-start-finish/expected.txt"
        "910-methods/expected.txt"
        "911-get-stack-trace/expected.txt"
        "912-classes/expected.txt"
        "913-heaps/expected.txt"
        "914-hello-obsolescence/expected.txt"
        "915-obsolete-2/expected.txt"
        "917-fields-transformation/expected.txt"
        "918-fields/expected.txt"
        "919-obsolete-fields/expected.txt"
        "920-objects/expected.txt"
        "922-properties/expected.txt"
        "923-monitors/expected.txt"
        "924-threads/expected.txt"
        "925-threadgroups/expected.txt"
        "926-multi-obsolescence/expected.txt"
        "927-timers/expected.txt"
        "928-jni-table/expected.txt"
        "930-hello-retransform/expected.txt"
        "931-agent-thread/expected.txt"
        "932-transform-saves/expected.txt"
        "933-misc-events/expected.txt"
        "940-recursive-obsolete/expected.txt"
        "942-private-recursive/expected.txt"
        "944-transform-classloaders/expected.txt"
        "945-obsolete-native/expected.txt"
        "947-reflect-method/expected.txt"
        "951-threaded-obsolete/expected.txt"
        "982-ok-no-retransform/expected.txt"
        "983-source-transform-verify/expected.txt"
        "984-obsolete-invoke/expected.txt"
        "985-re-obsolete/expected.txt"
        "986-native-method-bind/expected.txt"
        "988-method-trace/expected.txt"
        "989-method-trace-throw/expected.txt"
        "990-field-trace/expected.txt"
        "991-field-trace-2/expected.txt"
        "992-source-data/expected.txt"
        "993-breakpoints/expected.txt"
        "994-breakpoint-line/expected.txt"
        "995-breakpoints-throw/expected.txt"
        "996-breakpoint-obsolete/expected.txt"
        "997-single-step/expected.txt"
        "1900-track-alloc/expected.txt"
        "1901-get-bytecodes/expected.txt"
        "1902-suspend/expected.txt"
        "1903-suspend-self/expected.txt"
        "1904-double-suspend/expected.txt"
        "1906-suspend-list-me-first/expected.txt"
        "1907-suspend-list-self-twice/expected.txt"
        "1908-suspend-native-resume-self/expected.txt"
        "1909-per-agent-tls/expected.txt"
        "1910-transform-with-default/expected.txt"
        "1911-get-local-var-table/expected.txt"
        "1912-get-set-local-primitive/expected.txt"
        "1913-get-set-local-objects/expected.txt"
        "1914-get-local-instance/expected.txt"
        "1915-get-set-local-current-thread/expected.txt"
        "1916-get-set-current-frame/expected.txt"
        "1917-get-stack-frame/expected.txt"
        "1920-suspend-native-monitor/expected.txt"
        "1921-suspend-native-recursive-monitor/expected.txt"
        "1922-owned-monitors-info/expected.txt"
        "1923-frame-pop/expected.txt"
        "1924-frame-pop-toggle/expected.txt"
        "1925-self-frame-pop/expected.txt"
        "1926-missed-frame-pop/expected.txt"
        "1927-exception-event/expected.txt"
        "1928-exception-event-exception/expected.txt"
        "1930-monitor-info/expected.txt"
        "1931-monitor-events/expected.txt"
        "1932-monitor-events-misc/expected.txt"
        "1933-monitor-current-contended/expected.txt"
        "1934-jvmti-signal-thread/expected.txt"
        "1936-thread-end-events/expected.txt"
        "1937-transform-soft-fail/expected.txt"
        "1939-proxy-frames/expected.txt"
        "1941-dispose-stress/expected.txt"
        "1942-suspend-raw-monitor-exit/expected.txt"
        "1943-suspend-raw-monitor-wait/expected.txt"
        "1953-pop-frame/expected.txt"
        "1958-transform-try-jit/expected.txt"
    ];
    out = ["expected_cts_outputs.jar"];
    tools = ["soong_zip"];
    cmd = "rm -rf $(genDir)/res && mkdir -p $(genDir)/res && " +
        "for f in $(in); do x=$${f#art/test/}; " +
        "cp $$f $(genDir)/res/results.$${x%%-*}.expected.txt; done && " +
        "$(location soong_zip) -o $(out) -C $(genDir)/res -D $(genDir)/res";
};

in { inherit art_cts_jvmti_test_library art_gtest_defaults art_test_defaults expected_cts_outputs libart-gtest libart-gtest-defaults libartagent libartagent-defaults libartagentd libarttest libarttest-defaults libarttestd libctstiagent libnativebridgetest libtiagent libtiagent-base-defaults libtiagent-defaults libtiagentd libtistress libtistress-defaults libtistress-srcs libtistress-static-defaults libtistressd libtistressds libtistresss; }
