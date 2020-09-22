{ art_cc_defaults, art_cc_library, art_cc_test_library, cc_defaults, cc_library_static, filegroup, genrule, genrule_defaults, java_defaults, java_genrule, java_library }:
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

#  ART gtests.

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
    apex_available = [
        "com.android.art.debug"
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
    apex_available = [
        "com.android.art.debug"
    ];
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
    apex_available = [
        "com.android.art.debug"
    ];
};

#  ART run-tests.

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

libnativebridgetest-defaults = art_cc_defaults {
    name = "libnativebridgetest-defaults";
    defaults = [
        "art_test_defaults"
        "art_defaults"
    ];
    header_libs = ["libnativebridge-headers"];
    srcs = ["115-native-bridge/nativebridge.cc"];
};

libnativebridgetest = art_cc_test_library {
    name = "libnativebridgetest";
    shared_libs = ["libart"];
    defaults = [
        "libnativebridgetest-defaults"
    ];
};

libnativebridgetestd = art_cc_test_library {
    name = "libnativebridgetestd";
    shared_libs = ["libartd"];
    defaults = [
        "libnativebridgetest-defaults"
        "art_debug_defaults"
    ];
};

#  ART JVMTI run-tests.

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
        "ti-agent/early_return_helper.cc"
        "ti-agent/frame_pop_helper.cc"
        "ti-agent/locals_helper.cc"
        "ti-agent/monitors_helper.cc"
        "ti-agent/redefinition_helper.cc"
        "ti-agent/suspension_helper.cc"
        "ti-agent/suspend_event_helper.cc"
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
        #  TODO Renumber
        "1962-multi-thread-events/multi_thread_events.cc"
        "1963-add-to-dex-classloader-in-memory/add_to_loader.cc"
        "1968-force-early-return/force_early_return.cc"
        "1969-force-early-return-void/force_early_return_void.cc"
        "1970-force-early-return-long/force_early_return_long.cc"
        "1974-resize-array/resize_array.cc"
        "1975-hello-structural-transformation/structural_transform.cc"
        "1976-hello-structural-static-methods/structural_transform_methods.cc"
        "2005-pause-all-redefine-multithreaded/pause-all.cc"
        "2009-structural-local-ref/local-ref.cc"
        "2035-structural-native-method/structural-native.cc"
    ];
    #  Use NDK-compatible headers for ctstiagent.
    header_libs = [
        "libopenjdkjvmti_headers"
    ];
    local_include_dirs = ["ti-agent"];
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
        #  "1952-pop-frame-jit/pop_frame.cc",
        "1959-redefine-object-instrument/fake_redef_object.cc"
        "1960-obsolete-jit-multithread-native/native_say_hi.cc"
        "1964-add-to-dex-classloader-file/add_to_loader.cc"
        "1963-add-to-dex-classloader-in-memory/check_memfd_create.cc"
        "2012-structural-redefinition-failures-jni-id/set-jni-id-used.cc"
        "2031-zygote-compiled-frame-deopt/native-wait.cc"
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
    visibility = [
        "//cts/hostsidetests/jvmti:__subpackages__"
    ];
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
    header_libs = [
        "jni_headers"
        #  This is needed to resolve the base/ header file in libdexfile. Unfortunately there are
        #  many problems with how we export headers that are making doing this the 'right' way
        #  difficult.
        #  TODO: move those headers to art/ rather than under runtime.
        "libart_runtime_headers_ndk"
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
        "slicer_no_rtti"
        "libz" #  for slicer (using adler32).
    ];
};

libtistress = art_cc_test_library {
    name = "libtistress";
    defaults = ["libtistress-defaults"];
    shared_libs = [
        "libartbase"
        "libz"
    ];
};

libtistressd = art_cc_test_library {
    name = "libtistressd";
    defaults = [
        "art_debug_defaults"
        "libtistress-defaults"
    ];
    shared_libs = [
        "libartbased"
        "libz"
    ];
};

libtistress-shared-defaults = art_cc_defaults {
    name = "libtistress-shared-defaults";
    defaults = [
        "libtistress-srcs"
    ];
    static_libs = ["slicer_no_rtti"];
};

libtistresss = art_cc_test_library {
    name = "libtistresss";
    defaults = ["libtistress-shared-defaults"];
    shared_libs = [
        "libartbase"
        "libz"
    ];
};

libtistressds = art_cc_test_library {
    name = "libtistressds";
    defaults = [
        "libtistress-shared-defaults"
    ];
    shared_libs = [
        "libartbased"
        "libz"
    ];
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
        "177-visibly-initialized-deadlock/visibly_initialized.cc"
        "178-app-image-native-method/native_methods.cc"
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
        "1972-jni-id-swap-indices/jni_id.cc"
        "1985-structural-redefine-stack-scope/stack_scope.cc"
        "2011-stack-walk-concurrent-instrument/stack_walk_concurrent.cc"
        "2031-zygote-compiled-frame-deopt/native-wait.cc"
        "common/runtime_state.cc"
        "common/stack_inspect.cc"
    ];
    shared_libs = [
        "libbacktrace"
        "libbase"
        "libnativehelper"
    ];
};

art_cts_jvmti_test_library = filegroup {
    name = "art_cts_jvmti_test_library";
    visibility = [
        "//cts/hostsidetests/jvmti:__subpackages__"
    ];
    srcs = [
        #  shim classes. We use one that exposes the common functionality.
        "jvmti-common/Redefinition.java"
        "jvmti-common/Main.java"
        "jvmti-common/Trace.java"
        "jvmti-common/Breakpoint.java"
        "jvmti-common/Suspension.java"
        "jvmti-common/Locals.java"
        "jvmti-common/StackTrace.java"
        "jvmti-common/FramePop.java"
        "jvmti-common/Exceptions.java"
        "jvmti-common/Monitors.java"
        "jvmti-common/NonStandardExit.java"
        "jvmti-common/Threads.java"
        "jvmti-common/SuspendEvents.java"

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
        "1963-add-to-dex-classloader-in-memory/src/art/Test1963.java"
        "1967-get-set-local-bad-slot/src/art/Test1967.java"
        "1968-force-early-return/src/art/Test1968.java"
        "1969-force-early-return-void/src/art/Test1969.java"
        "1970-force-early-return-long/src/art/Test1970.java"
        "1971-multi-force-early-return/src/art/Test1971.java"
        "1974-resize-array/src/art/Test1974.java"
        "1975-hello-structural-transformation/src/art/Test1975.java"
        "1975-hello-structural-transformation/src/art/Transform1975.java"
        "1976-hello-structural-static-methods/src/art/Test1976.java"
        "1976-hello-structural-static-methods/src/art/Transform1976.java"
        "1977-hello-structural-obsolescence/src/art/Test1977.java"
        "1978-regular-obsolete-then-structural-obsolescence/src/art/Test1978.java"
        "1979-threaded-structural-transformation/src/art/Test1979.java"
        "1981-structural-redef-private-method-handles/src/art/Test1981.java"
        #  TODO Requires VarHandles to be un-@hide. See b/64382372
        #  "1981-structural-redef-private-method-handles/src/art/Test1981_Varhandles.java",
        "1982-no-virtuals-structural-redefinition/src/art/Test1982.java"
        "1983-structural-redefinition-failures/src/art/Test1983.java"
        "1984-structural-redefine-field-trace/src/art/Test1984.java"
        "1988-multi-structural-redefine/src/art/Test1988.java"
        "1989-transform-bad-monitor/src/art/Test1989.java"
        "1990-structural-bad-verify/src/art/Test1990.java"
        "1991-hello-structural-retransform/src/art/Test1991.java"
        "1992-retransform-no-such-field/src/art/Test1992.java"
        "1994-final-virtual-structural/src/art/Test1994.java"
        "1995-final-virtual-structural-multithread/src/art/Test1995.java"
        "1996-final-override-virtual-structural/src/art/Test1996.java"
        "1997-structural-shadow-method/src/art/Test1997.java"
        "1998-structural-shadow-field/src/art/Test1998.java"
        "1999-virtual-structural/src/art/Test1999.java"
        "2001-virtual-structural-multithread/src-art/art/Test2001.java"
        "2002-virtual-structural-initializing/src-art/art/Test2002.java"
        "2003-double-virtual-structural/src/art/Test2003.java"
        "2004-double-virtual-structural-abstract/src/art/Test2004.java"
        "2005-pause-all-redefine-multithreaded/src/art/Test2005.java"
        "2006-virtual-structural-finalizing/src-art/art/Test2006.java"
        "2007-virtual-structural-finalizable/src-art/art/Test2007.java"
    ];
};

#  CTS test runner in cts/hostsidetests/jvmti looks for an expected test
#  result for the test NN in the file results.NN.expected.txt while in the
#  source tree each expected test result is in the NN-xxxx/expected.txt.
#  Copy+rename them them to a temporary directory and them zip them.
expected_cts_outputs = java_genrule {
    name = "expected_cts_outputs";
    visibility = [
        "//cts/hostsidetests/jvmti:__subpackages__"
    ];
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
        "911-get-stack-trace/expected-cts-version.txt"
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
        "1962-multi-thread-events/expected.txt"
        "1963-add-to-dex-classloader-in-memory/expected.txt"
        "1967-get-set-local-bad-slot/expected.txt"
        "1968-force-early-return/expected.txt"
        "1969-force-early-return-void/expected.txt"
        "1970-force-early-return-long/expected.txt"
        "1971-multi-force-early-return/expected.txt"
        "1974-resize-array/expected.txt"
        "1975-hello-structural-transformation/expected.txt"
        "1976-hello-structural-static-methods/expected.txt"
        "1977-hello-structural-obsolescence/expected.txt"
        "1978-regular-obsolete-then-structural-obsolescence/expected.txt"
        "1979-threaded-structural-transformation/expected.txt"
        #  TODO Requires VarHandles to be un-@hide. See b/64382372
        #  "test/1981-structural-redef-private-method-handles/expected.txt",
        "1981-structural-redef-private-method-handles/expected_no_mh.txt"
        "1982-no-virtuals-structural-redefinition/expected.txt"
        #  JNI-id use can change the outcome of this test on device.
        "1983-structural-redefinition-failures/expected-cts.txt"
        "1984-structural-redefine-field-trace/expected.txt"
        "1988-multi-structural-redefine/expected.txt"
        "1989-transform-bad-monitor/expected.txt"
        "1990-structural-bad-verify/expected.txt"
        "1991-hello-structural-retransform/expected.txt"
        "1992-retransform-no-such-field/expected.txt"
        "1994-final-virtual-structural/expected.txt"
        "1995-final-virtual-structural-multithread/expected.txt"
        "1996-final-override-virtual-structural/expected.txt"
        "1997-structural-shadow-method/expected.txt"
        "1998-structural-shadow-field/expected.txt"
        "1999-virtual-structural/expected.txt"
        "2001-virtual-structural-multithread/expected.txt"
        "2002-virtual-structural-initializing/expected.txt"
        "2003-double-virtual-structural/expected.txt"
        "2004-double-virtual-structural-abstract/expected.txt"
        "2005-pause-all-redefine-multithreaded/expected.txt"
        "2006-virtual-structural-finalizing/expected.txt"
        "2007-virtual-structural-finalizable/expected.txt"
    ];
    out = ["expected_cts_outputs.jar"];
    tools = ["soong_zip"];
    cmd = "rm -rf $(genDir)/res && mkdir -p $(genDir)/res && " +
        "for f in $(in); do x=$\${f#art/test/}; " +
        "cp $$f $(genDir)/res/results.$\${x%%-*}.expected.txt; done && " +
        "$(location soong_zip) -o $(out) -C $(genDir)/res -D $(genDir)/res";
};

art-gtest-jars = filegroup {
    name = "art-gtest-jars";
    srcs = [
        ":art-gtest-jars-AbstractMethod"
        ":art-gtest-jars-AllFields"
        ":art-gtest-jars-DefaultMethods"
        ":art-gtest-jars-DexToDexDecompiler"
        ":art-gtest-jars-ErroneousA"
        ":art-gtest-jars-ErroneousB"
        ":art-gtest-jars-ErroneousInit"
        ":art-gtest-jars-Extension1"
        ":art-gtest-jars-Extension2"
        ":art-gtest-jars-ForClassLoaderA"
        ":art-gtest-jars-ForClassLoaderB"
        ":art-gtest-jars-ForClassLoaderC"
        ":art-gtest-jars-ForClassLoaderD"
        ":art-gtest-jars-ExceptionHandle"
        ":art-gtest-jars-GetMethodSignature"
        ":art-gtest-jars-HiddenApi"
        ":art-gtest-jars-HiddenApiSignatures"
        ":art-gtest-jars-HiddenApiStubs"
        ":art-gtest-jars-ImageLayoutA"
        ":art-gtest-jars-ImageLayoutB"
        ":art-gtest-jars-IMTA"
        ":art-gtest-jars-IMTB"
        ":art-gtest-jars-Instrumentation"
        ":art-gtest-jars-Interfaces"
        ":art-gtest-jars-Lookup"
        ":art-gtest-jars-Main"
        ":art-gtest-jars-ManyMethods"
        ":art-gtest-jars-MethodTypes"
        ":art-gtest-jars-MultiDex"
        ":art-gtest-jars-MultiDexModifiedSecondary"
        ":art-gtest-jars-MyClass"
        ":art-gtest-jars-MyClassNatives"
        ":art-gtest-jars-Nested"
        ":art-gtest-jars-NonStaticLeafMethods"
        ":art-gtest-jars-Packages"
        ":art-gtest-jars-ProtoCompare"
        ":art-gtest-jars-ProtoCompare2"
        ":art-gtest-jars-ProfileTestMultiDex"
        ":art-gtest-jars-StaticLeafMethods"
        ":art-gtest-jars-Statics"
        ":art-gtest-jars-StaticsFromCode"
        ":art-gtest-jars-StringLiterals"
        ":art-gtest-jars-Transaction"
        ":art-gtest-jars-XandY"
        ":art-gtest-jars-MainEmptyUncompressed"
        ":art-gtest-jars-MainEmptyUncompressedAligned"
        ":art-gtest-jars-MainStripped"
        ":art-gtest-jars-MainUncompressedAligned"
        ":art-gtest-jars-MultiDexUncompressedAligned"
        ":art-gtest-jars-VerifierDeps"
        ":art-gtest-jars-VerifierDepsMulti"
        ":art-gtest-jars-VerifySoftFailDuringClinit"
    ];
};

art-gtest-jars-defaults = java_defaults {
    name = "art-gtest-jars-defaults";
    installable = true;
    dex_preopt = {
        enabled = false;
    };
    sdk_version = "core_platform";
};

#  The following modules are just trivial compilations (non-trivial cases are the end).

art-gtest-jars-AbstractMethod = java_library {
    name = "art-gtest-jars-AbstractMethod";
    srcs = ["AbstractMethod/AbstractClass.java"];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-AllFields = java_library {
    name = "art-gtest-jars-AllFields";
    srcs = [
        "AllFields/AllFields.java"
        "AllFields/AllFieldsSub.java"
        "AllFields/AllFieldsUnrelated.java"
    ];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-DefaultMethods = java_library {
    name = "art-gtest-jars-DefaultMethods";
    srcs = ["DefaultMethods/IterableBase.java"];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-DexToDexDecompiler = java_library {
    name = "art-gtest-jars-DexToDexDecompiler";
    srcs = ["DexToDexDecompiler/Main.java"];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-ErroneousA = java_library {
    name = "art-gtest-jars-ErroneousA";
    srcs = ["ErroneousA/ErroneousA.java"];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-ErroneousB = java_library {
    name = "art-gtest-jars-ErroneousB";
    srcs = ["ErroneousB/ErroneousB.java"];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-ErroneousInit = java_library {
    name = "art-gtest-jars-ErroneousInit";
    srcs = ["ErroneousInit/ErroneousInit.java"];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-Extension1 = java_library {
    name = "art-gtest-jars-Extension1";
    srcs = ["Extension1/ExtensionClass1.java"];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-Extension2 = java_library {
    name = "art-gtest-jars-Extension2";
    srcs = ["Extension2/ExtensionClass2.java"];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-ForClassLoaderA = java_library {
    name = "art-gtest-jars-ForClassLoaderA";
    srcs = ["ForClassLoaderA/Classes.java"];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-ForClassLoaderB = java_library {
    name = "art-gtest-jars-ForClassLoaderB";
    srcs = ["ForClassLoaderB/Classes.java"];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-ForClassLoaderC = java_library {
    name = "art-gtest-jars-ForClassLoaderC";
    srcs = ["ForClassLoaderC/Classes.java"];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-ForClassLoaderD = java_library {
    name = "art-gtest-jars-ForClassLoaderD";
    srcs = ["ForClassLoaderD/Classes.java"];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-ExceptionHandle = java_library {
    name = "art-gtest-jars-ExceptionHandle";
    srcs = ["ExceptionHandle/ExceptionHandle.java"];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-GetMethodSignature = java_library {
    name = "art-gtest-jars-GetMethodSignature";
    srcs = ["GetMethodSignature/GetMethodSignature.java"];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-HiddenApi = java_library {
    name = "art-gtest-jars-HiddenApi";
    srcs = [
        "HiddenApi/AbstractPackageClass.java"
        "HiddenApi/Main.java"
        "HiddenApi/PackageClass.java"
        "HiddenApi/PublicInterface.java"
    ];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-HiddenApiSignatures = java_library {
    name = "art-gtest-jars-HiddenApiSignatures";
    srcs = [
        "HiddenApiSignatures/Class1.java"
        "HiddenApiSignatures/Class12.java"
        "HiddenApiSignatures/Class2.java"
        "HiddenApiSignatures/Class3.java"
        "HiddenApiSignatures/Interface.java"
    ];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-HiddenApiStubs = java_library {
    name = "art-gtest-jars-HiddenApiStubs";
    srcs = ["HiddenApiStubs/PublicInterface.java"];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-ImageLayoutA = java_library {
    name = "art-gtest-jars-ImageLayoutA";
    srcs = ["ImageLayoutA/ImageLayoutA.java"];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-ImageLayoutB = java_library {
    name = "art-gtest-jars-ImageLayoutB";
    srcs = ["ImageLayoutB/ImageLayoutB.java"];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-IMTA = java_library {
    name = "art-gtest-jars-IMTA";
    srcs = ["IMTA/Interfaces.java"];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-IMTB = java_library {
    name = "art-gtest-jars-IMTB";
    srcs = ["IMTB/Interfaces.java"];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-Instrumentation = java_library {
    name = "art-gtest-jars-Instrumentation";
    srcs = ["Instrumentation/Instrumentation.java"];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-Interfaces = java_library {
    name = "art-gtest-jars-Interfaces";
    srcs = ["Interfaces/Interfaces.java"];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-Lookup = java_library {
    name = "art-gtest-jars-Lookup";
    srcs = [
        "Lookup/A.java"
        "Lookup/AB.java"
        "Lookup/C.java"
    ];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-Main = java_library {
    name = "art-gtest-jars-Main";
    srcs = ["Main/Main.java"];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-ManyMethods = java_library {
    name = "art-gtest-jars-ManyMethods";
    srcs = ["ManyMethods/ManyMethods.java"];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-MethodTypes = java_library {
    name = "art-gtest-jars-MethodTypes";
    srcs = ["MethodTypes/MethodTypes.java"];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-MyClass = java_library {
    name = "art-gtest-jars-MyClass";
    srcs = ["MyClass/MyClass.java"];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-MyClassNatives = java_library {
    name = "art-gtest-jars-MyClassNatives";
    srcs = ["MyClassNatives/MyClassNatives.java"];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-Nested = java_library {
    name = "art-gtest-jars-Nested";
    srcs = ["Nested/Nested.java"];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-NonStaticLeafMethods = java_library {
    name = "art-gtest-jars-NonStaticLeafMethods";
    srcs = ["NonStaticLeafMethods/NonStaticLeafMethods.java"];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-Packages = java_library {
    name = "art-gtest-jars-Packages";
    srcs = [
        "Packages/Package1.java"
        "Packages/Package2.java"
    ];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-ProtoCompare = java_library {
    name = "art-gtest-jars-ProtoCompare";
    srcs = ["ProtoCompare/ProtoCompare.java"];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-ProtoCompare2 = java_library {
    name = "art-gtest-jars-ProtoCompare2";
    srcs = ["ProtoCompare2/ProtoCompare2.java"];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-StaticLeafMethods = java_library {
    name = "art-gtest-jars-StaticLeafMethods";
    srcs = ["StaticLeafMethods/StaticLeafMethods.java"];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-Statics = java_library {
    name = "art-gtest-jars-Statics";
    srcs = ["Statics/Statics.java"];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-StaticsFromCode = java_library {
    name = "art-gtest-jars-StaticsFromCode";
    srcs = ["StaticsFromCode/StaticsFromCode.java"];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-StringLiterals = java_library {
    name = "art-gtest-jars-StringLiterals";
    srcs = ["StringLiterals/StringLiterals.java"];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-Transaction = java_library {
    name = "art-gtest-jars-Transaction";
    srcs = [
        "Transaction/InstanceFieldsTest.java"
        "Transaction/StaticArrayFieldsTest.java"
        "Transaction/StaticFieldsTest.java"
        "Transaction/Transaction.java"
    ];
    defaults = ["art-gtest-jars-defaults"];
};

art-gtest-jars-XandY = java_library {
    name = "art-gtest-jars-XandY";
    srcs = [
        "XandY/X.java"
        "XandY/Y.java"
    ];
    defaults = ["art-gtest-jars-defaults"];
};

#  The following cases are non-trivial.

#  Uncompress classes.dex files in the jar file.
art-gtest-jars-uncompress-defaults = genrule_defaults {
    name = "art-gtest-jars-uncompress-defaults";
    cmd = "$(location zip2zip) -i $(in) -o $(out) -0 'classes*.dex'";
    tools = ["zip2zip"];
};

#  Ensure the files are at least 4 byte aligned.
art-gtest-jars-align-defaults = genrule_defaults {
    name = "art-gtest-jars-align-defaults";
    cmd = "$(location zipalign) 4 $(in) $(out)";
    tools = ["zipalign"];
};

#  Assemble jar file from smali source.
art-gtest-jars-smali-defaults = genrule_defaults {
    name = "art-gtest-jars-smali-defaults";
    cmd = "$(location smali) assemble --output $(out) $(in)";
    tools = ["smali"];
};

#  A copy of Main with the classes.dex stripped for the oat file assistant tests.
art-gtest-jars-MainStripped = genrule {
    name = "art-gtest-jars-MainStripped";
    srcs = [":art-gtest-jars-Main"];
    cmd = "$(location zip2zip) -i $(in) -o $(out) -x 'classes*.dex'";
    out = ["art-gtest-jars-MainStripped.jar"];
    tools = ["zip2zip"];
};

#  An empty.dex that is empty and uncompressed for the dex2oat tests.
art-gtest-jars-MainEmptyUncompressed = genrule {
    name = "art-gtest-jars-MainEmptyUncompressed";
    srcs = ["Main/empty.dex"];
    cmd = "$(location soong_zip) -j -L 0 -o $(out) -f $(in)";
    out = ["art-gtest-jars-MainEmptyUncompressed.jar"];
    tools = ["soong_zip"];
};

#  An empty.dex that is empty and uncompressed and aligned for the dex2oat tests.
art-gtest-jars-MainEmptyUncompressedAligned = genrule {
    name = "art-gtest-jars-MainEmptyUncompressedAligned";
    defaults = ["art-gtest-jars-align-defaults"];
    srcs = [":art-gtest-jars-MainEmptyUncompressed"];
    out = ["art-gtest-jars-MainEmptyUncompressedAligned.jar"];
};

#  A copy of Main with the classes.dex uncompressed for the dex2oat tests.
art-gtest-jars-MainUncompressed = genrule {
    name = "art-gtest-jars-MainUncompressed";
    defaults = ["art-gtest-jars-uncompress-defaults"];
    srcs = [":art-gtest-jars-Main"];
    out = ["art-gtest-jars-MainUncompressed.jar"];
};

#  A copy of Main with the classes.dex uncompressed and aligned for the dex2oat tests.
art-gtest-jars-MainUncompressedAligned = genrule {
    name = "art-gtest-jars-MainUncompressedAligned";
    defaults = ["art-gtest-jars-align-defaults"];
    srcs = [":art-gtest-jars-MainUncompressed"];
    out = ["art-gtest-jars-MainUncompressedAligned.jar"];
};

art-gtest-jars-MultiDex = java_library {
    name = "art-gtest-jars-MultiDex";
    srcs = [
        "MultiDex/Main.java"
        "MultiDex/Second.java"
    ];
    defaults = ["art-gtest-jars-defaults"];
    min_sdk_version = "19";
    dxflags = [
        "--main-dex-list"
        "art/test/MultiDex/main.list"
    ];
};

#  A copy of MultiDex with the classes.dex uncompressed for the OatFile tests.
art-gtest-jars-MultiDexUncompressed = genrule {
    name = "art-gtest-jars-MultiDexUncompressed";
    defaults = ["art-gtest-jars-uncompress-defaults"];
    srcs = [":art-gtest-jars-MultiDex"];
    out = ["art-gtest-jars-MultiDexUncompressed.jar"];
};

#  A copy of MultiDex with the classes.dex uncompressed and aligned for the OatFile tests.
art-gtest-jars-MultiDexUncompressedAligned = genrule {
    name = "art-gtest-jars-MultiDexUncompressedAligned";
    defaults = ["art-gtest-jars-align-defaults"];
    srcs = [":art-gtest-jars-MultiDexUncompressed"];
    out = ["art-gtest-jars-MultiDexUncompressedAligned.jar"];
};

art-gtest-jars-MultiDexModifiedSecondary = java_library {
    name = "art-gtest-jars-MultiDexModifiedSecondary";
    srcs = [
        "MultiDexModifiedSecondary/Main.java"
        "MultiDexModifiedSecondary/Second.java"
    ];
    defaults = ["art-gtest-jars-defaults"];
    min_sdk_version = "19";
    dxflags = [
        "--main-dex-list"
        "art/test/MultiDexModifiedSecondary/main.list"
    ];
};

art-gtest-jars-ProfileTestMultiDex = java_library {
    name = "art-gtest-jars-ProfileTestMultiDex";
    srcs = [
        "ProfileTestMultiDex/Main.java"
        "ProfileTestMultiDex/Second.java"
    ];
    defaults = ["art-gtest-jars-defaults"];
    min_sdk_version = "19";
    dxflags = [
        "--main-dex-list"
        "art/test/ProfileTestMultiDex/main.list"
    ];
};

art-gtest-jars-VerifierDeps = genrule {
    name = "art-gtest-jars-VerifierDeps";
    defaults = ["art-gtest-jars-smali-defaults"];
    srcs = [
        "VerifierDeps/Iface.smali"
        "VerifierDeps/Main.smali"
        "VerifierDeps/MyClassExtendingInterface.smali"
        "VerifierDeps/MyClassWithNoSuper.smali"
        "VerifierDeps/MyClassWithNoSuperButFailures.smali"
        "VerifierDeps/MyDOMResult.smali"
        "VerifierDeps/MyDocument.smali"
        "VerifierDeps/MyErroneousTimeZone.smali"
        "VerifierDeps/MyResult.smali"
        "VerifierDeps/MySSLSocket.smali"
        "VerifierDeps/MySimpleTimeZone.smali"
        "VerifierDeps/MySocketTimeoutException.smali"
        "VerifierDeps/MySub1SoftVerificationFailure.smali"
        "VerifierDeps/MySub2SoftVerificationFailure.smali"
        "VerifierDeps/MyThread.smali"
        "VerifierDeps/MyThreadSet.smali"
        "VerifierDeps/MyVerificationFailure.smali"
        "VerifierDeps/SocketTimeoutException.smali"
    ];
    out = ["art-gtest-jars-VerifierDeps.jar"];
};

art-gtest-jars-VerifierDepsMulti = genrule {
    name = "art-gtest-jars-VerifierDepsMulti";
    defaults = ["art-gtest-jars-smali-defaults"];
    srcs = ["VerifierDepsMulti/MySoftVerificationFailure.smali"];
    out = ["art-gtest-jars-VerifierDepsMulti.jar"];
};

art-gtest-jars-VerifySoftFailDuringClinit = genrule {
    name = "art-gtest-jars-VerifySoftFailDuringClinit";
    defaults = ["art-gtest-jars-smali-defaults"];
    srcs = [
        "VerifySoftFailDuringClinit/ClassToInitialize.smali"
        "VerifySoftFailDuringClinit/VerifySoftFail.smali"
    ];
    out = ["art-gtest-jars-VerifySoftFailDuringClinit.jar"];
};

in { inherit art-gtest-jars art-gtest-jars-AbstractMethod art-gtest-jars-AllFields art-gtest-jars-DefaultMethods art-gtest-jars-DexToDexDecompiler art-gtest-jars-ErroneousA art-gtest-jars-ErroneousB art-gtest-jars-ErroneousInit art-gtest-jars-ExceptionHandle art-gtest-jars-Extension1 art-gtest-jars-Extension2 art-gtest-jars-ForClassLoaderA art-gtest-jars-ForClassLoaderB art-gtest-jars-ForClassLoaderC art-gtest-jars-ForClassLoaderD art-gtest-jars-GetMethodSignature art-gtest-jars-HiddenApi art-gtest-jars-HiddenApiSignatures art-gtest-jars-HiddenApiStubs art-gtest-jars-IMTA art-gtest-jars-IMTB art-gtest-jars-ImageLayoutA art-gtest-jars-ImageLayoutB art-gtest-jars-Instrumentation art-gtest-jars-Interfaces art-gtest-jars-Lookup art-gtest-jars-Main art-gtest-jars-MainEmptyUncompressed art-gtest-jars-MainEmptyUncompressedAligned art-gtest-jars-MainStripped art-gtest-jars-MainUncompressed art-gtest-jars-MainUncompressedAligned art-gtest-jars-ManyMethods art-gtest-jars-MethodTypes art-gtest-jars-MultiDex art-gtest-jars-MultiDexModifiedSecondary art-gtest-jars-MultiDexUncompressed art-gtest-jars-MultiDexUncompressedAligned art-gtest-jars-MyClass art-gtest-jars-MyClassNatives art-gtest-jars-Nested art-gtest-jars-NonStaticLeafMethods art-gtest-jars-Packages art-gtest-jars-ProfileTestMultiDex art-gtest-jars-ProtoCompare art-gtest-jars-ProtoCompare2 art-gtest-jars-StaticLeafMethods art-gtest-jars-Statics art-gtest-jars-StaticsFromCode art-gtest-jars-StringLiterals art-gtest-jars-Transaction art-gtest-jars-VerifierDeps art-gtest-jars-VerifierDepsMulti art-gtest-jars-VerifySoftFailDuringClinit art-gtest-jars-XandY art-gtest-jars-align-defaults art-gtest-jars-defaults art-gtest-jars-smali-defaults art-gtest-jars-uncompress-defaults art_cts_jvmti_test_library art_gtest_defaults art_test_defaults expected_cts_outputs libart-gtest libart-gtest-defaults libartagent libartagent-defaults libartagentd libarttest libarttest-defaults libarttestd libctstiagent libnativebridgetest libnativebridgetest-defaults libnativebridgetestd libtiagent libtiagent-base-defaults libtiagent-defaults libtiagentd libtistress libtistress-defaults libtistress-shared-defaults libtistress-srcs libtistressd libtistressds libtistresss; }
