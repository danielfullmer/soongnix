{ callBPPackage }:
{
  inherit (callBPPackage "art/adbconnection" ./art_adbconnection.nix {})
    adbconnection-defaults libadbconnection libadbconnectiond;

  inherit (callBPPackage "art/benchmark" ./art_benchmark.nix {})
    libartbenchmark libartbenchmark-micronative-host;

  inherit (callBPPackage "art/build" ./art_build.nix {})
    art_debug_defaults art_defaults soong-art;

  inherit (callBPPackage "art/build/apex" ./art_build_apex.nix {})
    "com.android.runtime-defaults" "com.android.runtime.debug" "com.android.runtime.debug.certificate" "com.android.runtime.host" "com.android.runtime.key" "com.android.runtime.ld.config.txt" "com.android.runtime.release" "com.android.runtime.release.certificate" art-apex-tester art-check-debug-apex-gen art-check-debug-apex-gen-fakebin art-check-release-apex-gen art-check-release-apex-gen-fakebin art_apex_boot_integrity art_postinstall_hook art_preinstall_hook art_preinstall_hook_boot art_preinstall_hook_system_server art_prepostinstall_utils;

  inherit (callBPPackage "art/cmdline" ./art_cmdline.nix {})
    art_cmdline_tests art_cmdlineparser_headers;

  inherit (callBPPackage "art/compiler" ./art_compiler.nix {})
    art_compiler_host_tests art_compiler_operator_srcs art_compiler_tests libart-compiler libart-compiler-defaults libart-compiler-gtest libart-compiler_static_base_defaults libart-compiler_static_defaults libartd-compiler libartd-compiler_static_defaults;

  inherit (callBPPackage "art/dalvikvm" ./art_dalvikvm.nix {})
    dalvikvm;

  inherit (callBPPackage "art/dex2oat" ./art_dex2oat.nix {})
    art_dex2oat_operator_srcs art_dex2oat_tests dex2oat dex2oat-defaults dex2oat-pgo-defaults dex2oat_headers dex2oatd dex2oatds dex2oats dex2oats-defaults libart-dex2oat libart-dex2oat-defaults libart-dex2oat-gtest libart-dex2oat_static_base_defaults libart-dex2oat_static_defaults libartd-dex2oat libartd-dex2oat_static_defaults;

  inherit (callBPPackage "art/dexdump" ./art_dexdump.nix {})
    art_dexdump_tests dexdump2 dexdump_defaults dexdumps;

  inherit (callBPPackage "art/dexlayout" ./art_dexlayout.nix {})
    art_dexdiag_tests art_dexlayout_tests dexdiag dexlayout dexlayout-defaults dexlayoutd dexlayouts libart-dexlayout libart-dexlayout-defaults libart-dexlayout_static_base_defaults libart-dexlayout_static_defaults libartd-dexlayout libartd-dexlayout_static_defaults;

  inherit (callBPPackage "art/dexlist" ./art_dexlist.nix {})
    art_dexlist_tests dexlist dexlists;

  inherit (callBPPackage "art/dexoptanalyzer" ./art_dexoptanalyzer.nix {})
    art_dexoptanalyzer_tests dexoptanalyzer dexoptanalyzer-defaults dexoptanalyzerd;

  inherit (callBPPackage "art/disassembler" ./art_disassembler.nix {})
    libart-disassembler libart-disassembler-defaults libartd-disassembler;

  inherit (callBPPackage "art/dt_fd_forward" ./art_dt_fd_forward.nix {})
    dt_fd_forward-defaults libdt_fd_forward libdt_fd_forwardd;

  inherit (callBPPackage "art/dt_fd_forward/export" ./art_dt_fd_forward_export.nix {})
    dt_fd_forward_export;

  inherit (callBPPackage "art/imgdiag" ./art_imgdiag.nix {})
    art_imgdiag_tests imgdiag imgdiag-defaults imgdiagd;

  inherit (callBPPackage "art/libartbase" ./art_libartbase.nix {})
    art_libartbase_headers art_libartbase_operator_srcs art_libartbase_tests libartbase libartbase-art-gtest libartbase_defaults libartbase_static_base_defaults libartbase_static_defaults libartbased libartbased_static_defaults;

  inherit (callBPPackage "art/libartpalette" ./art_libartpalette.nix {})
    art_libartpalette_tests libartpalette libartpalette-system libartpalette_defaults;

  inherit (callBPPackage "art/libdexfile" ./art_libdexfile.nix {})
    art_libdexfile_external_tests art_libdexfile_support_static_tests art_libdexfile_support_tests art_libdexfile_tests dexfile_operator_srcs libdexfile libdexfile_defaults libdexfile_external libdexfile_external_headers libdexfile_static_base_defaults libdexfile_static_defaults libdexfile_support libdexfile_support_static libdexfiled libdexfiled_static_defaults;

  inherit (callBPPackage "art/libelffile" ./art_libelffile.nix {})
    libelffile libelffile-defaults libelffiled;

  inherit (callBPPackage "art/libprofile" ./art_libprofile.nix {})
    art_libprofile_tests libprofile libprofile_defaults libprofile_static_base_defaults libprofile_static_defaults libprofiled libprofiled_static_defaults;

  inherit (callBPPackage "art/oatdump" ./art_oatdump.nix {})
    art_oatdump_tests oatdump oatdump-defaults oatdumpd oatdumpds oatdumps oatdumps-defaults;

  inherit (callBPPackage "art/openjdkjvm" ./art_openjdkjvm.nix {})
    libopenjdkjvm libopenjdkjvm_defaults libopenjdkjvmd;

  inherit (callBPPackage "art/openjdkjvmti" ./art_openjdkjvmti.nix {})
    libopenjdkjvmti libopenjdkjvmti_defaults libopenjdkjvmti_headers libopenjdkjvmtid;

  inherit (callBPPackage "art/profman" ./art_profman.nix {})
    art_profman_tests profman profman-defaults profmand profmans;

  inherit (callBPPackage "art/runtime" ./art_runtime.nix {})
    "libart_mterp.arm" "libart_mterp.arm64" "libart_mterp.mips" "libart_mterp.mips64" "libart_mterp.x86" "libart_mterp.x86_64" art_operator_srcs art_runtime_compiler_tests art_runtime_tests libart libart-runtime-gtest libart_defaults libart_runtime_headers libart_static_base_defaults libart_static_defaults libartd libartd_static_defaults;

  inherit (callBPPackage "art/sigchainlib" ./art_sigchainlib.nix {})
    "art_sigchain_version_script32.txt" "art_sigchain_version_script64.txt" art_sigchain_tests libsigchain libsigchain_dummy;

  inherit (callBPPackage "art/simulator" ./art_simulator.nix {})
    libart-simulator libart-simulator-container libart_simulator_container_defaults libart_simulator_defaults libart_simulator_headers libartd-simulator libartd-simulator-container;

  inherit (callBPPackage "art/test" ./art_test.nix {})
    art_cts_jvmti_test_library art_gtest_defaults art_test_defaults expected_cts_outputs libart-gtest libart-gtest-defaults libartagent libartagent-defaults libartagentd libarttest libarttest-defaults libarttestd libctstiagent libnativebridgetest libtiagent libtiagent-base-defaults libtiagent-defaults libtiagentd libtistress libtistress-defaults libtistress-srcs libtistress-static-defaults libtistressd libtistressds libtistresss;

  inherit (callBPPackage "art/tools" ./art_tools.nix {})
    generate_operator_out;

  inherit (callBPPackage "art/tools/ahat" ./art_tools_ahat.nix {})
    ahat ahat-docs;

  inherit (callBPPackage "art/tools/amm" ./art_tools_amm.nix {})
    libammtestjni;

  inherit (callBPPackage "art/tools/art_verifier" ./art_tools_art_verifier.nix {})
    art_verifier art_verifier-defaults;

  inherit (callBPPackage "art/tools/class2greylist" ./art_tools_class2greylist.nix {})
    class2greylist class2greylistlib;

  inherit (callBPPackage "art/tools/cpp-define-generator" ./art_tools_cpp-define-generator.nix {})
    "asm_defines.s" cpp-define-generator-asm-support cpp-define-generator-definitions cpp-define-generator-test;

  inherit (callBPPackage "art/tools/dexanalyze" ./art_tools_dexanalyze.nix {})
    art_dexanalyze_tests dexanalyze dexanalyze-defaults;

  inherit (callBPPackage "art/tools/dmtracedump" ./art_tools_dmtracedump.nix {})
    create_test_dmtrace dmtracedump;

  inherit (callBPPackage "art/tools/hiddenapi" ./art_tools_hiddenapi.nix {})
    art_hiddenapi_tests hiddenapi hiddenapi-defaults hiddenapid;

  inherit (callBPPackage "art/tools/jfuzz" ./art_tools_jfuzz.nix {})
    jfuzz;

  inherit (callBPPackage "art/tools/jvmti-agents/breakpoint-logger" ./art_tools_jvmti-agents_breakpoint-logger.nix {})
    breakpointlogger-defaults libbreakpointlogger libbreakpointloggerd;

  inherit (callBPPackage "art/tools/jvmti-agents/dump-jvmti-state" ./art_tools_jvmti-agents_dump-jvmti-state.nix {})
    dumpjvmti-defaults libdumpjvmti libdumpjvmtid;

  inherit (callBPPackage "art/tools/jvmti-agents/field-null-percent" ./art_tools_jvmti-agents_field-null-percent.nix {})
    fieldnull-defaults libfieldnull libfieldnulld;

  inherit (callBPPackage "art/tools/jvmti-agents/jit-load" ./art_tools_jvmti-agents_jit-load.nix {})
    jitload-defaults libjitload libjitloadd;

  inherit (callBPPackage "art/tools/jvmti-agents/simple-force-redefine" ./art_tools_jvmti-agents_simple-force-redefine.nix {})
    forceredefine-defaults libforceredefine libforceredefined;

  inherit (callBPPackage "art/tools/jvmti-agents/ti-fast" ./art_tools_jvmti-agents_ti-fast.nix {})
    libtifast libtifastd tifast-defaults;

  inherit (callBPPackage "art/tools/jvmti-agents/titrace" ./art_tools_jvmti-agents_titrace.nix {})
    libtitrace libtitraced titrace-defaults;

  inherit (callBPPackage "art/tools/jvmti-agents/wrapagentproperties" ./art_tools_jvmti-agents_wrapagentproperties.nix {})
    libwrapagentproperties libwrapagentpropertiesd wrapagentproperties-defaults;

  inherit (callBPPackage "art/tools/timeout_dumper" ./art_tools_timeout_dumper.nix {})
    timeout_dumper;

  inherit (callBPPackage "art/tools/tracefast-plugin" ./art_tools_tracefast-plugin.nix {})
    libtracefast-interpreter libtracefast-interpreterd libtracefast-trampoline libtracefast-trampolined tracefast-defaults tracefast-interpreter-defaults tracefast-trampoline-defaults;

  inherit (callBPPackage "art/tools/veridex" ./art_tools_veridex.nix {})
    veridex;

  inherit (callBPPackage "bionic/benchmarks" ./bionic_benchmarks.nix {})
    bionic-benchmarks bionic-benchmarks-defaults bionic-benchmarks-extras-defaults bionic-benchmarks-glibc bionic-benchmarks-tests libBionicBenchmarksUtils;

  inherit (callBPPackage "bionic/libc" ./bionic_libc.nix {})
    "libc.arm.map" "libc.arm64.map" "libc.x86.map" "libc.x86_64.map" "libstdc++" "libstdc++.arm.map" "libstdc++.arm64.map" "libstdc++.x86.map" "libstdc++.x86_64.map" crt_defaults crt_so_defaults crtbegin_dynamic crtbegin_dynamic1 crtbegin_so crtbegin_so1 crtbegin_static crtbegin_static1 crtbrand crtend_android crtend_so func_to_syscall_nrs generate_app_zygote_blacklist generated_android_ids genfunctosyscallnrs genseccomp kernel_input_headers libc libc_aeabi libc_bionic libc_bionic_ndk libc_common libc_common_shared libc_common_static libc_defaults libc_dns libc_fortify libc_freebsd libc_freebsd_large_stack libc_gdtoa libc_headers libc_init_dynamic libc_init_static libc_malloc libc_ndk libc_netbsd libc_nomalloc libc_nopthread libc_openbsd libc_openbsd_large_stack libc_openbsd_ndk libc_pthread libc_scudo libc_sources_shared libc_sources_shared_arm libc_sources_static libc_sources_static_arm libc_stack_protector libc_syscalls libc_tzcode libseccomp_gen_syscall_nrs_arm libseccomp_gen_syscall_nrs_arm64 libseccomp_gen_syscall_nrs_defaults libseccomp_gen_syscall_nrs_mips libseccomp_gen_syscall_nrs_mips64 libseccomp_gen_syscall_nrs_x86 libseccomp_gen_syscall_nrs_x86_64 libseccomp_policy libseccomp_policy_app_sources libseccomp_policy_app_zygote_sources libseccomp_policy_global_sources libseccomp_policy_system_sources;

  inherit (callBPPackage "bionic/libc/async_safe" ./bionic_libc_async_safe.nix {})
    libasync_safe libasync_safe_headers;

  inherit (callBPPackage "bionic/libc/bionic/scudo" ./bionic_libc_bionic_scudo.nix {})
    libscudo_wrapper;

  inherit (callBPPackage "bionic/libc/malloc_debug" ./bionic_libc_malloc_debug.nix {})
    libc_malloc_debug libc_malloc_debug_backtrace malloc_debug_system_tests malloc_debug_unit_tests;

  inherit (callBPPackage "bionic/libc/malloc_hooks" ./bionic_libc_malloc_hooks.nix {})
    libc_malloc_hooks malloc_hooks_unit_tests;

  inherit (callBPPackage "bionic/libc/system_properties" ./bionic_libc_system_properties.nix {})
    libsystemproperties;

  inherit (callBPPackage "bionic/libdl" ./bionic_libdl.nix {})
    "libdl.arm.map" "libdl.arm64.map" "libdl.x86.map" "libdl.x86_64.map" libdl libdl_android libdl_static;

  inherit (callBPPackage "bionic/libm" ./bionic_libm.nix {})
    "libm.arm.map" "libm.arm64.map" "libm.x86.map" "libm.x86_64.map" libm;

  inherit (callBPPackage "bionic/linker" ./bionic_linker.nix {})
    ld-android liblinker_malloc linker linker-unit-tests linker_defaults linker_sources linker_sources_arm linker_sources_arm64 linker_sources_mips linker_sources_mips64 linker_sources_x86 linker_sources_x86_64 linker_version_script linker_version_script_arm linker_wrapper;

  inherit (callBPPackage "bionic/tests" ./bionic_tests.nix {})
    bionic-unit-tests bionic-unit-tests-glibc bionic-unit-tests-scudo bionic-unit-tests-static bionic_fortify_tests_defaults bionic_tests_defaults bionic_unit_tests_defaults clang_diagnostic_tests fortify_disabled_for_asan fortify_disabled_for_tidy libBionicCtsGtestMain libBionicElfTlsLoaderTests libBionicElfTlsTests libBionicLoaderTests libBionicStandardTests libBionicTests libfortify1-tests-clang libfortify2-tests-clang;

  inherit (callBPPackage "bionic/tests/headers/posix" ./bionic_tests_headers_posix.nix {})
    libbionic_tests_headers_posix;

  inherit (callBPPackage "bionic/tests/libs" ./bionic_tests_libs.nix {})
    bionic_testlib_defaults bionic_tests_zipalign cfi_test_helper cfi_test_helper2 elftls_dlopen_ie_error_helper exec_linker_helper exec_linker_helper_lib ld_config_test_helper ld_config_test_helper_lib1 ld_config_test_helper_lib2 ld_config_test_helper_lib3 ld_preload_test_helper ld_preload_test_helper_lib1 ld_preload_test_helper_lib2 libcfi-test libcfi-test-bad libdl_preempt_test_1 libdl_preempt_test_2 libdl_test_df_1_global libdlext_test_norelro libgnu-hash-table-library libnstest_dlopened libnstest_ns_a_public1 libnstest_ns_a_public1_internal libnstest_ns_b_public2 libnstest_ns_b_public3 libnstest_private libnstest_public libnstest_public_internal libnstest_root libsegment_gap_inner libsegment_gap_outer libsysv-hash-table-library libtest_atexit libtest_check_rtld_next_from_library libtest_dlopen_df_1_global libtest_dlopen_from_ctor libtest_dlopen_from_ctor_main libtest_dlopen_weak_undefined_func libtest_dlsym_df_1_global libtest_dlsym_from_this libtest_dlsym_from_this_child libtest_dlsym_from_this_grandchild libtest_dlsym_weak_func libtest_elftls_dynamic libtest_elftls_dynamic_filler_1 libtest_elftls_dynamic_filler_2 libtest_elftls_dynamic_filler_3 libtest_elftls_shared_var libtest_elftls_shared_var_ie libtest_elftls_tprel libtest_empty libtest_ifunc libtest_ifunc_variable libtest_ifunc_variable_impl libtest_indirect_thread_local_dtor libtest_init_fini_order_child libtest_init_fini_order_grand_child libtest_init_fini_order_root libtest_init_fini_order_root2 libtest_missing_symbol libtest_missing_symbol_child_private libtest_missing_symbol_child_public libtest_missing_symbol_root libtest_nodelete_1 libtest_nodelete_2 libtest_nodelete_dt_flags_1 libtest_relo_check_dt_needed_order libtest_relo_check_dt_needed_order_1 libtest_relo_check_dt_needed_order_2 libtest_simple libtest_thread_local_dtor libtest_thread_local_dtor2 libtest_with_dependency_loop libtest_with_dependency_loop_a libtest_with_dependency_loop_b libtest_with_dependency_loop_b_tmp libtest_with_dependency_loop_c libtestshared preinit_getauxval_test_helper preinit_syscall_test_helper;

  inherit (callBPPackage "bionic/tools" ./bionic_tools.nix {})
    bionic-generate-version-script;

  inherit (callBPPackage "bionic/tools/versioner/src" ./bionic_tools_versioner_src.nix {})
    versioner;

  inherit (callBPPackage "bootable/recovery" ./bootable_recovery.nix {})
    librecovery librecovery_defaults librecovery_fastboot recovery recovery-persist recovery-refresh recovery_defaults res-testdata;

  inherit (callBPPackage "bootable/recovery/applypatch" ./bootable_recovery_applypatch.nix {})
    applypatch applypatch_defaults imgdiff libapplypatch libapplypatch_modes libimgdiff libimgpatch;

  inherit (callBPPackage "bootable/recovery/boot_control" ./bootable_recovery_boot_control.nix {})
    "bootctrl.default";

  inherit (callBPPackage "bootable/recovery/bootloader_message" ./bootable_recovery_bootloader_message.nix {})
    libbootloader_message libbootloader_message_defaults libbootloader_message_vendor;

  inherit (callBPPackage "bootable/recovery/edify" ./bootable_recovery_edify.nix {})
    libedify;

  inherit (callBPPackage "bootable/recovery/fuse_sideload" ./bootable_recovery_fuse_sideload.nix {})
    libfusesideload;

  inherit (callBPPackage "bootable/recovery/install" ./bootable_recovery_install.nix {})
    libinstall libinstall_defaults;

  inherit (callBPPackage "bootable/recovery/minadbd" ./bootable_recovery_minadbd.nix {})
    libminadbd_headers libminadbd_services minadbd minadbd_defaults minadbd_test;

  inherit (callBPPackage "bootable/recovery/minui" ./bootable_recovery_minui.nix {})
    libminui;

  inherit (callBPPackage "bootable/recovery/misc_writer" ./bootable_recovery_misc_writer.nix {})
    misc_writer;

  inherit (callBPPackage "bootable/recovery/otautil" ./bootable_recovery_otautil.nix {})
    libotautil;

  inherit (callBPPackage "bootable/recovery/recovery_ui" ./bootable_recovery_recovery_ui.nix {})
    librecovery_ui librecovery_ui_default librecovery_ui_vr librecovery_ui_wear;

  inherit (callBPPackage "bootable/recovery/tests" ./bootable_recovery_tests.nix {})
    recovery_component_test recovery_host_test recovery_manual_test recovery_test_defaults recovery_unit_test;

  inherit (callBPPackage "bootable/recovery/tools/image_generator" ./bootable_recovery_tools_image_generator.nix {})
    RecoveryImageGenerator;

  inherit (callBPPackage "bootable/recovery/tools/recovery_l10n" ./bootable_recovery_tools_recovery_l10n.nix {})
    RecoveryLocalizer;

  inherit (callBPPackage "bootable/recovery/uncrypt" ./bootable_recovery_uncrypt.nix {})
    uncrypt;

  inherit (callBPPackage "bootable/recovery/update_verifier" ./bootable_recovery_update_verifier.nix {})
    care_map_generator libupdate_verifier update_verifier update_verifier_defaults;

  inherit (callBPPackage "bootable/recovery/updater" ./bootable_recovery_updater.nix {})
    libupdater libupdater_defaults;

  inherit (callBPPackage "bootable/recovery/updater_sample" ./bootable_recovery_updater_sample.nix {})
    SystemUpdaterSample;

  inherit (callBPPackage "bootable/recovery/updater_sample/tests" ./bootable_recovery_updater_sample_tests.nix {})
    SystemUpdaterSampleTests;

  inherit (callBPPackage "build/kati" ./build_kati.nix {})
    ckati ckati_defaults ckati_fileutil_bench ckati_stamp_dump ckati_test libckati;

  inherit (callBPPackage "build/make/tools/acp" ./build_make_tools_acp.nix {})
    acp;

  inherit (callBPPackage "build/make/tools/apicheck" ./build_make_tools_apicheck.nix {})
    apicheck;

  inherit (callBPPackage "build/make/tools/atree" ./build_make_tools_atree.nix {})
    atree;

  inherit (callBPPackage "build/make/tools/droiddoc" ./build_make_tools_droiddoc.nix {})
    droiddoc-templates-pdk;

  inherit (callBPPackage "build/make/tools/fs_config" ./build_make_tools_fs_config.nix {})
    fs_config group group_gen oemaids_header_gen oemaids_headers passwd passwd_gen soong-fs_config target_fs_config_gen;

  inherit (callBPPackage "build/make/tools/fs_get_stats" ./build_make_tools_fs_get_stats.nix {})
    fs_get_stats;

  inherit (callBPPackage "build/make/tools/libhost" ./build_make_tools_libhost.nix {})
    libhost;

  inherit (callBPPackage "build/make/tools/makeparallel" ./build_make_tools_makeparallel.nix {})
    makeparallel;

  inherit (callBPPackage "build/make/tools/signapk" ./build_make_tools_signapk.nix {})
    signapk;

  inherit (callBPPackage "build/make/tools/signtos" ./build_make_tools_signtos.nix {})
    signtos;

  inherit (callBPPackage "build/make/tools/zipalign" ./build_make_tools_zipalign.nix {})
    zipalign;

  inherit (callBPPackage "build/make/tools/ziptime" ./build_make_tools_ziptime.nix {})
    ziptime;

  inherit (callBPPackage "build/soong" ./build_soong.nix {})
    device_kernel_headers host_bionic_linker_asm host_bionic_linker_flags libatomic libgcc libgcc_stripped libgcov libwinpthread linux_bionic_supported soong soong-android soong-apex soong-cc soong-cc-config soong-env soong-genrule soong-java soong-java-config soong-phony soong-python soong-shared soong-sysprop soong-tradefed soong-xml;

  inherit (callBPPackage "build/soong/androidmk" ./build_soong_androidmk.nix {})
    androidmk androidmk-parser;

  inherit (callBPPackage "build/soong/bpf" ./build_soong_bpf.nix {})
    soong-bpf;

  inherit (callBPPackage "build/soong/bpfix" ./build_soong_bpfix.nix {})
    bpfix bpfix-lib;

  inherit (callBPPackage "build/soong/cc/libbuildversion" ./build_soong_cc_libbuildversion.nix {})
    libbuildversion;

  inherit (callBPPackage "build/soong/cc/libbuildversion/tests" ./build_soong_cc_libbuildversion_tests.nix {})
    build_version_test build_version_test_defaults libbuild_version_test;

  inherit (callBPPackage "build/soong/cmd/dep_fixer" ./build_soong_cmd_dep_fixer.nix {})
    dep_fixer;

  inherit (callBPPackage "build/soong/cmd/diff_target_files" ./build_soong_cmd_diff_target_files.nix {})
    diff_target_files;

  inherit (callBPPackage "build/soong/cmd/extract_jar_packages" ./build_soong_cmd_extract_jar_packages.nix {})
    extract_jar_packages;

  inherit (callBPPackage "build/soong/cmd/extract_linker" ./build_soong_cmd_extract_linker.nix {})
    extract_linker;

  inherit (callBPPackage "build/soong/cmd/fileslist" ./build_soong_cmd_fileslist.nix {})
    fileslist;

  inherit (callBPPackage "build/soong/cmd/host_bionic_inject" ./build_soong_cmd_host_bionic_inject.nix {})
    host_bionic_inject;

  inherit (callBPPackage "build/soong/cmd/javac_wrapper" ./build_soong_cmd_javac_wrapper.nix {})
    soong_javac_wrapper;

  inherit (callBPPackage "build/soong/cmd/merge_zips" ./build_soong_cmd_merge_zips.nix {})
    merge_zips;

  inherit (callBPPackage "build/soong/cmd/multiproduct_kati" ./build_soong_cmd_multiproduct_kati.nix {})
    multiproduct_kati;

  inherit (callBPPackage "build/soong/cmd/path_interposer" ./build_soong_cmd_path_interposer.nix {})
    path_interposer;

  inherit (callBPPackage "build/soong/cmd/pom2bp" ./build_soong_cmd_pom2bp.nix {})
    pom2bp;

  inherit (callBPPackage "build/soong/cmd/pom2mk" ./build_soong_cmd_pom2mk.nix {})
    pom2mk;

  inherit (callBPPackage "build/soong/cmd/sbox" ./build_soong_cmd_sbox.nix {})
    sbox;

  inherit (callBPPackage "build/soong/cmd/soong_build" ./build_soong_cmd_soong_build.nix {})
    soong_build;

  inherit (callBPPackage "build/soong/cmd/soong_env" ./build_soong_cmd_soong_env.nix {})
    soong_env;

  inherit (callBPPackage "build/soong/cmd/soong_ui" ./build_soong_cmd_soong_ui.nix {})
    soong_ui;

  inherit (callBPPackage "build/soong/cmd/zip2zip" ./build_soong_cmd_zip2zip.nix {})
    zip2zip;

  inherit (callBPPackage "build/soong/cmd/zipsync" ./build_soong_cmd_zipsync.nix {})
    zipsync;

  inherit (callBPPackage "build/soong/dexpreopt" ./build_soong_dexpreopt.nix {})
    soong-dexpreopt;

  inherit (callBPPackage "build/soong/dexpreopt/dexpreopt_gen" ./build_soong_dexpreopt_dexpreopt_gen.nix {})
    dexpreopt_gen;

  inherit (callBPPackage "build/soong/finder" ./build_soong_finder.nix {})
    soong-finder;

  inherit (callBPPackage "build/soong/finder/cmd" ./build_soong_finder_cmd.nix {})
    finder;

  inherit (callBPPackage "build/soong/finder/fs" ./build_soong_finder_fs.nix {})
    soong-finder-fs;

  inherit (callBPPackage "build/soong/jar" ./build_soong_jar.nix {})
    soong-jar;

  inherit (callBPPackage "build/soong/makedeps" ./build_soong_makedeps.nix {})
    soong-makedeps;

  inherit (callBPPackage "build/soong/python/tests" ./build_soong_python_tests.nix {})
    par_test;

  inherit (callBPPackage "build/soong/symbol_inject" ./build_soong_symbol_inject.nix {})
    soong-symbol_inject;

  inherit (callBPPackage "build/soong/symbol_inject/cmd" ./build_soong_symbol_inject_cmd.nix {})
    symbol_inject;

  inherit (callBPPackage "build/soong/third_party/zip" ./build_soong_third_party_zip.nix {})
    android-archive-zip;

  inherit (callBPPackage "build/soong/ui/build" ./build_soong_ui_build.nix {})
    soong-ui-build soong-ui-build-paths;

  inherit (callBPPackage "build/soong/ui/logger" ./build_soong_ui_logger.nix {})
    soong-ui-logger;

  inherit (callBPPackage "build/soong/ui/metrics" ./build_soong_ui_metrics.nix {})
    soong-ui-metrics soong-ui-metrics_proto;

  inherit (callBPPackage "build/soong/ui/status" ./build_soong_ui_status.nix {})
    soong-ui-status soong-ui-status-ninja_frontend;

  inherit (callBPPackage "build/soong/ui/terminal" ./build_soong_ui_terminal.nix {})
    soong-ui-terminal;

  inherit (callBPPackage "build/soong/ui/tracer" ./build_soong_ui_tracer.nix {})
    soong-ui-tracer;

  inherit (callBPPackage "build/soong/zip" ./build_soong_zip.nix {})
    soong-zip;

  inherit (callBPPackage "build/soong/zip/cmd" ./build_soong_zip_cmd.nix {})
    soong_zip;

  inherit (callBPPackage "cts" ./cts.nix {})
    cts_defaults cts_error_prone_rules cts_error_prone_rules_tests cts_support_defaults;

  inherit (callBPPackage "cts/common/device-side/device-info" ./cts_common_device-side_device-info.nix {})
    compatibility-device-info;

  inherit (callBPPackage "cts/common/device-side/device-info/tests" ./cts_common_device-side_device-info_tests.nix {})
    compatibility-device-info-tests;

  inherit (callBPPackage "cts/common/device-side/nativetesthelper" ./cts_common_device-side_nativetesthelper.nix {})
    nativetesthelper;

  inherit (callBPPackage "cts/common/device-side/nativetesthelper/jni" ./cts_common_device-side_nativetesthelper_jni.nix {})
    libnativetesthelper_jni;

  inherit (callBPPackage "cts/common/device-side/preconditions" ./cts_common_device-side_preconditions.nix {})
    compatibility-device-preconditions;

  inherit (callBPPackage "cts/common/device-side/test-app" ./cts_common_device-side_test-app.nix {})
    CompatibilityTestApp;

  inherit (callBPPackage "cts/common/device-side/util-axt" ./cts_common_device-side_util-axt.nix {})
    compatibility-device-util-axt;

  inherit (callBPPackage "cts/common/device-side/util-axt/tests" ./cts_common_device-side_util-axt_tests.nix {})
    compatibility-device-util-tests-axt;

  inherit (callBPPackage "cts/common/device-side/util" ./cts_common_device-side_util.nix {})
    compatibility-device-util;

  inherit (callBPPackage "cts/common/device-side/util/jni" ./cts_common_device-side_util_jni.nix {})
    libcts_jni;

  inherit (callBPPackage "cts/common/device-side/util/tests" ./cts_common_device-side_util_tests.nix {})
    compatibility-device-util-tests;

  inherit (callBPPackage "cts/hostsidetests/apex" ./cts_hostsidetests_apex.nix {})
    CtsApexTestCases;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/certs" ./cts_hostsidetests_appsecurity_certs.nix {})
    cts-testkey1 cts-testkey2;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/certs/keysets" ./cts_hostsidetests_appsecurity_certs_keysets.nix {})
    cts-keyset-test-a cts-keyset-test-b cts-keyset-test-c cts-keyset-test-ec-a;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/AccessSerialLegacy" ./cts_hostsidetests_appsecurity_test-apps_AccessSerialLegacy.nix {})
    CtsAccessSerialLegacy;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/AccessSerialModern" ./cts_hostsidetests_appsecurity_test-apps_AccessSerialModern.nix {})
    CtsAccessSerialModern;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/AppAccessData" ./cts_hostsidetests_appsecurity_test-apps_AppAccessData.nix {})
    CtsAppAccessData;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/AppWithData" ./cts_hostsidetests_appsecurity_test-apps_AppWithData.nix {})
    CtsAppWithData;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/ApplicationVisibilityCrossUserApp" ./cts_hostsidetests_appsecurity_test-apps_ApplicationVisibilityCrossUserApp.nix {})
    CtsApplicationVisibilityCrossUserApp;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/DeclareNotRuntimePermissions" ./cts_hostsidetests_appsecurity_test-apps_DeclareNotRuntimePermissions.nix {})
    CtsDeclareNonRuntimePermissions;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/DeviceIdentifiers" ./cts_hostsidetests_appsecurity_test-apps_DeviceIdentifiers.nix {})
    CtsAccessDeviceIdentifiers;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/DocumentClient" ./cts_hostsidetests_appsecurity_test-apps_DocumentClient.nix {})
    CtsDocumentClient;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/DocumentProvider" ./cts_hostsidetests_appsecurity_test-apps_DocumentProvider.nix {})
    CtsDocumentProvider;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/EphemeralTestApp/EphemeralApp1" ./cts_hostsidetests_appsecurity_test-apps_EphemeralTestApp_EphemeralApp1.nix {})
    CtsEphemeralTestsEphemeralApp1;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/EphemeralTestApp/EphemeralApp2" ./cts_hostsidetests_appsecurity_test-apps_EphemeralTestApp_EphemeralApp2.nix {})
    CtsEphemeralTestsEphemeralApp2;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/EphemeralTestApp/ImplicitlyExposedApp" ./cts_hostsidetests_appsecurity_test-apps_EphemeralTestApp_ImplicitlyExposedApp.nix {})
    CtsEphemeralTestsImplicitApp;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/EphemeralTestApp/NormalApp" ./cts_hostsidetests_appsecurity_test-apps_EphemeralTestApp_NormalApp.nix {})
    CtsEphemeralTestsNormalApp;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/EphemeralTestApp/UnexposedApp" ./cts_hostsidetests_appsecurity_test-apps_EphemeralTestApp_UnexposedApp.nix {})
    CtsEphemeralTestsUnexposedApp;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/EphemeralTestApp/UserApp" ./cts_hostsidetests_appsecurity_test-apps_EphemeralTestApp_UserApp.nix {})
    CtsEphemeralTestsUserApp;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/EphemeralTestApp/UserAppTest" ./cts_hostsidetests_appsecurity_test-apps_EphemeralTestApp_UserAppTest.nix {})
    CtsEphemeralTestsUserAppTest;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/EphemeralTestApp/util" ./cts_hostsidetests_appsecurity_test-apps_EphemeralTestApp_util.nix {})
    cts-aia-util;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/EscalateToRuntimePermissions" ./cts_hostsidetests_appsecurity_test-apps_EscalateToRuntimePermissions.nix {})
    CtsEscalateToRuntimePermissions;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/ExternalStorageApp" ./cts_hostsidetests_appsecurity_test-apps_ExternalStorageApp.nix {})
    CtsExternalStorageApp CtsExternalStorageTestLib;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/InstantCookieApp" ./cts_hostsidetests_appsecurity_test-apps_InstantCookieApp.nix {})
    CtsInstantCookieApp;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/InstantCookieApp2" ./cts_hostsidetests_appsecurity_test-apps_InstantCookieApp2.nix {})
    CtsInstantCookieApp2;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/InstantUpgradeApp" ./cts_hostsidetests_appsecurity_test-apps_InstantUpgradeApp.nix {})
    CtsInstantUpgradeApp;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/InstrumentationAppDiffCert" ./cts_hostsidetests_appsecurity_test-apps_InstrumentationAppDiffCert.nix {})
    CtsInstrumentationAppDiffCert;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/MajorVersionApp/Version000000000000ffff" ./cts_hostsidetests_appsecurity_test-apps_MajorVersionApp_Version000000000000ffff.nix {})
    CtsMajorVersion000000000000ffff;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/MajorVersionApp/Version00000000ffffffff" ./cts_hostsidetests_appsecurity_test-apps_MajorVersionApp_Version00000000ffffffff.nix {})
    CtsMajorVersion00000000ffffffff;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/MajorVersionApp/Version000000ff00000000" ./cts_hostsidetests_appsecurity_test-apps_MajorVersionApp_Version000000ff00000000.nix {})
    CtsMajorVersion000000ff00000000;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/MajorVersionApp/Version000000ffffffffff" ./cts_hostsidetests_appsecurity_test-apps_MajorVersionApp_Version000000ffffffffff.nix {})
    CtsMajorVersion000000ffffffffff;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/MajorVersionApp/src-common" ./cts_hostsidetests_appsecurity_test-apps_MajorVersionApp_src-common.nix {})
    CtsMajorVersionCommon;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/MultiUserStorageApp" ./cts_hostsidetests_appsecurity_test-apps_MultiUserStorageApp.nix {})
    CtsMultiUserStorageApp;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/OrderedActivityApp" ./cts_hostsidetests_appsecurity_test-apps_OrderedActivityApp.nix {})
    CtsOrderedActivityApp;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/PackageAccessApp" ./cts_hostsidetests_appsecurity_test-apps_PackageAccessApp.nix {})
    CtsPkgAccessApp;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/PermissionDeclareApp" ./cts_hostsidetests_appsecurity_test-apps_PermissionDeclareApp.nix {})
    CtsPermissionDeclareApp;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/PermissionDeclareAppCompat" ./cts_hostsidetests_appsecurity_test-apps_PermissionDeclareAppCompat.nix {})
    CtsPermissionDeclareAppCompat;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/PermissionPolicy25" ./cts_hostsidetests_appsecurity_test-apps_PermissionPolicy25.nix {})
    CtsPermissionPolicyTest25;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/ReadExternalStorageApp" ./cts_hostsidetests_appsecurity_test-apps_ReadExternalStorageApp.nix {})
    CtsReadExternalStorageApp;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/ReviewPermissionHelper" ./cts_hostsidetests_appsecurity_test-apps_ReviewPermissionHelper.nix {})
    ReviewPermissionHelper;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/SharedUidInstall" ./cts_hostsidetests_appsecurity_test-apps_SharedUidInstall.nix {})
    CtsSharedUidInstall;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/SharedUidInstallDiffCert" ./cts_hostsidetests_appsecurity_test-apps_SharedUidInstallDiffCert.nix {})
    CtsSharedUidInstallDiffCert;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/SimpleAppInstall" ./cts_hostsidetests_appsecurity_test-apps_SimpleAppInstall.nix {})
    CtsSimpleAppInstall;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/SimpleAppInstallDiffCert" ./cts_hostsidetests_appsecurity_test-apps_SimpleAppInstallDiffCert.nix {})
    CtsSimpleAppInstallDiffCert;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/StorageApp" ./cts_hostsidetests_appsecurity_test-apps_StorageApp.nix {})
    CtsStorageAppLib;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/StorageStatsApp" ./cts_hostsidetests_appsecurity_test-apps_StorageStatsApp.nix {})
    CtsStorageStatsApp;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/TargetInstrumentationApp" ./cts_hostsidetests_appsecurity_test-apps_TargetInstrumentationApp.nix {})
    CtsTargetInstrumentationApp;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/V3SigningSchemeRotation" ./cts_hostsidetests_appsecurity_test-apps_V3SigningSchemeRotation.nix {})
    CtsV3SigningSchemeRotationTest;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/dummyime" ./cts_hostsidetests_appsecurity_test-apps_dummyime.nix {})
    CtsDummyIme;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/keysets/malBadKey" ./cts_hostsidetests_appsecurity_test-apps_keysets_malBadKey.nix {})
    CtsKeySetSigningABadUpgradeB;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/keysets/malNoDef" ./cts_hostsidetests_appsecurity_test-apps_keysets_malNoDef.nix {})
    CtsKeySetSigningANoDefUpgradeB;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/keysets/malOneDef" ./cts_hostsidetests_appsecurity_test-apps_keysets_malOneDef.nix {})
    CtsKeySetSigningCBadAUpgradeAB;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/keysets/permDef" ./cts_hostsidetests_appsecurity_test-apps_keysets_permDef.nix {})
    CtsKeySetPermDefSigningA CtsKeySetPermDefSigningB;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/keysets/permUse" ./cts_hostsidetests_appsecurity_test-apps_keysets_permUse.nix {})
    CtsKeySetPermUseSigningA CtsKeySetPermUseSigningB;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/keysets/testApp" ./cts_hostsidetests_appsecurity_test-apps_keysets_testApp.nix {})
    CtsKeySetTestApp;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/keysets/uA" ./cts_hostsidetests_appsecurity_test-apps_keysets_uA.nix {})
    CtsKeySetSigningAAndBUpgradeA CtsKeySetSigningAUpgradeA CtsKeySetSigningBUpgradeA CtsKeySetSigningEcAUpgradeA;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/keysets/uAB" ./cts_hostsidetests_appsecurity_test-apps_keysets_uAB.nix {})
    CtsKeySetSigningAUpgradeAAndB;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/keysets/uAuB" ./cts_hostsidetests_appsecurity_test-apps_keysets_uAuB.nix {})
    CtsKeySetSigningAUpgradeAOrB;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/keysets/uB" ./cts_hostsidetests_appsecurity_test-apps_keysets_uB.nix {})
    CtsKeySetSigningAAndCUpgradeB CtsKeySetSigningAUpgradeB CtsKeySetSigningBUpgradeB;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/keysets/uBsharedUser" ./cts_hostsidetests_appsecurity_test-apps_keysets_uBsharedUser.nix {})
    CtsKeySetSharedUserSigningAUpgradeB CtsKeySetSharedUserSigningBUpgradeB;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/keysets/uEcA" ./cts_hostsidetests_appsecurity_test-apps_keysets_uEcA.nix {})
    CtsKeySetSigningAUpgradeEcA;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/keysets/uNone" ./cts_hostsidetests_appsecurity_test-apps_keysets_uNone.nix {})
    CtsKeySetSigningAUpgradeNone;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/rro/OverlayAll" ./cts_hostsidetests_appsecurity_test-apps_rro_OverlayAll.nix {})
    CtsOverlayPolicyAll CtsOverlayPolicyAllNoName CtsOverlayPolicyAllNoNameDifferentCert CtsOverlayPolicyAllPie;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/rro/OverlayAndroid" ./cts_hostsidetests_appsecurity_test-apps_rro_OverlayAndroid.nix {})
    CtsOverlayAndroid;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/rro/OverlayApp" ./cts_hostsidetests_appsecurity_test-apps_rro_OverlayApp.nix {})
    CtsOverlayApp;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/rro/OverlayPolicyProduct" ./cts_hostsidetests_appsecurity_test-apps_rro_OverlayPolicyProduct.nix {})
    CtsOverlayPolicyProduct;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/rro/OverlayPolicySignatureDifferent" ./cts_hostsidetests_appsecurity_test-apps_rro_OverlayPolicySignatureDifferent.nix {})
    CtsOverlayPolicySignatureDifferent;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/rro/OverlayPolicySystem" ./cts_hostsidetests_appsecurity_test-apps_rro_OverlayPolicySystem.nix {})
    CtsOverlayPolicySystem;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/rro/OverlayPolicyVendor" ./cts_hostsidetests_appsecurity_test-apps_rro_OverlayPolicyVendor.nix {})
    CtsOverlayPolicyVendor;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/rro/OverlayTarget" ./cts_hostsidetests_appsecurity_test-apps_rro_OverlayTarget.nix {})
    CtsOverlayTarget CtsOverlayTargetNoOverlayable;

  inherit (callBPPackage "cts/hostsidetests/appsecurity/test-apps/tinyapp" ./cts_hostsidetests_appsecurity_test-apps_tinyapp.nix {})
    CtsPkgInstallTinyApp;

  inherit (callBPPackage "cts/hostsidetests/backup/RestoreSessionTest" ./cts_hostsidetests_backup_RestoreSessionTest.nix {})
    CtsRestoreSessionApp;

  inherit (callBPPackage "cts/hostsidetests/backup/restoresessionapp1" ./cts_hostsidetests_backup_restoresessionapp1.nix {})
    CtsRestoreSessionApp1;

  inherit (callBPPackage "cts/hostsidetests/backup/restoresessionapp2" ./cts_hostsidetests_backup_restoresessionapp2.nix {})
    CtsRestoreSessionApp2;

  inherit (callBPPackage "cts/hostsidetests/backup/restoresessionapp3" ./cts_hostsidetests_backup_restoresessionapp3.nix {})
    CtsRestoreSessionApp3;

  inherit (callBPPackage "cts/hostsidetests/classloaders/splits" ./cts_hostsidetests_classloaders_splits.nix {})
    CtsClassloaderSplitsHostTestCases;

  inherit (callBPPackage "cts/hostsidetests/classloaders/splits/apps" ./cts_hostsidetests_classloaders_splits_apps.nix {})
    CtsClassloaderSplitApp;

  inherit (callBPPackage "cts/hostsidetests/classloaders/splits/apps/feature_a" ./cts_hostsidetests_classloaders_splits_apps_feature_a.nix {})
    CtsClassloaderSplitAppFeatureA;

  inherit (callBPPackage "cts/hostsidetests/classloaders/splits/apps/feature_b" ./cts_hostsidetests_classloaders_splits_apps_feature_b.nix {})
    CtsClassloaderSplitAppFeatureB;

  inherit (callBPPackage "cts/hostsidetests/classloaders/useslibrary" ./cts_hostsidetests_classloaders_useslibrary.nix {})
    CtsUsesLibraryHostTestCases;

  inherit (callBPPackage "cts/hostsidetests/classloaders/useslibrary/app" ./cts_hostsidetests_classloaders_useslibrary_app.nix {})
    CtsUsesLibraryApp;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/AccountCheck" ./cts_hostsidetests_devicepolicy_app_AccountCheck.nix {})
    CtsAccountCheckNonTestOnlyOwnerApp CtsAccountCheckTestOnlyOwnerApp CtsAccountCheckTestOnlyOwnerUpdateApp;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/AccountCheck/Auth" ./cts_hostsidetests_devicepolicy_app_AccountCheck_Auth.nix {})
    CtsAccountCheckAuthApp;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/AccountCheck/Tester" ./cts_hostsidetests_devicepolicy_app_AccountCheck_Tester.nix {})
    CtsAccountCheckAuthAppTester;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/AccountManagement" ./cts_hostsidetests_devicepolicy_app_AccountManagement.nix {})
    CtsAccountManagementDevicePolicyApp;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/AppRestrictionsTargetApp" ./cts_hostsidetests_devicepolicy_app_AppRestrictionsTargetApp.nix {})
    CtsAppRestrictionsTargetApp;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/Assistant" ./cts_hostsidetests_devicepolicy_app_Assistant.nix {})
    CtsDevicePolicyAssistApp;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/AutofillApp" ./cts_hostsidetests_devicepolicy_app_AutofillApp.nix {})
    CtsDevicePolicyAutofillApp;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/CertInstaller" ./cts_hostsidetests_devicepolicy_app_CertInstaller.nix {})
    CtsCertInstallerApp;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/ContactDirectoryProvider" ./cts_hostsidetests_devicepolicy_app_ContactDirectoryProvider.nix {})
    CtsContactDirectoryProvider;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/ContentCaptureApp" ./cts_hostsidetests_devicepolicy_app_ContentCaptureApp.nix {})
    CtsDevicePolicyContentCaptureApp;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/ContentCaptureService" ./cts_hostsidetests_devicepolicy_app_ContentCaptureService.nix {})
    CtsDevicePolicyContentCaptureService;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/CorpOwnedManagedProfile" ./cts_hostsidetests_devicepolicy_app_CorpOwnedManagedProfile.nix {})
    CtsCorpOwnedManagedProfile CtsCorpOwnedManagedProfile2;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/CrossProfileAppsTest" ./cts_hostsidetests_devicepolicy_app_CrossProfileAppsTest.nix {})
    CtsCrossProfileAppsTests;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/CustomizationApp" ./cts_hostsidetests_devicepolicy_app_CustomizationApp.nix {})
    CtsCustomizationApp;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/DelegateApp" ./cts_hostsidetests_devicepolicy_app_DelegateApp.nix {})
    CtsDelegateApp;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/DeviceAdmin" ./cts_hostsidetests_devicepolicy_app_DeviceAdmin.nix {})
    CtsDeviceAdminApp23 CtsDeviceAdminApp24 CtsDeviceAdminApp29;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/DeviceAdminService" ./cts_hostsidetests_devicepolicy_app_DeviceAdminService.nix {})
    CtsDeviceAdminService1 CtsDeviceAdminService2 CtsDeviceAdminService3 CtsDeviceAdminService4 CtsDeviceAdminServiceB;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/DeviceAndProfileOwner" ./cts_hostsidetests_devicepolicy_app_DeviceAndProfileOwner.nix {})
    CtsDeviceAndProfileOwnerApp CtsDeviceAndProfileOwnerApp23 CtsDeviceAndProfileOwnerApp25;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/DeviceOwner" ./cts_hostsidetests_devicepolicy_app_DeviceOwner.nix {})
    CtsDeviceOwnerApp;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/HasLauncherActivityApp" ./cts_hostsidetests_devicepolicy_app_HasLauncherActivityApp.nix {})
    CtsHasLauncherActivityApp CtsNoLauncherActivityApp CtsNoPermissionApp;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/IntentReceiver" ./cts_hostsidetests_devicepolicy_app_IntentReceiver.nix {})
    CtsIntentReceiverApp;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/IntentSender" ./cts_hostsidetests_devicepolicy_app_IntentSender.nix {})
    CtsIntentSenderApp;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/LauncherTestsSupport" ./cts_hostsidetests_devicepolicy_app_LauncherTestsSupport.nix {})
    CtsLauncherAppsTestsSupport;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/ManagedProfile" ./cts_hostsidetests_devicepolicy_app_ManagedProfile.nix {})
    CtsManagedProfileApp;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/MeteredDataTestApp" ./cts_hostsidetests_devicepolicy_app_MeteredDataTestApp.nix {})
    CtsMeteredDataTestApp;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/NotificationSender" ./cts_hostsidetests_devicepolicy_app_NotificationSender.nix {})
    CtsNotificationSenderApp;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/PackageInstaller" ./cts_hostsidetests_devicepolicy_app_PackageInstaller.nix {})
    CtsPackageInstallerApp;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/PasswordComplexity" ./cts_hostsidetests_devicepolicy_app_PasswordComplexity.nix {})
    CtsPasswordComplexity;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/PrintingApp" ./cts_hostsidetests_devicepolicy_app_PrintingApp.nix {})
    CtsDevicePolicyPrintingApp;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/ProfileOwner" ./cts_hostsidetests_devicepolicy_app_ProfileOwner.nix {})
    CtsProfileOwnerApp;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/SimpleApp" ./cts_hostsidetests_devicepolicy_app_SimpleApp.nix {})
    CtsSimpleApp;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/SimplePreMApp" ./cts_hostsidetests_devicepolicy_app_SimplePreMApp.nix {})
    CtsSimplePreMApp;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/SingleAdminApp" ./cts_hostsidetests_devicepolicy_app_SingleAdminApp.nix {})
    CtsDevicePolicySingleAdminTestApp;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/TransferOwnerIncomingApp" ./cts_hostsidetests_devicepolicy_app_TransferOwnerIncomingApp.nix {})
    CtsTransferOwnerIncomingApp;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/TransferOwnerOutgoingApp" ./cts_hostsidetests_devicepolicy_app_TransferOwnerOutgoingApp.nix {})
    CtsTransferOwnerOutgoingApp;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/WidgetProvider" ./cts_hostsidetests_devicepolicy_app_WidgetProvider.nix {})
    CtsWidgetProviderApp;

  inherit (callBPPackage "cts/hostsidetests/devicepolicy/app/WifiConfigCreator" ./cts_hostsidetests_devicepolicy_app_WifiConfigCreator.nix {})
    CtsWifiConfigCreator;

  inherit (callBPPackage "cts/hostsidetests/jdwptunnel" ./cts_hostsidetests_jdwptunnel.nix {})
    CtsJdwpTunnelHostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jdwptunnel/sampleapp" ./cts_hostsidetests_jdwptunnel_sampleapp.nix {})
    CtsJdwpTunnelSampleApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/allocation-tracking" ./cts_hostsidetests_jvmti_allocation-tracking.nix {})
    CtsJvmtiTrackingHostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/allocation-tracking/app" ./cts_hostsidetests_jvmti_allocation-tracking_app.nix {})
    CtsJvmtiTrackingDeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/attaching" ./cts_hostsidetests_jvmti_attaching.nix {})
    CtsJvmtiAttachingDeviceApp CtsJvmtiAttachingHostTestCases libctsjvmtiattachagent;

  inherit (callBPPackage "cts/hostsidetests/jvmti/base/app" ./cts_hostsidetests_jvmti_base_app.nix {})
    CtsJvmtiDeviceAppBase;

  inherit (callBPPackage "cts/hostsidetests/jvmti/base/host" ./cts_hostsidetests_jvmti_base_host.nix {})
    CtsJvmtiHostTestBase;

  inherit (callBPPackage "cts/hostsidetests/jvmti/base/jni" ./cts_hostsidetests_jvmti_base_jni.nix {})
    libctsjvmtiagent;

  inherit (callBPPackage "cts/hostsidetests/jvmti/base/run-test-based-app" ./cts_hostsidetests_jvmti_base_run-test-based-app.nix {})
    CtsJvmtiDeviceRunTestAppBase;

  inherit (callBPPackage "cts/hostsidetests/jvmti/redefining" ./cts_hostsidetests_jvmti_redefining.nix {})
    CtsJvmtiRedefineClassesHostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/redefining/app" ./cts_hostsidetests_jvmti_redefining_app.nix {})
    CtsJvmtiRedefineClassesDeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests" ./cts_hostsidetests_jvmti_run-tests.nix {})
    cts-run-jvmti-defaults;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1900" ./cts_hostsidetests_jvmti_run-tests_test-1900.nix {})
    CtsJvmtiRunTest1900HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1900/app" ./cts_hostsidetests_jvmti_run-tests_test-1900_app.nix {})
    CtsJvmtiRunTest1900DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1901" ./cts_hostsidetests_jvmti_run-tests_test-1901.nix {})
    CtsJvmtiRunTest1901HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1901/app" ./cts_hostsidetests_jvmti_run-tests_test-1901_app.nix {})
    CtsJvmtiRunTest1901DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1902" ./cts_hostsidetests_jvmti_run-tests_test-1902.nix {})
    CtsJvmtiRunTest1902HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1902/app" ./cts_hostsidetests_jvmti_run-tests_test-1902_app.nix {})
    CtsJvmtiRunTest1902DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1903" ./cts_hostsidetests_jvmti_run-tests_test-1903.nix {})
    CtsJvmtiRunTest1903HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1903/app" ./cts_hostsidetests_jvmti_run-tests_test-1903_app.nix {})
    CtsJvmtiRunTest1903DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1904" ./cts_hostsidetests_jvmti_run-tests_test-1904.nix {})
    CtsJvmtiRunTest1904HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1904/app" ./cts_hostsidetests_jvmti_run-tests_test-1904_app.nix {})
    CtsJvmtiRunTest1904DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1906" ./cts_hostsidetests_jvmti_run-tests_test-1906.nix {})
    CtsJvmtiRunTest1906HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1906/app" ./cts_hostsidetests_jvmti_run-tests_test-1906_app.nix {})
    CtsJvmtiRunTest1906DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1907" ./cts_hostsidetests_jvmti_run-tests_test-1907.nix {})
    CtsJvmtiRunTest1907HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1907/app" ./cts_hostsidetests_jvmti_run-tests_test-1907_app.nix {})
    CtsJvmtiRunTest1907DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1908" ./cts_hostsidetests_jvmti_run-tests_test-1908.nix {})
    CtsJvmtiRunTest1908HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1908/app" ./cts_hostsidetests_jvmti_run-tests_test-1908_app.nix {})
    CtsJvmtiRunTest1908DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1909" ./cts_hostsidetests_jvmti_run-tests_test-1909.nix {})
    CtsJvmtiRunTest1909HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1909/app" ./cts_hostsidetests_jvmti_run-tests_test-1909_app.nix {})
    CtsJvmtiRunTest1909DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1910" ./cts_hostsidetests_jvmti_run-tests_test-1910.nix {})
    CtsJvmtiRunTest1910HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1910/app" ./cts_hostsidetests_jvmti_run-tests_test-1910_app.nix {})
    CtsJvmtiRunTest1910DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1911" ./cts_hostsidetests_jvmti_run-tests_test-1911.nix {})
    CtsJvmtiRunTest1911HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1911/app" ./cts_hostsidetests_jvmti_run-tests_test-1911_app.nix {})
    CtsJvmtiRunTest1911DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1912" ./cts_hostsidetests_jvmti_run-tests_test-1912.nix {})
    CtsJvmtiRunTest1912HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1912/app" ./cts_hostsidetests_jvmti_run-tests_test-1912_app.nix {})
    CtsJvmtiRunTest1912DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1913" ./cts_hostsidetests_jvmti_run-tests_test-1913.nix {})
    CtsJvmtiRunTest1913HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1913/app" ./cts_hostsidetests_jvmti_run-tests_test-1913_app.nix {})
    CtsJvmtiRunTest1913DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1914" ./cts_hostsidetests_jvmti_run-tests_test-1914.nix {})
    CtsJvmtiRunTest1914HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1914/app" ./cts_hostsidetests_jvmti_run-tests_test-1914_app.nix {})
    CtsJvmtiRunTest1914DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1915" ./cts_hostsidetests_jvmti_run-tests_test-1915.nix {})
    CtsJvmtiRunTest1915HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1915/app" ./cts_hostsidetests_jvmti_run-tests_test-1915_app.nix {})
    CtsJvmtiRunTest1915DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1916" ./cts_hostsidetests_jvmti_run-tests_test-1916.nix {})
    CtsJvmtiRunTest1916HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1916/app" ./cts_hostsidetests_jvmti_run-tests_test-1916_app.nix {})
    CtsJvmtiRunTest1916DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1917" ./cts_hostsidetests_jvmti_run-tests_test-1917.nix {})
    CtsJvmtiRunTest1917HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1917/app" ./cts_hostsidetests_jvmti_run-tests_test-1917_app.nix {})
    CtsJvmtiRunTest1917DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1920" ./cts_hostsidetests_jvmti_run-tests_test-1920.nix {})
    CtsJvmtiRunTest1920HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1920/app" ./cts_hostsidetests_jvmti_run-tests_test-1920_app.nix {})
    CtsJvmtiRunTest1920DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1921" ./cts_hostsidetests_jvmti_run-tests_test-1921.nix {})
    CtsJvmtiRunTest1921HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1921/app" ./cts_hostsidetests_jvmti_run-tests_test-1921_app.nix {})
    CtsJvmtiRunTest1921DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1922" ./cts_hostsidetests_jvmti_run-tests_test-1922.nix {})
    CtsJvmtiRunTest1922HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1922/app" ./cts_hostsidetests_jvmti_run-tests_test-1922_app.nix {})
    CtsJvmtiRunTest1922DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1923" ./cts_hostsidetests_jvmti_run-tests_test-1923.nix {})
    CtsJvmtiRunTest1923HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1923/app" ./cts_hostsidetests_jvmti_run-tests_test-1923_app.nix {})
    CtsJvmtiRunTest1923DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1924" ./cts_hostsidetests_jvmti_run-tests_test-1924.nix {})
    CtsJvmtiRunTest1924HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1924/app" ./cts_hostsidetests_jvmti_run-tests_test-1924_app.nix {})
    CtsJvmtiRunTest1924DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1925" ./cts_hostsidetests_jvmti_run-tests_test-1925.nix {})
    CtsJvmtiRunTest1925HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1925/app" ./cts_hostsidetests_jvmti_run-tests_test-1925_app.nix {})
    CtsJvmtiRunTest1925DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1926" ./cts_hostsidetests_jvmti_run-tests_test-1926.nix {})
    CtsJvmtiRunTest1926HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1926/app" ./cts_hostsidetests_jvmti_run-tests_test-1926_app.nix {})
    CtsJvmtiRunTest1926DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1927" ./cts_hostsidetests_jvmti_run-tests_test-1927.nix {})
    CtsJvmtiRunTest1927HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1927/app" ./cts_hostsidetests_jvmti_run-tests_test-1927_app.nix {})
    CtsJvmtiRunTest1927DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1928" ./cts_hostsidetests_jvmti_run-tests_test-1928.nix {})
    CtsJvmtiRunTest1928HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1928/app" ./cts_hostsidetests_jvmti_run-tests_test-1928_app.nix {})
    CtsJvmtiRunTest1928DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1930" ./cts_hostsidetests_jvmti_run-tests_test-1930.nix {})
    CtsJvmtiRunTest1930HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1930/app" ./cts_hostsidetests_jvmti_run-tests_test-1930_app.nix {})
    CtsJvmtiRunTest1930DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1931" ./cts_hostsidetests_jvmti_run-tests_test-1931.nix {})
    CtsJvmtiRunTest1931HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1931/app" ./cts_hostsidetests_jvmti_run-tests_test-1931_app.nix {})
    CtsJvmtiRunTest1931DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1932" ./cts_hostsidetests_jvmti_run-tests_test-1932.nix {})
    CtsJvmtiRunTest1932HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1932/app" ./cts_hostsidetests_jvmti_run-tests_test-1932_app.nix {})
    CtsJvmtiRunTest1932DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1933" ./cts_hostsidetests_jvmti_run-tests_test-1933.nix {})
    CtsJvmtiRunTest1933HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1933/app" ./cts_hostsidetests_jvmti_run-tests_test-1933_app.nix {})
    CtsJvmtiRunTest1933DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1934" ./cts_hostsidetests_jvmti_run-tests_test-1934.nix {})
    CtsJvmtiRunTest1934HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1934/app" ./cts_hostsidetests_jvmti_run-tests_test-1934_app.nix {})
    CtsJvmtiRunTest1934DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1936" ./cts_hostsidetests_jvmti_run-tests_test-1936.nix {})
    CtsJvmtiRunTest1936HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1936/app" ./cts_hostsidetests_jvmti_run-tests_test-1936_app.nix {})
    CtsJvmtiRunTest1936DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1937" ./cts_hostsidetests_jvmti_run-tests_test-1937.nix {})
    CtsJvmtiRunTest1937HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1937/app" ./cts_hostsidetests_jvmti_run-tests_test-1937_app.nix {})
    CtsJvmtiRunTest1937DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1939" ./cts_hostsidetests_jvmti_run-tests_test-1939.nix {})
    CtsJvmtiRunTest1939HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1939/app" ./cts_hostsidetests_jvmti_run-tests_test-1939_app.nix {})
    CtsJvmtiRunTest1939DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1941" ./cts_hostsidetests_jvmti_run-tests_test-1941.nix {})
    CtsJvmtiRunTest1941HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1941/app" ./cts_hostsidetests_jvmti_run-tests_test-1941_app.nix {})
    CtsJvmtiRunTest1941DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1942" ./cts_hostsidetests_jvmti_run-tests_test-1942.nix {})
    CtsJvmtiRunTest1942HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1942/app" ./cts_hostsidetests_jvmti_run-tests_test-1942_app.nix {})
    CtsJvmtiRunTest1942DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1943" ./cts_hostsidetests_jvmti_run-tests_test-1943.nix {})
    CtsJvmtiRunTest1943HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1943/app" ./cts_hostsidetests_jvmti_run-tests_test-1943_app.nix {})
    CtsJvmtiRunTest1943DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1953" ./cts_hostsidetests_jvmti_run-tests_test-1953.nix {})
    CtsJvmtiRunTest1953HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1953/app" ./cts_hostsidetests_jvmti_run-tests_test-1953_app.nix {})
    CtsJvmtiRunTest1953DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1958" ./cts_hostsidetests_jvmti_run-tests_test-1958.nix {})
    CtsJvmtiRunTest1958HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-1958/app" ./cts_hostsidetests_jvmti_run-tests_test-1958_app.nix {})
    CtsJvmtiRunTest1958DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-902" ./cts_hostsidetests_jvmti_run-tests_test-902.nix {})
    CtsJvmtiRunTest902HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-902/app" ./cts_hostsidetests_jvmti_run-tests_test-902_app.nix {})
    CtsJvmtiRunTest902DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-903" ./cts_hostsidetests_jvmti_run-tests_test-903.nix {})
    CtsJvmtiRunTest903HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-903/app" ./cts_hostsidetests_jvmti_run-tests_test-903_app.nix {})
    CtsJvmtiRunTest903DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-904" ./cts_hostsidetests_jvmti_run-tests_test-904.nix {})
    CtsJvmtiRunTest904HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-904/app" ./cts_hostsidetests_jvmti_run-tests_test-904_app.nix {})
    CtsJvmtiRunTest904DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-905" ./cts_hostsidetests_jvmti_run-tests_test-905.nix {})
    CtsJvmtiRunTest905HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-905/app" ./cts_hostsidetests_jvmti_run-tests_test-905_app.nix {})
    CtsJvmtiRunTest905DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-906" ./cts_hostsidetests_jvmti_run-tests_test-906.nix {})
    CtsJvmtiRunTest906HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-906/app" ./cts_hostsidetests_jvmti_run-tests_test-906_app.nix {})
    CtsJvmtiRunTest906DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-907" ./cts_hostsidetests_jvmti_run-tests_test-907.nix {})
    CtsJvmtiRunTest907HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-907/app" ./cts_hostsidetests_jvmti_run-tests_test-907_app.nix {})
    CtsJvmtiRunTest907DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-908" ./cts_hostsidetests_jvmti_run-tests_test-908.nix {})
    CtsJvmtiRunTest908HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-908/app" ./cts_hostsidetests_jvmti_run-tests_test-908_app.nix {})
    CtsJvmtiRunTest908DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-910" ./cts_hostsidetests_jvmti_run-tests_test-910.nix {})
    CtsJvmtiRunTest910HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-910/app" ./cts_hostsidetests_jvmti_run-tests_test-910_app.nix {})
    CtsJvmtiRunTest910DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-911" ./cts_hostsidetests_jvmti_run-tests_test-911.nix {})
    CtsJvmtiRunTest911HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-911/app" ./cts_hostsidetests_jvmti_run-tests_test-911_app.nix {})
    CtsJvmtiRunTest911DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-912" ./cts_hostsidetests_jvmti_run-tests_test-912.nix {})
    CtsJvmtiRunTest912HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-912/app" ./cts_hostsidetests_jvmti_run-tests_test-912_app.nix {})
    CtsJvmtiRunTest912DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-913" ./cts_hostsidetests_jvmti_run-tests_test-913.nix {})
    CtsJvmtiRunTest913HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-913/app" ./cts_hostsidetests_jvmti_run-tests_test-913_app.nix {})
    CtsJvmtiRunTest913DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-914" ./cts_hostsidetests_jvmti_run-tests_test-914.nix {})
    CtsJvmtiRunTest914HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-914/app" ./cts_hostsidetests_jvmti_run-tests_test-914_app.nix {})
    CtsJvmtiRunTest914DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-915" ./cts_hostsidetests_jvmti_run-tests_test-915.nix {})
    CtsJvmtiRunTest915HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-915/app" ./cts_hostsidetests_jvmti_run-tests_test-915_app.nix {})
    CtsJvmtiRunTest915DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-917" ./cts_hostsidetests_jvmti_run-tests_test-917.nix {})
    CtsJvmtiRunTest917HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-917/app" ./cts_hostsidetests_jvmti_run-tests_test-917_app.nix {})
    CtsJvmtiRunTest917DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-918" ./cts_hostsidetests_jvmti_run-tests_test-918.nix {})
    CtsJvmtiRunTest918HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-918/app" ./cts_hostsidetests_jvmti_run-tests_test-918_app.nix {})
    CtsJvmtiRunTest918DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-919" ./cts_hostsidetests_jvmti_run-tests_test-919.nix {})
    CtsJvmtiRunTest919HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-919/app" ./cts_hostsidetests_jvmti_run-tests_test-919_app.nix {})
    CtsJvmtiRunTest919DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-920" ./cts_hostsidetests_jvmti_run-tests_test-920.nix {})
    CtsJvmtiRunTest920HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-920/app" ./cts_hostsidetests_jvmti_run-tests_test-920_app.nix {})
    CtsJvmtiRunTest920DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-922" ./cts_hostsidetests_jvmti_run-tests_test-922.nix {})
    CtsJvmtiRunTest922HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-922/app" ./cts_hostsidetests_jvmti_run-tests_test-922_app.nix {})
    CtsJvmtiRunTest922DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-923" ./cts_hostsidetests_jvmti_run-tests_test-923.nix {})
    CtsJvmtiRunTest923HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-923/app" ./cts_hostsidetests_jvmti_run-tests_test-923_app.nix {})
    CtsJvmtiRunTest923DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-924" ./cts_hostsidetests_jvmti_run-tests_test-924.nix {})
    CtsJvmtiRunTest924HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-924/app" ./cts_hostsidetests_jvmti_run-tests_test-924_app.nix {})
    CtsJvmtiRunTest924DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-926" ./cts_hostsidetests_jvmti_run-tests_test-926.nix {})
    CtsJvmtiRunTest926HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-926/app" ./cts_hostsidetests_jvmti_run-tests_test-926_app.nix {})
    CtsJvmtiRunTest926DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-927" ./cts_hostsidetests_jvmti_run-tests_test-927.nix {})
    CtsJvmtiRunTest927HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-927/app" ./cts_hostsidetests_jvmti_run-tests_test-927_app.nix {})
    CtsJvmtiRunTest927DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-928" ./cts_hostsidetests_jvmti_run-tests_test-928.nix {})
    CtsJvmtiRunTest928HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-928/app" ./cts_hostsidetests_jvmti_run-tests_test-928_app.nix {})
    CtsJvmtiRunTest928DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-930" ./cts_hostsidetests_jvmti_run-tests_test-930.nix {})
    CtsJvmtiRunTest930HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-930/app" ./cts_hostsidetests_jvmti_run-tests_test-930_app.nix {})
    CtsJvmtiRunTest930DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-931" ./cts_hostsidetests_jvmti_run-tests_test-931.nix {})
    CtsJvmtiRunTest931HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-931/app" ./cts_hostsidetests_jvmti_run-tests_test-931_app.nix {})
    CtsJvmtiRunTest931DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-932" ./cts_hostsidetests_jvmti_run-tests_test-932.nix {})
    CtsJvmtiRunTest932HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-932/app" ./cts_hostsidetests_jvmti_run-tests_test-932_app.nix {})
    CtsJvmtiRunTest932DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-940" ./cts_hostsidetests_jvmti_run-tests_test-940.nix {})
    CtsJvmtiRunTest940HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-940/app" ./cts_hostsidetests_jvmti_run-tests_test-940_app.nix {})
    CtsJvmtiRunTest940DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-942" ./cts_hostsidetests_jvmti_run-tests_test-942.nix {})
    CtsJvmtiRunTest942HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-942/app" ./cts_hostsidetests_jvmti_run-tests_test-942_app.nix {})
    CtsJvmtiRunTest942DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-944" ./cts_hostsidetests_jvmti_run-tests_test-944.nix {})
    CtsJvmtiRunTest944HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-944/app" ./cts_hostsidetests_jvmti_run-tests_test-944_app.nix {})
    CtsJvmtiRunTest944DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-945" ./cts_hostsidetests_jvmti_run-tests_test-945.nix {})
    CtsJvmtiRunTest945HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-945/app" ./cts_hostsidetests_jvmti_run-tests_test-945_app.nix {})
    CtsJvmtiRunTest945DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-947" ./cts_hostsidetests_jvmti_run-tests_test-947.nix {})
    CtsJvmtiRunTest947HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-947/app" ./cts_hostsidetests_jvmti_run-tests_test-947_app.nix {})
    CtsJvmtiRunTest947DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-951" ./cts_hostsidetests_jvmti_run-tests_test-951.nix {})
    CtsJvmtiRunTest951HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-951/app" ./cts_hostsidetests_jvmti_run-tests_test-951_app.nix {})
    CtsJvmtiRunTest951DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-982" ./cts_hostsidetests_jvmti_run-tests_test-982.nix {})
    CtsJvmtiRunTest982HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-982/app" ./cts_hostsidetests_jvmti_run-tests_test-982_app.nix {})
    CtsJvmtiRunTest982DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-983" ./cts_hostsidetests_jvmti_run-tests_test-983.nix {})
    CtsJvmtiRunTest983HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-983/app" ./cts_hostsidetests_jvmti_run-tests_test-983_app.nix {})
    CtsJvmtiRunTest983DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-984" ./cts_hostsidetests_jvmti_run-tests_test-984.nix {})
    CtsJvmtiRunTest984HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-984/app" ./cts_hostsidetests_jvmti_run-tests_test-984_app.nix {})
    CtsJvmtiRunTest984DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-985" ./cts_hostsidetests_jvmti_run-tests_test-985.nix {})
    CtsJvmtiRunTest985HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-985/app" ./cts_hostsidetests_jvmti_run-tests_test-985_app.nix {})
    CtsJvmtiRunTest985DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-986" ./cts_hostsidetests_jvmti_run-tests_test-986.nix {})
    CtsJvmtiRunTest986HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-986/app" ./cts_hostsidetests_jvmti_run-tests_test-986_app.nix {})
    CtsJvmtiRunTest986DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-988" ./cts_hostsidetests_jvmti_run-tests_test-988.nix {})
    CtsJvmtiRunTest988HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-988/app" ./cts_hostsidetests_jvmti_run-tests_test-988_app.nix {})
    CtsJvmtiRunTest988DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-989" ./cts_hostsidetests_jvmti_run-tests_test-989.nix {})
    CtsJvmtiRunTest989HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-989/app" ./cts_hostsidetests_jvmti_run-tests_test-989_app.nix {})
    CtsJvmtiRunTest989DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-990" ./cts_hostsidetests_jvmti_run-tests_test-990.nix {})
    CtsJvmtiRunTest990HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-990/app" ./cts_hostsidetests_jvmti_run-tests_test-990_app.nix {})
    CtsJvmtiRunTest990DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-991" ./cts_hostsidetests_jvmti_run-tests_test-991.nix {})
    CtsJvmtiRunTest991HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-991/app" ./cts_hostsidetests_jvmti_run-tests_test-991_app.nix {})
    CtsJvmtiRunTest991DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-992" ./cts_hostsidetests_jvmti_run-tests_test-992.nix {})
    CtsJvmtiRunTest992HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-992/app" ./cts_hostsidetests_jvmti_run-tests_test-992_app.nix {})
    CtsJvmtiRunTest992DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-993" ./cts_hostsidetests_jvmti_run-tests_test-993.nix {})
    CtsJvmtiRunTest993HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-993/app" ./cts_hostsidetests_jvmti_run-tests_test-993_app.nix {})
    CtsJvmtiRunTest993DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-994" ./cts_hostsidetests_jvmti_run-tests_test-994.nix {})
    CtsJvmtiRunTest994HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-994/app" ./cts_hostsidetests_jvmti_run-tests_test-994_app.nix {})
    CtsJvmtiRunTest994DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-995" ./cts_hostsidetests_jvmti_run-tests_test-995.nix {})
    CtsJvmtiRunTest995HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-995/app" ./cts_hostsidetests_jvmti_run-tests_test-995_app.nix {})
    CtsJvmtiRunTest995DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-996" ./cts_hostsidetests_jvmti_run-tests_test-996.nix {})
    CtsJvmtiRunTest996HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-996/app" ./cts_hostsidetests_jvmti_run-tests_test-996_app.nix {})
    CtsJvmtiRunTest996DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-997" ./cts_hostsidetests_jvmti_run-tests_test-997.nix {})
    CtsJvmtiRunTest997HostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/run-tests/test-997/app" ./cts_hostsidetests_jvmti_run-tests_test-997_app.nix {})
    CtsJvmtiRunTest997DeviceApp;

  inherit (callBPPackage "cts/hostsidetests/jvmti/tagging" ./cts_hostsidetests_jvmti_tagging.nix {})
    CtsJvmtiTaggingHostTestCases;

  inherit (callBPPackage "cts/hostsidetests/jvmti/tagging/app" ./cts_hostsidetests_jvmti_tagging_app.nix {})
    CtsJvmtiTaggingDeviceApp;

  inherit (callBPPackage "cts/hostsidetests/rollback" ./cts_hostsidetests_rollback.nix {})
    CtsRollbackManagerHostTestCases CtsRollbackManagerHostTestHelperApp;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin" ./cts_hostsidetests_securitybulletin.nix {})
    CtsSecurityBulletinHostTestCases cts_hostsidetests_securitybulletin_defaults;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/Bug-115739809" ./cts_hostsidetests_securitybulletin_securityPatch_Bug-115739809.nix {})
    Bug-115739809;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/Bug-38195738" ./cts_hostsidetests_securitybulletin_securityPatch_Bug-38195738.nix {})
    Bug-38195738;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2012-6702" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2012-6702.nix {})
    CVE-2012-6702;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2014-3145" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2014-3145.nix {})
    CVE-2014-3145;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2014-9803" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2014-9803.nix {})
    CVE-2014-9803;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2015-1805" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2015-1805.nix {})
    CVE-2015-1805;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2016-0844" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2016-0844.nix {})
    CVE-2016-0844;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2016-10229" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2016-10229.nix {})
    CVE-2016-10229;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2016-2109" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2016-2109.nix {})
    CVE-2016-2109;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2016-2412" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2016-2412.nix {})
    CVE-2016-2412;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2016-2419" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2016-2419.nix {})
    CVE-2016-2419;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2016-2460" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2016-2460.nix {})
    CVE-2016-2460;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2016-2471" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2016-2471.nix {})
    CVE-2016-2471;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2016-3746" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2016-3746.nix {})
    CVE-2016-3746;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2016-3818" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2016-3818.nix {})
    CVE-2016-3818;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2016-3913" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2016-3913.nix {})
    CVE-2016-3913;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2016-6730" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2016-6730.nix {})
    CVE-2016-6730;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2016-6731" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2016-6731.nix {})
    CVE-2016-6731;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2016-6732" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2016-6732.nix {})
    CVE-2016-6732;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2016-6733" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2016-6733.nix {})
    CVE-2016-6733;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2016-6734" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2016-6734.nix {})
    CVE-2016-6734;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2016-6735" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2016-6735.nix {})
    CVE-2016-6735;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2016-6736" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2016-6736.nix {})
    CVE-2016-6736;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2016-8425" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2016-8425.nix {})
    CVE-2016-8425;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2016-8426" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2016-8426.nix {})
    CVE-2016-8426;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2016-8427" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2016-8427.nix {})
    CVE-2016-8427;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2016-8428" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2016-8428.nix {})
    CVE-2016-8428;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2016-8429" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2016-8429.nix {})
    CVE-2016-8429;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2016-8430" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2016-8430.nix {})
    CVE-2016-8430;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2016-8431" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2016-8431.nix {})
    CVE-2016-8431;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2016-8432" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2016-8432.nix {})
    CVE-2016-8432;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2016-8434" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2016-8434.nix {})
    CVE-2016-8434;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2016-8460" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2016-8460.nix {})
    CVE-2016-8460;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2016-8479" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2016-8479.nix {})
    CVE-2016-8479;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2016-8482" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2016-8482.nix {})
    CVE-2016-8482;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2017-0333" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2017-0333.nix {})
    CVE-2017-0333;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2017-0334" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2017-0334.nix {})
    CVE-2017-0334;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2017-0386" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2017-0386.nix {})
    CVE-2017-0386;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2017-0415" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2017-0415.nix {})
    CVE-2017-0415;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2017-0426" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2017-0426.nix {})
    CVE-2017-0426;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2017-0477" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2017-0477.nix {})
    CVE-2017-0477;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2017-0479" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2017-0479.nix {})
    CVE-2017-0479;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2017-0508" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2017-0508.nix {})
    CVE-2017-0508;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2017-0553" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2017-0553.nix {})
    CVE-2017-0553;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2017-13232" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2017-13232.nix {})
    CVE-2017-13232;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2017-13273" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2017-13273.nix {})
    CVE-2017-13273;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2017-6262" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2017-6262.nix {})
    CVE-2017-6262;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2018-9344" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2018-9344.nix {})
    CVE-2018-9344;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2018-9424" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2018-9424.nix {})
    CVE-2018-9424;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/securityPatch/CVE-2018-9515" ./cts_hostsidetests_securitybulletin_securityPatch_CVE-2018-9515.nix {})
    CVE-2018-9515;

  inherit (callBPPackage "cts/hostsidetests/securitybulletin/test-apps/launchanywhere" ./cts_hostsidetests_securitybulletin_test-apps_launchanywhere.nix {})
    CtsHostLaunchAnyWhereApp;

  inherit (callBPPackage "cts/hostsidetests/stagedinstall" ./cts_hostsidetests_stagedinstall.nix {})
    CtsStagedInstallHostTestCases StagedInstallTest StagedInstallTestApexV1_NotPreInstalled StagedInstallTestApexV2 StagedInstallTestApexV2_AdditionalFile StagedInstallTestApexV2_AdditionalFolder StagedInstallTestApexV2_WithPostInstallHook StagedInstallTestApexV2_WithPreInstallHook StagedInstallTestApexV2_WrongSha StagedInstallTestApexV3 StagedInstallTestAppAv1 StagedInstallTestAppAv2 StagedInstallTestAppBv1 StagedInstallTestAppSamePackageNameAsApex;

  inherit (callBPPackage "cts/hostsidetests/statsd/apps/statsdapp" ./cts_hostsidetests_statsd_apps_statsdapp.nix {})
    CtsStatsdApp liblmkhelper statslog-statsd-cts-java-gen;

  inherit (callBPPackage "cts/libs/deviceutillegacy" ./cts_libs_deviceutillegacy.nix {})
    ctsdeviceutillegacy ctsdeviceutillegacy-axt;

  inherit (callBPPackage "cts/libs/input" ./cts_libs_input.nix {})
    cts-input-lib;

  inherit (callBPPackage "cts/libs/json" ./cts_libs_json.nix {})
    json jsonlib;

  inherit (callBPPackage "cts/libs/midi" ./cts_libs_midi.nix {})
    cts-midi-lib;

  inherit (callBPPackage "cts/libs/rollback" ./cts_libs_rollback.nix {})
    RollbackManagerTestAppA1 RollbackManagerTestAppA2 cts-rollback-lib;

  inherit (callBPPackage "cts/libs/runner" ./cts_libs_runner.nix {})
    ctstestrunner ctstestrunner-axt;

  inherit (callBPPackage "cts/libs/testserver" ./cts_libs_testserver.nix {})
    ctstestserver;

  inherit (callBPPackage "cts/libs/view" ./cts_libs_view.nix {})
    cts-view-lib;

  inherit (callBPPackage "cts/libs/vogar-expect" ./cts_libs_vogar-expect.nix {})
    vogarexpect vogarexpect-no-deps vogarexpectlib;

  inherit (callBPPackage "cts/suite/audio_quality/executable" ./cts_suite_audio_quality_executable.nix {})
    cts_audio_quality;

  inherit (callBPPackage "cts/suite/audio_quality/lib" ./cts_suite_audio_quality_lib.nix {})
    libcts_audio_quality;

  inherit (callBPPackage "cts/suite/audio_quality/test" ./cts_suite_audio_quality_test.nix {})
    cts_audio_quality_test;

  inherit (callBPPackage "cts/tests/AlarmManager" ./cts_tests_AlarmManager.nix {})
    CtsAlarmManagerTestCases;

  inherit (callBPPackage "cts/tests/AlarmManager/app" ./cts_tests_AlarmManager_app.nix {})
    AlarmTestApp;

  inherit (callBPPackage "cts/tests/JobScheduler" ./cts_tests_JobScheduler.nix {})
    CtsJobSchedulerTestCases;

  inherit (callBPPackage "cts/tests/JobScheduler/JobTestApp" ./cts_tests_JobScheduler_JobTestApp.nix {})
    CtsJobTestApp;

  inherit (callBPPackage "cts/tests/ProcessTest" ./cts_tests_ProcessTest.nix {})
    ProcessTests;

  inherit (callBPPackage "cts/tests/ProcessTest/NoShareUidApp" ./cts_tests_ProcessTest_NoShareUidApp.nix {})
    NoShareUidApp;

  inherit (callBPPackage "cts/tests/ProcessTest/ShareUidApp" ./cts_tests_ProcessTest_ShareUidApp.nix {})
    ShareUidApp;

  inherit (callBPPackage "cts/tests/accessibility" ./cts_tests_accessibility.nix {})
    CtsAccessibilityCommon CtsAccessibilityTestCases;

  inherit (callBPPackage "cts/tests/accessibilityservice/test-apps/WidgetProvider" ./cts_tests_accessibilityservice_test-apps_WidgetProvider.nix {})
    CtsAccessibilityWidgetProvider;

  inherit (callBPPackage "cts/tests/admin/app" ./cts_tests_admin_app.nix {})
    CtsAdminApp;

  inherit (callBPPackage "cts/tests/aslr" ./cts_tests_aslr.nix {})
    CtsAslrMallocTestCases;

  inherit (callBPPackage "cts/tests/core/runner-axt" ./cts_tests_core_runner-axt.nix {})
    cts-core-test-runner-axt cts-test-runner-axt;

  inherit (callBPPackage "cts/tests/core/runner" ./cts_tests_core_runner.nix {})
    cts-core-test-runner cts-test-runner;

  inherit (callBPPackage "cts/tests/filesystem" ./cts_tests_filesystem.nix {})
    CtsFileSystemTestCases;

  inherit (callBPPackage "cts/tests/fragment" ./cts_tests_fragment.nix {})
    CtsFragmentTestCases;

  inherit (callBPPackage "cts/tests/fragment/sdk26" ./cts_tests_fragment_sdk26.nix {})
    CtsFragmentTestCasesSdk26;

  inherit (callBPPackage "cts/tests/framework/base/windowmanager" ./cts_tests_framework_base_windowmanager.nix {})
    cts-wm-components;

  inherit (callBPPackage "cts/tests/framework/base/windowmanager/app_base" ./cts_tests_framework_base_windowmanager_app_base.nix {})
    cts-wm-components-base;

  inherit (callBPPackage "cts/tests/framework/base/windowmanager/util" ./cts_tests_framework_base_windowmanager_util.nix {})
    cts-wm-util;

  inherit (callBPPackage "cts/tests/jdwp" ./cts_tests_jdwp.nix {})
    CtsJdwpTestCases;

  inherit (callBPPackage "cts/tests/jdwp/runner/device-side" ./cts_tests_jdwp_runner_device-side.nix {})
    cts-dalvik-device-test-runner;

  inherit (callBPPackage "cts/tests/jdwp/runner/host-side" ./cts_tests_jdwp_runner_host-side.nix {})
    cts-dalvik-host-test-runner;

  inherit (callBPPackage "cts/tests/mocking" ./cts_tests_mocking.nix {})
    CtsMockingTestCases;

  inherit (callBPPackage "cts/tests/mocking/debuggable" ./cts_tests_mocking_debuggable.nix {})
    CtsMockingDebuggableTestCases;

  inherit (callBPPackage "cts/tests/mocking/inline" ./cts_tests_mocking_inline.nix {})
    CtsInlineMockingTestCases;

  inherit (callBPPackage "cts/tests/netlegacy22.permission" ./cts_tests_netlegacy22.permission.nix {})
    CtsNetTestCasesLegacyPermission22;

  inherit (callBPPackage "cts/tests/openglperf2/jni" ./cts_tests_openglperf2_jni.nix {})
    libctsopengl_jni libctsopengl_test;

  inherit (callBPPackage "cts/tests/openglperf2/test" ./cts_tests_openglperf2_test.nix {})
    cts_device_opengl_test;

  inherit (callBPPackage "cts/tests/pdf" ./cts_tests_pdf.nix {})
    CtsPdfTestCases;

  inherit (callBPPackage "cts/tests/rollback" ./cts_tests_rollback.nix {})
    CtsRollbackManagerTestCases;

  inherit (callBPPackage "cts/tests/sample" ./cts_tests_sample.nix {})
    CtsSampleDeviceTestCases;

  inherit (callBPPackage "cts/tests/security" ./cts_tests_security.nix {})
    cts-security-test-support-library;

  inherit (callBPPackage "cts/tests/signature" ./cts_tests_signature.nix {})
    signature-hostside;

  inherit (callBPPackage "cts/tests/signature/api-check" ./cts_tests_signature_api-check.nix {})
    cts-api-signature-test libclassdescriptors;

  inherit (callBPPackage "cts/tests/signature/dex-checker" ./cts_tests_signature_dex-checker.nix {})
    libcts_dexchecker;

  inherit (callBPPackage "cts/tests/signature/lib/android" ./cts_tests_signature_lib_android.nix {})
    cts-signature-common;

  inherit (callBPPackage "cts/tests/signature/lib/common" ./cts_tests_signature_lib_common.nix {})
    signature-common-javalib;

  inherit (callBPPackage "cts/tests/signature/tests" ./cts_tests_signature_tests.nix {})
    signature-host-tests;

  inherit (callBPPackage "cts/tests/simplecpu/jni" ./cts_tests_simplecpu_jni.nix {})
    libctscpu_jni;

  inherit (callBPPackage "cts/tests/tests/animation" ./cts_tests_tests_animation.nix {})
    CtsAnimationTestCases;

  inherit (callBPPackage "cts/tests/tests/appop" ./cts_tests_tests_appop.nix {})
    CtsAppOpsTestCases;

  inherit (callBPPackage "cts/tests/tests/assist/common" ./cts_tests_tests_assist_common.nix {})
    CtsAssistCommon;

  inherit (callBPPackage "cts/tests/tests/binder_ndk/libbinder_ndk_test" ./cts_tests_tests_binder_ndk_libbinder_ndk_test.nix {})
    libbinder_ndk_test libbinder_ndk_test_defaults libbinder_ndk_test_interface libbinder_ndk_test_interface_new libbinder_ndk_test_interface_old libbinder_ndk_test_utilities;

  inherit (callBPPackage "cts/tests/tests/classloaderfactory" ./cts_tests_tests_classloaderfactory.nix {})
    ClassLoaderFactoryTestSecondary cts-classloaderfactorytest-srcs cts_classloaderfactorytest_defaults;

  inherit (callBPPackage "cts/tests/tests/classloaderfactory/test-memcl" ./cts_tests_tests_classloaderfactory_test-memcl.nix {})
    CtsClassLoaderFactoryInMemoryDexClassLoaderTestCases;

  inherit (callBPPackage "cts/tests/tests/classloaderfactory/test-pathcl" ./cts_tests_tests_classloaderfactory_test-pathcl.nix {})
    CtsClassLoaderFactoryPathClassLoaderTestCases;

  inherit (callBPPackage "cts/tests/tests/content/DirectBootUnawareTestApp" ./cts_tests_tests_content_DirectBootUnawareTestApp.nix {})
    CtsContentDirectBootUnawareTestApp;

  inherit (callBPPackage "cts/tests/tests/content/PartiallyDirectBootAwareTestApp" ./cts_tests_tests_content_PartiallyDirectBootAwareTestApp.nix {})
    CtsContentPartiallyDirectBootAwareTestApp;

  inherit (callBPPackage "cts/tests/tests/database/apps" ./cts_tests_tests_database_apps.nix {})
    CtsProviderApp;

  inherit (callBPPackage "cts/tests/tests/midi" ./cts_tests_tests_midi.nix {})
    CtsMidiTestCases;

  inherit (callBPPackage "cts/tests/tests/net" ./cts_tests_tests_net.nix {})
    CtsNetTestCases;

  inherit (callBPPackage "cts/tests/tests/net/api23Test" ./cts_tests_tests_net_api23Test.nix {})
    CtsNetApi23TestCases;

  inherit (callBPPackage "cts/tests/tests/net/appForApi23" ./cts_tests_tests_net_appForApi23.nix {})
    CtsNetTestAppForApi23;

  inherit (callBPPackage "cts/tests/tests/net/jni" ./cts_tests_tests_net_jni.nix {})
    libnativedns_jni libnativemultinetwork_jni;

  inherit (callBPPackage "cts/tests/tests/net/native/dns" ./cts_tests_tests_net_native_dns.nix {})
    CtsNativeNetDnsTestCases dns_async_defaults;

  inherit (callBPPackage "cts/tests/tests/net/native/qtaguid" ./cts_tests_tests_net_native_qtaguid.nix {})
    CtsNativeNetTestCases;

  inherit (callBPPackage "cts/tests/tests/net/util" ./cts_tests_tests_net_util.nix {})
    cts-net-utils;

  inherit (callBPPackage "cts/tests/tests/netpermission/internetpermission" ./cts_tests_tests_netpermission_internetpermission.nix {})
    CtsNetTestCasesInternetPermission;

  inherit (callBPPackage "cts/tests/tests/netpermission/updatestatspermission" ./cts_tests_tests_netpermission_updatestatspermission.nix {})
    CtsNetTestCasesUpdateStatsPermission;

  inherit (callBPPackage "cts/tests/tests/os/jni" ./cts_tests_tests_os_jni.nix {})
    libctsos_jni libctsos_jni_arm libctsos_jni_defaults;

  inherit (callBPPackage "cts/tests/tests/packageinstaller/atomicinstall" ./cts_tests_tests_packageinstaller_atomicinstall.nix {})
    AtomicInstallCorrupt AtomicInstallTestAppAv1 AtomicInstallTestAppAv2 AtomicInstallTestAppBv1 CtsAtomicInstallTestCases;

  inherit (callBPPackage "cts/tests/tests/packageinstaller/install" ./cts_tests_tests_packageinstaller_install.nix {})
    CtsPackageInstallTestCases;

  inherit (callBPPackage "cts/tests/tests/packageinstaller/nopermission" ./cts_tests_tests_packageinstaller_nopermission.nix {})
    CtsNoPermissionTestCases CtsNoPermissionTestCasesBase;

  inherit (callBPPackage "cts/tests/tests/packageinstaller/nopermission25" ./cts_tests_tests_packageinstaller_nopermission25.nix {})
    CtsNoPermissionTestCases25;

  inherit (callBPPackage "cts/tests/tests/permission/AppWithSharedUidThatRequestLocationPermission28" ./cts_tests_tests_permission_AppWithSharedUidThatRequestLocationPermission28.nix {})
    CtsAppWithSharedUidThatRequestsLocationPermission28;

  inherit (callBPPackage "cts/tests/tests/permission/AppWithSharedUidThatRequestLocationPermission29" ./cts_tests_tests_permission_AppWithSharedUidThatRequestLocationPermission29.nix {})
    CtsAppWithSharedUidThatRequestsLocationPermission29;

  inherit (callBPPackage "cts/tests/tests/permission/permissionTestUtilLib" ./cts_tests_tests_permission_permissionTestUtilLib.nix {})
    permission-test-util-lib;

  inherit (callBPPackage "cts/tests/tests/permission2" ./cts_tests_tests_permission2.nix {})
    CtsPermission2TestCases;

  inherit (callBPPackage "cts/tests/tests/permission2/CtsLegacyStorageIsolatedWithSharedUid" ./cts_tests_tests_permission2_CtsLegacyStorageIsolatedWithSharedUid.nix {})
    CtsLegacyStorageIsolatedWithSharedUid;

  inherit (callBPPackage "cts/tests/tests/permission2/CtsLegacyStorageNotIsolatedWithSharedUid" ./cts_tests_tests_permission2_CtsLegacyStorageNotIsolatedWithSharedUid.nix {})
    CtsLegacyStorageNotIsolatedWithSharedUid;

  inherit (callBPPackage "cts/tests/tests/permission2/CtsLegacyStorageRestrictedSdk28WithSharedUid" ./cts_tests_tests_permission2_CtsLegacyStorageRestrictedSdk28WithSharedUid.nix {})
    CtsLegacyStorageRestrictedSdk28WithSharedUid;

  inherit (callBPPackage "cts/tests/tests/permission2/CtsLegacyStorageRestrictedWithSharedUid" ./cts_tests_tests_permission2_CtsLegacyStorageRestrictedWithSharedUid.nix {})
    CtsLegacyStorageRestrictedWithSharedUid;

  inherit (callBPPackage "cts/tests/tests/permission2/CtsLocationPermissionsUserSdk22" ./cts_tests_tests_permission2_CtsLocationPermissionsUserSdk22.nix {})
    CtsLocationPermissionsUserSdk22;

  inherit (callBPPackage "cts/tests/tests/permission2/CtsLocationPermissionsUserSdk29" ./cts_tests_tests_permission2_CtsLocationPermissionsUserSdk29.nix {})
    CtsLocationPermissionsUserSdk29;

  inherit (callBPPackage "cts/tests/tests/permission2/CtsSMSCallLogPermissionsUserSdk22" ./cts_tests_tests_permission2_CtsSMSCallLogPermissionsUserSdk22.nix {})
    CtsSMSCallLogPermissionsUserSdk22;

  inherit (callBPPackage "cts/tests/tests/permission2/CtsSMSCallLogPermissionsUserSdk29" ./cts_tests_tests_permission2_CtsSMSCallLogPermissionsUserSdk29.nix {})
    CtsSMSCallLogPermissionsUserSdk29;

  inherit (callBPPackage "cts/tests/tests/permission2/CtsSMSNotRestrictedWithSharedUid" ./cts_tests_tests_permission2_CtsSMSNotRestrictedWithSharedUid.nix {})
    CtsSMSNotRestrictedWithSharedUid;

  inherit (callBPPackage "cts/tests/tests/permission2/CtsSMSRestrictedWithSharedUid" ./cts_tests_tests_permission2_CtsSMSRestrictedWithSharedUid.nix {})
    CtsSMSRestrictedWithSharedUid;

  inherit (callBPPackage "cts/tests/tests/permission2/CtsStoragePermissionsUserDefaultSdk22" ./cts_tests_tests_permission2_CtsStoragePermissionsUserDefaultSdk22.nix {})
    CtsStoragePermissionsUserDefaultSdk22;

  inherit (callBPPackage "cts/tests/tests/permission2/CtsStoragePermissionsUserDefaultSdk28" ./cts_tests_tests_permission2_CtsStoragePermissionsUserDefaultSdk28.nix {})
    CtsStoragePermissionsUserDefaultSdk28;

  inherit (callBPPackage "cts/tests/tests/permission2/CtsStoragePermissionsUserDefaultSdk29" ./cts_tests_tests_permission2_CtsStoragePermissionsUserDefaultSdk29.nix {})
    CtsStoragePermissionsUserDefaultSdk29;

  inherit (callBPPackage "cts/tests/tests/permission2/CtsStoragePermissionsUserOptInSdk22" ./cts_tests_tests_permission2_CtsStoragePermissionsUserOptInSdk22.nix {})
    CtsStoragePermissionsUserOptInSdk22;

  inherit (callBPPackage "cts/tests/tests/permission2/CtsStoragePermissionsUserOptInSdk28" ./cts_tests_tests_permission2_CtsStoragePermissionsUserOptInSdk28.nix {})
    CtsStoragePermissionsUserOptInSdk28;

  inherit (callBPPackage "cts/tests/tests/permission2/CtsStoragePermissionsUserOptOutSdk29" ./cts_tests_tests_permission2_CtsStoragePermissionsUserOptOutSdk29.nix {})
    CtsStoragePermissionsUserOptOutSdk29;

  inherit (callBPPackage "cts/tests/tests/preference" ./cts_tests_tests_preference.nix {})
    CtsPreferenceTestCases;

  inherit (callBPPackage "cts/tests/tests/print/printTestUtilLib" ./cts_tests_tests_print_printTestUtilLib.nix {})
    print-test-util-lib;

  inherit (callBPPackage "cts/tests/tests/provider" ./cts_tests_tests_provider.nix {})
    CtsProviderTestCases;

  inherit (callBPPackage "cts/tests/tests/resolverservice" ./cts_tests_tests_resolverservice.nix {})
    CtsResolverServiceTestCases;

  inherit (callBPPackage "cts/tests/tests/role" ./cts_tests_tests_role.nix {})
    CtsRoleTestCases;

  inherit (callBPPackage "cts/tests/tests/role/CtsRoleTestApp" ./cts_tests_tests_role_CtsRoleTestApp.nix {})
    CtsRoleTestApp;

  inherit (callBPPackage "cts/tests/tests/role/CtsRoleTestApp28" ./cts_tests_tests_role_CtsRoleTestApp28.nix {})
    CtsRoleTestApp28;

  inherit (callBPPackage "cts/tests/tests/security/jni" ./cts_tests_tests_security_jni.nix {})
    libctssecurity_jni libcve_2019_2213_jni;

  inherit (callBPPackage "cts/tests/tests/slice" ./cts_tests_tests_slice.nix {})
    CtsSliceTestCases;

  inherit (callBPPackage "cts/tests/tests/telephony/TestFinancialSmsApp" ./cts_tests_tests_telephony_TestFinancialSmsApp.nix {})
    TestFinancialSmsApp;

  inherit (callBPPackage "cts/tests/tests/telephony/TestSmsApp" ./cts_tests_tests_telephony_TestSmsApp.nix {})
    TestSmsApp;

  inherit (callBPPackage "cts/tests/tests/telephony/TestSmsApp22" ./cts_tests_tests_telephony_TestSmsApp22.nix {})
    TestSmsApp22;

  inherit (callBPPackage "cts/tests/tests/telephony/TestSmsRetrieverApp" ./cts_tests_tests_telephony_TestSmsRetrieverApp.nix {})
    TestSmsRetrieverApp;

  inherit (callBPPackage "cts/tests/tests/text" ./cts_tests_tests_text.nix {})
    CtsTextTestCases;

  inherit (callBPPackage "cts/tests/tests/theme" ./cts_tests_tests_theme.nix {})
    CtsThemeDeviceTestCases;

  inherit (callBPPackage "cts/tests/tests/tools/processors/view_inspector" ./cts_tests_tests_tools_processors_view_inspector.nix {})
    CtsViewInspectorAnnotationProcessorTestCases;

  inherit (callBPPackage "cts/tests/tests/transition" ./cts_tests_tests_transition.nix {})
    CtsTransitionTestCases;

  inherit (callBPPackage "cts/tests/tests/uirendering" ./cts_tests_tests_uirendering.nix {})
    CtsUiRenderingTestCases;

  inherit (callBPPackage "cts/tests/tests/uirendering27" ./cts_tests_tests_uirendering27.nix {})
    CtsUiRenderingTestCases27;

  inherit (callBPPackage "cts/tests/tests/view/jni" ./cts_tests_tests_view_jni.nix {})
    libctsview_jni;

  inherit (callBPPackage "cts/tests/tests/view/sdk28" ./cts_tests_tests_view_sdk28.nix {})
    CtsViewTestCasesSdk28;

  inherit (callBPPackage "cts/tests/tests/widget" ./cts_tests_tests_widget.nix {})
    CtsWidgetTestCases;

  inherit (callBPPackage "cts/tests/tvprovider" ./cts_tests_tvprovider.nix {})
    CtsTvProviderTestCases;

  inherit (callBPPackage "cts/tools/cfassembler" ./cts_tools_cfassembler.nix {})
    cfassembler;

  inherit (callBPPackage "cts/tools/cts-api-coverage" ./cts_tools_cts-api-coverage.nix {})
    api-coverage cts-api-coverage ndk-api-report;

  inherit (callBPPackage "cts/tools/cts-device-info/jni" ./cts_tools_cts-device-info_jni.nix {})
    libctsdeviceinfo;

  inherit (callBPPackage "cts/tools/cts-holo-generation" ./cts_tools_cts-holo-generation.nix {})
    CtsHoloGeneration;

  inherit (callBPPackage "cts/tools/cts-media-preparer-app" ./cts_tools_cts-media-preparer-app.nix {})
    CtsMediaPreparerApp;

  inherit (callBPPackage "cts/tools/cts-preconditions" ./cts_tools_cts-preconditions.nix {})
    CtsPreconditions;

  inherit (callBPPackage "cts/tools/dasm" ./cts_tools_dasm.nix {})
    dasm;

  inherit (callBPPackage "cts/tools/release-parser" ./cts_tools_release-parser.nix {})
    release-parser;

  inherit (callBPPackage "cts/tools/release-parser/tests" ./cts_tools_release-parser_tests.nix {})
    release-parser-tests;

  inherit (callBPPackage "cts/tools/utils" ./cts_tools_utils.nix {})
    descGen;

  inherit (callBPPackage "cts/tools/vm-tests-tf" ./cts_tools_vm-tests-tf.nix {})
    cts-vmtests-dot host-cts-vmtests vmtests-buildutil vmtests-dasm-dex-generated vmtests-dfh-dex-generated vmtests-generated-resources vmtests-mains vmtests_generated_host_test_sources vmtests_generated_mains_test_sources;

  inherit (callBPPackage "dalvik/dexdump" ./dalvik_dexdump.nix {})
    dexdump;

  inherit (callBPPackage "dalvik/dexgen" ./dalvik_dexgen.nix {})
    dexgen;

  inherit (callBPPackage "dalvik/dx" ./dalvik_dx.nix {})
    dx;

  inherit (callBPPackage "dalvik/dx/junit-tests" ./dalvik_dx_junit-tests.nix {})
    dx-tests;

  inherit (callBPPackage "dalvik/dx/src" ./dalvik_dx_src.nix {})
    dx-doc-stubs dx-docs;

  inherit (callBPPackage "dalvik/libdex" ./dalvik_libdex.nix {})
    libdex;

  inherit (callBPPackage "dalvik/tools/dexdeps" ./dalvik_tools_dexdeps.nix {})
    dexdeps;

  inherit (callBPPackage "dalvik/tools/dexdeps/src" ./dalvik_tools_dexdeps_src.nix {})
    dexdeps-doc-stubs dexdeps-docs;

  inherit (callBPPackage "dalvik/tools/hprof-conv" ./dalvik_tools_hprof-conv.nix {})
    hprof-conv;

  inherit (callBPPackage "development/build" ./development_build.nix {})
    android_stubs_current android_stubs_current_system_modules android_system_stubs_current android_system_stubs_current_system_modules android_test_stubs_current android_test_stubs_current_system_modules framework-stubs-default;

  inherit (callBPPackage "development/gsi/gsi_util" ./development_gsi_gsi_util.nix {})
    gsi_util;

  inherit (callBPPackage "development/host/windows" ./development_host_windows.nix {})
    AdbWinApi AdbWinApi_defaults AdbWinUsbApi;

  inherit (callBPPackage "development/python-packages" ./development_python-packages.nix {})
    adb_py;

  inherit (callBPPackage "development/scripts" ./development_scripts.nix {})
    python-native_heapdump_viewer_test python-symbol python-symbol_test;

  inherit (callBPPackage "development/sdk" ./development_sdk.nix {})
    platform_tools_version;

  inherit (callBPPackage "development/tools/apkcheck" ./development_tools_apkcheck.nix {})
    apkcheck;

  inherit (callBPPackage "development/tools/bugreport" ./development_tools_bugreport.nix {})
    BugReport;

  inherit (callBPPackage "development/tools/etc1tool" ./development_tools_etc1tool.nix {})
    etc1tool;

  inherit (callBPPackage "development/tools/hosttestlib" ./development_tools_hosttestlib.nix {})
    hosttestlib;

  inherit (callBPPackage "development/tools/idegen" ./development_tools_idegen.nix {})
    idegen;

  inherit (callBPPackage "development/tools/line_endings" ./development_tools_line_endings.nix {})
    line_endings;

  inherit (callBPPackage "development/tools/mkstubs" ./development_tools_mkstubs.nix {})
    mkstubs;

  inherit (callBPPackage "development/tools/rmtypedefs" ./development_tools_rmtypedefs.nix {})
    rmtypedefs;

  inherit (callBPPackage "development/vndk/tools/header-checker" ./development_vndk_tools_header-checker.nix {})
    header-abi-diff header-abi-dumper header-abi-linker header-abi-linker-defaults header-checker-defaults header-checker-unittests libheader-checker merge-abi-diff;

  inherit (callBPPackage "development/vndk/tools/header-checker/src/repr/protobuf/proto" ./development_vndk_tools_header-checker_src_repr_protobuf_proto.nix {})
    libheader-checker-proto;

  inherit (callBPPackage "development/vndk/tools/header-checker/tests/integration/version_script_example" ./development_vndk_tools_header-checker_tests_integration_version_script_example.nix {})
    libversion_script_example;

  inherit (callBPPackage "external/ImageMagick" ./external_ImageMagick.nix {})
    Magick_headers;

  inherit (callBPPackage "external/ImageMagick/Magick++" ./external_ImageMagick_Magick++.nix {})
    "Magick++" "Magick++_defaults" "Magick++_platform";

  inherit (callBPPackage "external/ImageMagick/MagickCore" ./external_ImageMagick_MagickCore.nix {})
    MagickCore;

  inherit (callBPPackage "external/ImageMagick/MagickWand" ./external_ImageMagick_MagickWand.nix {})
    MagickWand;

  inherit (callBPPackage "external/ImageMagick/coders" ./external_ImageMagick_coders.nix {})
    Magick_coders;

  inherit (callBPPackage "external/ImageMagick/filters" ./external_ImageMagick_filters.nix {})
    Magick_filters;

  inherit (callBPPackage "external/Microsoft-GSL" ./external_Microsoft-GSL.nix {})
    libgsl;

  inherit (callBPPackage "external/Reactive-Extensions/RxCpp" ./external_Reactive-Extensions_RxCpp.nix {})
    librxcpp librxcpp-tests librxcpp-tests-defaults librxcpp-tests-upstream;

  inherit (callBPPackage "external/aac" ./external_aac.nix {})
    libFraunhoferAAC;

  inherit (callBPPackage "external/adhd/cras/src" ./external_adhd_cras_src.nix {})
    libcras;

  inherit (callBPPackage "external/android-clat" ./external_android-clat.nix {})
    "clatd.conf" clatd clatd_common clatd_defaults clatd_microbenchmark clatd_test;

  inherit (callBPPackage "external/androidplot" ./external_androidplot.nix {})
    AndroidPlotDemos androidplot;

  inherit (callBPPackage "external/ant-glob" ./external_ant-glob.nix {})
    ant-glob;

  inherit (callBPPackage "external/antlr" ./external_antlr.nix {})
    antlr-runtime;

  inherit (callBPPackage "external/apache-commons-bcel" ./external_apache-commons-bcel.nix {})
    apache-bcel;

  inherit (callBPPackage "external/apache-commons-compress" ./external_apache-commons-compress.nix {})
    apache-commons-compress;

  inherit (callBPPackage "external/apache-commons-math" ./external_apache-commons-math.nix {})
    apache-commons-math apache-commons-math-host;

  inherit (callBPPackage "external/apache-harmony" ./external_apache-harmony.nix {})
    apache-harmony-tests;

  inherit (callBPPackage "external/apache-harmony/jdwp" ./external_apache-harmony_jdwp.nix {})
    SourceDebugExtensionMockClass_gen apache-harmony-jdwp-tests apache-harmony-jdwp-tests-host;

  inherit (callBPPackage "external/apache-http" ./external_apache-http.nix {})
    "org.apache.http.legacy";

  inherit (callBPPackage "external/apache-xml" ./external_apache-xml.nix {})
    apache-xml apache-xml-testdex apache-xml_api_files;

  inherit (callBPPackage "external/archive-patcher" ./external_archive-patcher.nix {})
    archive-patcher;

  inherit (callBPPackage "external/arm-neon-tests" ./external_arm-neon-tests.nix {})
    arm_neon_tests_arm arm_neon_tests_defaults arm_neon_tests_thumb;

  inherit (callBPPackage "external/arm-optimized-routines" ./external_arm-optimized-routines.nix {})
    libarm-optimized-routines mathtest;

  inherit (callBPPackage "external/avb" ./external_avb.nix {})
    "bootctrl.avb" avb_defaults avb_sources avbctl avbtool avbtool_py libavb libavb_ab_host libavb_atx_host libavb_host_sysdeps libavb_host_unittest libavb_host_user_code_test libavb_things_example libavb_user;

  inherit (callBPPackage "external/avb/test" ./external_avb_test.nix {})
    at_auth_unlock_unittest;

  inherit (callBPPackage "external/avb/tools" ./external_avb_tools.nix {})
    at_auth_unlock;

  inherit (callBPPackage "external/bcc" ./external_bcc.nix {})
    libbpf libbpf_defaults libbpf_headers;

  inherit (callBPPackage "external/blktrace" ./external_blktrace.nix {})
    blkiomon blkparse blkrawverify blktrace blktrace_defaults btt verify_blkparse;

  inherit (callBPPackage "external/boringssl" ./external_boringssl.nix {})
    boringssl_crypto_test boringssl_defaults boringssl_flags boringssl_ssl_test boringssl_test_support bssl cavp libcrypto libcrypto_defaults libcrypto_no_clang libcrypto_static libssl libssl_static;

  inherit (callBPPackage "external/boringssl" ./external_boringssl_sources.bp.nix {})
    boringssl_crypto_test_sources boringssl_ssl_test_sources boringssl_test_support_sources bssl_sources libcrypto_sources libssl_sources;

  inherit (callBPPackage "external/bouncycastle" ./external_bouncycastle.nix {})
    bouncycastle bouncycastle-bcpkix-host bouncycastle-bcpkix-unbundled bouncycastle-defaults bouncycastle-errorprone-defaults bouncycastle-host bouncycastle-ocsp-unbundled bouncycastle-testdex bouncycastle-unbundled bouncycastle_java_files;

  inherit (callBPPackage "external/brotli" ./external_brotli.nix {})
    brotli brotli-java libbrotli;

  inherit (callBPPackage "external/bsdiff" ./external_bsdiff.nix {})
    bsdiff bsdiff_defaults bsdiff_unittest bspatch libbsdiff libbspatch;

  inherit (callBPPackage "external/bzip2" ./external_bzip2.nix {})
    bzip2 libbz;

  inherit (callBPPackage "external/caliper" ./external_caliper.nix {})
    caliper caliper-api-target caliper-examples caliper-gson caliper-prebuilts caliper-tests;

  inherit (callBPPackage "external/capstone" ./external_capstone.nix {})
    capstone-defaults libcapstone;

  inherit (callBPPackage "external/catch2" ./external_catch2.nix {})
    libcatch2 libcatch2-defaults libcatch2-defaults-tests libcatch2-main libcatch2-tests libcatch2-tests-upstream libcatch2-upstream;

  inherit (callBPPackage "external/cblas" ./external_cblas.nix {})
    cblas-defaults libblas libblasV8;

  inherit (callBPPackage "external/chromium-libpac" ./external_chromium-libpac.nix {})
    libpac;

  inherit (callBPPackage "external/chromium-libpac/test" ./external_chromium-libpac_test.nix {})
    proxy_resolver_v8_unittest;

  inherit (callBPPackage "external/clang" ./external_clang.nix {})
    clang-defaults clang-gen-arm-neon clang-gen-attributes clang-gen-checkers clang-gen-comment-commands clang-gen-comment-html-named-character-references clang-gen-comment-nodes clang-gen-declnodes clang-gen-diagnostics clang-gen-html-tags clang-gen-options clang-gen-statnodes clang-headers clang-version libclang_android;

  inherit (callBPPackage "external/clang/lib/ARCMigrate" ./external_clang_lib_ARCMigrate.nix {})
    libclangARCMigrate;

  inherit (callBPPackage "external/clang/lib/AST" ./external_clang_lib_AST.nix {})
    libclangAST;

  inherit (callBPPackage "external/clang/lib/ASTMatchers" ./external_clang_lib_ASTMatchers.nix {})
    libclangASTMatchers;

  inherit (callBPPackage "external/clang/lib/Analysis" ./external_clang_lib_Analysis.nix {})
    libclangAnalysis;

  inherit (callBPPackage "external/clang/lib/Basic" ./external_clang_lib_Basic.nix {})
    libclangBasic;

  inherit (callBPPackage "external/clang/lib/CodeGen" ./external_clang_lib_CodeGen.nix {})
    libclangCodeGen;

  inherit (callBPPackage "external/clang/lib/Driver" ./external_clang_lib_Driver.nix {})
    libclangDriver;

  inherit (callBPPackage "external/clang/lib/Edit" ./external_clang_lib_Edit.nix {})
    libclangEdit;

  inherit (callBPPackage "external/clang/lib/Format" ./external_clang_lib_Format.nix {})
    libclangFormat;

  inherit (callBPPackage "external/clang/lib/Frontend" ./external_clang_lib_Frontend.nix {})
    libclangFrontend;

  inherit (callBPPackage "external/clang/lib/Frontend/Rewrite" ./external_clang_lib_Frontend_Rewrite.nix {})
    libclangRewriteFrontend;

  inherit (callBPPackage "external/clang/lib/FrontendTool" ./external_clang_lib_FrontendTool.nix {})
    libclangFrontendTool;

  inherit (callBPPackage "external/clang/lib/Index" ./external_clang_lib_Index.nix {})
    libclangIndex;

  inherit (callBPPackage "external/clang/lib/Lex" ./external_clang_lib_Lex.nix {})
    libclangLex;

  inherit (callBPPackage "external/clang/lib/Parse" ./external_clang_lib_Parse.nix {})
    libclangParse;

  inherit (callBPPackage "external/clang/lib/Rewrite" ./external_clang_lib_Rewrite.nix {})
    libclangRewrite;

  inherit (callBPPackage "external/clang/lib/Sema" ./external_clang_lib_Sema.nix {})
    libclangSema;

  inherit (callBPPackage "external/clang/lib/Serialization" ./external_clang_lib_Serialization.nix {})
    libclangSerialization;

  inherit (callBPPackage "external/clang/lib/StaticAnalyzer/Checkers" ./external_clang_lib_StaticAnalyzer_Checkers.nix {})
    libclangStaticAnalyzerCheckers;

  inherit (callBPPackage "external/clang/lib/StaticAnalyzer/Checkers/MPI-Checker" ./external_clang_lib_StaticAnalyzer_Checkers_MPI-Checker.nix {})
    libclangStaticAnalyzerMPIChecker;

  inherit (callBPPackage "external/clang/lib/StaticAnalyzer/Core" ./external_clang_lib_StaticAnalyzer_Core.nix {})
    libclangStaticAnalyzerCore;

  inherit (callBPPackage "external/clang/lib/StaticAnalyzer/Frontend" ./external_clang_lib_StaticAnalyzer_Frontend.nix {})
    libclangStaticAnalyzerFrontend;

  inherit (callBPPackage "external/clang/lib/Tooling" ./external_clang_lib_Tooling.nix {})
    libclangTooling;

  inherit (callBPPackage "external/clang/lib/Tooling/Core" ./external_clang_lib_Tooling_Core.nix {})
    libclangToolingCore;

  inherit (callBPPackage "external/clang/soong" ./external_clang_soong.nix {})
    soong-clang;

  inherit (callBPPackage "external/clang/tools/libclang" ./external_clang_tools_libclang.nix {})
    libclangLibclang;

  inherit (callBPPackage "external/clang/utils/TableGen" ./external_clang_utils_TableGen.nix {})
    clang-tblgen;

  inherit (callBPPackage "external/cn-cbor" ./external_cn-cbor.nix {})
    cn-cbor_test libcn-cbor;

  inherit (callBPPackage "external/compiler-rt" ./external_compiler-rt.nix {})
    asan_arch_defaults libcompiler_rt libcompiler_rt-extras;

  inherit (callBPPackage "external/compiler-rt/lib/asan" ./external_compiler-rt_lib_asan.nix {})
    asan_test asanwrapper libasan libasan_cxx libasan_noinst_test;

  inherit (callBPPackage "external/compiler-rt/lib/interception" ./external_compiler-rt_lib_interception.nix {})
    libinterception;

  inherit (callBPPackage "external/compiler-rt/lib/lsan" ./external_compiler-rt_lib_lsan.nix {})
    liblsan;

  inherit (callBPPackage "external/compiler-rt/lib/profile" ./external_compiler-rt_lib_profile.nix {})
    libprofile_rt;

  inherit (callBPPackage "external/compiler-rt/lib/sanitizer_common" ./external_compiler-rt_lib_sanitizer_common.nix {})
    libsan;

  inherit (callBPPackage "external/compiler-rt/lib/sanitizer_common/tests" ./external_compiler-rt_lib_sanitizer_common_tests.nix {})
    san_test san_test-Nolibc san_test_defaults;

  inherit (callBPPackage "external/compiler-rt/lib/tsan" ./external_compiler-rt_lib_tsan.nix {})
    libtsan libtsan_cxx libtsan_rtl_test libtsan_unit_test;

  inherit (callBPPackage "external/compiler-rt/lib/ubsan" ./external_compiler-rt_lib_ubsan.nix {})
    libclang_rt_ubsan_defaults libubsan libubsan_cxx libubsan_standalone libubsan_standalone_cxx;

  inherit (callBPPackage "external/conscrypt" ./external_conscrypt.nix {})
    conscrypt conscrypt-benchmarks conscrypt-nojarjar conscrypt-nojarjar_generated_constants conscrypt-stubs conscrypt-testdex conscrypt-tests conscrypt_generate_constants conscrypt_generated_constants conscrypt_global conscrypt_java_files conscrypt_public_api_files conscrypt_unbundled conscrypt_unbundled-jni-defaults libconscrypt_jni libconscrypt_openjdk_jni libconscrypt_static libjavacrypto libjavacrypto-defaults;

  inherit (callBPPackage "external/conscrypt/apex" ./external_conscrypt_apex.nix {})
    "apex.conscrypt.key" "com.android.conscrypt" "com.android.conscrypt-androidManifest" "com.android.conscrypt-defaults" "com.android.conscrypt.certificate";

  inherit (callBPPackage "external/conscrypt/apex/testing" ./external_conscrypt_apex_testing.nix {})
    "test_com.android.conscrypt";

  inherit (callBPPackage "external/crcalc" ./external_crcalc.nix {})
    cr;

  inherit (callBPPackage "external/crcalc/tests" ./external_crcalc_tests.nix {})
    CRTests;

  inherit (callBPPackage "external/curl" ./external_curl.nix {})
    curl curl_common_defaults libcurl;

  inherit (callBPPackage "external/dagger2" ./external_dagger2.nix {})
    dagger2 dagger2-auto-annotation dagger2-auto-common dagger2-auto-factory dagger2-auto-factory-jar dagger2-auto-service dagger2-auto-service-jar dagger2-auto-value dagger2-auto-value-jar dagger2-compiler dagger2-google-java-format dagger2-inject dagger2-producers;

  inherit (callBPPackage "external/deqp-deps/SPIRV-Headers" ./external_deqp-deps_SPIRV-Headers.nix {})
    "deqp_spirv.core.grammar.json-1.0" "deqp_spirv.core.grammar.json-1.1" "deqp_spirv.core.grammar.json-1.2" "deqp_spirv.core.grammar.json-unified1" "deqp_spirv.glsl.grammar.json" "deqp_spirv.opencl.grammar.json" "deqp_spirv.registry.xml";

  inherit (callBPPackage "external/deqp-deps/SPIRV-Tools" ./external_deqp-deps_SPIRV-Tools.nix {})
    "deqp_gen_spvtools_grammar_tables_1.0" "deqp_gen_spvtools_grammar_tables_1.1" "deqp_gen_spvtools_grammar_tables_1.2" "deqp_spirv.debuginfo.grammar.json" deqp_gen_spvtools_build_version_inc deqp_gen_spvtools_enum_string_mapping deqp_gen_spvtools_generators_inc deqp_gen_spvtools_grammar_tables_amd-gcn-shader deqp_gen_spvtools_grammar_tables_amd-shader-ballot deqp_gen_spvtools_grammar_tables_amd-shader-explicit-vertex-parameter deqp_gen_spvtools_grammar_tables_amd-shader-trinary-minmax deqp_gen_spvtools_grammar_tables_debuginfo deqp_gen_spvtools_grammar_tables_unified1 deqp_gen_spvtools_lang_headers deqp_spirv-tools;

  inherit (callBPPackage "external/deqp-deps/glslang" ./external_deqp-deps_glslang.nix {})
    deqp_HLSL deqp_OGLCompiler deqp_OSDependent deqp_SPIRV deqp_glslang deqp_glslang_defaults;

  inherit (callBPPackage "external/deqp" ./external_deqp.nix {})
    "com.drawelements.deqp" libdeqp;

  inherit (callBPPackage "external/deqp" ./external_deqp_AndroidGen.bp.nix {})
    libdeqp_gen;

  inherit (callBPPackage "external/deqp/android/cts" ./external_deqp_android_cts.nix {})
    CtsDeqpTestCases deqp_angle_exclude_caselists deqp_master_caselists deqp_nyc_caselists;

  inherit (callBPPackage "external/deqp/android/cts/runner/tests" ./external_deqp_android_cts_runner_tests.nix {})
    CtsDeqpRunnerTests;

  inherit (callBPPackage "external/desugar" ./external_desugar.nix {})
    desugar;

  inherit (callBPPackage "external/dexmaker" ./external_dexmaker.nix {})
    DexmakerTests dexmaker dexmaker-dx-target dexmaker-extended-mockmaker dexmaker-extended-mockmaker-tests dexmaker-inline-mockmaker dexmaker-inline-mockmaker-dispatcher dexmaker-inline-mockmaker-tests dexmaker-mockmaker dexmaker-mockmaker-tests dexmaker-tests-lib dexmaker_agent_defaults libdexmakerjvmtiagent libmultiplejvmtiagentsinterferenceagent libstaticjvmtiagent mockito-target mockito-target-extended mockito-target-extended-minus-junit4 mockito-target-inline mockito-target-inline-minus-junit4 mockito-target-minus-junit4;

  inherit (callBPPackage "external/dng_sdk" ./external_dng_sdk.nix {})
    dng_validate dng_validate_host libdng_sdk libdng_sdk-defaults libdng_sdk_validate;

  inherit (callBPPackage "external/dnsmasq/src" ./external_dnsmasq_src.nix {})
    dnsmasq;

  inherit (callBPPackage "external/doclava" ./external_doclava.nix {})
    doclava doclava-no-guava droiddoc-templates-sdk;

  inherit (callBPPackage "external/dokka" ./external_dokka.nix {})
    dokka;

  inherit (callBPPackage "external/drm_hwcomposer" ./external_drm_hwcomposer.nix {})
    "hwcomposer.drm" "hwcomposer.drm_defaults" "hwcomposer.drm_minigbm" drm_hwcomposer drm_hwcomposer_platformhisi libdrmhwc_utils;

  inherit (callBPPackage "external/drm_hwcomposer/tests" ./external_drm_hwcomposer_tests.nix {})
    hwc-drm-tests;

  inherit (callBPPackage "external/drrickorang/LoopbackApp/app/src/main/cpp" ./external_drrickorang_LoopbackApp_app_src_main_cpp.nix {})
    libloopback;

  inherit (callBPPackage "external/dtc" ./external_dtc.nix {})
    dt_defaults dtc fdtget;

  inherit (callBPPackage "external/dtc/libfdt" ./external_dtc_libfdt.nix {})
    libfdt;

  inherit (callBPPackage "external/dynamic_depth" ./external_dynamic_depth.nix {})
    libdynamic_depth libdynamic_depth-defaults libdynamic_depth-internal_headers libdynamic_depth-public_headers libdynamic_depth_ndk;

  inherit (callBPPackage "external/e2fsprogs" ./external_e2fsprogs.nix {})
    e2fsprogs-defaults;

  inherit (callBPPackage "external/e2fsprogs/contrib" ./external_e2fsprogs_contrib.nix {})
    add_ext4_encrypt;

  inherit (callBPPackage "external/e2fsprogs/contrib/android" ./external_e2fsprogs_contrib_android.nix {})
    e2fsdroid ext2simg;

  inherit (callBPPackage "external/e2fsprogs/debugfs" ./external_e2fsprogs_debugfs.nix {})
    debugfs debugfs-defaults debugfs_static;

  inherit (callBPPackage "external/e2fsprogs/e2fsck" ./external_e2fsprogs_e2fsck.nix {})
    e2fsck e2fsck-defaults e2fsck_static;

  inherit (callBPPackage "external/e2fsprogs/lib" ./external_e2fsprogs_lib.nix {})
    libext2-headers;

  inherit (callBPPackage "external/e2fsprogs/lib/blkid" ./external_e2fsprogs_lib_blkid.nix {})
    libext2_blkid;

  inherit (callBPPackage "external/e2fsprogs/lib/e2p" ./external_e2fsprogs_lib_e2p.nix {})
    libext2_e2p;

  inherit (callBPPackage "external/e2fsprogs/lib/et" ./external_e2fsprogs_lib_et.nix {})
    libext2_com_err;

  inherit (callBPPackage "external/e2fsprogs/lib/ext2fs" ./external_e2fsprogs_lib_ext2fs.nix {})
    libext2fs;

  inherit (callBPPackage "external/e2fsprogs/lib/ss" ./external_e2fsprogs_lib_ss.nix {})
    libext2_ss;

  inherit (callBPPackage "external/e2fsprogs/lib/support" ./external_e2fsprogs_lib_support.nix {})
    libext2_profile libext2_quota libext2_support;

  inherit (callBPPackage "external/e2fsprogs/lib/uuid" ./external_e2fsprogs_lib_uuid.nix {})
    libext2_uuid;

  inherit (callBPPackage "external/e2fsprogs/misc" ./external_e2fsprogs_misc.nix {})
    badblocks blkid chattr e2image e4crypt filefrag libext2_misc libtune2fs lsattr lsattr-defaults lsattr_static mke2fs tune2fs tune2fs-defaults tune2fs_static;

  inherit (callBPPackage "external/e2fsprogs/resize" ./external_e2fsprogs_resize.nix {})
    resize2fs;

  inherit (callBPPackage "external/easymock" ./external_easymock.nix {})
    easymock easymocklib;

  inherit (callBPPackage "external/eigen" ./external_eigen.nix {})
    libeigen;

  inherit (callBPPackage "external/eigen/blas" ./external_eigen_blas.nix {})
    eigen-defaults libF77blas libF77blasV8;

  inherit (callBPPackage "external/elfutils" ./external_elfutils.nix {})
    libelf_headers;

  inherit (callBPPackage "external/elfutils/libelf" ./external_elfutils_libelf.nix {})
    libelf;

  inherit (callBPPackage "external/emma" ./external_emma.nix {})
    emma;

  inherit (callBPPackage "external/epid-sdk" ./external_epid-sdk.nix {})
    epid_cflags epid_common_testhelper_utest epid_common_utest epid_member_tpm2_utest epid_member_utest epid_signmsg epid_verifier_utest epid_verifysig libargtable3 libepid_common libepid_common_testhelper libepid_member libepid_util libepid_verifier libippcp;

  inherit (callBPPackage "external/error_prone" ./external_error_prone.nix {})
    error_prone_annotations error_prone_core error_prone_test_helpers;

  inherit (callBPPackage "external/error_prone/soong" ./external_error_prone_soong.nix {})
    soong-java-config-error_prone;

  inherit (callBPPackage "external/expat" ./external_expat.nix {})
    libexpat;

  inherit (callBPPackage "external/f2fs-tools" ./external_f2fs-tools.nix {})
    "f2fs.fibmap" "fsck.f2fs" check_f2fs f2fs-tools-defaults f2fscrypt f2fsstat fsck_main_src_files libf2fs_fmt libf2fs_fmt_host libf2fs_src_files make_f2fs make_f2fs_src_files sload_f2fs tools-defaults;

  inherit (callBPPackage "external/f2fs-tools/tools/f2fs_io" ./external_f2fs-tools_tools_f2fs_io.nix {})
    f2fs-io-defaults f2fs_io;

  inherit (callBPPackage "external/f2fs-tools/tools/sg_write_buffer" ./external_f2fs-tools_tools_sg_write_buffer.nix {})
    sg3-utils-defaults sg_write_buffer;

  inherit (callBPPackage "external/fdlibm" ./external_fdlibm.nix {})
    libfdlibm;

  inherit (callBPPackage "external/fec" ./external_fec.nix {})
    libfec_rs;

  inherit (callBPPackage "external/flac" ./external_flac.nix {})
    libFLAC-config libFLAC-headers;

  inherit (callBPPackage "external/flac/libFLAC" ./external_flac_libFLAC.nix {})
    libFLAC;

  inherit (callBPPackage "external/flatbuffers" ./external_flatbuffers.nix {})
    flatbuffer_headers flatbuffers-java flatc;

  inherit (callBPPackage "external/fonttools/Lib/fontTools" ./external_fonttools_Lib_fontTools.nix {})
    fontTools fonttools_default;

  inherit (callBPPackage "external/freetype" ./external_freetype.nix {})
    libft2;

  inherit (callBPPackage "external/fsck_msdos" ./external_fsck_msdos.nix {})
    fsck_msdos;

  inherit (callBPPackage "external/fsverity-utils" ./external_fsverity-utils.nix {})
    fsverity;

  inherit (callBPPackage "external/gemmlowp" ./external_gemmlowp.nix {})
    gemmlowp_headers libfixedpoint libgemmlowp;

  inherit (callBPPackage "external/gemmlowp/eight_bit_int_gemm" ./external_gemmlowp_eight_bit_int_gemm.nix {})
    libbnnmlowp libbnnmlowp-defaults libbnnmlowpV8;

  inherit (callBPPackage "external/gflags" ./external_gflags.nix {})
    libgflags;

  inherit (callBPPackage "external/giflib" ./external_giflib.nix {})
    libgif;

  inherit (callBPPackage "external/glide" ./external_glide.nix {})
    glide;

  inherit (callBPPackage "external/golang-protobuf" ./external_golang-protobuf.nix {})
    golang-protobuf-proto golang-protobuf-proto-proto3_proto golang-protobuf-proto-test-proto golang-protobuf-proto_test golang-protobuf-ptypes golang-protobuf-ptypes-any golang-protobuf-ptypes-duration golang-protobuf-ptypes-empty golang-protobuf-ptypes-struct golang-protobuf-ptypes-timestamp golang-protobuf-ptypes-wrappers protoc-gen-go protoc-gen-go_descriptor protoc-gen-go_generator protoc-gen-go_generator_internal_remap protoc-gen-go_grpc protoc-gen-go_plugin;

  inherit (callBPPackage "external/google-benchmark" ./external_google-benchmark.nix {})
    google-benchmark-test libgoogle-benchmark;

  inherit (callBPPackage "external/google-breakpad" ./external_google-breakpad.nix {})
    breakpad_client core2md dump_syms libdisasm minidump_stackwalk sym_upload;

  inherit (callBPPackage "external/google-fruit" ./external_google-fruit.nix {})
    libfruit libfruit-example-defaults libfruit-example-hello-world;

  inherit (callBPPackage "external/googletest/googlemock" ./external_googletest_googlemock.nix {})
    gmock_defaults gmock_flags gmock_ndk libgmock libgmock_host libgmock_main libgmock_main_host libgmock_main_ndk libgmock_ndk;

  inherit (callBPPackage "external/googletest/googletest" ./external_googletest_googletest.nix {})
    "libgtest_main_ndk_c++" "libgtest_ndk_c++" libgtest libgtest_defaults libgtest_host libgtest_host_defaults libgtest_main libgtest_main_host libgtest_prod;

  inherit (callBPPackage "external/gptfdisk" ./external_gptfdisk.nix {})
    sgdisk;

  inherit (callBPPackage "external/grpc-grpc-java" ./external_grpc-grpc-java.nix {})
    grpc-java;

  inherit (callBPPackage "external/grpc-grpc-java/context" ./external_grpc-grpc-java_context.nix {})
    grpc-java-context;

  inherit (callBPPackage "external/grpc-grpc-java/core" ./external_grpc-grpc-java_core.nix {})
    grpc-java-core;

  inherit (callBPPackage "external/grpc-grpc-java/netty/shaded" ./external_grpc-grpc-java_netty_shaded.nix {})
    grpc-java-netty-shaded;

  inherit (callBPPackage "external/grpc-grpc-java/protobuf" ./external_grpc-grpc-java_protobuf.nix {})
    grpc-java-protobuf;

  inherit (callBPPackage "external/grpc-grpc-java/stub" ./external_grpc-grpc-java_stub.nix {})
    grpc-java-stub;

  inherit (callBPPackage "external/guava" ./external_guava.nix {})
    guava guavalib;

  inherit (callBPPackage "external/guice" ./external_guice.nix {})
    guice guice-no-guava guice_munge guice_munge_manifest guice_munge_srcjar guice_munged_srcs guice_srcs guice_test_src_files;

  inherit (callBPPackage "external/hamcrest/hamcrest-core" ./external_hamcrest_hamcrest-core.nix {})
    hamcrest;

  inherit (callBPPackage "external/hamcrest/hamcrest-library" ./external_hamcrest_hamcrest-library.nix {})
    hamcrest-library;

  inherit (callBPPackage "external/harfbuzz_ng" ./external_harfbuzz_ng.nix {})
    libharfbuzz_ng;

  inherit (callBPPackage "external/honggfuzz" ./external_honggfuzz.nix {})
    honggfuzz honggfuzz-defaults honggfuzz_libcommon honggfuzz_libcommon_headers honggfuzz_libhfuzz honggfuzz_libhfuzz_headers;

  inherit (callBPPackage "external/honggfuzz/third_party/android/libBlocksRuntime" ./external_honggfuzz_third_party_android_libBlocksRuntime.nix {})
    libBlocksRuntime;

  inherit (callBPPackage "external/icu/android_icu4c" ./external_icu_android_icu4c.nix {})
    icu4c_extra_headers;

  inherit (callBPPackage "external/icu/android_icu4j" ./external_icu_android_icu4j.nix {})
    android-icu4j-tests android_icu4j_resources android_icu4j_src_files android_icu4j_src_files_for_docs;

  inherit (callBPPackage "external/icu/icu4c/source" ./external_icu_icu4c_source.nix {})
    libicuuc_stubdata;

  inherit (callBPPackage "external/icu/icu4c/source/common" ./external_icu_icu4c_source_common.nix {})
    libicuuc libicuuc_defaults libicuuc_headers;

  inherit (callBPPackage "external/icu/icu4c/source/i18n" ./external_icu_icu4c_source_i18n.nix {})
    libicui18n libicui18n_defaults libicui18n_headers;

  inherit (callBPPackage "external/icu/icu4c/source/stubdata" ./external_icu_icu4c_source_stubdata.nix {})
    "apex_icu.dat";

  inherit (callBPPackage "external/icu/icu4j" ./external_icu_icu4j.nix {})
    generated_android_icu4j_resources generated_android_icu4j_src_files generated_android_icu4j_test_files generated_android_icu4j_test_resources icu4j icu4j-defaults icu4j-host icu4j-icudata icu4j-icudata-jarjar icu4j-icutzdata icu4j-icutzdata-jarjar icu4j-testdata icu4j-tests;

  inherit (callBPPackage "external/icu/libandroidicu" ./external_icu_libandroidicu.nix {})
    libandroidicu;

  inherit (callBPPackage "external/icu/libandroidicu/static_shim" ./external_icu_libandroidicu_static_shim.nix {})
    libandroidicu_static;

  inherit (callBPPackage "external/icu/tools/srcgen" ./external_icu_tools_srcgen.nix {})
    android_icu4j_srcgen android_icu4j_srcgen_binary generate_android_icu4j_script;

  inherit (callBPPackage "external/icu/tools/srcgen/currysrc" ./external_icu_tools_srcgen_currysrc.nix {})
    "currysrc_org.eclipse" currysrc;

  inherit (callBPPackage "external/image_io" ./external_image_io.nix {})
    libimage_io libimage_io-defaults libimage_io-headers libimage_io_ndk libimage_io_ndk-headers;

  inherit (callBPPackage "external/ims/rcs/presencepolling" ./external_ims_rcs_presencepolling.nix {})
    PresencePolling PresencePollingTestHelper presence_polling_defaults;

  inherit (callBPPackage "external/ims/rcs/presencepolling/tests" ./external_ims_rcs_presencepolling_tests.nix {})
    PresencePollingTests;

  inherit (callBPPackage "external/ims/rcs/rcsmanager" ./external_ims_rcs_rcsmanager.nix {})
    "com.android.ims.rcsmanager";

  inherit (callBPPackage "external/ims/rcs/rcsservice" ./external_ims_rcs_rcsservice.nix {})
    RcsService;

  inherit (callBPPackage "external/iperf3" ./external_iperf3.nix {})
    iperf;

  inherit (callBPPackage "external/iproute2" ./external_iproute2.nix {})
    iproute2_defaults iproute2_headers;

  inherit (callBPPackage "external/iproute2/ip" ./external_iproute2_ip.nix {})
    ip;

  inherit (callBPPackage "external/iproute2/lib" ./external_iproute2_lib.nix {})
    libiprouteutil libnetlink;

  inherit (callBPPackage "external/iproute2/misc" ./external_iproute2_misc.nix {})
    ss;

  inherit (callBPPackage "external/iproute2/tc" ./external_iproute2_tc.nix {})
    tc;

  inherit (callBPPackage "external/ipsec-tools" ./external_ipsec-tools.nix {})
    libipsec racoon;

  inherit (callBPPackage "external/iptables" ./external_iptables.nix {})
    iptables_config_header iptables_defaults iptables_headers iptables_iptables_headers;

  inherit (callBPPackage "external/iptables/extensions" ./external_iptables_extensions.nix {})
    libext libext4 libext4_init libext4_srcs libext6 libext6_init libext6_srcs libext_defaults libext_init libext_srcs;

  inherit (callBPPackage "external/iptables/iptables" ./external_iptables_iptables.nix {})
    "xtables.lock" ip6tables iptables iptables_cmd_defaults;

  inherit (callBPPackage "external/iptables/libiptc" ./external_iptables_libiptc.nix {})
    libip4tc libip6tc libiptc_defaults;

  inherit (callBPPackage "external/iptables/libxtables" ./external_iptables_libxtables.nix {})
    libxtables;

  inherit (callBPPackage "external/iputils" ./external_iputils.nix {})
    arping iputils_defaults ping ping6 tracepath tracepath6 traceroute6;

  inherit (callBPPackage "external/iw" ./external_iw.nix {})
    iw iw_common iw_vendor iw_version;

  inherit (callBPPackage "external/jacoco" ./external_jacoco.nix {})
    jacoco-cli jacoco-stubs jacoco-stubs-gen jacocoagent;

  inherit (callBPPackage "external/jarjar" ./external_jarjar.nix {})
    jarjar jarjar-apache-ant jarjar-maven-plugin-api;

  inherit (callBPPackage "external/javaparser" ./external_javaparser.nix {})
    javaparser;

  inherit (callBPPackage "external/javapoet" ./external_javapoet.nix {})
    javapoet;

  inherit (callBPPackage "external/javasqlite" ./external_javasqlite.nix {})
    libsqlite_jni sqlite-jdbc;

  inherit (callBPPackage "external/jcommander" ./external_jcommander.nix {})
    jcommander;

  inherit (callBPPackage "external/jdiff" ./external_jdiff.nix {})
    jdiff;

  inherit (callBPPackage "external/jemalloc" ./external_jemalloc.nix {})
    jemalloc_defaults jemalloc_integrationtests jemalloc_unittests libjemalloc libjemalloc_integrationtest libjemalloc_jet libjemalloc_unittest;

  inherit (callBPPackage "external/jemalloc_new" ./external_jemalloc_new.nix {})
    jemalloc5_defaults jemalloc5_integrationtests jemalloc5_stresstests jemalloc5_unittests libjemalloc5 libjemalloc5_integrationtest libjemalloc5_jet libjemalloc5_stresstestlib libjemalloc5_unittest;

  inherit (callBPPackage "external/jline" ./external_jline.nix {})
    "jline-1.0";

  inherit (callBPPackage "external/jsilver" ./external_jsilver.nix {})
    jsilver;

  inherit (callBPPackage "external/jsmn" ./external_jsmn.nix {})
    libjsmn;

  inherit (callBPPackage "external/jsoncpp" ./external_jsoncpp.nix {})
    libjsoncpp libjsoncpp_defaults libjsoncpp_ndk;

  inherit (callBPPackage "external/jsr305" ./external_jsr305.nix {})
    jsr305 jsr305lib;

  inherit (callBPPackage "external/jsr330" ./external_jsr330.nix {})
    jsr330 jsr330-tck;

  inherit (callBPPackage "external/junit-params" ./external_junit-params.nix {})
    junit-params junit-params-assertj-core junit-params-host junit-params-test;

  inherit (callBPPackage "external/junit" ./external_junit.nix {})
    junit junit-host;

  inherit (callBPPackage "external/kmod" ./external_kmod.nix {})
    depmod;

  inherit (callBPPackage "external/kotlinc" ./external_kotlinc.nix {})
    kotlin-annotations kotlin-reflect kotlin-stdlib kotlin-test;

  inherit (callBPPackage "external/ksoap2" ./external_ksoap2.nix {})
    ksoap2;

  inherit (callBPPackage "external/libaom" ./external_libaom.nix {})
    libaom;

  inherit (callBPPackage "external/libavc" ./external_libavc.nix {})
    libavcdec libavcenc;

  inherit (callBPPackage "external/libavc/test" ./external_libavc_test.nix {})
    avcdec avcenc;

  inherit (callBPPackage "external/libbackup" ./external_libbackup.nix {})
    libbackup;

  inherit (callBPPackage "external/libbrillo" ./external_libbrillo.nix {})
    libbrillo libbrillo-binder libbrillo-http libbrillo-minijail libbrillo-policy libbrillo-stream libbrillo-test-helpers libbrillo_test;

  inherit (callBPPackage "external/libcap-ng" ./external_libcap-ng.nix {})
    libcap-ng;

  inherit (callBPPackage "external/libcap" ./external_libcap.nix {})
    getcap libcap libcap_defaults setcap;

  inherit (callBPPackage "external/libchrome" ./external_libchrome.nix {})
    "android.mojo" jni_generator jni_registration_generator libchrome libchrome-crypto libchrome-crypto-include libchrome-defaults libchrome-include libchrome-include-sources libchrome-test-defaults libchrome_test libchrome_test_helpers libchrome_test_helpers-host libmojo libmojo_common_custom_types__type_mappings libmojo_jni_headers libmojo_jni_registration_headers libmojo_mojo_sources libmojo_mojom_files libmojo_mojom_headers libmojo_mojom_java_srcs libmojo_mojom_pickles libmojo_mojom_srcs libmojo_mojom_templates libmojo_scripts mojom_bindings_generator mojom_generate_type_mappings;

  inherit (callBPPackage "external/libchrome/soong" ./external_libchrome_soong.nix {})
    soong-libchrome;

  inherit (callBPPackage "external/libcups" ./external_libcups.nix {})
    libcups;

  inherit (callBPPackage "external/libcxx" ./external_libcxx.nix {})
    "filesystem_dynamic_test_helper.py" "libc++ defaults" "libc++" "libc++_static" "libc++experimental" "libc++fs" libcxx_test_template;

  inherit (callBPPackage "external/libcxxabi" ./external_libcxxabi.nix {})
    "libc++abi";

  inherit (callBPPackage "external/libdaemon" ./external_libdaemon.nix {})
    libdaemon;

  inherit (callBPPackage "external/libdivsufsort" ./external_libdivsufsort.nix {})
    libdivsufsort libdivsufsort64 libdivsufsort_defaults;

  inherit (callBPPackage "external/libdrm" ./external_libdrm.nix {})
    libdrm libdrm_defaults;

  inherit (callBPPackage "external/libdrm" ./external_libdrm_Android.sources.bp.nix {})
    libdrm_sources;

  inherit (callBPPackage "external/libdrm/amdgpu" ./external_libdrm_amdgpu.nix {})
    libdrm_amdgpu;

  inherit (callBPPackage "external/libdrm/amdgpu" ./external_libdrm_amdgpu_Android.sources.bp.nix {})
    libdrm_amdgpu_sources;

  inherit (callBPPackage "external/libdrm/data" ./external_libdrm_data.nix {})
    "amdgpu.ids";

  inherit (callBPPackage "external/libdrm/etnaviv" ./external_libdrm_etnaviv.nix {})
    libdrm_etnaviv;

  inherit (callBPPackage "external/libdrm/etnaviv" ./external_libdrm_etnaviv_Android.sources.bp.nix {})
    libdrm_etnaviv_sources;

  inherit (callBPPackage "external/libdrm/freedreno" ./external_libdrm_freedreno.nix {})
    libdrm_freedreno;

  inherit (callBPPackage "external/libdrm/freedreno" ./external_libdrm_freedreno_Android.sources.bp.nix {})
    libdrm_freedreno_sources;

  inherit (callBPPackage "external/libdrm/intel" ./external_libdrm_intel.nix {})
    libdrm_intel;

  inherit (callBPPackage "external/libdrm/intel" ./external_libdrm_intel_Android.sources.bp.nix {})
    libdrm_intel_sources;

  inherit (callBPPackage "external/libdrm/libkms" ./external_libdrm_libkms.nix {})
    libkms;

  inherit (callBPPackage "external/libdrm/libkms" ./external_libdrm_libkms_Android.sources.bp.nix {})
    libkms_intel_sources libkms_nouveau_sources libkms_radeon_sources libkms_sources libkms_vmwgfx_sources;

  inherit (callBPPackage "external/libdrm/nouveau" ./external_libdrm_nouveau.nix {})
    libdrm_nouveau;

  inherit (callBPPackage "external/libdrm/nouveau" ./external_libdrm_nouveau_Android.sources.bp.nix {})
    libdrm_nouveau_sources;

  inherit (callBPPackage "external/libdrm/omap" ./external_libdrm_omap.nix {})
    libdrm_omap;

  inherit (callBPPackage "external/libdrm/omap" ./external_libdrm_omap_Android.sources.bp.nix {})
    libdrm_omap_sources;

  inherit (callBPPackage "external/libdrm/radeon" ./external_libdrm_radeon.nix {})
    libdrm_radeon;

  inherit (callBPPackage "external/libdrm/radeon" ./external_libdrm_radeon_Android.sources.bp.nix {})
    libdrm_radeon_sources;

  inherit (callBPPackage "external/libdrm/rockchip" ./external_libdrm_rockchip.nix {})
    libdrm_rockchip;

  inherit (callBPPackage "external/libdrm/tegra" ./external_libdrm_tegra.nix {})
    libdrm_tegra;

  inherit (callBPPackage "external/libdrm/tests" ./external_libdrm_tests.nix {})
    libdrm_test_headers;

  inherit (callBPPackage "external/libdrm/tests/modetest" ./external_libdrm_tests_modetest.nix {})
    modetest;

  inherit (callBPPackage "external/libdrm/tests/modetest" ./external_libdrm_tests_modetest_Android.sources.bp.nix {})
    modetest_sources;

  inherit (callBPPackage "external/libdrm/tests/planetest" ./external_libdrm_tests_planetest.nix {})
    atomictest planetest;

  inherit (callBPPackage "external/libdrm/tests/planetest" ./external_libdrm_tests_planetest_Android.sources.bp.nix {})
    atomictest_sources planetest_common_sources planetest_sources;

  inherit (callBPPackage "external/libdrm/tests/proptest" ./external_libdrm_tests_proptest.nix {})
    proptest;

  inherit (callBPPackage "external/libdrm/tests/util" ./external_libdrm_tests_util.nix {})
    libdrm_util;

  inherit (callBPPackage "external/libdrm/tests/util" ./external_libdrm_tests_util_Android.sources.bp.nix {})
    libdrm_util_sources;

  inherit (callBPPackage "external/libese/apps" ./external_libese_apps.nix {})
    libese-app-defaults;

  inherit (callBPPackage "external/libese/apps/boot" ./external_libese_apps_boot.nix {})
    ese-boot-tool libese-app-boot libese-app-boot-fortest;

  inherit (callBPPackage "external/libese/apps/boot/tests" ./external_libese_apps_boot_tests.nix {})
    ese_app_boot_tests;

  inherit (callBPPackage "external/libese/apps/weaver" ./external_libese_apps_weaver.nix {})
    libese-app-weaver libese-app-weaver-test;

  inherit (callBPPackage "external/libese/esed" ./external_libese_esed.nix {})
    esed esed_defaults;

  inherit (callBPPackage "external/libese/examples" ./external_libese_examples.nix {})
    ese_nxp_sample;

  inherit (callBPPackage "external/libese/libapdu" ./external_libese_libapdu.nix {})
    libapdu libapdu_defaults;

  inherit (callBPPackage "external/libese/libapdu/tests" ./external_libese_libapdu_tests.nix {})
    libapdu_test;

  inherit (callBPPackage "external/libese/libese-cpp" ./external_libese_libese-cpp.nix {})
    libese_cpp libese_cpp_defaults libese_cpp_mock libese_cpp_nxp_pn80t_nq_nci;

  inherit (callBPPackage "external/libese/libese-hw" ./external_libese_libese-hw.nix {})
    libese-hw-echo libese-hw-fake;

  inherit (callBPPackage "external/libese/libese-hw/nxp" ./external_libese_libese-hw_nxp.nix {})
    libese-hw-nxp-pn80t-common libese-hw-nxp-pn80t-nq-nci libese-hw-nxp-pn80t-spidev pn80t_platform;

  inherit (callBPPackage "external/libese/libese-hw/tests" ./external_libese_libese-hw_tests.nix {})
    ese_hw_tests;

  inherit (callBPPackage "external/libese/libese-sysdeps" ./external_libese_libese-sysdeps.nix {})
    libese-sysdeps;

  inherit (callBPPackage "external/libese/libese-teq1" ./external_libese_libese-teq1.nix {})
    libese-teq1 libese-teq1-private;

  inherit (callBPPackage "external/libese/libese-teq1/tests" ./external_libese_libese-teq1_tests.nix {})
    ese_teq1_unittests;

  inherit (callBPPackage "external/libese/libese" ./external_libese_libese.nix {})
    libese libese-api-defaults libese-defaults;

  inherit (callBPPackage "external/libese/libese/tests" ./external_libese_libese_tests.nix {})
    ese_unittests;

  inherit (callBPPackage "external/libese/third_party/NXPNFC_P61_JCOP_Kit" ./external_libese_third_party_NXPNFC_P61_JCOP_Kit.nix {})
    libp61-jcop-kit;

  inherit (callBPPackage "external/libese/tools/ese_ls_provision" ./external_libese_tools_ese_ls_provision.nix {})
    ese-ls-provision;

  inherit (callBPPackage "external/libese/tools/ese_relay" ./external_libese_tools_ese_relay.nix {})
    ese-relay-defaults ese-relay-fake ese-relay-pn80t-nq-nci ese-relay-pn80t-spidev;

  inherit (callBPPackage "external/libese/tools/ese_replay" ./external_libese_tools_ese_replay.nix {})
    ese-replay;

  inherit (callBPPackage "external/libevent" ./external_libevent.nix {})
    libevent;

  inherit (callBPPackage "external/libexif" ./external_libexif.nix {})
    libexif;

  inherit (callBPPackage "external/libffi" ./external_libffi.nix {})
    ffi_header libffi;

  inherit (callBPPackage "external/libgav1" ./external_libgav1.nix {})
    libgav1;

  inherit (callBPPackage "external/libgsm" ./external_libgsm.nix {})
    libgsm;

  inherit (callBPPackage "external/libhevc" ./external_libhevc.nix {})
    hevcdec hevcenc libhevcdec libhevcenc;

  inherit (callBPPackage "external/libjpeg-turbo" ./external_libjpeg-turbo.nix {})
    libjpeg libjpeg-defaults libjpeg_static_ndk tjbench;

  inherit (callBPPackage "external/libkmsxx" ./external_libkmsxx.nix {})
    libkmsxx;

  inherit (callBPPackage "external/libldac" ./external_libldac.nix {})
    libldacBT_abr libldacBT_enc;

  inherit (callBPPackage "external/libmpeg2" ./external_libmpeg2.nix {})
    libmpeg2dec;

  inherit (callBPPackage "external/libmpeg2/test" ./external_libmpeg2_test.nix {})
    mpeg2dec;

  inherit (callBPPackage "external/libnetfilter_conntrack" ./external_libnetfilter_conntrack.nix {})
    libnetfilter_conntrack;

  inherit (callBPPackage "external/libnfnetlink" ./external_libnfnetlink.nix {})
    libnfnetlink;

  inherit (callBPPackage "external/libnl" ./external_libnl.nix {})
    libnl;

  inherit (callBPPackage "external/libogg" ./external_libogg.nix {})
    libogg;

  inherit (callBPPackage "external/libopus" ./external_libopus.nix {})
    libopus;

  inherit (callBPPackage "external/libpcap" ./external_libpcap.nix {})
    libpcap libpcap_defaults libpcap_test;

  inherit (callBPPackage "external/libphonenumber" ./external_libphonenumber.nix {})
    libphonenumber libphonenumber-nogeocoder libphonenumber-platform libphonenumber-unbundled-defaults libphonenumber_test;

  inherit (callBPPackage "external/libpng" ./external_libpng.nix {})
    libpng libpng-defaults libpng_ndk pngtest;

  inherit (callBPPackage "external/libtextclassifier" ./external_libtextclassifier.nix {})
    fbgen libtextclassifier libtextclassifier-java libtextclassifier_actions_suggestions_universal_model libtextclassifier_annotator_en_model libtextclassifier_annotator_universal_model libtextclassifier_defaults libtextclassifier_fbgen_actions-entity-data libtextclassifier_fbgen_actions_model libtextclassifier_fbgen_annotator_model libtextclassifier_fbgen_codepoint_range libtextclassifier_fbgen_entity-data libtextclassifier_fbgen_flatbuffers libtextclassifier_fbgen_intent_config libtextclassifier_fbgen_lang_id_embedded_network libtextclassifier_fbgen_lang_id_model libtextclassifier_fbgen_resources_extra libtextclassifier_fbgen_tflite_text_encoder_config libtextclassifier_fbgen_tokenizer libtextclassifier_fbgen_zlib_buffer libtextclassifier_hash libtextclassifier_hash_defaults libtextclassifier_hash_headers libtextclassifier_hash_static libtextclassifier_lang_id_model libtextclassifier_tests;

  inherit (callBPPackage "external/libunwind" ./external_libunwind.nix {})
    libunwind libunwind-unit-tests libunwind_core_defaults libunwind_defaults libunwind_static libunwindbacktrace;

  inherit (callBPPackage "external/libunwind_llvm" ./external_libunwind_llvm.nix {})
    libunwind_llvm;

  inherit (callBPPackage "external/libusb" ./external_libusb.nix {})
    libusb;

  inherit (callBPPackage "external/libutf" ./external_libutf.nix {})
    libutf;

  inherit (callBPPackage "external/libvpx" ./external_libvpx.nix {})
    libvpx;

  inherit (callBPPackage "external/libvpx/libwebm" ./external_libvpx_libwebm.nix {})
    libwebm;

  inherit (callBPPackage "external/libvterm" ./external_libvterm.nix {})
    libvterm;

  inherit (callBPPackage "external/libxaac" ./external_libxaac.nix {})
    libxaacdec;

  inherit (callBPPackage "external/libxaac/test" ./external_libxaac_test.nix {})
    xaacdec;

  inherit (callBPPackage "external/libxcam" ./external_libxcam.nix {})
    libxcam libxcam_defaults test-soft-image;

  inherit (callBPPackage "external/libxkbcommon" ./external_libxkbcommon.nix {})
    libxkbcommon;

  inherit (callBPPackage "external/libxml2" ./external_libxml2.nix {})
    libxml2 libxml2-defaults libxml2_ndk xmllint;

  inherit (callBPPackage "external/libyuv/files" ./external_libyuv_files.nix {})
    libyuv libyuv_static libyuv_unittest;

  inherit (callBPPackage "external/linux-kselftest" ./external_linux-kselftest.nix {})
    "kselftest_exec_execveat.sh" "kselftest_ftrace_test.d_00basic_basic1" "kselftest_ftrace_test.d_00basic_basic2" "kselftest_ftrace_test.d_00basic_basic3" "kselftest_ftrace_test.d_00basic_basic4" "kselftest_ftrace_test.d_functions" "kselftest_ftrace_test.d_instances_instance" "kselftest_ftrace_test.d_instances_instance-event" "kselftest_ftrace_test.d_template" "kselftest_futex_functional_run.sh" "kselftest_intel_pstate_run.sh" "kselftest_splice_default_file_splice_read.sh" "kselftest_zram_zram.sh" "kselftest_zram_zram01.sh" "kselftest_zram_zram02.sh" "kselftest_zram_zram_lib.sh" kselftest_breakpoints_tests kselftest_capabilities_test kselftest_cpu-hotplug_cpu-on-off-test kselftest_defaults kselftest_efivarfs_efivarfs kselftest_efivarfs_tests kselftest_exec_test kselftest_firmware_fw_fallback kselftest_firmware_fw_filesystem kselftest_ftrace_ftracetest kselftest_futex_tests kselftest_intel_pstate_tests kselftest_kcmp_tests kselftest_lib_bitmap kselftest_lib_printf kselftest_media_tests kselftest_membarrier_tests kselftest_memory-hotplug_mem-on-off-test kselftest_mount_tests kselftest_net_test_bpf kselftest_net_tests kselftest_pstore_common_tests kselftest_pstore_pstore_crash_test kselftest_pstore_pstore_post_reboot_tests kselftest_pstore_pstore_tests kselftest_ptrace_tests kselftest_rtc_tests kselftest_seccomp_tests kselftest_size_test kselftest_splice_test kselftest_static_keys_test_static_keys kselftest_timer_tests kselftest_user_test_user_copy kselftest_vdso_test kselftest_vm64_tests kselftest_vm_run_vmtests kselftest_vm_tests kselftest_x86_check_initial_reg_state kselftest_x86_ptrace_syscall kselftest_x86_test_syscall_vdso kselftest_x86_tests;

  inherit (callBPPackage "external/llvm/lib/Analysis" ./external_llvm_lib_Analysis.nix {})
    libLLVMAnalysis;

  inherit (callBPPackage "external/llvm/lib" ./external_llvm_lib.nix {})
    llvm-lib-defaults;

  inherit (callBPPackage "external/llvm/lib/AsmParser" ./external_llvm_lib_AsmParser.nix {})
    libLLVMAsmParser;

  inherit (callBPPackage "external/llvm/lib/Bitcode/Reader" ./external_llvm_lib_Bitcode_Reader.nix {})
    libLLVMBitReader;

  inherit (callBPPackage "external/llvm/lib/Bitcode/Writer" ./external_llvm_lib_Bitcode_Writer.nix {})
    libLLVMBitWriter;

  inherit (callBPPackage "external/llvm/lib/CodeGen" ./external_llvm_lib_CodeGen.nix {})
    libLLVMCodeGen;

  inherit (callBPPackage "external/llvm/lib/CodeGen/AsmPrinter" ./external_llvm_lib_CodeGen_AsmPrinter.nix {})
    libLLVMAsmPrinter;

  inherit (callBPPackage "external/llvm/lib/CodeGen/GlobalISel" ./external_llvm_lib_CodeGen_GlobalISel.nix {})
    libLLVMGlobalISel;

  inherit (callBPPackage "external/llvm/lib/CodeGen/MIRParser" ./external_llvm_lib_CodeGen_MIRParser.nix {})
    libLLVMMIRParser;

  inherit (callBPPackage "external/llvm/lib/CodeGen/SelectionDAG" ./external_llvm_lib_CodeGen_SelectionDAG.nix {})
    libLLVMSelectionDAG;

  inherit (callBPPackage "external/llvm/lib/DebugInfo/CodeView" ./external_llvm_lib_DebugInfo_CodeView.nix {})
    libLLVMDebugInfoCodeView;

  inherit (callBPPackage "external/llvm/lib/DebugInfo/DWARF" ./external_llvm_lib_DebugInfo_DWARF.nix {})
    libLLVMDebugInfoDWARF;

  inherit (callBPPackage "external/llvm/lib/DebugInfo/PDB" ./external_llvm_lib_DebugInfo_PDB.nix {})
    libLLVMDebugInfoPDB;

  inherit (callBPPackage "external/llvm/lib/DebugInfo/Symbolize" ./external_llvm_lib_DebugInfo_Symbolize.nix {})
    libLLVMSymbolize;

  inherit (callBPPackage "external/llvm/lib/ExecutionEngine" ./external_llvm_lib_ExecutionEngine.nix {})
    libLLVMExecutionEngine;

  inherit (callBPPackage "external/llvm/lib/ExecutionEngine/Interpreter" ./external_llvm_lib_ExecutionEngine_Interpreter.nix {})
    libLLVMInterpreter;

  inherit (callBPPackage "external/llvm/lib/ExecutionEngine/MCJIT" ./external_llvm_lib_ExecutionEngine_MCJIT.nix {})
    libLLVMMCJIT;

  inherit (callBPPackage "external/llvm/lib/ExecutionEngine/Orc" ./external_llvm_lib_ExecutionEngine_Orc.nix {})
    libLLVMOrcJIT;

  inherit (callBPPackage "external/llvm/lib/ExecutionEngine/RuntimeDyld" ./external_llvm_lib_ExecutionEngine_RuntimeDyld.nix {})
    libLLVMRuntimeDyld;

  inherit (callBPPackage "external/llvm/lib/Fuzzer" ./external_llvm_lib_Fuzzer.nix {})
    libLLVMFuzzer libLLVMFuzzerNoMain;

  inherit (callBPPackage "external/llvm/lib/IR" ./external_llvm_lib_IR.nix {})
    libLLVMCore llvm-gen-core;

  inherit (callBPPackage "external/llvm/lib/IRReader" ./external_llvm_lib_IRReader.nix {})
    libLLVMIRReader;

  inherit (callBPPackage "external/llvm/lib/LTO" ./external_llvm_lib_LTO.nix {})
    libLLVMLTO;

  inherit (callBPPackage "external/llvm/lib/LibDriver" ./external_llvm_lib_LibDriver.nix {})
    libLLVMLibDriver llvm-gen-libdriver;

  inherit (callBPPackage "external/llvm/lib/Linker" ./external_llvm_lib_Linker.nix {})
    libLLVMLinker;

  inherit (callBPPackage "external/llvm/lib/MC" ./external_llvm_lib_MC.nix {})
    libLLVMMC;

  inherit (callBPPackage "external/llvm/lib/MC/MCDisassembler" ./external_llvm_lib_MC_MCDisassembler.nix {})
    libLLVMMCDisassembler;

  inherit (callBPPackage "external/llvm/lib/MC/MCParser" ./external_llvm_lib_MC_MCParser.nix {})
    libLLVMMCParser;

  inherit (callBPPackage "external/llvm/lib/Object" ./external_llvm_lib_Object.nix {})
    libLLVMObject;

  inherit (callBPPackage "external/llvm/lib/ObjectYAML" ./external_llvm_lib_ObjectYAML.nix {})
    libLLVMObjectYAML;

  inherit (callBPPackage "external/llvm/lib/Option" ./external_llvm_lib_Option.nix {})
    libLLVMOption;

  inherit (callBPPackage "external/llvm/lib/Passes" ./external_llvm_lib_Passes.nix {})
    libLLVMPasses;

  inherit (callBPPackage "external/llvm/lib/ProfileData" ./external_llvm_lib_ProfileData.nix {})
    libLLVMProfileData;

  inherit (callBPPackage "external/llvm/lib/ProfileData/Coverage" ./external_llvm_lib_ProfileData_Coverage.nix {})
    libLLVMProfileDataCoverage;

  inherit (callBPPackage "external/llvm/lib/Support" ./external_llvm_lib_Support.nix {})
    libLLVMSupport;

  inherit (callBPPackage "external/llvm/lib/TableGen" ./external_llvm_lib_TableGen.nix {})
    libLLVMTableGen;

  inherit (callBPPackage "external/llvm/lib/Target/AArch64" ./external_llvm_lib_Target_AArch64.nix {})
    libLLVMAArch64CodeGen llvm-aarch64-defaults llvm-aarch64-headers llvm-gen-aarch64;

  inherit (callBPPackage "external/llvm/lib/Target/AArch64/AsmParser" ./external_llvm_lib_Target_AArch64_AsmParser.nix {})
    libLLVMAArch64AsmParser;

  inherit (callBPPackage "external/llvm/lib/Target/AArch64/Disassembler" ./external_llvm_lib_Target_AArch64_Disassembler.nix {})
    libLLVMAArch64Disassembler;

  inherit (callBPPackage "external/llvm/lib/Target/AArch64/InstPrinter" ./external_llvm_lib_Target_AArch64_InstPrinter.nix {})
    libLLVMAArch64AsmPrinter;

  inherit (callBPPackage "external/llvm/lib/Target/AArch64/MCTargetDesc" ./external_llvm_lib_Target_AArch64_MCTargetDesc.nix {})
    libLLVMAArch64Desc;

  inherit (callBPPackage "external/llvm/lib/Target/AArch64/TargetInfo" ./external_llvm_lib_Target_AArch64_TargetInfo.nix {})
    libLLVMAArch64Info;

  inherit (callBPPackage "external/llvm/lib/Target/AArch64/Utils" ./external_llvm_lib_Target_AArch64_Utils.nix {})
    libLLVMAArch64Utils;

  inherit (callBPPackage "external/llvm/lib/Target/ARM" ./external_llvm_lib_Target_ARM.nix {})
    libLLVMARMCodeGen llvm-arm-defaults llvm-arm-headers llvm-gen-arm;

  inherit (callBPPackage "external/llvm/lib/Target/ARM/AsmParser" ./external_llvm_lib_Target_ARM_AsmParser.nix {})
    libLLVMARMAsmParser;

  inherit (callBPPackage "external/llvm/lib/Target/ARM/Disassembler" ./external_llvm_lib_Target_ARM_Disassembler.nix {})
    libLLVMARMDisassembler;

  inherit (callBPPackage "external/llvm/lib/Target/ARM/InstPrinter" ./external_llvm_lib_Target_ARM_InstPrinter.nix {})
    libLLVMARMAsmPrinter;

  inherit (callBPPackage "external/llvm/lib/Target/ARM/MCTargetDesc" ./external_llvm_lib_Target_ARM_MCTargetDesc.nix {})
    libLLVMARMDesc;

  inherit (callBPPackage "external/llvm/lib/Target/ARM/TargetInfo" ./external_llvm_lib_Target_ARM_TargetInfo.nix {})
    libLLVMARMInfo;

  inherit (callBPPackage "external/llvm/lib/Target" ./external_llvm_lib_Target.nix {})
    libLLVMTarget;

  inherit (callBPPackage "external/llvm/lib/Target/Mips" ./external_llvm_lib_Target_Mips.nix {})
    libLLVMMipsCodeGen llvm-gen-mips llvm-mips-defaults llvm-mips-headers;

  inherit (callBPPackage "external/llvm/lib/Target/Mips/AsmParser" ./external_llvm_lib_Target_Mips_AsmParser.nix {})
    libLLVMMipsAsmParser;

  inherit (callBPPackage "external/llvm/lib/Target/Mips/Disassembler" ./external_llvm_lib_Target_Mips_Disassembler.nix {})
    libLLVMMipsDisassembler;

  inherit (callBPPackage "external/llvm/lib/Target/Mips/InstPrinter" ./external_llvm_lib_Target_Mips_InstPrinter.nix {})
    libLLVMMipsAsmPrinter;

  inherit (callBPPackage "external/llvm/lib/Target/Mips/MCTargetDesc" ./external_llvm_lib_Target_Mips_MCTargetDesc.nix {})
    libLLVMMipsDesc;

  inherit (callBPPackage "external/llvm/lib/Target/Mips/TargetInfo" ./external_llvm_lib_Target_Mips_TargetInfo.nix {})
    libLLVMMipsInfo;

  inherit (callBPPackage "external/llvm/lib/Target/X86" ./external_llvm_lib_Target_X86.nix {})
    libLLVMX86CodeGen llvm-gen-x86 llvm-x86-defaults llvm-x86-headers;

  inherit (callBPPackage "external/llvm/lib/Target/X86/AsmParser" ./external_llvm_lib_Target_X86_AsmParser.nix {})
    libLLVMX86AsmParser;

  inherit (callBPPackage "external/llvm/lib/Target/X86/Disassembler" ./external_llvm_lib_Target_X86_Disassembler.nix {})
    libLLVMX86Disassembler;

  inherit (callBPPackage "external/llvm/lib/Target/X86/InstPrinter" ./external_llvm_lib_Target_X86_InstPrinter.nix {})
    libLLVMX86AsmPrinter;

  inherit (callBPPackage "external/llvm/lib/Target/X86/MCTargetDesc" ./external_llvm_lib_Target_X86_MCTargetDesc.nix {})
    libLLVMX86Desc;

  inherit (callBPPackage "external/llvm/lib/Target/X86/TargetInfo" ./external_llvm_lib_Target_X86_TargetInfo.nix {})
    libLLVMX86Info;

  inherit (callBPPackage "external/llvm/lib/Target/X86/Utils" ./external_llvm_lib_Target_X86_Utils.nix {})
    libLLVMX86Utils;

  inherit (callBPPackage "external/llvm/lib/Transforms/Hello" ./external_llvm_lib_Transforms_Hello.nix {})
    LLVMHello;

  inherit (callBPPackage "external/llvm/lib/Transforms/IPO" ./external_llvm_lib_Transforms_IPO.nix {})
    libLLVMipo;

  inherit (callBPPackage "external/llvm/lib/Transforms/InstCombine" ./external_llvm_lib_Transforms_InstCombine.nix {})
    libLLVMInstCombine;

  inherit (callBPPackage "external/llvm/lib/Transforms/Instrumentation" ./external_llvm_lib_Transforms_Instrumentation.nix {})
    libLLVMInstrumentation;

  inherit (callBPPackage "external/llvm/lib/Transforms/ObjCARC" ./external_llvm_lib_Transforms_ObjCARC.nix {})
    libLLVMTransformObjCARC;

  inherit (callBPPackage "external/llvm/lib/Transforms/Scalar" ./external_llvm_lib_Transforms_Scalar.nix {})
    libLLVMScalarOpts;

  inherit (callBPPackage "external/llvm/lib/Transforms/Utils" ./external_llvm_lib_Transforms_Utils.nix {})
    libLLVMTransformUtils;

  inherit (callBPPackage "external/llvm/lib/Transforms/Vectorize" ./external_llvm_lib_Transforms_Vectorize.nix {})
    libLLVMVectorize;

  inherit (callBPPackage "external/llvm/soong" ./external_llvm_soong.nix {})
    soong-llvm;

  inherit (callBPPackage "external/llvm/utils/FileCheck" ./external_llvm_utils_FileCheck.nix {})
    FileCheck;

  inherit (callBPPackage "external/llvm/utils/TableGen" ./external_llvm_utils_TableGen.nix {})
    llvm-tblgen;

  inherit (callBPPackage "external/llvm/utils/count" ./external_llvm_utils_count.nix {})
    count;

  inherit (callBPPackage "external/llvm/utils/not" ./external_llvm_utils_not.nix {})
    not;

  inherit (callBPPackage "external/llvm/utils/yaml-bench" ./external_llvm_utils_yaml-bench.nix {})
    yaml-bench;

  inherit (callBPPackage "external/lmfit" ./external_lmfit.nix {})
    lmfit;

  inherit (callBPPackage "external/ltp" ./external_ltp.nix {})
    ltp_defaults ltp_syscalls_h ltp_test_defaults;

  inherit (callBPPackage "external/ltp" ./external_ltp_gen.bp.nix {})
    libltp_controllers libltp_cpu_set libltp_hugetlb libltp_ipc libltp_kerntest libltp_ltp libltp_mem ltp_abort01 ltp_abs01 ltp_accept01 ltp_accept4_01 ltp_access01 ltp_access02 ltp_access03 ltp_access04 ltp_acct01 ltp_acl1 ltp_add_key01 ltp_add_key02 ltp_add_key03 ltp_add_key04 ltp_adjtimex01 ltp_adjtimex02 ltp_aio-stress ltp_aio01 ltp_aio02 ltp_aiocp ltp_aiodio_append ltp_aiodio_sparse ltp_alarm02 ltp_alarm03 ltp_alarm05 ltp_alarm06 ltp_alarm07 ltp_asapi_01 ltp_asapi_02 ltp_asapi_03 ltp_asyncio02 ltp_atof01 ltp_autogroup01 ltp_bdflush01 ltp_bind01 ltp_bind02 ltp_bind03 ltp_block_dev ltp_brk01 ltp_cacheflush01 ltp_can_filter ltp_can_rcv_own_msgs ltp_cap_bounds_r ltp_cap_bounds_rw ltp_cap_bset_inh_bounds ltp_capget01 ltp_capget02 ltp_capset01 ltp_capset02 ltp_cgroup_fj_proc ltp_cgroup_regression_6_2 ltp_cgroup_regression_fork_processes ltp_cgroup_regression_getdelays ltp_cgroup_xattr ltp_chdir01 ltp_chdir02 ltp_chdir03 ltp_chdir04 ltp_check_keepcaps ltp_check_pe ltp_check_simple_capset ltp_chmod01 ltp_chmod02 ltp_chmod03 ltp_chmod04 ltp_chmod05 ltp_chmod07 ltp_chown01 ltp_chown01_16 ltp_chown02 ltp_chown02_16 ltp_chown03 ltp_chown03_16 ltp_chown05 ltp_chown05_16 ltp_chroot01 ltp_chroot02 ltp_chroot03 ltp_chroot04 ltp_clock_getres01 ltp_clock_gettime02 ltp_clock_gettime03 ltp_clock_nanosleep01 ltp_clock_nanosleep02 ltp_clock_nanosleep2_01 ltp_clock_settime02 ltp_clock_settime03 ltp_clone01 ltp_clone02 ltp_clone03 ltp_clone04 ltp_clone05 ltp_clone06 ltp_clone07 ltp_clone08 ltp_clone09 ltp_close01 ltp_close02 ltp_close08 ltp_connect01 ltp_copy_file_range01 ltp_cpuacct_task ltp_cpuctl_def_task01 ltp_cpuctl_def_task02 ltp_cpuctl_def_task03 ltp_cpuctl_def_task04 ltp_cpuctl_fj_cpu-hog ltp_cpuctl_fj_simple_echo ltp_cpuctl_latency_check_task ltp_cpuctl_latency_test ltp_cpuctl_test01 ltp_cpuctl_test02 ltp_cpuctl_test03 ltp_cpuctl_test04 ltp_cpufreq_boost ltp_cpuset01 ltp_cpuset_cpu_hog ltp_cpuset_list_compute ltp_cpuset_mem_hog ltp_cpuset_memory_pressure ltp_cpuset_sched_domains_check ltp_cpuset_syscall_test ltp_crash01 ltp_crash02 ltp_creat01 ltp_creat03 ltp_creat04 ltp_creat05 ltp_creat07 ltp_creat07_child ltp_creat08 ltp_create-files ltp_create_datafile ltp_create_long_dirs ltp_create_short_dirs ltp_crypto_user01 ltp_cve-2014-0196 ltp_cve-2015-3290 ltp_cve-2016-10044 ltp_cve-2016-7042 ltp_cve-2016-7117 ltp_cve-2017-16939 ltp_cve-2017-17052 ltp_cve-2017-17053 ltp_cve-2017-2618 ltp_cve-2017-2671 ltp_data_space ltp_delete_module01 ltp_delete_module02 ltp_delete_module03 ltp_dio_append ltp_dio_sparse ltp_dio_truncate ltp_diotest1 ltp_diotest2 ltp_diotest3 ltp_diotest5 ltp_diotest6 ltp_dirty ltp_dirtyc0w ltp_dirtyc0w_child ltp_disktest ltp_dma_thread_diotest ltp_dup01 ltp_dup02 ltp_dup03 ltp_dup04 ltp_dup05 ltp_dup06 ltp_dup07 ltp_dup201 ltp_dup202 ltp_dup203 ltp_dup204 ltp_dup205 ltp_dup3_01 ltp_dup3_02 ltp_eas_big_to_small ltp_eas_one_big_task ltp_eas_one_small_task ltp_eas_small_big_toggle ltp_eas_small_to_big ltp_eas_two_big_three_small ltp_endian_switch01 ltp_epoll-ltp ltp_epoll_create1_01 ltp_epoll_ctl01 ltp_epoll_ctl02 ltp_epoll_pwait01 ltp_epoll_wait01 ltp_epoll_wait02 ltp_epoll_wait03 ltp_event_generator ltp_eventfd01 ltp_eventfd2_01 ltp_eventfd2_02 ltp_eventfd2_03 ltp_exec_with_inh ltp_exec_without_inh ltp_execl01 ltp_execl01_child ltp_execle01 ltp_execle01_child ltp_execlp01 ltp_execlp01_child ltp_execv01 ltp_execv01_child ltp_execve01 ltp_execve01_child ltp_execve02 ltp_execve03 ltp_execve04 ltp_execve05 ltp_execve_child ltp_execveat01 ltp_execveat02 ltp_execveat03 ltp_execveat_child ltp_execveat_errno ltp_execvp01 ltp_execvp01_child ltp_exit01 ltp_exit02 ltp_exit_group01 ltp_ext4_file_time ltp_ext4_test_inode_version ltp_f1 ltp_f2 ltp_f3 ltp_faccessat01 ltp_fallocate01 ltp_fallocate02 ltp_fallocate03 ltp_fallocate04 ltp_fallocate05 ltp_fanotify01 ltp_fanotify02 ltp_fanotify03 ltp_fanotify04 ltp_fanotify05 ltp_fanotify06 ltp_fanotify07 ltp_fanotify08 ltp_fanotify09 ltp_fanotify10 ltp_fanotify11 ltp_fanout01 ltp_fchdir01 ltp_fchdir02 ltp_fchdir03 ltp_fchmod01 ltp_fchmod02 ltp_fchmod03 ltp_fchmod04 ltp_fchmod05 ltp_fchmod06 ltp_fchmodat01 ltp_fchown01 ltp_fchown01_16 ltp_fchown02 ltp_fchown02_16 ltp_fchown03 ltp_fchown03_16 ltp_fchown04 ltp_fchown04_16 ltp_fchown05 ltp_fchown05_16 ltp_fchownat01 ltp_fchownat02 ltp_fcntl01 ltp_fcntl01_64 ltp_fcntl02 ltp_fcntl02_64 ltp_fcntl03 ltp_fcntl03_64 ltp_fcntl04 ltp_fcntl04_64 ltp_fcntl05 ltp_fcntl05_64 ltp_fcntl06 ltp_fcntl06_64 ltp_fcntl07 ltp_fcntl07_64 ltp_fcntl08 ltp_fcntl08_64 ltp_fcntl09 ltp_fcntl09_64 ltp_fcntl10 ltp_fcntl10_64 ltp_fcntl11 ltp_fcntl11_64 ltp_fcntl12 ltp_fcntl12_64 ltp_fcntl13 ltp_fcntl13_64 ltp_fcntl14 ltp_fcntl14_64 ltp_fcntl15 ltp_fcntl15_64 ltp_fcntl16 ltp_fcntl16_64 ltp_fcntl17 ltp_fcntl17_64 ltp_fcntl18 ltp_fcntl18_64 ltp_fcntl19 ltp_fcntl19_64 ltp_fcntl20 ltp_fcntl20_64 ltp_fcntl21 ltp_fcntl21_64 ltp_fcntl22 ltp_fcntl22_64 ltp_fcntl23 ltp_fcntl23_64 ltp_fcntl24 ltp_fcntl24_64 ltp_fcntl25 ltp_fcntl25_64 ltp_fcntl26 ltp_fcntl26_64 ltp_fcntl27 ltp_fcntl27_64 ltp_fcntl28 ltp_fcntl28_64 ltp_fcntl29 ltp_fcntl29_64 ltp_fcntl30 ltp_fcntl30_64 ltp_fcntl31 ltp_fcntl31_64 ltp_fcntl32 ltp_fcntl32_64 ltp_fcntl33 ltp_fcntl33_64 ltp_fcntl34 ltp_fcntl34_64 ltp_fcntl35 ltp_fcntl35_64 ltp_fcntl36 ltp_fcntl36_64 ltp_fdatasync01 ltp_fdatasync02 ltp_fgetxattr01 ltp_fgetxattr02 ltp_fgetxattr03 ltp_flistxattr01 ltp_flistxattr02 ltp_flistxattr03 ltp_float_bessel ltp_float_exp_log ltp_float_iperb ltp_float_power ltp_float_trigo ltp_flock01 ltp_flock02 ltp_flock03 ltp_flock04 ltp_flock06 ltp_fork01 ltp_fork02 ltp_fork03 ltp_fork04 ltp_fork05 ltp_fork06 ltp_fork07 ltp_fork08 ltp_fork09 ltp_fork10 ltp_fork11 ltp_fork12 ltp_fork13 ltp_fork14 ltp_fork_exec_loop ltp_fpathconf01 ltp_fptest01 ltp_fptest02 ltp_frag ltp_fremovexattr01 ltp_fremovexattr02 ltp_fs_fill ltp_fs_perms ltp_fsetxattr01 ltp_fsetxattr02 ltp_fstat01 ltp_fstat01_64 ltp_fstat02 ltp_fstat02_64 ltp_fstat03 ltp_fstat03_64 ltp_fstat05 ltp_fstat05_64 ltp_fstatat01 ltp_fstatfs01 ltp_fstatfs01_64 ltp_fstatfs02 ltp_fstatfs02_64 ltp_fsx-linux ltp_fsync01 ltp_fsync02 ltp_fsync03 ltp_ftest01 ltp_ftest02 ltp_ftest03 ltp_ftest04 ltp_ftest05 ltp_ftest06 ltp_ftest07 ltp_ftest08 ltp_ftruncate01 ltp_ftruncate01_64 ltp_ftruncate02 ltp_ftruncate02_64 ltp_ftruncate03 ltp_ftruncate03_64 ltp_ftruncate04 ltp_ftruncate04_64 ltp_futex_wait01 ltp_futex_wait03 ltp_futex_wait04 ltp_futex_wait05 ltp_futex_wait_bitset01 ltp_futex_wait_bitset02 ltp_futex_wake01 ltp_futex_wake02 ltp_futex_wake04 ltp_futimesat01 ltp_fw_load ltp_genacos ltp_genasin ltp_genatan ltp_genatan2 ltp_genbessel ltp_genceil ltp_gencos ltp_gencosh ltp_genexp ltp_genexp_log ltp_genfabs ltp_genfloor ltp_genfmod ltp_genfrexp ltp_genhypot ltp_geniperb ltp_genj0 ltp_genj1 ltp_genldexp ltp_genlgamma ltp_genlog ltp_genlog10 ltp_genmodf ltp_genpow ltp_genpower ltp_gensin ltp_gensinh ltp_gensqrt ltp_gentan ltp_gentanh ltp_gentrigo ltp_geny0 ltp_geny1 ltp_get_mempolicy01 ltp_get_robust_list01 ltp_getaddrinfo_01 ltp_getcpu01 ltp_getcwd01 ltp_getcwd02 ltp_getcwd03 ltp_getcwd04 ltp_getdents01 ltp_getdents02 ltp_getdomainname01 ltp_getdtablesize01 ltp_getegid01 ltp_getegid01_16 ltp_getegid02 ltp_getegid02_16 ltp_geteuid01 ltp_geteuid01_16 ltp_geteuid02 ltp_geteuid02_16 ltp_getgid01 ltp_getgid01_16 ltp_getgid03 ltp_getgid03_16 ltp_getgroups01 ltp_getgroups01_16 ltp_getgroups03 ltp_getgroups03_16 ltp_gethostbyname_r01 ltp_gethostname01 ltp_getitimer01 ltp_getitimer02 ltp_getitimer03 ltp_getpagesize01 ltp_getpeername01 ltp_getpgid01 ltp_getpgid02 ltp_getpgrp01 ltp_getpid01 ltp_getpid02 ltp_getppid01 ltp_getppid02 ltp_getpriority01 ltp_getpriority02 ltp_getrandom01 ltp_getrandom02 ltp_getrandom03 ltp_getrandom04 ltp_getresgid01 ltp_getresgid01_16 ltp_getresgid02 ltp_getresgid02_16 ltp_getresgid03 ltp_getresgid03_16 ltp_getresuid01 ltp_getresuid01_16 ltp_getresuid02 ltp_getresuid02_16 ltp_getresuid03 ltp_getresuid03_16 ltp_getrlimit01 ltp_getrlimit02 ltp_getrlimit03 ltp_getrusage01 ltp_getrusage02 ltp_getrusage03_child ltp_getrusage04 ltp_getsid01 ltp_getsid02 ltp_getsockname01 ltp_getsockopt01 ltp_getsockopt02 ltp_gettid01 ltp_gettimeofday01 ltp_gettimeofday02 ltp_getuid01 ltp_getuid01_16 ltp_getuid03 ltp_getuid03_16 ltp_getxattr01 ltp_getxattr02 ltp_getxattr03 ltp_getxattr04 ltp_getxattr05 ltp_hackbench ltp_hangup01 ltp_ht_affinity ltp_ht_enabled ltp_hugemmap01 ltp_hugemmap02 ltp_hugemmap04 ltp_hugemmap06 ltp_ima_boot_aggregate ltp_ima_mmap ltp_in ltp_in6_02 ltp_inh_capped ltp_inode01 ltp_inode02 ltp_inotify01 ltp_inotify02 ltp_inotify03 ltp_inotify04 ltp_inotify05 ltp_inotify06 ltp_inotify07 ltp_inotify08 ltp_inotify09 ltp_inotify_init1_01 ltp_inotify_init1_02 ltp_input01 ltp_input02 ltp_input04 ltp_input05 ltp_input06 ltp_io_cancel01 ltp_io_destroy01 ltp_io_getevents01 ltp_io_setup01 ltp_io_submit01 ltp_iobw ltp_ioctl01 ltp_ioctl03 ltp_ioctl04 ltp_ioctl05 ltp_ioctl06 ltp_ioctl07 ltp_iogen ltp_ioperm01 ltp_ioperm02 ltp_iopl01 ltp_iopl02 ltp_kcmp01 ltp_kcmp02 ltp_kcmp03 ltp_keyctl01 ltp_keyctl02 ltp_keyctl03 ltp_keyctl04 ltp_keyctl05 ltp_keyctl06 ltp_keyctl07 ltp_keyctl08 ltp_kill01 ltp_kill02 ltp_kill03 ltp_kill04 ltp_kill06 ltp_kill08 ltp_kill09 ltp_kill10 ltp_kill11 ltp_kill12 ltp_kmsg01 ltp_ksm01 ltp_ksm02 ltp_ksm03 ltp_ksm04 ltp_ksm05 ltp_ksm06 ltp_lchown01 ltp_lchown01_16 ltp_lchown02 ltp_lchown02_16 ltp_lchown03 ltp_lchown03_16 ltp_lftest ltp_lgetxattr01 ltp_lgetxattr02 ltp_link02 ltp_link03 ltp_link04 ltp_link05 ltp_link06 ltp_link07 ltp_link08 ltp_linkat01 ltp_linkat02 ltp_listen01 ltp_listxattr01 ltp_listxattr02 ltp_listxattr03 ltp_llistxattr01 ltp_llistxattr02 ltp_llistxattr03 ltp_llseek01 ltp_llseek02 ltp_llseek03 ltp_locktests ltp_lremovexattr01 ltp_lseek01 ltp_lseek02 ltp_lseek07 ltp_lseek11 ltp_lstat01 ltp_lstat01_64 ltp_lstat02 ltp_lstat02_64 ltp_lstat03 ltp_lstat03_64 ltp_ltp-diorh ltp_ltpClient ltp_ltpServer ltp_ltp_acpi ltp_madvise01 ltp_madvise02 ltp_madvise05 ltp_madvise06 ltp_madvise07 ltp_madvise08 ltp_madvise09 ltp_madvise10 ltp_max_map_count ltp_mbind01 ltp_mc_member_test ltp_mc_recv ltp_mc_send ltp_mc_verify_opts ltp_mc_verify_opts_error ltp_meltdown ltp_mem01 ltp_mem02 ltp_mem03 ltp_mem_process ltp_membarrier01 ltp_memcg_process_stress ltp_memcg_test_1 ltp_memcg_test_2 ltp_memcg_test_3 ltp_memcg_test_4 ltp_memcmp01 ltp_memcpy01 ltp_memctl_test01 ltp_memfd_create01 ltp_memfd_create02 ltp_memfd_create03 ltp_memfd_create04 ltp_memset01 ltp_memtoy ltp_migrate_pages01 ltp_migrate_pages02 ltp_migrate_pages03 ltp_mincore01 ltp_mincore02 ltp_mkdir02 ltp_mkdir03 ltp_mkdir04 ltp_mkdir05 ltp_mkdir09 ltp_mkdirat01 ltp_mkdirat02 ltp_mknod01 ltp_mknod02 ltp_mknod03 ltp_mknod04 ltp_mknod05 ltp_mknod06 ltp_mknod07 ltp_mknod08 ltp_mknod09 ltp_mknodat01 ltp_mknodat02 ltp_mlock01 ltp_mlock02 ltp_mlock03 ltp_mlock04 ltp_mlock201 ltp_mlock202 ltp_mlock203 ltp_mlockall01 ltp_mlockall02 ltp_mlockall03 ltp_mmap-corruption01 ltp_mmap001 ltp_mmap01 ltp_mmap02 ltp_mmap03 ltp_mmap04 ltp_mmap05 ltp_mmap06 ltp_mmap07 ltp_mmap08 ltp_mmap09 ltp_mmap1 ltp_mmap10 ltp_mmap11 ltp_mmap12 ltp_mmap13 ltp_mmap14 ltp_mmap15 ltp_mmap16 ltp_mmap2 ltp_mmap3 ltp_mmapstress01 ltp_mmapstress02 ltp_mmapstress03 ltp_mmapstress04 ltp_mmapstress05 ltp_mmapstress06 ltp_mmapstress07 ltp_mmapstress08 ltp_mmapstress09 ltp_mmapstress10 ltp_mmstress ltp_mmstress_dummy ltp_modify_ldt01 ltp_modify_ldt02 ltp_modify_ldt03 ltp_mount01 ltp_mount02 ltp_mount03 ltp_mount03_setuid_test ltp_mount04 ltp_mount05 ltp_mount06 ltp_move_pages01 ltp_move_pages02 ltp_move_pages03 ltp_move_pages04 ltp_move_pages05 ltp_move_pages06 ltp_move_pages07 ltp_move_pages08 ltp_move_pages09 ltp_move_pages10 ltp_move_pages11 ltp_move_pages12 ltp_mprotect01 ltp_mprotect02 ltp_mprotect03 ltp_mprotect04 ltp_mremap01 ltp_mremap02 ltp_mremap03 ltp_mremap05 ltp_msync01 ltp_msync02 ltp_msync03 ltp_msync04 ltp_mtest01 ltp_munlock01 ltp_munlock02 ltp_munlockall01 ltp_munmap01 ltp_munmap02 ltp_munmap03 ltp_nanosleep01 ltp_nanosleep02 ltp_nanosleep03 ltp_nanosleep04 ltp_netstress ltp_newns ltp_newuname01 ltp_nextafter01 ltp_nfs01_open_files ltp_nfs04_create_file ltp_nfs05_make_tree ltp_nfs_flock ltp_nfs_flock_dgen ltp_nftw01 ltp_nftw6401 ltp_nice01 ltp_nice02 ltp_nice03 ltp_nice04 ltp_nptl01 ltp_ns-icmp_redirector ltp_ns-icmpv4_sender ltp_ns-icmpv6_sender ltp_ns-igmp_querier ltp_ns-mcast_join ltp_ns-mcast_receiver ltp_ns-tcpclient ltp_ns-tcpserver ltp_ns-udpclient ltp_ns-udpsender ltp_ns-udpserver ltp_nsclone ltp_oom01 ltp_oom02 ltp_oom03 ltp_oom04 ltp_oom05 ltp_open01 ltp_open02 ltp_open03 ltp_open04 ltp_open05 ltp_open06 ltp_open07 ltp_open08 ltp_open09 ltp_open10 ltp_open11 ltp_open12_child ltp_open13 ltp_open14 ltp_openat01 ltp_openat02_child ltp_openat03 ltp_openfile ltp_overcommit_memory ltp_page01 ltp_page02 ltp_pathconf01 ltp_pause01 ltp_pause02 ltp_pause03 ltp_pcrypt_aead01 ltp_pec_listener ltp_perf_event_open01 ltp_perf_event_open02 ltp_personality01 ltp_personality02 ltp_pids_task1 ltp_pids_task2 ltp_pipe01 ltp_pipe02 ltp_pipe03 ltp_pipe04 ltp_pipe05 ltp_pipe06 ltp_pipe07 ltp_pipe08 ltp_pipe09 ltp_pipe10 ltp_pipe11 ltp_pipe2_01 ltp_pipe2_02 ltp_pivot_root01 ltp_pm_get_sched_values ltp_poll01 ltp_poll02 ltp_posix_fadvise01 ltp_posix_fadvise01_64 ltp_posix_fadvise02 ltp_posix_fadvise02_64 ltp_posix_fadvise03 ltp_posix_fadvise03_64 ltp_posix_fadvise04 ltp_posix_fadvise04_64 ltp_ppoll01 ltp_prctl01 ltp_prctl02 ltp_prctl03 ltp_pread01 ltp_pread01_64 ltp_pread02 ltp_pread02_64 ltp_pread03 ltp_pread03_64 ltp_preadv01 ltp_preadv01_64 ltp_preadv02 ltp_preadv02_64 ltp_preadv03 ltp_preadv03_64 ltp_preadv201 ltp_preadv201_64 ltp_preadv202 ltp_preadv202_64 ltp_print_caps ltp_proc01 ltp_process_vm01 ltp_process_vm_readv02 ltp_process_vm_readv03 ltp_process_vm_writev02 ltp_pselect01 ltp_pselect01_64 ltp_pselect02 ltp_pselect02_64 ltp_pselect03 ltp_pselect03_64 ltp_pt_test ltp_ptem01 ltp_pth_str01 ltp_pth_str02 ltp_pth_str03 ltp_pthcli ltp_pthserv ltp_ptrace01 ltp_ptrace02 ltp_ptrace03 ltp_ptrace04 ltp_ptrace05 ltp_ptrace07 ltp_pty01 ltp_pty02 ltp_pwrite01 ltp_pwrite01_64 ltp_pwrite02 ltp_pwrite02_64 ltp_pwrite03 ltp_pwrite03_64 ltp_pwrite04 ltp_pwrite04_64 ltp_pwritev01 ltp_pwritev01_64 ltp_pwritev02 ltp_pwritev02_64 ltp_pwritev03 ltp_pwritev03_64 ltp_pwritev201 ltp_pwritev201_64 ltp_pwritev202 ltp_pwritev202_64 ltp_quotactl01 ltp_quotactl02 ltp_quotactl03 ltp_random-access ltp_random-access-del-create ltp_read01 ltp_read02 ltp_read03 ltp_read04 ltp_read_all ltp_read_checkzero ltp_readahead01 ltp_readahead02 ltp_readdir01 ltp_readdir02 ltp_readdir21 ltp_readlink01 ltp_readlink03 ltp_readlinkat01 ltp_readlinkat02 ltp_readv01 ltp_readv02 ltp_readv03 ltp_realpath01 ltp_reboot01 ltp_reboot02 ltp_recv01 ltp_recvfrom01 ltp_recvmsg01 ltp_recvmsg02 ltp_recvmsg03 ltp_remap_file_pages02 ltp_removexattr01 ltp_removexattr02 ltp_rename01 ltp_rename02 ltp_rename03 ltp_rename04 ltp_rename05 ltp_rename06 ltp_rename07 ltp_rename08 ltp_rename09 ltp_rename10 ltp_rename11 ltp_rename12 ltp_rename13 ltp_rename14 ltp_renameat01 ltp_renameat201 ltp_renameat202 ltp_request_key01 ltp_request_key02 ltp_request_key03 ltp_request_key04 ltp_request_key05 ltp_rmdir01 ltp_rmdir02 ltp_rmdir03 ltp_rt_sigaction01 ltp_rt_sigaction02 ltp_rt_sigaction03 ltp_rt_sigpending02 ltp_rt_sigprocmask01 ltp_rt_sigprocmask02 ltp_rt_sigqueueinfo01 ltp_rt_sigsuspend01 ltp_rt_sigtimedwait01 ltp_rt_tgsigqueueinfo01 ltp_rtc01 ltp_sbrk01 ltp_sbrk02 ltp_sbrk03 ltp_sched_boost ltp_sched_cfs_prio ltp_sched_dl_runtime ltp_sched_driver ltp_sched_get_priority_max01 ltp_sched_get_priority_max02 ltp_sched_get_priority_min01 ltp_sched_get_priority_min02 ltp_sched_getaffinity01 ltp_sched_getattr01 ltp_sched_getattr02 ltp_sched_getparam01 ltp_sched_getparam02 ltp_sched_getparam03 ltp_sched_getscheduler01 ltp_sched_getscheduler02 ltp_sched_latency_dl ltp_sched_latency_rt ltp_sched_prio_3_fifo ltp_sched_prio_3_rr ltp_sched_rr_get_interval01 ltp_sched_rr_get_interval02 ltp_sched_rr_get_interval03 ltp_sched_setaffinity01 ltp_sched_setattr01 ltp_sched_setparam01 ltp_sched_setparam02 ltp_sched_setparam03 ltp_sched_setparam04 ltp_sched_setparam05 ltp_sched_setscheduler01 ltp_sched_setscheduler02 ltp_sched_setscheduler03 ltp_sched_tc0 ltp_sched_tc1 ltp_sched_tc2 ltp_sched_tc3 ltp_sched_tc4 ltp_sched_tc5 ltp_sched_tc6 ltp_sched_yield01 ltp_sctp_big_chunk ltp_select01 ltp_select01_SYS__newselect ltp_select01_SYS_pselect6 ltp_select01_SYS_select ltp_select02 ltp_select02_SYS__newselect ltp_select02_SYS_pselect6 ltp_select02_SYS_select ltp_select03 ltp_select03_SYS__newselect ltp_select03_SYS_pselect6 ltp_select03_SYS_select ltp_select04 ltp_select04_SYS__newselect ltp_select04_SYS_pselect6 ltp_select04_SYS_select ltp_send01 ltp_sendfile02 ltp_sendfile02_64 ltp_sendfile03 ltp_sendfile03_64 ltp_sendfile04 ltp_sendfile04_64 ltp_sendfile05 ltp_sendfile05_64 ltp_sendfile06 ltp_sendfile06_64 ltp_sendfile07 ltp_sendfile07_64 ltp_sendfile08 ltp_sendfile08_64 ltp_sendfile09 ltp_sendfile09_64 ltp_sendmmsg01 ltp_sendmsg01 ltp_sendto01 ltp_sendto02 ltp_set_robust_list01 ltp_set_thread_area01 ltp_set_tid_address01 ltp_setdomainname01 ltp_setdomainname02 ltp_setdomainname03 ltp_setegid01 ltp_setegid02 ltp_setfsgid01 ltp_setfsgid01_16 ltp_setfsgid02 ltp_setfsgid02_16 ltp_setfsgid03 ltp_setfsgid03_16 ltp_setfsuid01 ltp_setfsuid01_16 ltp_setfsuid02 ltp_setfsuid02_16 ltp_setfsuid03 ltp_setfsuid03_16 ltp_setfsuid04 ltp_setfsuid04_16 ltp_setgid01 ltp_setgid01_16 ltp_setgid02 ltp_setgid02_16 ltp_setgid03 ltp_setgid03_16 ltp_setgroups01 ltp_setgroups01_16 ltp_setgroups02 ltp_setgroups02_16 ltp_setgroups03 ltp_setgroups03_16 ltp_setgroups04 ltp_setgroups04_16 ltp_sethostname01 ltp_sethostname02 ltp_sethostname03 ltp_setitimer01 ltp_setitimer02 ltp_setitimer03 ltp_setns01 ltp_setpgid01 ltp_setpgid02 ltp_setpgid03 ltp_setpgid03_child ltp_setpgrp01 ltp_setpgrp02 ltp_setpriority01 ltp_setpriority02 ltp_setregid01 ltp_setregid01_16 ltp_setregid02 ltp_setregid02_16 ltp_setregid03 ltp_setregid03_16 ltp_setregid04 ltp_setregid04_16 ltp_setresgid01 ltp_setresgid01_16 ltp_setresgid02 ltp_setresgid02_16 ltp_setresgid03 ltp_setresgid03_16 ltp_setresgid04 ltp_setresgid04_16 ltp_setresuid01 ltp_setresuid01_16 ltp_setresuid02 ltp_setresuid02_16 ltp_setresuid03 ltp_setresuid03_16 ltp_setresuid04 ltp_setresuid04_16 ltp_setresuid05 ltp_setresuid05_16 ltp_setreuid01 ltp_setreuid01_16 ltp_setreuid02 ltp_setreuid02_16 ltp_setreuid03 ltp_setreuid03_16 ltp_setreuid04 ltp_setreuid04_16 ltp_setreuid05 ltp_setreuid05_16 ltp_setreuid06 ltp_setreuid06_16 ltp_setreuid07 ltp_setreuid07_16 ltp_setrlimit01 ltp_setrlimit02 ltp_setrlimit03 ltp_setrlimit04 ltp_setrlimit05 ltp_setsid01 ltp_setsockopt01 ltp_setsockopt02 ltp_setsockopt03 ltp_settimeofday01 ltp_settimeofday02 ltp_setuid01 ltp_setuid01_16 ltp_setuid03 ltp_setuid03_16 ltp_setuid04 ltp_setuid04_16 ltp_setxattr01 ltp_setxattr02 ltp_setxattr03 ltp_sgetmask01 ltp_shmctl05 ltp_sigaction01 ltp_sigaction02 ltp_sigaltstack01 ltp_sigaltstack02 ltp_sighold02 ltp_signal01 ltp_signal02 ltp_signal03 ltp_signal04 ltp_signal05 ltp_signal06 ltp_signalfd01 ltp_signalfd4_01 ltp_signalfd4_02 ltp_sigpending02 ltp_sigprocmask01 ltp_sigrelse01 ltp_sigsuspend01 ltp_sigtimedwait01 ltp_sigwait01 ltp_sigwaitinfo01 ltp_smack_notroot ltp_smack_set_socket_labels ltp_smount ltp_socket01 ltp_socket02 ltp_socketcall01 ltp_socketcall02 ltp_socketcall03 ltp_socketcall04 ltp_socketpair01 ltp_socketpair02 ltp_sockioctl01 ltp_splice01 ltp_splice02 ltp_splice03 ltp_splice04 ltp_splice05 ltp_ssetmask01 ltp_stack_clash ltp_stack_space ltp_stat01 ltp_stat01_64 ltp_stat02 ltp_stat02_64 ltp_stat03 ltp_stat03_64 ltp_stat05 ltp_stat05_64 ltp_stat06 ltp_stat06_64 ltp_statfs01 ltp_statfs01_64 ltp_statfs02 ltp_statfs02_64 ltp_statfs03 ltp_statfs03_64 ltp_statvfs01 ltp_statvfs02 ltp_statx01 ltp_statx02 ltp_statx03 ltp_statx04 ltp_statx06 ltp_stream01 ltp_stream02 ltp_stream03 ltp_stream04 ltp_stream05 ltp_stress_cd ltp_string01 ltp_sugov_latency ltp_sugov_stale_util ltp_sugov_wakeups ltp_support_numa ltp_swapoff01 ltp_swapoff02 ltp_swapon01 ltp_swapon02 ltp_swapon03 ltp_swapping01 ltp_symlink01 ltp_symlink02 ltp_symlink03 ltp_symlink04 ltp_symlink05 ltp_symlinkat01 ltp_sync01 ltp_sync02 ltp_sync_file_range01 ltp_syncfs01 ltp_syscall01 ltp_sysconf01 ltp_sysctl01 ltp_sysctl03 ltp_sysctl04 ltp_sysfs01 ltp_sysfs02 ltp_sysfs03 ltp_sysfs04 ltp_sysfs05 ltp_sysfs06 ltp_sysinfo01 ltp_sysinfo02 ltp_syslog11 ltp_syslog12 ltp_syslogtst ltp_tbio ltp_tee01 ltp_tee02 ltp_test01 ltp_test02 ltp_test03 ltp_test04 ltp_test05 ltp_test06 ltp_test07 ltp_test08 ltp_test09 ltp_test10 ltp_test11 ltp_test12 ltp_test13 ltp_test14 ltp_test15 ltp_test16 ltp_test17 ltp_test18 ltp_test19 ltp_test_exec ltp_test_exec_child ltp_testsf_c ltp_testsf_c6 ltp_testsf_s ltp_testsf_s6 ltp_tgkill01 ltp_tgkill02 ltp_tgkill03 ltp_thp01 ltp_thp02 ltp_thp03 ltp_time-schedule ltp_time01 ltp_time02 ltp_timed_forkbomb ltp_timer_create02 ltp_timer_create03 ltp_timer_create04 ltp_timer_delete02 ltp_timer_delete03 ltp_timer_getoverrun01 ltp_timer_gettime01 ltp_timer_settime02 ltp_timer_settime03 ltp_timerfd01 ltp_timerfd02 ltp_timerfd03 ltp_timerfd_create01 ltp_timerfd_gettime01 ltp_timerfd_settime01 ltp_times01 ltp_times03 ltp_tkill01 ltp_tkill02 ltp_tomoyo_accept_test ltp_tomoyo_file_test ltp_tomoyo_filesystem_test ltp_tomoyo_new_file_test ltp_tomoyo_new_test ltp_tomoyo_policy_io_test ltp_tomoyo_policy_memory_test ltp_tomoyo_rewrite_test ltp_tpci ltp_trace_sched ltp_trerrno ltp_truncate01 ltp_truncate01_64 ltp_truncate02 ltp_truncate02_64 ltp_truncate03 ltp_truncate03_64 ltp_tst_brk ltp_tst_brkm ltp_tst_check_drivers ltp_tst_checkpoint ltp_tst_checkpoint_wait_timeout ltp_tst_checkpoint_wake_timeout ltp_tst_cleanup_once ltp_tst_dataroot01 ltp_tst_dataroot02 ltp_tst_dataroot03 ltp_tst_device ltp_tst_exit ltp_tst_expiration_timer ltp_tst_fs_fill_hardlinks ltp_tst_fs_fill_subdirs ltp_tst_fs_has_free ltp_tst_get_unused_port ltp_tst_getconf ltp_tst_kvcmp ltp_tst_ncpus ltp_tst_ncpus_conf ltp_tst_ncpus_max ltp_tst_net_iface_prefix ltp_tst_net_ip_prefix ltp_tst_net_vars ltp_tst_process_state ltp_tst_random ltp_tst_record_childstatus ltp_tst_res ltp_tst_res_hexd ltp_tst_resm ltp_tst_rod ltp_tst_safe_fileops ltp_tst_safe_macros ltp_tst_sleep ltp_tst_strerrno ltp_tst_strsig ltp_tst_strstatus ltp_tst_supported_fs ltp_tst_tmpdir_test ltp_uaccess ltp_umask01 ltp_umount01 ltp_umount02 ltp_umount03 ltp_umount2_01 ltp_umount2_02 ltp_umount2_03 ltp_uname01 ltp_uname02 ltp_uname03 ltp_uname04 ltp_unlink05 ltp_unlink07 ltp_unlink08 ltp_unlinkat01 ltp_unshare01 ltp_unshare02 ltp_ustat01 ltp_ustat02 ltp_utime01 ltp_utime02 ltp_utime03 ltp_utime04 ltp_utime05 ltp_utime06 ltp_utimensat01 ltp_utimes01 ltp_verify_caps_exec ltp_vfork ltp_vfork01 ltp_vfork02 ltp_vhangup01 ltp_vhangup02 ltp_vma01 ltp_vma02 ltp_vma03 ltp_vma04 ltp_vma05_vdso ltp_vmsplice01 ltp_vmsplice02 ltp_wait01 ltp_wait02 ltp_wait401 ltp_wait402 ltp_waitid01 ltp_waitid02 ltp_waitpid01 ltp_waitpid02 ltp_waitpid03 ltp_waitpid04 ltp_waitpid05 ltp_waitpid06 ltp_waitpid07 ltp_waitpid08 ltp_waitpid09 ltp_waitpid10 ltp_waitpid11 ltp_waitpid12 ltp_waitpid13 ltp_write01 ltp_write02 ltp_write03 ltp_write04 ltp_write05 ltp_writetest ltp_writev01 ltp_writev02 ltp_writev05 ltp_writev06 ltp_writev07 ltp_zram03;

  inherit (callBPPackage "external/lua" ./external_lua.nix {})
    liblua liblua-sources;

  inherit (callBPPackage "external/lz4/lib" ./external_lz4_lib.nix {})
    liblz4;

  inherit (callBPPackage "external/lz4/programs" ./external_lz4_programs.nix {})
    lz4 lz4c;

  inherit (callBPPackage "external/lzma/C" ./external_lzma_C.nix {})
    liblzma;

  inherit (callBPPackage "external/mdnsresponder" ./external_mdnsresponder.nix {})
    dnssd libmdnssd mdnsd mdnsresponder_default_cflags;

  inherit (callBPPackage "external/minigbm" ./external_minigbm.nix {})
    "gralloc.minigbm" "gralloc.minigbm_defaults" "gralloc.minigbm_intel" "gralloc.minigbm_intel_defaults" "gralloc.minigbm_meson" "gralloc.minigbm_meson_defaults" libminigbm;

  inherit (callBPPackage "external/minijail" ./external_minijail.nix {})
    drop_privs libminijail libminijail_flags libminijail_gen_constants libminijail_gen_constants_obj libminijail_gen_syscall libminijail_gen_syscall_obj libminijail_generated libminijail_test libminijail_unittest_gtest minijail0 minijail0_cli_unittest_gtest mj_system_unittest_gtest mj_util_unittest_gtest syscall_filter_unittest_gtest;

  inherit (callBPPackage "external/minijail/tools" ./external_minijail_tools.nix {})
    minijail_compile_seccomp_policy minijail_compiler_unittest minijail_parser_unittest;

  inherit (callBPPackage "external/mksh" ./external_mksh.nix {})
    mkshrc mkshrc_vendor sh sh-defaults sh_vendor;

  inherit (callBPPackage "external/mockftpserver" ./external_mockftpserver.nix {})
    mockftpserver;

  inherit (callBPPackage "external/mockito" ./external_mockito.nix {})
    mockito mockito-api mockito-byte-buddy mockito-byte-buddy-agent mockito-host mockito-inline;

  inherit (callBPPackage "external/mockwebserver" ./external_mockwebserver.nix {})
    mockwebserver;

  inherit (callBPPackage "external/modp_b64" ./external_modp_b64.nix {})
    libmodpb64 libmodpb64_ndk;

  inherit (callBPPackage "external/mp4parser" ./external_mp4parser.nix {})
    mp4parser;

  inherit (callBPPackage "external/mtpd" ./external_mtpd.nix {})
    mtpd;

  inherit (callBPPackage "external/nanohttpd" ./external_nanohttpd.nix {})
    libnanohttpd nanohttpd-webserver;

  inherit (callBPPackage "external/nanopb-c" ./external_nanopb-c.nix {})
    libprotobuf-c-nano libprotobuf-c-nano-16bit libprotobuf-c-nano-32bit libprotobuf-c-nano-defaults libprotobuf-c-nano-enable_malloc libprotobuf-c-nano-enable_malloc-16bit libprotobuf-c-nano-enable_malloc-32bit;

  inherit (callBPPackage "external/nanopb-c/generator" ./external_nanopb-c_generator.nix {})
    protoc-gen-nanopb;

  inherit (callBPPackage "external/neven" ./external_neven.nix {})
    libFFTEm;

  inherit (callBPPackage "external/newfs_msdos" ./external_newfs_msdos.nix {})
    newfs_msdos;

  inherit (callBPPackage "external/nfacct" ./external_nfacct.nix {})
    nfacct;

  inherit (callBPPackage "external/nist-pkits" ./external_nist-pkits.nix {})
    nist-pkix-tests;

  inherit (callBPPackage "external/nist-sip" ./external_nist-sip.nix {})
    nist-sip;

  inherit (callBPPackage "external/nos/host/generic" ./external_nos_host_generic.nix {})
    libnos_citadel_for_recovery libnos_client_citadel libnos_for_recovery nos_app_defaults nos_app_service_defaults nos_cc_defaults nos_cc_host_supported_defaults nos_cc_hw_defaults nos_headers nos_proto_defaults;

  inherit (callBPPackage "external/nos/host/generic/libnos" ./external_nos_host_generic_libnos.nix {})
    libnos libnos_client libnos_client_defaults;

  inherit (callBPPackage "external/nos/host/generic/libnos/generator" ./external_nos_host_generic_libnos_generator.nix {})
    protoc-gen-nos-client-cpp;

  inherit (callBPPackage "external/nos/host/generic/libnos/generator/test" ./external_nos_host_generic_libnos_generator_test.nix {})
    "nos_generator_test_service_genc++" "nos_generator_test_service_genc++_headers" "nos_generator_test_service_genc++_mock" protoc-gen-nos-client-cpp_test;

  inherit (callBPPackage "external/nos/host/generic/libnos/test" ./external_nos_host_generic_libnos_test.nix {})
    libnos_mock;

  inherit (callBPPackage "external/nos/host/generic/libnos_datagram" ./external_nos_host_generic_libnos_datagram.nix {})
    libnos_datagram libnos_datagram_citadel;

  inherit (callBPPackage "external/nos/host/generic/libnos_transport" ./external_nos_host_generic_libnos_transport.nix {})
    libnos_transport;

  inherit (callBPPackage "external/nos/host/generic/nugget/proto" ./external_nos_host_generic_nugget_proto.nix {})
    libnosprotos;

  inherit (callBPPackage "external/nos/host/generic/nugget/proto/nugget/app/avb" ./external_nos_host_generic_nugget_proto_nugget_app_avb.nix {})
    "nos_app_avb_service_genc++" "nos_app_avb_service_genc++_headers" "nos_app_avb_service_genc++_mock" nos_app_avb;

  inherit (callBPPackage "external/nos/host/generic/nugget/proto/nugget/app/keymaster" ./external_nos_host_generic_nugget_proto_nugget_app_keymaster.nix {})
    "nos_app_keymaster_service_genc++" "nos_app_keymaster_service_genc++_headers" "nos_app_keymaster_service_genc++_mock" nos_app_keymaster;

  inherit (callBPPackage "external/nos/host/generic/nugget/proto/nugget/app/weaver" ./external_nos_host_generic_nugget_proto_nugget_app_weaver.nix {})
    "nos_app_weaver_service_genc++" "nos_app_weaver_service_genc++_headers" "nos_app_weaver_service_genc++_mock" nos_app_weaver;

  inherit (callBPPackage "external/noto-fonts" ./external_noto-fonts.nix {})
    recovery_noto-fonts_dep;

  inherit (callBPPackage "external/oauth/core/src/main/java" ./external_oauth_core_src_main_java.nix {})
    oauth;

  inherit (callBPPackage "external/objenesis" ./external_objenesis.nix {})
    objenesis objenesis-host objenesis-tck;

  inherit (callBPPackage "external/objenesis/tck-android" ./external_objenesis_tck-android.nix {})
    ObjenesisTck;

  inherit (callBPPackage "external/oj-libjdwp" ./external_oj-libjdwp.nix {})
    javavm_headers jdi-support jdi_generated_properties jdi_prop_gen jdwp_generated_headers jdwp_generated_java jdwpgen libdt_socket libjdwp libjdwp_headers libnpt libnpt_headers upstream-jdwp-defaults;

  inherit (callBPPackage "external/okhttp" ./external_okhttp.nix {})
    okhttp okhttp-nojarjar okhttp-testdex okhttp-tests-nojarjar okhttp_api_files;

  inherit (callBPPackage "external/one-true-awk" ./external_one-true-awk.nix {})
    awk awk-defaults awk-flags awk-maketab awk_vendor one-true-awk;

  inherit (callBPPackage "external/owasp/sanitizer" ./external_owasp_sanitizer.nix {})
    owasp-html-sanitizer;

  inherit (callBPPackage "external/parameter-framework" ./external_parameter-framework.nix {})
    "ComponentLibrary.xsd" "ComponentTypeSet.xsd" "ConfigurableDomain.xsd" "ConfigurableDomains.xsd" "EddParser.py" "EddParser.py-srcs" "FileIncluder.xsd" "PFWScriptGenerator.py" "PFWScriptGenerator.py-srcs" "Parameter.xsd" "ParameterFrameworkConfiguration.xsd" "ParameterSettings.xsd" "PfwBaseTranslator.py" "PfwBaseTranslator.py-srcs" "Subsystem.xsd" "SystemClass.xsd" "W3cXmlAttributes.xsd" "domainGenerator.py" "domainGenerator.sh" "hostConfig.py" "hostConfig.py-srcs" "lightRoutingUpdate.sh" "updateRoutageDomains.sh" domainGeneratorConnector libparameter libparameter-defaults libpfw_utility libremote-processor libremote-processor-defaults pfw_defaults remote-process test-platform;

  inherit (callBPPackage "external/pcre" ./external_pcre.nix {})
    libpcre2 libpcrecpp pcre_defaults;

  inherit (callBPPackage "external/pdfium" ./external_pdfium.nix {})
    pdfium-common pdfium-core pdfium-headers pdfium-third-party-headers;

  inherit (callBPPackage "external/pdfium" ./external_pdfium_pdfium.bp.nix {})
    libpdfium;

  inherit (callBPPackage "external/pdfium" ./external_pdfium_pdfiumfdrm.bp.nix {})
    libpdfiumfdrm;

  inherit (callBPPackage "external/pdfium" ./external_pdfium_pdfiumformfiller.bp.nix {})
    libpdfiumformfiller;

  inherit (callBPPackage "external/pdfium" ./external_pdfium_pdfiumfpdfapi.bp.nix {})
    libpdfiumfpdfapi;

  inherit (callBPPackage "external/pdfium" ./external_pdfium_pdfiumfpdfdoc.bp.nix {})
    libpdfiumfpdfdoc;

  inherit (callBPPackage "external/pdfium" ./external_pdfium_pdfiumfpdftext.bp.nix {})
    libpdfiumfpdftext;

  inherit (callBPPackage "external/pdfium" ./external_pdfium_pdfiumfxcodec.bp.nix {})
    libpdfiumfxcodec;

  inherit (callBPPackage "external/pdfium" ./external_pdfium_pdfiumfxcrt.bp.nix {})
    libpdfiumfxcrt;

  inherit (callBPPackage "external/pdfium" ./external_pdfium_pdfiumfxge.bp.nix {})
    libpdfiumfxge;

  inherit (callBPPackage "external/pdfium" ./external_pdfium_pdfiumfxjs.bp.nix {})
    libpdfiumfxjs;

  inherit (callBPPackage "external/pdfium" ./external_pdfium_pdfiumpwl.bp.nix {})
    libpdfiumpwl;

  inherit (callBPPackage "external/pdfium/third_party" ./external_pdfium_third_party.nix {})
    pdfium-third-party;

  inherit (callBPPackage "external/pdfium/third_party" ./external_pdfium_third_party_pdfiumbigint.bp.nix {})
    libpdfiumbigint;

  inherit (callBPPackage "external/pdfium/third_party" ./external_pdfium_third_party_pdfiumfx_agg.bp.nix {})
    libpdfiumfx_agg;

  inherit (callBPPackage "external/pdfium/third_party" ./external_pdfium_third_party_pdfiumfx_libopenjpeg.bp.nix {})
    libpdfiumfx_libopenjpeg;

  inherit (callBPPackage "external/pdfium/third_party" ./external_pdfium_third_party_pdfiumlcms2.bp.nix {})
    libpdfiumlcms2;

  inherit (callBPPackage "external/pdfium/third_party" ./external_pdfium_third_party_pdfiumpdfiumbase.bp.nix {})
    libpdfiumpdfiumbase;

  inherit (callBPPackage "external/perf_data_converter/src/quipper" ./external_perf_data_converter_src_quipper.nix {})
    libquipper libquipper-full libquipper_defaults quipper-full_unit_tests quipper_android_test_defaults quipper_data_proto quipper_libelf_test quipper_stat_proto quipper_test_defaults quipper_unit_tests;

  inherit (callBPPackage "external/perfetto" ./external_perfetto.nix {})
    gen_merged_sql_metrics heapprofd heapprofd_client libperfetto libperfetto_android_internal perfetto perfetto_config-full perfetto_cts_deps perfetto_cts_jni_deps perfetto_defaults perfetto_integrationtests perfetto_protos_perfetto_common_lite_gen perfetto_protos_perfetto_common_lite_gen_headers perfetto_protos_perfetto_common_zero_gen perfetto_protos_perfetto_common_zero_gen_headers perfetto_protos_perfetto_config_lite_gen perfetto_protos_perfetto_config_lite_gen_headers perfetto_protos_perfetto_config_zero_gen perfetto_protos_perfetto_config_zero_gen_headers perfetto_protos_perfetto_ipc_ipc_gen perfetto_protos_perfetto_ipc_ipc_gen_headers perfetto_protos_perfetto_metrics_android_zero_gen perfetto_protos_perfetto_metrics_android_zero_gen_headers perfetto_protos_perfetto_metrics_zero_gen perfetto_protos_perfetto_metrics_zero_gen_headers perfetto_protos_perfetto_trace_android_lite_gen perfetto_protos_perfetto_trace_android_lite_gen_headers perfetto_protos_perfetto_trace_android_zero_gen perfetto_protos_perfetto_trace_android_zero_gen_headers perfetto_protos_perfetto_trace_chrome_lite_gen perfetto_protos_perfetto_trace_chrome_lite_gen_headers perfetto_protos_perfetto_trace_chrome_zero_gen perfetto_protos_perfetto_trace_chrome_zero_gen_headers perfetto_protos_perfetto_trace_filesystem_lite_gen perfetto_protos_perfetto_trace_filesystem_lite_gen_headers perfetto_protos_perfetto_trace_filesystem_zero_gen perfetto_protos_perfetto_trace_filesystem_zero_gen_headers perfetto_protos_perfetto_trace_ftrace_lite_gen perfetto_protos_perfetto_trace_ftrace_lite_gen_headers perfetto_protos_perfetto_trace_ftrace_zero_gen perfetto_protos_perfetto_trace_ftrace_zero_gen_headers perfetto_protos_perfetto_trace_interned_data_lite_gen perfetto_protos_perfetto_trace_interned_data_lite_gen_headers perfetto_protos_perfetto_trace_interned_data_zero_gen perfetto_protos_perfetto_trace_interned_data_zero_gen_headers perfetto_protos_perfetto_trace_lite_gen perfetto_protos_perfetto_trace_lite_gen_headers perfetto_protos_perfetto_trace_minimal_lite_gen perfetto_protos_perfetto_trace_minimal_lite_gen_headers perfetto_protos_perfetto_trace_power_lite_gen perfetto_protos_perfetto_trace_power_lite_gen_headers perfetto_protos_perfetto_trace_power_zero_gen perfetto_protos_perfetto_trace_power_zero_gen_headers perfetto_protos_perfetto_trace_profiling_lite_gen perfetto_protos_perfetto_trace_profiling_lite_gen_headers perfetto_protos_perfetto_trace_profiling_zero_gen perfetto_protos_perfetto_trace_profiling_zero_gen_headers perfetto_protos_perfetto_trace_ps_lite_gen perfetto_protos_perfetto_trace_ps_lite_gen_headers perfetto_protos_perfetto_trace_ps_zero_gen perfetto_protos_perfetto_trace_ps_zero_gen_headers perfetto_protos_perfetto_trace_sys_stats_lite_gen perfetto_protos_perfetto_trace_sys_stats_lite_gen_headers perfetto_protos_perfetto_trace_sys_stats_zero_gen perfetto_protos_perfetto_trace_sys_stats_zero_gen_headers perfetto_protos_perfetto_trace_track_event_lite_gen perfetto_protos_perfetto_trace_track_event_lite_gen_headers perfetto_protos_perfetto_trace_track_event_zero_gen perfetto_protos_perfetto_trace_track_event_zero_gen_headers perfetto_protos_perfetto_trace_trusted_lite_gen perfetto_protos_perfetto_trace_trusted_lite_gen_headers perfetto_protos_perfetto_trace_zero_gen perfetto_protos_perfetto_trace_zero_gen_headers perfetto_protos_third_party_pprof_lite_gen perfetto_protos_third_party_pprof_lite_gen_headers perfetto_src_ipc_protoc_plugin_ipc_plugin___gn_standalone_toolchain_gcc_like_host_ perfetto_src_ipc_test_messages_gen perfetto_src_ipc_test_messages_gen_headers perfetto_src_ipc_wire_protocol_gen perfetto_src_ipc_wire_protocol_gen_headers perfetto_src_perfetto_cmd_protos_gen perfetto_src_perfetto_cmd_protos_gen_headers perfetto_src_protozero_protoc_plugin_protoc_plugin___gn_standalone_toolchain_gcc_like_host_ perfetto_src_protozero_testing_messages_lite_gen perfetto_src_protozero_testing_messages_lite_gen_headers perfetto_src_protozero_testing_messages_zero_gen perfetto_src_protozero_testing_messages_zero_gen_headers perfetto_src_traced_probes_ftrace_test_messages_lite_gen perfetto_src_traced_probes_ftrace_test_messages_lite_gen_headers perfetto_src_traced_probes_ftrace_test_messages_zero_gen perfetto_src_traced_probes_ftrace_test_messages_zero_gen_headers perfetto_src_tracing_ipc perfetto_trace_protos perfetto_unittests trace_to_text traced traced_probes trigger_perfetto;

  inherit (callBPPackage "external/perfetto/test/cts" ./external_perfetto_test_cts.nix {})
    CtsPerfettoTestCases;

  inherit (callBPPackage "external/perfetto/test/cts/heapprofd_test_apps" ./external_perfetto_test_cts_heapprofd_test_apps.nix {})
    CtsPerfettoDebuggableApp CtsPerfettoReleaseApp;

  inherit (callBPPackage "external/perfetto/test/cts/heapprofd_test_apps/jni" ./external_perfetto_test_cts_heapprofd_test_apps_jni.nix {})
    libperfettocts_heapprofdtarget;

  inherit (callBPPackage "external/perfetto/test/cts/producer" ./external_perfetto_test_cts_producer.nix {})
    CtsPerfettoProducerApp;

  inherit (callBPPackage "external/perfetto/test/cts/producer/jni" ./external_perfetto_test_cts_producer_jni.nix {})
    libperfettocts_jni;

  inherit (callBPPackage "external/piex" ./external_piex.nix {})
    libbinary_parse libimage_type_recognition libpiex libtiff_directory piex_default_cflags;

  inherit (callBPPackage "external/ppp/pppd" ./external_ppp_pppd.nix {})
    ppp_defaults pppd pppol2tp-android pppopptp-android;

  inherit (callBPPackage "external/protobuf" ./external_protobuf.nix {})
    "libcore_private.stubs" NanoAndroidTest android-nano-test-parcelable android-nano-test-parcelable-extendable aprotoc aprotoc-test-nano-params host-libprotobuf-java-full host-libprotobuf-java-lite host-libprotobuf-java-micro host-libprotobuf-java-nano libprotobuf-cpp-full libprotobuf-cpp-full-defaults libprotobuf-cpp-full-ndk libprotobuf-cpp-full-rtti libprotobuf-cpp-lite libprotobuf-cpp-lite-defaults libprotobuf-cpp-lite-ndk libprotobuf-cpp-lite-rtti libprotobuf-cpp-lite_static libprotobuf-internal-protos libprotobuf-internal-python-srcs libprotobuf-java-full libprotobuf-java-lite libprotobuf-java-micro libprotobuf-java-nano libprotobuf-python libprotobuf_errorprone_defaults libprotoc protobuf-cflags-defaults;

  inherit (callBPPackage "external/puffin" ./external_puffin.nix {})
    libpuffdiff libpuffpatch puffin puffin_defaults puffin_unittest;

  inherit (callBPPackage "external/python/apitools/apitools" ./external_python_apitools_apitools.nix {})
    py-apitools;

  inherit (callBPPackage "external/python/cpython2" ./external_python_cpython2.nix {})
    py2-c-module-_bisect py2-c-module-_codecs_cn py2-c-module-_codecs_hk py2-c-module-_codecs_iso2022 py2-c-module-_codecs_jp py2-c-module-_codecs_kr py2-c-module-_codecs_tw py2-c-module-_collections py2-c-module-_csv py2-c-module-_ctypes py2-c-module-_ctypes_test py2-c-module-_functools py2-c-module-_heapq py2-c-module-_hotshot py2-c-module-_io py2-c-module-_json py2-c-module-_lsprof py2-c-module-_md5 py2-c-module-_multibytecodec py2-c-module-_multiprocessing py2-c-module-_random py2-c-module-_scproxy py2-c-module-_sha py2-c-module-_sha256 py2-c-module-_sha512 py2-c-module-_socket py2-c-module-_sqlite3 py2-c-module-_ssl py2-c-module-_struct py2-c-module-_testcapi py2-c-module-array py2-c-module-audioop py2-c-module-binascii py2-c-module-cPickle py2-c-module-cStringIO py2-c-module-cmath py2-c-module-datetime py2-c-module-fcntl py2-c-module-future_builtins py2-c-module-grp py2-c-module-itertools py2-c-module-math py2-c-module-mmap py2-c-module-operator py2-c-module-parser py2-c-module-pyexpat py2-c-module-resource py2-c-module-select py2-c-module-strop py2-c-module-syslog py2-c-module-termios py2-c-module-time py2-c-module-unicodedata py2-c-module-xxsubtype py2-c-module-zlib py2-cmd py2-interp-defaults py2-interp-object py2-interp-parser py2-interp-python py2-launcher py2-launcher-autorun py2-launcher-defaults py2-launcher-lib;

  inherit (callBPPackage "external/python/cpython2/Lib" ./external_python_cpython2_Lib.nix {})
    py2-plat-darwin py2-plat-linux2 py2-stdlib;

  inherit (callBPPackage "external/python/dateutil/dateutil" ./external_python_dateutil_dateutil.nix {})
    py-dateutil;

  inherit (callBPPackage "external/python/funcsigs" ./external_python_funcsigs.nix {})
    py2-funcsigs-tests py3-funcsigs-tests;

  inherit (callBPPackage "external/python/funcsigs/funcsigs" ./external_python_funcsigs_funcsigs.nix {})
    py-funcsigs;

  inherit (callBPPackage "external/python/futures" ./external_python_futures.nix {})
    py2-futures;

  inherit (callBPPackage "external/python/google-api-python-client" ./external_python_google-api-python-client.nix {})
    py-google-api-python-client;

  inherit (callBPPackage "external/python/httplib2" ./external_python_httplib2.nix {})
    cacert_data py-httplib2 py2_httplib2_srcs py3_httplib2_srcs;

  inherit (callBPPackage "external/python/mock/mock" ./external_python_mock_mock.nix {})
    py-mock;

  inherit (callBPPackage "external/python/oauth2client/oauth2client" ./external_python_oauth2client_oauth2client.nix {})
    py-oauth2client;

  inherit (callBPPackage "external/python/pyasn1-modules/pyasn1_modules" ./external_python_pyasn1-modules_pyasn1_modules.nix {})
    py-pyasn1-modules;

  inherit (callBPPackage "external/python/pyasn1/pyasn1" ./external_python_pyasn1_pyasn1.nix {})
    py-pyasn1;

  inherit (callBPPackage "external/python/rsa/rsa" ./external_python_rsa_rsa.nix {})
    py-rsa;

  inherit (callBPPackage "external/python/setuptools" ./external_python_setuptools.nix {})
    py-setuptools;

  inherit (callBPPackage "external/python/six" ./external_python_six.nix {})
    py-six;

  inherit (callBPPackage "external/python/uritemplates/uritemplate" ./external_python_uritemplates_uritemplate.nix {})
    py-uritemplate;

  inherit (callBPPackage "external/rappor" ./external_rappor.nix {})
    rappor rappor-tests;

  inherit (callBPPackage "external/rmi4utils/f54test" ./external_rmi4utils_f54test.nix {})
    f54test;

  inherit (callBPPackage "external/rmi4utils/rmi4update" ./external_rmi4utils_rmi4update.nix {})
    rmi4update;

  inherit (callBPPackage "external/rmi4utils/rmihidtool" ./external_rmi4utils_rmihidtool.nix {})
    rmihidtool;

  inherit (callBPPackage "external/roboto-fonts" ./external_roboto-fonts.nix {})
    recovery_roboto-fonts_dep;

  inherit (callBPPackage "external/rootdev" ./external_rootdev.nix {})
    librootdev rootdev;

  inherit (callBPPackage "external/scapy" ./external_scapy.nix {})
    scapy;

  inherit (callBPPackage "external/scrypt" ./external_scrypt.nix {})
    libscrypt_static scrypt_test;

  inherit (callBPPackage "external/scrypt" ./external_scrypt_sources.bp.nix {})
    libscrypt_sources;

  inherit (callBPPackage "external/seccomp-tests" ./external_seccomp-tests.nix {})
    external_seccomp_tests;

  inherit (callBPPackage "external/selinux/checkpolicy" ./external_selinux_checkpolicy.nix {})
    checkpolicy dispol;

  inherit (callBPPackage "external/selinux/libselinux" ./external_selinux_libselinux.nix {})
    libselinux libselinux_defaults sefcontext_compile;

  inherit (callBPPackage "external/selinux/libsepol" ./external_selinux_libsepol.nix {})
    chkcon libsepol;

  inherit (callBPPackage "external/selinux/secilc" ./external_selinux_secilc.nix {})
    secilc;

  inherit (callBPPackage "external/setupcompat" ./external_setupcompat.nix {})
    setupcompat;

  inherit (callBPPackage "external/setupdesign" ./external_setupdesign.nix {})
    setupdesign setupdesign-strings;

  inherit (callBPPackage "external/sfntly" ./external_sfntly.nix {})
    libsfntly;

  inherit (callBPPackage "external/shaderc/spirv-headers" ./external_shaderc_spirv-headers.nix {})
    "spirv.core.grammar.json-1.1";

  inherit (callBPPackage "external/shflags" ./external_shflags.nix {})
    shflags;

  inherit (callBPPackage "external/skia" ./external_skia.nix {})
    libskia skia_deps skia_dm skia_nanobench skia_pgo skia_pgo_no_profile_use skia_tool_deps;

  inherit (callBPPackage "external/skqp" ./external_skqp.nix {})
    libskqp_app;

  inherit (callBPPackage "external/sl4a/ScriptingLayerForAndroid/jni" ./external_sl4a_ScriptingLayerForAndroid_jni.nix {})
    libcom_googlecode_android_scripting_Exec;

  inherit (callBPPackage "external/slf4j" ./external_slf4j.nix {})
    slf4j-jdk14;

  inherit (callBPPackage "external/smali" ./external_smali.nix {})
    "smali_build.gradle" baksmali_script smali_script;

  inherit (callBPPackage "external/smali/baksmali" ./external_smali_baksmali.nix {})
    baksmali baksmali_version;

  inherit (callBPPackage "external/smali/deodexerant" ./external_smali_deodexerant.nix {})
    deodexerant;

  inherit (callBPPackage "external/smali/dexlib2" ./external_smali_dexlib2.nix {})
    dexlib2 dexlib2-no-guava;

  inherit (callBPPackage "external/smali/smali" ./external_smali_smali.nix {})
    smali smali_version;

  inherit (callBPPackage "external/smali/util" ./external_smali_util.nix {})
    smali-util;

  inherit (callBPPackage "external/snakeyaml" ./external_snakeyaml.nix {})
    snakeyaml snakeyaml_patched_src_files;

  inherit (callBPPackage "external/sonic" ./external_sonic.nix {})
    libsonic;

  inherit (callBPPackage "external/sonivox/arm-wt-22k" ./external_sonivox_arm-wt-22k.nix {})
    libsonivox;

  inherit (callBPPackage "external/speex" ./external_speex.nix {})
    libspeexresampler;

  inherit (callBPPackage "external/spirv-llvm/lib/SPIRV" ./external_spirv-llvm_lib_SPIRV.nix {})
    libSPIRV;

  inherit (callBPPackage "external/spirv-llvm/tools/llvm-spirv" ./external_spirv-llvm_tools_llvm-spirv.nix {})
    llvm-spirv;

  inherit (callBPPackage "external/sqlite/android" ./external_sqlite_android.nix {})
    libsqlite3_android libsqlite3_phone_number_utils_test;

  inherit (callBPPackage "external/sqlite/dist" ./external_sqlite_dist.nix {})
    libsqlite libsqlite_static_minimal sqlite-defaults sqlite-minimal-defaults sqlite3;

  inherit (callBPPackage "external/squashfs-tools/squashfs-tools" ./external_squashfs-tools_squashfs-tools.nix {})
    mksquashfs squashfs-tools_defaults unsquashfs;

  inherit (callBPPackage "external/strace" ./external_strace.nix {})
    strace;

  inherit (callBPPackage "external/stressapptest" ./external_stressapptest.nix {})
    stressapptest;

  inherit (callBPPackage "external/swiftshader" ./external_swiftshader.nix {})
    swiftshader_common swiftshader_common_debug swiftshader_common_release swiftshader_host_headers swiftshader_platform_headers swiftshader_subzero;

  inherit (callBPPackage "external/swiftshader/src" ./external_swiftshader_src.nix {})
    libEGL_swiftshader libEGL_swiftshader_debug libEGL_swiftshader_defaults libGLESv1_CM_swiftshader libGLESv1_CM_swiftshader_debug libGLESv1_CM_swiftshader_defaults libGLESv2_swiftshader libGLESv2_swiftshader_debug libGLESv2_swiftshader_defaults libswiftshader libswiftshader_common libswiftshader_common_debug libswiftshader_common_defaults libswiftshader_compiler libswiftshader_compiler_debug libswiftshader_compiler_defaults libswiftshader_debug libswiftshader_llvm libswiftshader_llvm_debug libswiftshader_llvm_defaults libswiftshader_release swiftshader_client_libraries_subzero_or_llvm swiftshader_client_libraries_subzero_or_llvm_debug;

  inherit (callBPPackage "external/swiftshader/third_party/LLVM" ./external_swiftshader_third_party_LLVM.nix {})
    libLLVM_swiftshader;

  inherit (callBPPackage "external/swiftshader/third_party/llvm-subzero" ./external_swiftshader_third_party_llvm-subzero.nix {})
    libLLVMSupport_subzero;

  inherit (callBPPackage "external/tagsoup" ./external_tagsoup.nix {})
    tagsoup;

  inherit (callBPPackage "external/tcpdump" ./external_tcpdump.nix {})
    tcpdump;

  inherit (callBPPackage "external/tensorflow" ./external_tensorflow.nix {})
    tensorflow_headers;

  inherit (callBPPackage "external/tensorflow/tensorflow/lite" ./external_tensorflow_tensorflow_lite.nix {})
    libtflite libtflite_context libtflite_framework tflite_defaults;

  inherit (callBPPackage "external/tensorflow/tensorflow/lite/kernels" ./external_tensorflow_tensorflow_lite_kernels.nix {})
    libtflite_kernel_utils libtflite_kernels;

  inherit (callBPPackage "external/tensorflow/tensorflow/lite/testing/nnapi_tflite_zip_tests" ./external_tensorflow_tensorflow_lite_testing_nnapi_tflite_zip_tests.nix {})
    TfliteGeneratedNnapiTest;

  inherit (callBPPackage "external/tensorflow/tensorflow/lite" ./external_tensorflow_tensorflow_lite_tflite_static.bp.nix {})
    libtflite_static;

  inherit (callBPPackage "external/testng" ./external_testng.nix {})
    testng testng-generated-srcs;

  inherit (callBPPackage "external/tinyalsa" ./external_tinyalsa.nix {})
    libtinyalsa tinycap tinyhostless tinymix tinypcminfo tinyplay;

  inherit (callBPPackage "external/tinycompress" ./external_tinycompress.nix {})
    cplay libtinycompress;

  inherit (callBPPackage "external/tinyxml" ./external_tinyxml.nix {})
    libtinyxml;

  inherit (callBPPackage "external/tinyxml2" ./external_tinyxml2.nix {})
    libtinyxml2 tinyxml2-tests;

  inherit (callBPPackage "external/toybox" ./external_toybox.nix {})
    toybox toybox-defaults toybox_vendor;

  inherit (callBPPackage "external/tremolo" ./external_tremolo.nix {})
    libvorbisidec;

  inherit (callBPPackage "external/turbine" ./external_turbine.nix {})
    turbine;

  inherit (callBPPackage "external/ukey2" ./external_ukey2.nix {})
    ukey2;

  inherit (callBPPackage "external/universal-tween-engine" ./external_universal-tween-engine.nix {})
    universal-tween-engine;

  inherit (callBPPackage "external/v4l2_codec2/vda" ./external_v4l2_codec2_vda.nix {})
    libv4l2_codec2_vda;

  inherit (callBPPackage "external/v8" ./external_v8_Android.base.bp.nix {})
    libv8base;

  inherit (callBPPackage "external/v8" ./external_v8.nix {})
    libv8 libv8gen v8_defaults v8_js2c v8_torque v8_torque_file v8_torque_file_cc v8gen_experimental_extra_libraries v8gen_extra_libraries v8gen_libraries;

  inherit (callBPPackage "external/v8" ./external_v8_Android.platform.bp.nix {})
    libv8platform;

  inherit (callBPPackage "external/v8" ./external_v8_Android.sampler.bp.nix {})
    libv8sampler;

  inherit (callBPPackage "external/v8" ./external_v8_Android.v8.bp.nix {})
    libv8src;

  inherit (callBPPackage "external/v8" ./external_v8_Android.v8gen.bp.nix {})
    v8_js_lib_files;

  inherit (callBPPackage "external/vboot_reference" ./external_vboot_reference.nix {})
    futility-host futility_cmds futility_srcs libvboot_util vboot_defaults;

  inherit (callBPPackage "external/virglrenderer" ./external_virglrenderer.nix {})
    virgl_headers;

  inherit (callBPPackage "external/vixl" ./external_vixl.nix {})
    libvixl libvixld vixl-arm vixl-arm64 vixl-common vixl-debug vixl-release vixl-test-runner;

  inherit (callBPPackage "external/volley" ./external_volley.nix {})
    volley;

  inherit (callBPPackage "external/vulkan-headers" ./external_vulkan-headers.nix {})
    vulkan_headers;

  inherit (callBPPackage "external/walt/android/WALT/app/src/main/jni" ./external_walt_android_WALT_app_src_main_jni.nix {})
    sync_clock_jni;

  inherit (callBPPackage "external/wayland-protocols" ./external_wayland-protocols.nix {})
    libwayland_extension_client_protocols soong-wayland-protocol-codegen wayland_extension_client_protocol_headers wayland_extension_protocol_sources wayland_extension_protocols wayland_extension_server_protocol_headers;

  inherit (callBPPackage "external/wayland-protocols/flinger_headers" ./external_wayland-protocols_flinger_headers.nix {})
    wayland_flinger_headers;

  inherit (callBPPackage "external/wayland" ./external_wayland.nix {})
    libwayland_client libwayland_server wayland_core_client_protocol_headers wayland_core_protocol wayland_core_protocol_sources wayland_core_server_protocol_headers wayland_defaults wayland_scanner wayland_version_header;

  inherit (callBPPackage "external/webp" ./external_webp.nix {})
    libwebp-decode libwebp-encode webp-headers;

  inherit (callBPPackage "external/webrtc" ./external_webrtc.nix {})
    libwebrtc_audio_coding libwebrtc_audio_preprocessing libwebrtc_headers webrtc_flags;

  inherit (callBPPackage "external/webrtc/webrtc/base" ./external_webrtc_webrtc_base.nix {})
    libwebrtc_base;

  inherit (callBPPackage "external/webrtc/webrtc/common_audio" ./external_webrtc_webrtc_common_audio.nix {})
    libwebrtc_common webrtc_common_audio_wav;

  inherit (callBPPackage "external/webrtc/webrtc/common_audio/resampler" ./external_webrtc_webrtc_common_audio_resampler.nix {})
    libwebrtc_resampler webrtc_common_audio_resampler_push_resampler;

  inherit (callBPPackage "external/webrtc/webrtc/common_audio/signal_processing" ./external_webrtc_webrtc_common_audio_signal_processing.nix {})
    libwebrtc_spl;

  inherit (callBPPackage "external/webrtc/webrtc/common_audio/vad" ./external_webrtc_webrtc_common_audio_vad.nix {})
    libwebrtc_vad;

  inherit (callBPPackage "external/webrtc/webrtc/modules" ./external_webrtc_webrtc_modules.nix {})
    libwebrtc_modules_headers;

  inherit (callBPPackage "external/webrtc/webrtc/modules/audio_coding/codecs/isac/fix" ./external_webrtc_webrtc_modules_audio_coding_codecs_isac_fix.nix {})
    libwebrtc_isacfix_headers;

  inherit (callBPPackage "external/webrtc/webrtc/modules/audio_coding/codecs/isac/fix/source" ./external_webrtc_webrtc_modules_audio_coding_codecs_isac_fix_source.nix {})
    libwebrtc_isacfix;

  inherit (callBPPackage "external/webrtc/webrtc/modules/audio_coding/codecs/isac/fix/test" ./external_webrtc_webrtc_modules_audio_coding_codecs_isac_fix_test.nix {})
    webrtc_isac_test;

  inherit (callBPPackage "external/webrtc/webrtc/modules/audio_coding/codecs/isac/main" ./external_webrtc_webrtc_modules_audio_coding_codecs_isac_main.nix {})
    libwebrtc_isac_interface;

  inherit (callBPPackage "external/webrtc/webrtc/modules/audio_coding/codecs/isac/main/source" ./external_webrtc_webrtc_modules_audio_coding_codecs_isac_main_source.nix {})
    libwebrtc_isac;

  inherit (callBPPackage "external/webrtc/webrtc/modules/audio_processing" ./external_webrtc_webrtc_modules_audio_processing.nix {})
    libwebrtc_apm webrtc_apm_process_test webrtc_apm_unit_test;

  inherit (callBPPackage "external/webrtc/webrtc/modules/audio_processing/aec" ./external_webrtc_webrtc_modules_audio_processing_aec.nix {})
    libwebrtc_aec;

  inherit (callBPPackage "external/webrtc/webrtc/modules/audio_processing/aecm" ./external_webrtc_webrtc_modules_audio_processing_aecm.nix {})
    libwebrtc_aecm;

  inherit (callBPPackage "external/webrtc/webrtc/modules/audio_processing/agc" ./external_webrtc_webrtc_modules_audio_processing_agc.nix {})
    libwebrtc_agc;

  inherit (callBPPackage "external/webrtc/webrtc/modules/audio_processing/beamformer" ./external_webrtc_webrtc_modules_audio_processing_beamformer.nix {})
    libwebrtc_beamformer;

  inherit (callBPPackage "external/webrtc/webrtc/modules/audio_processing/intelligibility" ./external_webrtc_webrtc_modules_audio_processing_intelligibility.nix {})
    libwebrtc_intell;

  inherit (callBPPackage "external/webrtc/webrtc/modules/audio_processing/ns" ./external_webrtc_webrtc_modules_audio_processing_ns.nix {})
    libwebrtc_ns;

  inherit (callBPPackage "external/webrtc/webrtc/modules/audio_processing/transient" ./external_webrtc_webrtc_modules_audio_processing_transient.nix {})
    libwebrtc_transient;

  inherit (callBPPackage "external/webrtc/webrtc/modules/audio_processing/utility" ./external_webrtc_webrtc_modules_audio_processing_utility.nix {})
    libwebrtc_apm_utility;

  inherit (callBPPackage "external/webrtc/webrtc/modules/audio_processing/vad" ./external_webrtc_webrtc_modules_audio_processing_vad.nix {})
    libwebrtc_apvad;

  inherit (callBPPackage "external/webrtc/webrtc/system_wrappers" ./external_webrtc_webrtc_system_wrappers.nix {})
    libwebrtc_system_wrappers_headers;

  inherit (callBPPackage "external/webrtc/webrtc/system_wrappers/source" ./external_webrtc_webrtc_system_wrappers_source.nix {})
    libwebrtc_system_wrappers webrtc_system_wrappers_tick_util;

  inherit (callBPPackage "external/webrtc/webrtc/test" ./external_webrtc_webrtc_test.nix {})
    webrtc_test_testsupport_fileutils webrtc_test_testsupport_perf_test;

  inherit (callBPPackage "external/wycheproof" ./external_wycheproof.nix {})
    wycheproof;

  inherit (callBPPackage "external/xmp_toolkit/XMPCore" ./external_xmp_toolkit_XMPCore.nix {})
    xmp_toolkit;

  inherit (callBPPackage "external/xz-embedded" ./external_xz-embedded.nix {})
    libxz;

  inherit (callBPPackage "external/xz-java" ./external_xz-java.nix {})
    xz-java;

  inherit (callBPPackage "external/zlib" ./external_zlib.nix {})
    libz minigzip zlib_example zlib_example_host;

  inherit (callBPPackage "external/zopfli" ./external_zopfli.nix {})
    libzopfli zopflipng;

  inherit (callBPPackage "external/zxing/core" ./external_zxing_core.nix {})
    "zxing-core-1.7";

  inherit (callBPPackage "frameworks/av/apex" ./frameworks_av_apex.nix {})
    "com.android.media" "com.android.media-androidManifest" "com.android.media-defaults" "com.android.media.certificate" "com.android.media.key" "com.android.media.swcodec" "com.android.media.swcodec-androidManifest" "com.android.media.swcodec-defaults" "com.android.media.swcodec-ld.config.txt" "com.android.media.swcodec-mediaswcodec.rc" "com.android.media.swcodec.certificate" "com.android.media.swcodec.key";

  inherit (callBPPackage "frameworks/av/apex/testing" ./frameworks_av_apex_testing.nix {})
    "test_com.android.media" "test_com.android.media.swcodec";

  inherit (callBPPackage "frameworks/av/camera" ./frameworks_av_camera.nix {})
    libcamera_client libcamera_client_aidl libcamera_client_framework_aidl;

  inherit (callBPPackage "frameworks/av/camera/cameraserver" ./frameworks_av_camera_cameraserver.nix {})
    cameraserver;

  inherit (callBPPackage "frameworks/av/camera/ndk" ./frameworks_av_camera_ndk.nix {})
    AImageReaderVendorTest libcamera2ndk libcamera2ndk_vendor;

  inherit (callBPPackage "frameworks/av/cmds/screenrecord" ./frameworks_av_cmds_screenrecord.nix {})
    screenrecord;

  inherit (callBPPackage "frameworks/av/drm/common" ./frameworks_av_drm_common.nix {})
    libdrmframeworkcommon;

  inherit (callBPPackage "frameworks/av/drm/drmserver" ./frameworks_av_drm_drmserver.nix {})
    drmserver;

  inherit (callBPPackage "frameworks/av/drm/libdrmframework" ./frameworks_av_drm_libdrmframework.nix {})
    libdrmframework;

  inherit (callBPPackage "frameworks/av/drm/libdrmframework/plugins/common/util" ./frameworks_av_drm_libdrmframework_plugins_common_util.nix {})
    libdrmutility;

  inherit (callBPPackage "frameworks/av/drm/libdrmframework/plugins/forward-lock/FwdLockEngine" ./frameworks_av_drm_libdrmframework_plugins_forward-lock_FwdLockEngine.nix {})
    libfwdlockengine;

  inherit (callBPPackage "frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/common" ./frameworks_av_drm_libdrmframework_plugins_forward-lock_internal-format_common.nix {})
    libfwdlock-common;

  inherit (callBPPackage "frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/converter" ./frameworks_av_drm_libdrmframework_plugins_forward-lock_internal-format_converter.nix {})
    libfwdlock-converter;

  inherit (callBPPackage "frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/decoder" ./frameworks_av_drm_libdrmframework_plugins_forward-lock_internal-format_decoder.nix {})
    libfwdlock-decoder;

  inherit (callBPPackage "frameworks/av/drm/libdrmframework/plugins/passthru" ./frameworks_av_drm_libdrmframework_plugins_passthru.nix {})
    libdrmpassthruplugin;

  inherit (callBPPackage "frameworks/av/drm/libmediadrm" ./frameworks_av_drm_libmediadrm.nix {})
    libmediadrm libmediadrmmetrics_full libmediadrmmetrics_lite;

  inherit (callBPPackage "frameworks/av/drm/libmediadrm/tests" ./frameworks_av_drm_libmediadrm_tests.nix {})
    CounterMetric_test DrmMetrics_test EventMetric_test;

  inherit (callBPPackage "frameworks/av/drm/mediadrm/plugins/clearkey/common" ./frameworks_av_drm_mediadrm_plugins_clearkey_common.nix {})
    libclearkeycommon;

  inherit (callBPPackage "frameworks/av/drm/mediadrm/plugins/clearkey/default" ./frameworks_av_drm_mediadrm_plugins_clearkey_default.nix {})
    libdrmclearkeyplugin;

  inherit (callBPPackage "frameworks/av/drm/mediadrm/plugins/clearkey/default/tests" ./frameworks_av_drm_mediadrm_plugins_clearkey_default_tests.nix {})
    ClearKeyDrmUnitTest;

  inherit (callBPPackage "frameworks/av/drm/mediadrm/plugins/clearkey/hidl" ./frameworks_av_drm_mediadrm_plugins_clearkey_hidl.nix {})
    "android.hardware.drm@1.2-service-lazy.clearkey" "android.hardware.drm@1.2-service.clearkey" clearkey_service_defaults libclearkeydevicefiles-protos;

  inherit (callBPPackage "frameworks/av/drm/mediadrm/plugins/mock" ./frameworks_av_drm_mediadrm_plugins_mock.nix {})
    libmockdrmcryptoplugin;

  inherit (callBPPackage "frameworks/av/media/bufferpool/1.0" ./frameworks_av_media_bufferpool_1.0.nix {})
    "libstagefright_bufferpool@1.0";

  inherit (callBPPackage "frameworks/av/media/bufferpool/1.0/vts" ./frameworks_av_media_bufferpool_1.0_vts.nix {})
    VtsVndkHidlBufferpoolV1_0TargetMultiTest VtsVndkHidlBufferpoolV1_0TargetSingleTest;

  inherit (callBPPackage "frameworks/av/media/bufferpool/2.0" ./frameworks_av_media_bufferpool_2.0.nix {})
    "libstagefright_bufferpool@2.0" "libstagefright_bufferpool@2.0-default" "libstagefright_bufferpool@2.0.1";

  inherit (callBPPackage "frameworks/av/media/bufferpool/2.0/tests" ./frameworks_av_media_bufferpool_2.0_tests.nix {})
    VtsVndkHidlBufferpoolV2_0TargetMultiTest VtsVndkHidlBufferpoolV2_0TargetSingleTest;

  inherit (callBPPackage "frameworks/av/media/codec2/components/aac" ./frameworks_av_media_codec2_components_aac.nix {})
    libcodec2_soft_aacdec libcodec2_soft_aacenc;

  inherit (callBPPackage "frameworks/av/media/codec2/components/amr_nb_wb" ./frameworks_av_media_codec2_components_amr_nb_wb.nix {})
    libcodec2_soft_amrnbdec libcodec2_soft_amrnbenc libcodec2_soft_amrwbdec libcodec2_soft_amrwbenc;

  inherit (callBPPackage "frameworks/av/media/codec2/components/aom" ./frameworks_av_media_codec2_components_aom.nix {})
    libcodec2_soft_av1dec_aom;

  inherit (callBPPackage "frameworks/av/media/codec2/components/avc" ./frameworks_av_media_codec2_components_avc.nix {})
    libcodec2_soft_avcdec libcodec2_soft_avcenc;

  inherit (callBPPackage "frameworks/av/media/codec2/components/base" ./frameworks_av_media_codec2_components_base.nix {})
    codec2_soft_exports libcodec2_simple_component libcodec2_soft-defaults libcodec2_soft_common libcodec2_soft_sanitize_all-defaults libcodec2_soft_sanitize_signed-defaults;

  inherit (callBPPackage "frameworks/av/media/codec2/components/cmds" ./frameworks_av_media_codec2_components_cmds.nix {})
    codec2play;

  inherit (callBPPackage "frameworks/av/media/codec2/components/flac" ./frameworks_av_media_codec2_components_flac.nix {})
    libcodec2_soft_flacdec libcodec2_soft_flacenc;

  inherit (callBPPackage "frameworks/av/media/codec2/components/g711" ./frameworks_av_media_codec2_components_g711.nix {})
    libcodec2_soft_g711alawdec libcodec2_soft_g711mlawdec;

  inherit (callBPPackage "frameworks/av/media/codec2/components/gav1" ./frameworks_av_media_codec2_components_gav1.nix {})
    libcodec2_soft_av1dec_gav1;

  inherit (callBPPackage "frameworks/av/media/codec2/components/gsm" ./frameworks_av_media_codec2_components_gsm.nix {})
    libcodec2_soft_gsmdec;

  inherit (callBPPackage "frameworks/av/media/codec2/components/hevc" ./frameworks_av_media_codec2_components_hevc.nix {})
    libcodec2_soft_hevcdec libcodec2_soft_hevcenc;

  inherit (callBPPackage "frameworks/av/media/codec2/components/mp3" ./frameworks_av_media_codec2_components_mp3.nix {})
    libcodec2_soft_mp3dec;

  inherit (callBPPackage "frameworks/av/media/codec2/components/mpeg2" ./frameworks_av_media_codec2_components_mpeg2.nix {})
    libcodec2_soft_mpeg2dec;

  inherit (callBPPackage "frameworks/av/media/codec2/components/mpeg4_h263" ./frameworks_av_media_codec2_components_mpeg4_h263.nix {})
    libcodec2_soft_h263dec libcodec2_soft_h263enc libcodec2_soft_mpeg4dec libcodec2_soft_mpeg4enc;

  inherit (callBPPackage "frameworks/av/media/codec2/components/opus" ./frameworks_av_media_codec2_components_opus.nix {})
    libcodec2_soft_opusdec libcodec2_soft_opusenc;

  inherit (callBPPackage "frameworks/av/media/codec2/components/raw" ./frameworks_av_media_codec2_components_raw.nix {})
    libcodec2_soft_rawdec;

  inherit (callBPPackage "frameworks/av/media/codec2/components/vorbis" ./frameworks_av_media_codec2_components_vorbis.nix {})
    libcodec2_soft_vorbisdec;

  inherit (callBPPackage "frameworks/av/media/codec2/components/vpx" ./frameworks_av_media_codec2_components_vpx.nix {})
    libcodec2_soft_vp8dec libcodec2_soft_vp8enc libcodec2_soft_vp9dec libcodec2_soft_vp9enc;

  inherit (callBPPackage "frameworks/av/media/codec2/components/xaac" ./frameworks_av_media_codec2_components_xaac.nix {})
    libcodec2_soft_xaacdec;

  inherit (callBPPackage "frameworks/av/media/codec2/core" ./frameworks_av_media_codec2_core.nix {})
    libcodec2 libcodec2_headers;

  inherit (callBPPackage "frameworks/av/media/codec2/faultinjection" ./frameworks_av_media_codec2_faultinjection.nix {})
    libcodec2_component_wrapper;

  inherit (callBPPackage "frameworks/av/media/codec2/hidl/1.0/utils" ./frameworks_av_media_codec2_hidl_1.0_utils.nix {})
    "libcodec2_hidl@1.0" "libcodec2_hidl_client@1.0" libcodec2-hidl-client-defaults libcodec2-hidl-defaults;

  inherit (callBPPackage "frameworks/av/media/codec2/hidl/1.0/vts/functional/audio" ./frameworks_av_media_codec2_hidl_1.0_vts_functional_audio.nix {})
    VtsHalMediaC2V1_0TargetAudioDecTest VtsHalMediaC2V1_0TargetAudioEncTest;

  inherit (callBPPackage "frameworks/av/media/codec2/hidl/1.0/vts/functional/common" ./frameworks_av_media_codec2_hidl_1.0_vts_functional_common.nix {})
    VtsHalMediaC2V1_0CommonUtil VtsHalMediaC2V1_0Defaults;

  inherit (callBPPackage "frameworks/av/media/codec2/hidl/1.0/vts/functional/component" ./frameworks_av_media_codec2_hidl_1.0_vts_functional_component.nix {})
    VtsHalMediaC2V1_0TargetComponentTest;

  inherit (callBPPackage "frameworks/av/media/codec2/hidl/1.0/vts/functional/master" ./frameworks_av_media_codec2_hidl_1.0_vts_functional_master.nix {})
    VtsHalMediaC2V1_0TargetMasterTest;

  inherit (callBPPackage "frameworks/av/media/codec2/hidl/1.0/vts/functional/video" ./frameworks_av_media_codec2_hidl_1.0_vts_functional_video.nix {})
    VtsHalMediaC2V1_0TargetVideoDecTest VtsHalMediaC2V1_0TargetVideoEncTest;

  inherit (callBPPackage "frameworks/av/media/codec2/hidl/client" ./frameworks_av_media_codec2_hidl_client.nix {})
    libcodec2_client;

  inherit (callBPPackage "frameworks/av/media/codec2/hidl/services" ./frameworks_av_media_codec2_hidl_services.nix {})
    "android.hardware.media.c2@1.0-service";

  inherit (callBPPackage "frameworks/av/media/codec2/sfplugin" ./frameworks_av_media_codec2_sfplugin.nix {})
    libsfplugin_ccodec;

  inherit (callBPPackage "frameworks/av/media/codec2/sfplugin/tests" ./frameworks_av_media_codec2_sfplugin_tests.nix {})
    ccodec_unit_test mc_sanity_test;

  inherit (callBPPackage "frameworks/av/media/codec2/sfplugin/utils" ./frameworks_av_media_codec2_sfplugin_utils.nix {})
    libsfplugin_ccodec_utils;

  inherit (callBPPackage "frameworks/av/media/codec2/tests" ./frameworks_av_media_codec2_tests.nix {})
    codec2_core_param_test codec2_vndk_interface_test codec2_vndk_test;

  inherit (callBPPackage "frameworks/av/media/codec2/vndk" ./frameworks_av_media_codec2_vndk.nix {})
    libcodec2-impl-defaults libcodec2-internal-defaults libcodec2_internal libcodec2_vndk;

  inherit (callBPPackage "frameworks/av/media/extractors/aac" ./frameworks_av_media_extractors_aac.nix {})
    libaacextractor;

  inherit (callBPPackage "frameworks/av/media/extractors/amr" ./frameworks_av_media_extractors_amr.nix {})
    libamrextractor;

  inherit (callBPPackage "frameworks/av/media/extractors/flac" ./frameworks_av_media_extractors_flac.nix {})
    libflacextractor;

  inherit (callBPPackage "frameworks/av/media/extractors/midi" ./frameworks_av_media_extractors_midi.nix {})
    libmidiextractor;

  inherit (callBPPackage "frameworks/av/media/extractors/mkv" ./frameworks_av_media_extractors_mkv.nix {})
    libmkvextractor;

  inherit (callBPPackage "frameworks/av/media/extractors/mp3" ./frameworks_av_media_extractors_mp3.nix {})
    libmp3extractor;

  inherit (callBPPackage "frameworks/av/media/extractors/mp4" ./frameworks_av_media_extractors_mp4.nix {})
    libmp4extractor libmp4extractor_defaults libmp4extractor_fuzzing;

  inherit (callBPPackage "frameworks/av/media/extractors/mpeg2" ./frameworks_av_media_extractors_mpeg2.nix {})
    libmpeg2extractor;

  inherit (callBPPackage "frameworks/av/media/extractors/ogg" ./frameworks_av_media_extractors_ogg.nix {})
    liboggextractor;

  inherit (callBPPackage "frameworks/av/media/extractors/wav" ./frameworks_av_media_extractors_wav.nix {})
    libwavextractor;

  inherit (callBPPackage "frameworks/av/media/img_utils" ./frameworks_av_media_img_utils.nix {})
    libimg_utils;

  inherit (callBPPackage "frameworks/av/media/libaaudio" ./frameworks_av_media_libaaudio.nix {})
    libaaudio_headers;

  inherit (callBPPackage "frameworks/av/media/libaaudio/examples" ./frameworks_av_media_libaaudio_examples.nix {})
    libaaudio_example_utils;

  inherit (callBPPackage "frameworks/av/media/libaaudio/examples/input_monitor" ./frameworks_av_media_libaaudio_examples_input_monitor.nix {})
    input_monitor input_monitor_callback;

  inherit (callBPPackage "frameworks/av/media/libaaudio/examples/loopback" ./frameworks_av_media_libaaudio_examples_loopback.nix {})
    aaudio_loopback;

  inherit (callBPPackage "frameworks/av/media/libaaudio/examples/write_sine" ./frameworks_av_media_libaaudio_examples_write_sine.nix {})
    write_sine write_sine_callback;

  inherit (callBPPackage "frameworks/av/media/libaaudio/src" ./frameworks_av_media_libaaudio_src.nix {})
    libaaudio;

  inherit (callBPPackage "frameworks/av/media/libaaudio/tests" ./frameworks_av_media_libaaudio_tests.nix {})
    libaaudio_tests_defaults test_aaudio_marshalling test_aaudio_monkey test_aaudio_recovery test_atomic_fifo test_attributes test_bad_disconnect test_block_adapter test_clock_model test_flowgraph test_full_queue test_interference test_n_streams test_no_close test_open_params test_return_stop test_session_id test_stop_hang test_timestamps test_various;

  inherit (callBPPackage "frameworks/av/media/libaudioclient" ./frameworks_av_media_libaudioclient.nix {})
    libaudioclient libaudioclient_aidl libaudioclient_headers libaudiopolicy;

  inherit (callBPPackage "frameworks/av/media/libaudioclient/tests" ./frameworks_av_media_libaudioclient_tests.nix {})
    libaudioclient_tests_defaults test_create_audiorecord test_create_audiotrack;

  inherit (callBPPackage "frameworks/av/media/libaudiohal" ./frameworks_av_media_libaudiohal.nix {})
    libaudiohal libaudiohal_deathhandler libaudiohal_headers;

  inherit (callBPPackage "frameworks/av/media/libaudiohal/impl" ./frameworks_av_media_libaudiohal_impl.nix {})
    "libaudiohal@2.0" "libaudiohal@4.0" "libaudiohal@5.0" libaudiohal_default;

  inherit (callBPPackage "frameworks/av/media/libaudioprocessing" ./frameworks_av_media_libaudioprocessing.nix {})
    libaudioprocessing libaudioprocessing_arm libaudioprocessing_defaults;

  inherit (callBPPackage "frameworks/av/media/libaudioprocessing/audio-resampler" ./frameworks_av_media_libaudioprocessing_audio-resampler.nix {})
    libaudio-resampler;

  inherit (callBPPackage "frameworks/av/media/libaudioprocessing/tests" ./frameworks_av_media_libaudioprocessing_tests.nix {})
    libaudioprocessing_test_defaults resampler_tests test-mixer test-resampler;

  inherit (callBPPackage "frameworks/av/media/libcpustats" ./frameworks_av_media_libcpustats.nix {})
    libcpustats;

  inherit (callBPPackage "frameworks/av/media/libeffects/config" ./frameworks_av_media_libeffects_config.nix {})
    libeffectsconfig;

  inherit (callBPPackage "frameworks/av/media/libeffects/downmix" ./frameworks_av_media_libeffects_downmix.nix {})
    libdownmix;

  inherit (callBPPackage "frameworks/av/media/libeffects/downmix/tests" ./frameworks_av_media_libeffects_downmix_tests.nix {})
    downmixtest;

  inherit (callBPPackage "frameworks/av/media/libeffects/dynamicsproc" ./frameworks_av_media_libeffects_dynamicsproc.nix {})
    libdynproc;

  inherit (callBPPackage "frameworks/av/media/libeffects/factory" ./frameworks_av_media_libeffects_factory.nix {})
    dumpEffectConfigFile libeffects libeffects_headers;

  inherit (callBPPackage "frameworks/av/media/libeffects/loudness" ./frameworks_av_media_libeffects_loudness.nix {})
    libldnhncr;

  inherit (callBPPackage "frameworks/av/media/libeffects/lvm/lib" ./frameworks_av_media_libeffects_lvm_lib.nix {})
    libmusicbundle libreverb;

  inherit (callBPPackage "frameworks/av/media/libeffects/lvm/tests" ./frameworks_av_media_libeffects_lvm_tests.nix {})
    lvmtest snr;

  inherit (callBPPackage "frameworks/av/media/libeffects/lvm/wrapper" ./frameworks_av_media_libeffects_lvm_wrapper.nix {})
    libbundlewrapper libreverbwrapper;

  inherit (callBPPackage "frameworks/av/media/libeffects/preprocessing" ./frameworks_av_media_libeffects_preprocessing.nix {})
    libaudiopreprocessing;

  inherit (callBPPackage "frameworks/av/media/libeffects/proxy" ./frameworks_av_media_libeffects_proxy.nix {})
    libeffectproxy;

  inherit (callBPPackage "frameworks/av/media/libheif" ./frameworks_av_media_libheif.nix {})
    libheif;

  inherit (callBPPackage "frameworks/av/media/libmedia" ./frameworks_av_media_libmedia.nix {})
    libmedia libmedia_defaults libmedia_headers libmedia_helper libmedia_midiiowrapper libmedia_omx libmedia_omx_client libmedia_player2_util;

  inherit (callBPPackage "frameworks/av/media/libmedia/xsd" ./frameworks_av_media_libmedia_xsd.nix {})
    media_profiles;

  inherit (callBPPackage "frameworks/av/media/libmedia/xsd/vts" ./frameworks_av_media_libmedia_xsd_vts.nix {})
    vts_mediaProfiles_validate_test;

  inherit (callBPPackage "frameworks/av/media/libmediametrics" ./frameworks_av_media_libmediametrics.nix {})
    libmediametrics;

  inherit (callBPPackage "frameworks/av/media/libmediaplayer2" ./frameworks_av_media_libmediaplayer2.nix {})
    libmedia2_jni_core libmediaplayer2 libmediaplayer2_headers;

  inherit (callBPPackage "frameworks/av/media/libmediaplayer2/nuplayer2" ./frameworks_av_media_libmediaplayer2_nuplayer2.nix {})
    libstagefright_nuplayer2;

  inherit (callBPPackage "frameworks/av/media/libmediaplayerservice" ./frameworks_av_media_libmediaplayerservice.nix {})
    libmediaplayerservice;

  inherit (callBPPackage "frameworks/av/media/libmediaplayerservice/nuplayer" ./frameworks_av_media_libmediaplayerservice_nuplayer.nix {})
    libstagefright_nuplayer;

  inherit (callBPPackage "frameworks/av/media/libmediaplayerservice/tests" ./frameworks_av_media_libmediaplayerservice_tests.nix {})
    DrmSessionManager_test;

  inherit (callBPPackage "frameworks/av/media/libnbaio" ./frameworks_av_media_libnbaio.nix {})
    libnbaio libnbaio_mono libnbaio_mono_defaults;

  inherit (callBPPackage "frameworks/av/media/libnblog" ./frameworks_av_media_libnblog.nix {})
    libnblog;

  inherit (callBPPackage "frameworks/av/media/libstagefright" ./frameworks_av_media_libstagefright.nix {})
    libstagefright libstagefright_codecbase libstagefright_esds libstagefright_headers libstagefright_metadatautils libstagefright_mpeg2extractor libstagefright_player2;

  inherit (callBPPackage "frameworks/av/media/libstagefright/bqhelper" ./frameworks_av_media_libstagefright_bqhelper.nix {})
    libstagefright_bufferqueue_helper;

  inherit (callBPPackage "frameworks/av/media/libstagefright/bqhelper/tests" ./frameworks_av_media_libstagefright_bqhelper_tests.nix {})
    FrameDropper_test;

  inherit (callBPPackage "frameworks/av/media/libstagefright/codecs/aacdec" ./frameworks_av_media_libstagefright_codecs_aacdec.nix {})
    libstagefright_soft_aacdec;

  inherit (callBPPackage "frameworks/av/media/libstagefright/codecs/aacenc" ./frameworks_av_media_libstagefright_codecs_aacenc.nix {})
    libstagefright_soft_aacenc;

  inherit (callBPPackage "frameworks/av/media/libstagefright/codecs/amrnb/common" ./frameworks_av_media_libstagefright_codecs_amrnb_common.nix {})
    libstagefright_amrnb_common;

  inherit (callBPPackage "frameworks/av/media/libstagefright/codecs/amrnb/dec" ./frameworks_av_media_libstagefright_codecs_amrnb_dec.nix {})
    libstagefright_amrnbdec libstagefright_amrnbdec_test libstagefright_soft_amrdec;

  inherit (callBPPackage "frameworks/av/media/libstagefright/codecs/amrnb/enc" ./frameworks_av_media_libstagefright_codecs_amrnb_enc.nix {})
    libstagefright_amrnbenc libstagefright_amrnbenc_test libstagefright_soft_amrnbenc;

  inherit (callBPPackage "frameworks/av/media/libstagefright/codecs/amrwb" ./frameworks_av_media_libstagefright_codecs_amrwb.nix {})
    libstagefright_amrwbdec libstagefright_amrwbdec_test;

  inherit (callBPPackage "frameworks/av/media/libstagefright/codecs/amrwbenc" ./frameworks_av_media_libstagefright_codecs_amrwbenc.nix {})
    libstagefright_amrwbenc libstagefright_soft_amrwbenc;

  inherit (callBPPackage "frameworks/av/media/libstagefright/codecs/amrwbenc/SampleCode" ./frameworks_av_media_libstagefright_codecs_amrwbenc_SampleCode.nix {})
    AMRWBEncTest;

  inherit (callBPPackage "frameworks/av/media/libstagefright/codecs/avcdec" ./frameworks_av_media_libstagefright_codecs_avcdec.nix {})
    libstagefright_soft_avcdec;

  inherit (callBPPackage "frameworks/av/media/libstagefright/codecs/avcenc" ./frameworks_av_media_libstagefright_codecs_avcenc.nix {})
    libstagefright_soft_avcenc;

  inherit (callBPPackage "frameworks/av/media/libstagefright/codecs/common" ./frameworks_av_media_libstagefright_codecs_common.nix {})
    libstagefright_enc_common;

  inherit (callBPPackage "frameworks/av/media/libstagefright/codecs/flac/dec" ./frameworks_av_media_libstagefright_codecs_flac_dec.nix {})
    libstagefright_soft_flacdec;

  inherit (callBPPackage "frameworks/av/media/libstagefright/codecs/flac/enc" ./frameworks_av_media_libstagefright_codecs_flac_enc.nix {})
    libstagefright_soft_flacenc;

  inherit (callBPPackage "frameworks/av/media/libstagefright/codecs/g711/dec" ./frameworks_av_media_libstagefright_codecs_g711_dec.nix {})
    libstagefright_soft_g711dec;

  inherit (callBPPackage "frameworks/av/media/libstagefright/codecs/gsm/dec" ./frameworks_av_media_libstagefright_codecs_gsm_dec.nix {})
    libstagefright_soft_gsmdec;

  inherit (callBPPackage "frameworks/av/media/libstagefright/codecs/hevcdec" ./frameworks_av_media_libstagefright_codecs_hevcdec.nix {})
    libstagefright_soft_hevcdec;

  inherit (callBPPackage "frameworks/av/media/libstagefright/codecs/m4v_h263/dec" ./frameworks_av_media_libstagefright_codecs_m4v_h263_dec.nix {})
    libstagefright_m4vh263dec libstagefright_soft_mpeg4dec;

  inherit (callBPPackage "frameworks/av/media/libstagefright/codecs/m4v_h263/enc" ./frameworks_av_media_libstagefright_codecs_m4v_h263_enc.nix {})
    libstagefright_m4vh263enc libstagefright_m4vh263enc_test libstagefright_soft_mpeg4enc;

  inherit (callBPPackage "frameworks/av/media/libstagefright/codecs/mp3dec" ./frameworks_av_media_libstagefright_codecs_mp3dec.nix {})
    libstagefright_mp3dec libstagefright_mp3dec_test libstagefright_soft_mp3dec;

  inherit (callBPPackage "frameworks/av/media/libstagefright/codecs/mpeg2dec" ./frameworks_av_media_libstagefright_codecs_mpeg2dec.nix {})
    libstagefright_soft_mpeg2dec;

  inherit (callBPPackage "frameworks/av/media/libstagefright/codecs/on2/dec" ./frameworks_av_media_libstagefright_codecs_on2_dec.nix {})
    libstagefright_soft_vpxdec;

  inherit (callBPPackage "frameworks/av/media/libstagefright/codecs/on2/enc" ./frameworks_av_media_libstagefright_codecs_on2_enc.nix {})
    libstagefright_soft_vpxenc;

  inherit (callBPPackage "frameworks/av/media/libstagefright/codecs/opus/dec" ./frameworks_av_media_libstagefright_codecs_opus_dec.nix {})
    libstagefright_soft_opusdec;

  inherit (callBPPackage "frameworks/av/media/libstagefright/codecs/raw" ./frameworks_av_media_libstagefright_codecs_raw.nix {})
    libstagefright_soft_rawdec;

  inherit (callBPPackage "frameworks/av/media/libstagefright/codecs/vorbis/dec" ./frameworks_av_media_libstagefright_codecs_vorbis_dec.nix {})
    libstagefright_soft_vorbisdec;

  inherit (callBPPackage "frameworks/av/media/libstagefright/codecs/xaacdec" ./frameworks_av_media_libstagefright_codecs_xaacdec.nix {})
    libstagefright_soft_xaacdec;

  inherit (callBPPackage "frameworks/av/media/libstagefright/colorconversion" ./frameworks_av_media_libstagefright_colorconversion.nix {})
    libstagefright_color_conversion;

  inherit (callBPPackage "frameworks/av/media/libstagefright/data" ./frameworks_av_media_libstagefright_data.nix {})
    "mediaswcodec.xml";

  inherit (callBPPackage "frameworks/av/media/libstagefright/filters" ./frameworks_av_media_libstagefright_filters.nix {})
    libstagefright_mediafilter;

  inherit (callBPPackage "frameworks/av/media/libstagefright/flac/dec" ./frameworks_av_media_libstagefright_flac_dec.nix {})
    libstagefright_flacdec;

  inherit (callBPPackage "frameworks/av/media/libstagefright/foundation" ./frameworks_av_media_libstagefright_foundation.nix {})
    libstagefright_foundation libstagefright_foundation_defaults libstagefright_foundation_headers libstagefright_foundation_without_imemory;

  inherit (callBPPackage "frameworks/av/media/libstagefright/http" ./frameworks_av_media_libstagefright_http.nix {})
    libstagefright_http_support;

  inherit (callBPPackage "frameworks/av/media/libstagefright/httplive" ./frameworks_av_media_libstagefright_httplive.nix {})
    libstagefright_httplive;

  inherit (callBPPackage "frameworks/av/media/libstagefright/id3" ./frameworks_av_media_libstagefright_id3.nix {})
    libstagefright_id3 testid3;

  inherit (callBPPackage "frameworks/av/media/libstagefright/mpeg2ts" ./frameworks_av_media_libstagefright_mpeg2ts.nix {})
    libstagefright_mpeg2support;

  inherit (callBPPackage "frameworks/av/media/libstagefright/omx" ./frameworks_av_media_libstagefright_omx.nix {})
    libstagefright_omx libstagefright_omx_utils libstagefright_softomx libstagefright_softomx-defaults libstagefright_softomx_plugin;

  inherit (callBPPackage "frameworks/av/media/libstagefright/omx/tests" ./frameworks_av_media_libstagefright_omx_tests.nix {})
    omx_tests;

  inherit (callBPPackage "frameworks/av/media/libstagefright/rtsp" ./frameworks_av_media_libstagefright_rtsp.nix {})
    libstagefright_rtsp libstagefright_rtsp_defaults libstagefright_rtsp_player2 rtp_test;

  inherit (callBPPackage "frameworks/av/media/libstagefright/tests" ./frameworks_av_media_libstagefright_tests.nix {})
    BatteryChecker_test MediaCodecListOverrides_test;

  inherit (callBPPackage "frameworks/av/media/libstagefright/timedtext" ./frameworks_av_media_libstagefright_timedtext.nix {})
    libstagefright_timedtext libstagefright_timedtext2;

  inherit (callBPPackage "frameworks/av/media/libstagefright/webm" ./frameworks_av_media_libstagefright_webm.nix {})
    libstagefright_webm;

  inherit (callBPPackage "frameworks/av/media/libstagefright/xmlparser" ./frameworks_av_media_libstagefright_xmlparser.nix {})
    libstagefright_xmlparser libstagefright_xmlparser_headers media_codecs;

  inherit (callBPPackage "frameworks/av/media/libstagefright/xmlparser/vts" ./frameworks_av_media_libstagefright_xmlparser_vts.nix {})
    vts_mediaCodecs_validate_test;

  inherit (callBPPackage "frameworks/av/media/libwatchdog" ./frameworks_av_media_libwatchdog.nix {})
    libwatchdog;

  inherit (callBPPackage "frameworks/av/media/mediaserver" ./frameworks_av_media_mediaserver.nix {})
    libregistermsext mediaserver;

  inherit (callBPPackage "frameworks/av/media/mtp" ./frameworks_av_media_mtp.nix {})
    libmtp;

  inherit (callBPPackage "frameworks/av/media/mtp/tests" ./frameworks_av_media_mtp_tests.nix {})
    mtp_ffs_handle_test posix_async_io_test;

  inherit (callBPPackage "frameworks/av/media/ndk" ./frameworks_av_media_ndk.nix {})
    AImageReaderWindowHandleTest libmediandk libmediandk_utils media_ndk_headers;

  inherit (callBPPackage "frameworks/av/media/utils" ./frameworks_av_media_utils.nix {})
    libmediautils;

  inherit (callBPPackage "frameworks/av/services/audioflinger" ./frameworks_av_services_audioflinger.nix {})
    libaudioflinger;

  inherit (callBPPackage "frameworks/av/services/audiopolicy" ./frameworks_av_services_audiopolicy.nix {})
    libaudiopolicymanager_interface_headers;

  inherit (callBPPackage "frameworks/av/services/audiopolicy/common" ./frameworks_av_services_audiopolicy_common.nix {})
    libaudiopolicycommon;

  inherit (callBPPackage "frameworks/av/services/audiopolicy/common/managerdefinitions" ./frameworks_av_services_audiopolicy_common_managerdefinitions.nix {})
    libaudiopolicycomponents;

  inherit (callBPPackage "frameworks/av/services/audiopolicy/engine/common" ./frameworks_av_services_audiopolicy_engine_common.nix {})
    libaudiopolicyengine_common libaudiopolicyengine_common_headers;

  inherit (callBPPackage "frameworks/av/services/audiopolicy/engine/config" ./frameworks_av_services_audiopolicy_engine_config.nix {})
    libaudiopolicyengine_config;

  inherit (callBPPackage "frameworks/av/services/audiopolicy/engine/interface" ./frameworks_av_services_audiopolicy_engine_interface.nix {})
    libaudiopolicyengine_interface_headers;

  inherit (callBPPackage "frameworks/av/services/audiopolicy/engineconfigurable" ./frameworks_av_services_audiopolicy_engineconfigurable.nix {})
    libaudiopolicyengineconfigurable libaudiopolicyengineconfigurable_interface_headers;

  inherit (callBPPackage "frameworks/av/services/audiopolicy/engineconfigurable/parameter-framework/plugin" ./frameworks_av_services_audiopolicy_engineconfigurable_parameter-framework_plugin.nix {})
    libpolicy-subsystem;

  inherit (callBPPackage "frameworks/av/services/audiopolicy/engineconfigurable/tools" ./frameworks_av_services_audiopolicy_engineconfigurable_tools.nix {})
    "buildPolicyCriterionTypes.py" "buildStrategiesStructureFile.py" "domainGeneratorPolicy.py" tools_default;

  inherit (callBPPackage "frameworks/av/services/audiopolicy/engineconfigurable/wrapper" ./frameworks_av_services_audiopolicy_engineconfigurable_wrapper.nix {})
    libaudiopolicyengineconfigurable_pfwwrapper;

  inherit (callBPPackage "frameworks/av/services/audiopolicy/enginedefault" ./frameworks_av_services_audiopolicy_enginedefault.nix {})
    libaudiopolicyenginedefault;

  inherit (callBPPackage "frameworks/av/services/camera/libcameraservice" ./frameworks_av_services_camera_libcameraservice.nix {})
    libcameraservice libdepthphoto;

  inherit (callBPPackage "frameworks/av/services/mediaanalytics" ./frameworks_av_services_mediaanalytics.nix {})
    mediametrics;

  inherit (callBPPackage "frameworks/av/services/mediacodec" ./frameworks_av_services_mediacodec.nix {})
    "mediaswcodec.policy" mediaswcodec;

  inherit (callBPPackage "frameworks/av/services/mediacodec/registrant" ./frameworks_av_services_mediacodec_registrant.nix {})
    libmedia_codecserviceregistrant;

  inherit (callBPPackage "frameworks/av/services/mediaextractor" ./frameworks_av_services_mediaextractor.nix {})
    "mediaextractor.policy" libmediaextractorservice mediaextractor;

  inherit (callBPPackage "frameworks/av/services/medialog" ./frameworks_av_services_medialog.nix {})
    libmedialogservice;

  inherit (callBPPackage "frameworks/av/services/mediaresourcemanager" ./frameworks_av_services_mediaresourcemanager.nix {})
    libresourcemanagerservice;

  inherit (callBPPackage "frameworks/av/services/mediaresourcemanager/test" ./frameworks_av_services_mediaresourcemanager_test.nix {})
    ResourceManagerService_test ServiceLog_test;

  inherit (callBPPackage "frameworks/av/services/minijail" ./frameworks_av_services_minijail.nix {})
    libavservices_minijail libavservices_minijail_defaults libavservices_minijail_unittest libavservices_minijail_vendor;

  inherit (callBPPackage "frameworks/av/services/soundtrigger" ./frameworks_av_services_soundtrigger.nix {})
    libsoundtriggerservice;

  inherit (callBPPackage "frameworks/av/soundtrigger" ./frameworks_av_soundtrigger.nix {})
    libsoundtrigger;

  inherit (callBPPackage "frameworks/base/apct-tests/perftests/autofill" ./frameworks_base_apct-tests_perftests_autofill.nix {})
    AutofillPerfTests;

  inherit (callBPPackage "frameworks/base/apct-tests/perftests/core/jni" ./frameworks_base_apct-tests_perftests_core_jni.nix {})
    libperftestscore_jni;

  inherit (callBPPackage "frameworks/base/apct-tests/perftests/multiuser" ./frameworks_base_apct-tests_perftests_multiuser.nix {})
    MultiUserPerfTests;

  inherit (callBPPackage "frameworks/base/apct-tests/perftests/textclassifier" ./frameworks_base_apct-tests_perftests_textclassifier.nix {})
    TextClassifierPerfTests;

  inherit (callBPPackage "frameworks/base/apct-tests/perftests/utils" ./frameworks_base_apct-tests_perftests_utils.nix {})
    apct-perftests-utils;

  inherit (callBPPackage "frameworks/base/cmds/am" ./frameworks_base_cmds_am.nix {})
    libinstrumentation;

  inherit (callBPPackage "frameworks/base/cmds/backup" ./frameworks_base_cmds_backup.nix {})
    btool;

  inherit (callBPPackage "frameworks/base/cmds/bmgr" ./frameworks_base_cmds_bmgr.nix {})
    bmgr;

  inherit (callBPPackage "frameworks/base/cmds/bootanimation" ./frameworks_base_cmds_bootanimation.nix {})
    bootanimation bootanimation_defaults libbootanimation;

  inherit (callBPPackage "frameworks/base/cmds/bootanimation/iot" ./frameworks_base_cmds_bootanimation_iot.nix {})
    libbootanimation_iot_test;

  inherit (callBPPackage "frameworks/base/cmds/hid/jni" ./frameworks_base_cmds_hid_jni.nix {})
    libhidcommand_jni;

  inherit (callBPPackage "frameworks/base/cmds/idmap" ./frameworks_base_cmds_idmap.nix {})
    idmap;

  inherit (callBPPackage "frameworks/base/cmds/idmap2" ./frameworks_base_cmds_idmap2.nix {})
    idmap2 idmap2_aidl idmap2_defaults idmap2_tests idmap2d libidmap2 libidmap2daidl;

  inherit (callBPPackage "frameworks/base/cmds/incident" ./frameworks_base_cmds_incident.nix {})
    incident incident_sections;

  inherit (callBPPackage "frameworks/base/cmds/incident_helper" ./frameworks_base_cmds_incident_helper.nix {})
    incident_helper incident_helper_defaults incident_helper_test;

  inherit (callBPPackage "frameworks/base/cmds/incidentd" ./frameworks_base_cmds_incidentd.nix {})
    incidentd incidentd_section_list incidentd_test;

  inherit (callBPPackage "frameworks/base/cmds/interrupter" ./frameworks_base_cmds_interrupter.nix {})
    interrupter;

  inherit (callBPPackage "frameworks/base/cmds/media" ./frameworks_base_cmds_media.nix {})
    media;

  inherit (callBPPackage "frameworks/base/cmds/screencap" ./frameworks_base_cmds_screencap.nix {})
    screencap;

  inherit (callBPPackage "frameworks/base/cmds/statsd" ./frameworks_base_cmds_statsd.nix {})
    libstats_proto_host statsd statsd-config-proto-def statsd_benchmark statsd_defaults statsd_test statsdprotolite;

  inherit (callBPPackage "frameworks/base/cmds/statsd/tools/dogfood" ./frameworks_base_cmds_statsd_tools_dogfood.nix {})
    StatsdDogfood;

  inherit (callBPPackage "frameworks/base/cmds/statsd/tools/loadtest" ./frameworks_base_cmds_statsd_tools_loadtest.nix {})
    StatsdLoadtest;

  inherit (callBPPackage "frameworks/base/cmds/statsd/tools/localtools" ./frameworks_base_cmds_statsd_tools_localtools.nix {})
    statsd_localdrive statsd_testdrive;

  inherit (callBPPackage "frameworks/base/cmds/uiautomator/library" ./frameworks_base_cmds_uiautomator_library.nix {})
    "uiautomator.core" android_uiautomator uiautomator-stubs-docs;

  inherit (callBPPackage "frameworks/base/core/java" ./frameworks_base_core_java.nix {})
    "ICarStatsService.aidl" "IDropBoxManagerService.aidl" "IKeyAttestationApplicationIdProvider.aidl";

  inherit (callBPPackage "frameworks/base/core/java/android/service/wallpaper" ./frameworks_base_core_java_android_service_wallpaper.nix {})
    WallpaperSharedLib;

  inherit (callBPPackage "frameworks/base/core/jni" ./frameworks_base_core_jni.nix {})
    "android_util_StatsLogInternal.cpp" libandroid_runtime;

  inherit (callBPPackage "frameworks/base/core/proto" ./frameworks_base_core_proto.nix {})
    libbt-platform-protos-lite;

  inherit (callBPPackage "frameworks/base/core/proto/android/server/connectivity" ./frameworks_base_core_proto_android_server_connectivity.nix {})
    datastallprotosnano;

  inherit (callBPPackage "frameworks/base/core/proto/android/stats/connectivity" ./frameworks_base_core_proto_android_stats_connectivity.nix {})
    networkstackprotosnano;

  inherit (callBPPackage "frameworks/base/core/proto/android/stats/devicepolicy" ./frameworks_base_core_proto_android_stats_devicepolicy.nix {})
    devicepolicyprotosnano;

  inherit (callBPPackage "frameworks/base/core/proto/android/stats/dnsresolver" ./frameworks_base_core_proto_android_stats_dnsresolver.nix {})
    dnsresolverprotosnano;

  inherit (callBPPackage "frameworks/base/core/proto/android/stats/launcher" ./frameworks_base_core_proto_android_stats_launcher.nix {})
    launcherprotosnano;

  inherit (callBPPackage "frameworks/base/core/proto/android/stats/style" ./frameworks_base_core_proto_android_stats_style.nix {})
    styleprotosnano;

  inherit (callBPPackage "frameworks/base/core/res" ./frameworks_base_core_res.nix {})
    framework-res;

  inherit (callBPPackage "frameworks/base/core/tests/BroadcastRadioTests" ./frameworks_base_core_tests_BroadcastRadioTests.nix {})
    BroadcastRadioTests;

  inherit (callBPPackage "frameworks/base/core/tests/bugreports" ./frameworks_base_core_tests_bugreports.nix {})
    BugreportManagerTestCases;

  inherit (callBPPackage "frameworks/base/core/tests/coretests" ./frameworks_base_core_tests_coretests.nix {})
    FrameworksCoreTests FrameworksCoreTests_apks_as_resources;

  inherit (callBPPackage "frameworks/base/core/tests/coretests/BinderProxyCountingTestApp" ./frameworks_base_core_tests_coretests_BinderProxyCountingTestApp.nix {})
    BinderProxyCountingTestApp;

  inherit (callBPPackage "frameworks/base/core/tests/coretests/BinderProxyCountingTestService" ./frameworks_base_core_tests_coretests_BinderProxyCountingTestService.nix {})
    BinderProxyCountingTestService;

  inherit (callBPPackage "frameworks/base/core/tests/coretests/BstatsTestApp" ./frameworks_base_core_tests_coretests_BstatsTestApp.nix {})
    BstatsTestApp;

  inherit (callBPPackage "frameworks/base/core/tests/coretests/DisabledTestApp" ./frameworks_base_core_tests_coretests_DisabledTestApp.nix {})
    DisabledTestApp;

  inherit (callBPPackage "frameworks/base/core/tests/coretests/EnabledTestApp" ./frameworks_base_core_tests_coretests_EnabledTestApp.nix {})
    EnabledTestApp;

  inherit (callBPPackage "frameworks/base/core/tests/coretests/aidl" ./frameworks_base_core_tests_coretests_aidl.nix {})
    coretests-aidl;

  inherit (callBPPackage "frameworks/base/core/tests/coretests/apks" ./frameworks_base_core_tests_coretests_apks.nix {})
    FrameworksCoreTests_apks_defaults;

  inherit (callBPPackage "frameworks/base/core/tests/coretests/apks/install-split-base" ./frameworks_base_core_tests_coretests_apks_install-split-base.nix {})
    FrameworksCoreTests_install_split_base;

  inherit (callBPPackage "frameworks/base/core/tests/coretests/apks/install-split-feature-a" ./frameworks_base_core_tests_coretests_apks_install-split-feature-a.nix {})
    FrameworksCoreTests_install_split_feature_a;

  inherit (callBPPackage "frameworks/base/core/tests/coretests/apks/install" ./frameworks_base_core_tests_coretests_apks_install.nix {})
    FrameworksCoreTests_install;

  inherit (callBPPackage "frameworks/base/core/tests/coretests/apks/install_bad_dex" ./frameworks_base_core_tests_coretests_apks_install_bad_dex.nix {})
    FrameworksCoreTests_install_bad_dex FrameworksCoreTests_install_bad_dex_;

  inherit (callBPPackage "frameworks/base/core/tests/coretests/apks/install_complete_package_info" ./frameworks_base_core_tests_coretests_apks_install_complete_package_info.nix {})
    FrameworksCoreTests_install_complete_package_info;

  inherit (callBPPackage "frameworks/base/core/tests/coretests/apks/install_decl_perm" ./frameworks_base_core_tests_coretests_apks_install_decl_perm.nix {})
    FrameworksCoreTests_install_decl_perm;

  inherit (callBPPackage "frameworks/base/core/tests/coretests/apks/install_jni_lib" ./frameworks_base_core_tests_coretests_apks_install_jni_lib.nix {})
    libframeworks_coretests_jni;

  inherit (callBPPackage "frameworks/base/core/tests/coretests/apks/install_jni_lib_open_from_apk" ./frameworks_base_core_tests_coretests_apks_install_jni_lib_open_from_apk.nix {})
    FrameworksCoreTests_install_jni_lib_open_from_apk;

  inherit (callBPPackage "frameworks/base/core/tests/coretests/apks/install_loc_auto" ./frameworks_base_core_tests_coretests_apks_install_loc_auto.nix {})
    FrameworksCoreTests_install_loc_auto;

  inherit (callBPPackage "frameworks/base/core/tests/coretests/apks/install_loc_internal" ./frameworks_base_core_tests_coretests_apks_install_loc_internal.nix {})
    FrameworksCoreTests_install_loc_internal;

  inherit (callBPPackage "frameworks/base/core/tests/coretests/apks/install_loc_sdcard" ./frameworks_base_core_tests_coretests_apks_install_loc_sdcard.nix {})
    FrameworksCoreTests_install_loc_sdcard;

  inherit (callBPPackage "frameworks/base/core/tests/coretests/apks/install_loc_unspecified" ./frameworks_base_core_tests_coretests_apks_install_loc_unspecified.nix {})
    FrameworksCoreTests_install_loc_unspecified;

  inherit (callBPPackage "frameworks/base/core/tests/coretests/apks/install_multi_package" ./frameworks_base_core_tests_coretests_apks_install_multi_package.nix {})
    FrameworksCoreTests_install_multi_package;

  inherit (callBPPackage "frameworks/base/core/tests/coretests/apks/install_use_perm_good" ./frameworks_base_core_tests_coretests_apks_install_use_perm_good.nix {})
    FrameworksCoreTests_install_use_perm_good;

  inherit (callBPPackage "frameworks/base/core/tests/coretests/apks/install_uses_feature" ./frameworks_base_core_tests_coretests_apks_install_uses_feature.nix {})
    FrameworksCoreTests_install_uses_feature;

  inherit (callBPPackage "frameworks/base/core/tests/coretests/apks/install_verifier_bad" ./frameworks_base_core_tests_coretests_apks_install_verifier_bad.nix {})
    FrameworksCoreTests_install_verifier_bad;

  inherit (callBPPackage "frameworks/base/core/tests/coretests/apks/install_verifier_good" ./frameworks_base_core_tests_coretests_apks_install_verifier_good.nix {})
    FrameworksCoreTests_install_verifier_good;

  inherit (callBPPackage "frameworks/base/core/tests/coretests/apks/keyset" ./frameworks_base_core_tests_coretests_apks_keyset.nix {})
    FrameworksCoreTests_keyset_permdef_sa_unone FrameworksCoreTests_keyset_permuse_sa_ua_ub FrameworksCoreTests_keyset_permuse_sb_ua_ub FrameworksCoreTests_keyset_sa_ua FrameworksCoreTests_keyset_sa_ua_ub FrameworksCoreTests_keyset_sa_uab FrameworksCoreTests_keyset_sa_ub FrameworksCoreTests_keyset_sa_unone FrameworksCoreTests_keyset_sab_ua FrameworksCoreTests_keyset_sau_ub FrameworksCoreTests_keyset_sb_ua FrameworksCoreTests_keyset_sb_ub FrameworksCoreTests_keyset_splat_api FrameworksCoreTests_keyset_splata_api;

  inherit (callBPPackage "frameworks/base/core/tests/coretests/apks/locales" ./frameworks_base_core_tests_coretests_apks_locales.nix {})
    FrameworksCoreTests_locales;

  inherit (callBPPackage "frameworks/base/core/tests/coretests/apks/version" ./frameworks_base_core_tests_coretests_apks_version.nix {})
    FrameworksCoreTests_version_1 FrameworksCoreTests_version_1_diff FrameworksCoreTests_version_2 FrameworksCoreTests_version_2_diff FrameworksCoreTests_version_3;

  inherit (callBPPackage "frameworks/base/core/tests/coretests/apks/version_nosys" ./frameworks_base_core_tests_coretests_apks_version_nosys.nix {})
    FrameworksCoreTests_version_1_nosys;

  inherit (callBPPackage "frameworks/base/core/tests/coretests/certs" ./frameworks_base_core_tests_coretests_certs.nix {})
    FrameworksCoreTests_keyset_A_cert FrameworksCoreTests_keyset_B_cert FrameworksCoreTests_unit_test_cert;

  inherit (callBPPackage "frameworks/base/core/tests/featureflagtests" ./frameworks_base_core_tests_featureflagtests.nix {})
    FrameworksCoreFeatureFlagTests;

  inherit (callBPPackage "frameworks/base/core/tests/hosttests/test-apps/SharedUid/32/jni" ./frameworks_base_core_tests_hosttests_test-apps_SharedUid_32_jni.nix {})
    libpmtest32;

  inherit (callBPPackage "frameworks/base/core/tests/hosttests/test-apps/SharedUid/64/jni" ./frameworks_base_core_tests_hosttests_test-apps_SharedUid_64_jni.nix {})
    libpmtest64;

  inherit (callBPPackage "frameworks/base/core/tests/hosttests/test-apps/SharedUid/dual/jni" ./frameworks_base_core_tests_hosttests_test-apps_SharedUid_dual_jni.nix {})
    libpmtestdual;

  inherit (callBPPackage "frameworks/base/core/tests/mockingcoretests" ./frameworks_base_core_tests_mockingcoretests.nix {})
    FrameworksMockingCoreTests;

  inherit (callBPPackage "frameworks/base/core/tests/screenshothelpertests" ./frameworks_base_core_tests_screenshothelpertests.nix {})
    ScreenshotHelperTests;

  inherit (callBPPackage "frameworks/base/core/tests/utillib" ./frameworks_base_core_tests_utillib.nix {})
    frameworks-core-util-lib;

  inherit (callBPPackage "frameworks/base/core/tests/utiltests/jni" ./frameworks_base_core_tests_utiltests_jni.nix {})
    libmemoryintarraytest;

  inherit (callBPPackage "frameworks/base/core/xsd" ./frameworks_base_core_xsd.nix {})
    permission;

  inherit (callBPPackage "frameworks/base/core/xsd/vts" ./frameworks_base_core_xsd_vts.nix {})
    vts_permission_validate_test;

  inherit (callBPPackage "frameworks/base/data/etc" ./frameworks_base_data_etc.nix {})
    "com.android.timezone.updater.xml" "framework-sysconfig.xml" "hiddenapi-package-whitelist.xml" "platform.xml" "privapp-permissions-platform.xml" "privapp_whitelist_com.android.carrierconfig" "privapp_whitelist_com.android.contacts" "privapp_whitelist_com.android.dialer" "privapp_whitelist_com.android.documentsui" "privapp_whitelist_com.android.emergency" "privapp_whitelist_com.android.launcher3" "privapp_whitelist_com.android.provision" "privapp_whitelist_com.android.settings" "privapp_whitelist_com.android.settings.intelligence" "privapp_whitelist_com.android.storagemanager" "privapp_whitelist_com.android.systemui";

  inherit (callBPPackage "frameworks/base/data/etc/car" ./frameworks_base_data_etc_car.nix {})
    "privapp_whitelist_android.car.cluster" "privapp_whitelist_android.car.cluster.loggingrenderer" "privapp_whitelist_android.car.cluster.sample" "privapp_whitelist_android.car.usb.handler" "privapp_whitelist_com.android.car" "privapp_whitelist_com.android.car.carlauncher" "privapp_whitelist_com.android.car.developeroptions" "privapp_whitelist_com.android.car.dialer" "privapp_whitelist_com.android.car.hvac" "privapp_whitelist_com.android.car.media" "privapp_whitelist_com.android.car.notification" "privapp_whitelist_com.android.car.radio" "privapp_whitelist_com.android.car.settings" "privapp_whitelist_com.android.car.themeplayground" "privapp_whitelist_com.android.car.trust" "privapp_whitelist_com.google.android.car.kitchensink";

  inherit (callBPPackage "frameworks/base/drm/jni" ./frameworks_base_drm_jni.nix {})
    libdrmframework_jni;

  inherit (callBPPackage "frameworks/base/graphics/proto" ./frameworks_base_graphics_proto.nix {})
    game-driver-protos;

  inherit (callBPPackage "frameworks/base/keystore/tests" ./frameworks_base_keystore_tests.nix {})
    KeystoreTests;

  inherit (callBPPackage "frameworks/base/libs/androidfw" ./frameworks_base_libs_androidfw.nix {})
    libandroidfw libandroidfw_benchmarks libandroidfw_defaults libandroidfw_tests;

  inherit (callBPPackage "frameworks/base/libs/hwui" ./frameworks_base_libs_hwui.nix {})
    hwui_bugreport_font_cache_usage hwui_compile_for_perf hwui_debug hwui_defaults hwui_enable_opengl_validation hwui_lto hwui_pgo hwui_static_deps hwui_test_defaults hwui_unit_tests hwuimacro hwuimicro libhwui libhwui_defaults libhwui_static_debug pgo-targets-hwui;

  inherit (callBPPackage "frameworks/base/libs/incident" ./frameworks_base_libs_incident.nix {})
    libincident;

  inherit (callBPPackage "frameworks/base/libs/input" ./frameworks_base_libs_input.nix {})
    libinputservice;

  inherit (callBPPackage "frameworks/base/libs/protoutil" ./frameworks_base_libs_protoutil.nix {})
    libprotoutil libprotoutil_defaults libprotoutil_test;

  inherit (callBPPackage "frameworks/base/libs/services" ./frameworks_base_libs_services.nix {})
    libservices;

  inherit (callBPPackage "frameworks/base/libs/storage" ./frameworks_base_libs_storage.nix {})
    libstorage;

  inherit (callBPPackage "frameworks/base/libs/usb" ./frameworks_base_libs_usb.nix {})
    "com.android.future.usb.accessory";

  inherit (callBPPackage "frameworks/base/libs/usb/tests/AccessoryChat/accessorychat" ./frameworks_base_libs_usb_tests_AccessoryChat_accessorychat.nix {})
    accessorychat;

  inherit (callBPPackage "frameworks/base/libs/usb/tests/accessorytest" ./frameworks_base_libs_usb_tests_accessorytest.nix {})
    accessorytest;

  inherit (callBPPackage "frameworks/base/location/lib" ./frameworks_base_location_lib.nix {})
    "com.android.location.provider";

  inherit (callBPPackage "frameworks/base/location/tests/locationtests" ./frameworks_base_location_tests_locationtests.nix {})
    FrameworksLocationTests;

  inherit (callBPPackage "frameworks/base/media" ./frameworks_base_media.nix {})
    framework_media_annotation mediaplayer2-srcs mediasession2-srcs mediasession2-srcs-without-aidls updatable-media updatable-media-srcs updatable-media-srcs-without-aidls updatable-media-stubs updatable_media_stubs;

  inherit (callBPPackage "frameworks/base/media/java" ./frameworks_base_media_java.nix {})
    "IMidiDeviceServer.aidl";

  inherit (callBPPackage "frameworks/base/media/jni" ./frameworks_base_media_jni.nix {})
    libmedia2_jni libmedia_jni libmedia_jni_utils;

  inherit (callBPPackage "frameworks/base/media/jni/audioeffect" ./frameworks_base_media_jni_audioeffect.nix {})
    libaudioeffect_jni;

  inherit (callBPPackage "frameworks/base/media/jni/soundpool" ./frameworks_base_media_jni_soundpool.nix {})
    libsoundpool;

  inherit (callBPPackage "frameworks/base/media/lib/remotedisplay" ./frameworks_base_media_lib_remotedisplay.nix {})
    "com.android.media.remotedisplay";

  inherit (callBPPackage "frameworks/base/media/lib/signer" ./frameworks_base_media_lib_signer.nix {})
    "com.android.mediadrm.signer";

  inherit (callBPPackage "frameworks/base/media/lib/tvremote" ./frameworks_base_media_lib_tvremote.nix {})
    "com.android.media.tv.remoteprovider";

  inherit (callBPPackage "frameworks/base/media/mca/filterfw" ./frameworks_base_media_mca_filterfw.nix {})
    libfilterfw libfilterfw_jni;

  inherit (callBPPackage "frameworks/base/media/mca/filterfw/native" ./frameworks_base_media_mca_filterfw_native.nix {})
    libfilterfw_native;

  inherit (callBPPackage "frameworks/base/media/mca/filterpacks" ./frameworks_base_media_mca_filterpacks.nix {})
    libfilterpack_base libfilterpack_imageproc;

  inherit (callBPPackage "frameworks/base/media/mca/samples/CameraEffectsRecordingSample" ./frameworks_base_media_mca_samples_CameraEffectsRecordingSample.nix {})
    CameraEffectsRecordingSample;

  inherit (callBPPackage "frameworks/base/media/mca/tests" ./frameworks_base_media_mca_tests.nix {})
    CameraEffectsTests;

  inherit (callBPPackage "frameworks/base/media/native/midi" ./frameworks_base_media_native_midi.nix {})
    libamidi;

  inherit (callBPPackage "frameworks/base/media/packages/BluetoothMidiService" ./frameworks_base_media_packages_BluetoothMidiService.nix {})
    BluetoothMidiService;

  inherit (callBPPackage "frameworks/base/media/proto" ./frameworks_base_media_proto.nix {})
    libmediaplayer2-protos mediaplayer2-protos;

  inherit (callBPPackage "frameworks/base/media/tests/CameraBrowser" ./frameworks_base_media_tests_CameraBrowser.nix {})
    CameraBrowser;

  inherit (callBPPackage "frameworks/base/media/tests/EffectsTest" ./frameworks_base_media_tests_EffectsTest.nix {})
    EffectsTest;

  inherit (callBPPackage "frameworks/base/media/tests/MediaDump" ./frameworks_base_media_tests_MediaDump.nix {})
    MediaDump;

  inherit (callBPPackage "frameworks/base/media/tests/MediaFrameworkTest" ./frameworks_base_media_tests_MediaFrameworkTest.nix {})
    mediaframeworktest;

  inherit (callBPPackage "frameworks/base/media/tests/MtpTests" ./frameworks_base_media_tests_MtpTests.nix {})
    MtpTests;

  inherit (callBPPackage "frameworks/base/media/tests/ScoAudioTest" ./frameworks_base_media_tests_ScoAudioTest.nix {})
    scoaudiotest;

  inherit (callBPPackage "frameworks/base/media/tests/SoundPoolTest" ./frameworks_base_media_tests_SoundPoolTest.nix {})
    SoundPoolTest;

  inherit (callBPPackage "frameworks/base/media/tests/audiotests" ./frameworks_base_media_tests_audiotests.nix {})
    shared_mem_test;

  inherit (callBPPackage "frameworks/base/media/tests/players" ./frameworks_base_media_tests_players.nix {})
    invoke_mock_media_player;

  inherit (callBPPackage "frameworks/base/native/android" ./frameworks_base_native_android.nix {})
    libandroid libandroid_defaults libandroid_net;

  inherit (callBPPackage "frameworks/base/native/graphics/jni" ./frameworks_base_native_graphics_jni.nix {})
    libjnigraphics;

  inherit (callBPPackage "frameworks/base/native/webview/loader" ./frameworks_base_native_webview_loader.nix {})
    libwebviewchromium_loader;

  inherit (callBPPackage "frameworks/base/native/webview/plat_support" ./frameworks_base_native_webview_plat_support.nix {})
    libwebviewchromium_plat_support;

  inherit (callBPPackage "frameworks/base/nfc-extras" ./frameworks_base_nfc-extras.nix {})
    "com.android.nfc_extras";

  inherit (callBPPackage "frameworks/base/obex" ./frameworks_base_obex.nix {})
    "javax.obex";

  inherit (callBPPackage "frameworks/base/packages/AppPredictionLib" ./frameworks_base_packages_AppPredictionLib.nix {})
    app_prediction;

  inherit (callBPPackage "frameworks/base/packages/BackupRestoreConfirmation" ./frameworks_base_packages_BackupRestoreConfirmation.nix {})
    BackupRestoreConfirmation;

  inherit (callBPPackage "frameworks/base/packages/CarSystemUI" ./frameworks_base_packages_CarSystemUI.nix {})
    CarSystemUI CarSystemUI-core;

  inherit (callBPPackage "frameworks/base/packages/CarrierDefaultApp" ./frameworks_base_packages_CarrierDefaultApp.nix {})
    CarrierDefaultApp;

  inherit (callBPPackage "frameworks/base/packages/CarrierDefaultApp/tests/unit" ./frameworks_base_packages_CarrierDefaultApp_tests_unit.nix {})
    CarrierDefaultAppUnitTests;

  inherit (callBPPackage "frameworks/base/packages/CompanionDeviceManager" ./frameworks_base_packages_CompanionDeviceManager.nix {})
    CompanionDeviceManager;

  inherit (callBPPackage "frameworks/base/packages/CtsShim/build/jni" ./frameworks_base_packages_CtsShim_build_jni.nix {})
    libshim_jni;

  inherit (callBPPackage "frameworks/base/packages/EasterEgg" ./frameworks_base_packages_EasterEgg.nix {})
    EasterEgg;

  inherit (callBPPackage "frameworks/base/packages/ExternalStorageProvider" ./frameworks_base_packages_ExternalStorageProvider.nix {})
    ExternalStorageProvider;

  inherit (callBPPackage "frameworks/base/packages/ExternalStorageProvider/tests" ./frameworks_base_packages_ExternalStorageProvider_tests.nix {})
    ExternalStorageProviderTests;

  inherit (callBPPackage "frameworks/base/packages/FakeOemFeatures" ./frameworks_base_packages_FakeOemFeatures.nix {})
    FakeOemFeatures;

  inherit (callBPPackage "frameworks/base/packages/FusedLocation" ./frameworks_base_packages_FusedLocation.nix {})
    FusedLocation;

  inherit (callBPPackage "frameworks/base/packages/LocalTransport" ./frameworks_base_packages_LocalTransport.nix {})
    LocalTransport;

  inherit (callBPPackage "frameworks/base/packages/OsuLogin" ./frameworks_base_packages_OsuLogin.nix {})
    OsuLogin;

  inherit (callBPPackage "frameworks/base/packages/PackageInstaller" ./frameworks_base_packages_PackageInstaller.nix {})
    PackageInstaller;

  inherit (callBPPackage "frameworks/base/packages/PrintSpooler" ./frameworks_base_packages_PrintSpooler.nix {})
    PrintSpooler;

  inherit (callBPPackage "frameworks/base/packages/PrintSpooler/jni" ./frameworks_base_packages_PrintSpooler_jni.nix {})
    libprintspooler_jni;

  inherit (callBPPackage "frameworks/base/packages/PrintSpooler/tests/outofprocess" ./frameworks_base_packages_PrintSpooler_tests_outofprocess.nix {})
    PrintSpoolerOutOfProcessTests;

  inherit (callBPPackage "frameworks/base/packages/SettingsLib/ActionBarShadow" ./frameworks_base_packages_SettingsLib_ActionBarShadow.nix {})
    SettingsLibActionBarShadow;

  inherit (callBPPackage "frameworks/base/packages/SettingsLib/ActionButtonsPreference" ./frameworks_base_packages_SettingsLib_ActionButtonsPreference.nix {})
    SettingsLibActionButtonsPreference;

  inherit (callBPPackage "frameworks/base/packages/SettingsLib/AdaptiveIcon" ./frameworks_base_packages_SettingsLib_AdaptiveIcon.nix {})
    SettingsLibAdaptiveIcon;

  inherit (callBPPackage "frameworks/base/packages/SettingsLib" ./frameworks_base_packages_SettingsLib.nix {})
    SettingsLib SettingsLibDefaults;

  inherit (callBPPackage "frameworks/base/packages/SettingsLib/AppPreference" ./frameworks_base_packages_SettingsLib_AppPreference.nix {})
    SettingsLibAppPreference;

  inherit (callBPPackage "frameworks/base/packages/SettingsLib/BarChartPreference" ./frameworks_base_packages_SettingsLib_BarChartPreference.nix {})
    SettingsLibBarChartPreference;

  inherit (callBPPackage "frameworks/base/packages/SettingsLib/EntityHeaderWidgets" ./frameworks_base_packages_SettingsLib_EntityHeaderWidgets.nix {})
    SettingsLibEntityHeaderWidgets;

  inherit (callBPPackage "frameworks/base/packages/SettingsLib/HelpUtils" ./frameworks_base_packages_SettingsLib_HelpUtils.nix {})
    SettingsLibHelpUtils;

  inherit (callBPPackage "frameworks/base/packages/SettingsLib/LayoutPreference" ./frameworks_base_packages_SettingsLib_LayoutPreference.nix {})
    SettingsLibLayoutPreference;

  inherit (callBPPackage "frameworks/base/packages/SettingsLib/ProgressBar" ./frameworks_base_packages_SettingsLib_ProgressBar.nix {})
    SettingsLibProgressBar;

  inherit (callBPPackage "frameworks/base/packages/SettingsLib/RestrictedLockUtils" ./frameworks_base_packages_SettingsLib_RestrictedLockUtils.nix {})
    SettingsLibRestrictedLockUtils;

  inherit (callBPPackage "frameworks/base/packages/SettingsLib/SearchWidget" ./frameworks_base_packages_SettingsLib_SearchWidget.nix {})
    SettingsLibSearchWidget;

  inherit (callBPPackage "frameworks/base/packages/SettingsLib/SettingsSpinner" ./frameworks_base_packages_SettingsLib_SettingsSpinner.nix {})
    SettingsLibSettingsSpinner;

  inherit (callBPPackage "frameworks/base/packages/SettingsLib/Tile" ./frameworks_base_packages_SettingsLib_Tile.nix {})
    SettingsLibTile;

  inherit (callBPPackage "frameworks/base/packages/SettingsProvider" ./frameworks_base_packages_SettingsProvider.nix {})
    SettingsProvider SettingsProviderTest;

  inherit (callBPPackage "frameworks/base/packages/SharedStorageBackup" ./frameworks_base_packages_SharedStorageBackup.nix {})
    SharedStorageBackup;

  inherit (callBPPackage "frameworks/base/packages/StatementService" ./frameworks_base_packages_StatementService.nix {})
    StatementService;

  inherit (callBPPackage "frameworks/base/packages/SystemUI" ./frameworks_base_packages_SystemUI.nix {})
    SystemUI SystemUI-core SystemUI-proto SystemUI-tags SystemUI-tests SystemUIWithLegacyRecents;

  inherit (callBPPackage "frameworks/base/packages/SystemUI/plugin" ./frameworks_base_packages_SystemUI_plugin.nix {})
    PluginDummyLib SystemUIPluginLib;

  inherit (callBPPackage "frameworks/base/packages/SystemUI/plugin/ExamplePlugin" ./frameworks_base_packages_SystemUI_plugin_ExamplePlugin.nix {})
    ExamplePlugin;

  inherit (callBPPackage "frameworks/base/packages/SystemUI/plugin_core" ./frameworks_base_packages_SystemUI_plugin_core.nix {})
    PluginCoreLib;

  inherit (callBPPackage "frameworks/base/packages/SystemUI/shared" ./frameworks_base_packages_SystemUI_shared.nix {})
    SystemUISharedLib;

  inherit (callBPPackage "frameworks/base/packages/VpnDialogs" ./frameworks_base_packages_VpnDialogs.nix {})
    VpnDialogs;

  inherit (callBPPackage "frameworks/base/packages/WAPPushManager" ./frameworks_base_packages_WAPPushManager.nix {})
    WAPPushManager;

  inherit (callBPPackage "frameworks/base/packages/WAPPushManager/tests" ./frameworks_base_packages_WAPPushManager_tests.nix {})
    WAPPushManagerTests;

  inherit (callBPPackage "frameworks/base/packages/WallpaperBackup" ./frameworks_base_packages_WallpaperBackup.nix {})
    WallpaperBackup;

  inherit (callBPPackage "frameworks/base/packages/WallpaperCropper" ./frameworks_base_packages_WallpaperCropper.nix {})
    WallpaperCropper;

  inherit (callBPPackage "frameworks/base/packages/services/PacProcessor" ./frameworks_base_packages_services_PacProcessor.nix {})
    PacProcessor;

  inherit (callBPPackage "frameworks/base/packages/services/PacProcessor/jni" ./frameworks_base_packages_services_PacProcessor_jni.nix {})
    libjni_pacprocessor;

  inherit (callBPPackage "frameworks/base/packages/services/Proxy" ./frameworks_base_packages_services_Proxy.nix {})
    ProxyHandler;

  inherit (callBPPackage "frameworks/base/proto" ./frameworks_base_proto.nix {})
    framework-protos metrics-constants-protos;

  inherit (callBPPackage "frameworks/base/sax/tests/saxtests" ./frameworks_base_sax_tests_saxtests.nix {})
    FrameworksSaxTests;

  inherit (callBPPackage "frameworks/base/services" ./frameworks_base_services.nix {})
    libandroid_servers services;

  inherit (callBPPackage "frameworks/base/services/accessibility" ./frameworks_base_services_accessibility.nix {})
    "services.accessibility";

  inherit (callBPPackage "frameworks/base/services/appprediction" ./frameworks_base_services_appprediction.nix {})
    "services.appprediction";

  inherit (callBPPackage "frameworks/base/services/appwidget" ./frameworks_base_services_appwidget.nix {})
    "services.appwidget";

  inherit (callBPPackage "frameworks/base/services/autofill" ./frameworks_base_services_autofill.nix {})
    "services.autofill";

  inherit (callBPPackage "frameworks/base/services/backup" ./frameworks_base_services_backup.nix {})
    "services.backup";

  inherit (callBPPackage "frameworks/base/services/companion" ./frameworks_base_services_companion.nix {})
    "services.companion";

  inherit (callBPPackage "frameworks/base/services/contentcapture" ./frameworks_base_services_contentcapture.nix {})
    "services.contentcapture";

  inherit (callBPPackage "frameworks/base/services/contentsuggestions" ./frameworks_base_services_contentsuggestions.nix {})
    "services.contentsuggestions";

  inherit (callBPPackage "frameworks/base/services/core" ./frameworks_base_services_core.nix {})
    "gps_debug.conf" "services.core" "services.core.priorityboosted" "services.core.unboosted";

  inherit (callBPPackage "frameworks/base/services/core/jni" ./frameworks_base_services_core_jni.nix {})
    "libservices.core" "libservices.core-libs" lib_networkStatsFactory_native;

  inherit (callBPPackage "frameworks/base/services/core/xsd" ./frameworks_base_services_core_xsd.nix {})
    default-permissions;

  inherit (callBPPackage "frameworks/base/services/core/xsd/vts" ./frameworks_base_services_core_xsd_vts.nix {})
    vts_defaultPermissions_validate_test;

  inherit (callBPPackage "frameworks/base/services/coverage" ./frameworks_base_services_coverage.nix {})
    "services.coverage";

  inherit (callBPPackage "frameworks/base/services/devicepolicy" ./frameworks_base_services_devicepolicy.nix {})
    "services.devicepolicy";

  inherit (callBPPackage "frameworks/base/services/midi" ./frameworks_base_services_midi.nix {})
    "services.midi";

  inherit (callBPPackage "frameworks/base/services/net" ./frameworks_base_services_net.nix {})
    "services.net" ipmemorystore-aidl-interfaces ipmemorystore-client networkstack-aidl-interfaces services-networkstack-shared-srcs;

  inherit (callBPPackage "frameworks/base/services/print" ./frameworks_base_services_print.nix {})
    "services.print";

  inherit (callBPPackage "frameworks/base/services/restrictions" ./frameworks_base_services_restrictions.nix {})
    "services.restrictions";

  inherit (callBPPackage "frameworks/base/services/startop" ./frameworks_base_services_startop.nix {})
    "services.startop";

  inherit (callBPPackage "frameworks/base/services/systemcaptions" ./frameworks_base_services_systemcaptions.nix {})
    "services.systemcaptions";

  inherit (callBPPackage "frameworks/base/services/tests/mockingservicestests" ./frameworks_base_services_tests_mockingservicestests.nix {})
    FrameworksMockingServicesTests;

  inherit (callBPPackage "frameworks/base/services/tests/rescueparty" ./frameworks_base_services_tests_rescueparty.nix {})
    log_rescueparty_reset_event_reported;

  inherit (callBPPackage "frameworks/base/services/tests/servicestests" ./frameworks_base_services_tests_servicestests.nix {})
    FrameworksServicesTests servicestests-SuspendTestApp-files servicestests-utils;

  inherit (callBPPackage "frameworks/base/services/tests/servicestests/aidl" ./frameworks_base_services_tests_servicestests_aidl.nix {})
    servicestests-aidl;

  inherit (callBPPackage "frameworks/base/services/tests/servicestests/test-apps/ConnTestApp" ./frameworks_base_services_tests_servicestests_test-apps_ConnTestApp.nix {})
    ConnTestApp;

  inherit (callBPPackage "frameworks/base/services/tests/servicestests/test-apps/JobTestApp" ./frameworks_base_services_tests_servicestests_test-apps_JobTestApp.nix {})
    JobTestApp;

  inherit (callBPPackage "frameworks/base/services/tests/servicestests/test-apps/SuspendTestApp" ./frameworks_base_services_tests_servicestests_test-apps_SuspendTestApp.nix {})
    SuspendTestApp;

  inherit (callBPPackage "frameworks/base/services/tests/shortcutmanagerutils" ./frameworks_base_services_tests_shortcutmanagerutils.nix {})
    ShortcutManagerTestUtils;

  inherit (callBPPackage "frameworks/base/services/tests/uiservicestests" ./frameworks_base_services_tests_uiservicestests.nix {})
    FrameworksUiServicesTests;

  inherit (callBPPackage "frameworks/base/services/tests/wmtests" ./frameworks_base_services_tests_wmtests.nix {})
    WmTests;

  inherit (callBPPackage "frameworks/base/services/usage" ./frameworks_base_services_usage.nix {})
    "services.usage";

  inherit (callBPPackage "frameworks/base/services/usb" ./frameworks_base_services_usb.nix {})
    "services.usb";

  inherit (callBPPackage "frameworks/base/services/voiceinteraction" ./frameworks_base_services_voiceinteraction.nix {})
    "services.voiceinteraction";

  inherit (callBPPackage "frameworks/base/startop/iorap" ./frameworks_base_startop_iorap.nix {})
    "services.startop.iorap";

  inherit (callBPPackage "frameworks/base/startop/iorap/tests" ./frameworks_base_startop_iorap_tests.nix {})
    libiorap-java-test-lib libiorap-java-tests;

  inherit (callBPPackage "frameworks/base/startop/view_compiler" ./frameworks_base_startop_view_compiler.nix {})
    dex_testcase_generator generate_dex_testcases libviewcompiler view-compiler-tests viewcompiler viewcompiler_defaults;

  inherit (callBPPackage "frameworks/base/startop/view_compiler/dex_builder_test" ./frameworks_base_startop_view_compiler_dex_builder_test.nix {})
    dex-builder-test generate_compiled_layout1 generate_compiled_layout2;

  inherit (callBPPackage "frameworks/base/test-base" ./frameworks_base_test-base.nix {})
    "android.test.base" "android.test.base-minus-junit" "android.test.base_static" "repackaged.android.test.base";

  inherit (callBPPackage "frameworks/base/test-base/hiddenapi" ./frameworks_base_test-base_hiddenapi.nix {})
    "android.test.base-hiddenapi";

  inherit (callBPPackage "frameworks/base/test-mock" ./frameworks_base_test-mock.nix {})
    "android.test.mock";

  inherit (callBPPackage "frameworks/base/test-runner" ./frameworks_base_test-runner.nix {})
    "android.test.runner" "android.test.runner-minus-junit" "repackaged.android.test.runner";

  inherit (callBPPackage "frameworks/base/test-runner/tests" ./frameworks_base_test-runner_tests.nix {})
    FrameworkTestRunnerTests;

  inherit (callBPPackage "frameworks/base/tests/AccessibilityEventsLogger" ./frameworks_base_tests_AccessibilityEventsLogger.nix {})
    AccessibilityEventsLogger;

  inherit (callBPPackage "frameworks/base/tests/AccessoryDisplay/common" ./frameworks_base_tests_AccessoryDisplay_common.nix {})
    AccessoryDisplayCommon;

  inherit (callBPPackage "frameworks/base/tests/AccessoryDisplay/sink" ./frameworks_base_tests_AccessoryDisplay_sink.nix {})
    AccessoryDisplaySink;

  inherit (callBPPackage "frameworks/base/tests/AccessoryDisplay/source" ./frameworks_base_tests_AccessoryDisplay_source.nix {})
    AccessoryDisplaySource;

  inherit (callBPPackage "frameworks/base/tests/ActivityManagerPerfTests/test-app" ./frameworks_base_tests_ActivityManagerPerfTests_test-app.nix {})
    ActivityManagerPerfTestsTestApp;

  inherit (callBPPackage "frameworks/base/tests/ActivityManagerPerfTests/tests" ./frameworks_base_tests_ActivityManagerPerfTests_tests.nix {})
    ActivityManagerPerfTests;

  inherit (callBPPackage "frameworks/base/tests/ActivityManagerPerfTests/utils" ./frameworks_base_tests_ActivityManagerPerfTests_utils.nix {})
    ActivityManagerPerfTestsUtils;

  inherit (callBPPackage "frameworks/base/tests/ActivityTests" ./frameworks_base_tests_ActivityTests.nix {})
    ActivityTest;

  inherit (callBPPackage "frameworks/base/tests/ActivityViewTest" ./frameworks_base_tests_ActivityViewTest.nix {})
    ActivityViewTest;

  inherit (callBPPackage "frameworks/base/tests/AmSlam" ./frameworks_base_tests_AmSlam.nix {})
    AmSlam;

  inherit (callBPPackage "frameworks/base/tests/AppLaunch" ./frameworks_base_tests_AppLaunch.nix {})
    AppLaunch;

  inherit (callBPPackage "frameworks/base/tests/AppLaunchWear" ./frameworks_base_tests_AppLaunchWear.nix {})
    AppLaunchWear;

  inherit (callBPPackage "frameworks/base/tests/Assist" ./frameworks_base_tests_Assist.nix {})
    Assist;

  inherit (callBPPackage "frameworks/base/tests/BackgroundDexOptServiceIntegrationTests" ./frameworks_base_tests_BackgroundDexOptServiceIntegrationTests.nix {})
    BackgroundDexOptServiceIntegrationTests;

  inherit (callBPPackage "frameworks/base/tests/BandwidthTests" ./frameworks_base_tests_BandwidthTests.nix {})
    BandwidthEnforcementTest;

  inherit (callBPPackage "frameworks/base/tests/BatteryWaster" ./frameworks_base_tests_BatteryWaster.nix {})
    BatteryWaster;

  inherit (callBPPackage "frameworks/base/tests/BiDiTests" ./frameworks_base_tests_BiDiTests.nix {})
    BiDiTests;

  inherit (callBPPackage "frameworks/base/tests/BrowserPowerTest" ./frameworks_base_tests_BrowserPowerTest.nix {})
    BrowserPowerTests;

  inherit (callBPPackage "frameworks/base/tests/Camera2Tests/SmartCamera/SimpleCamera/jni" ./frameworks_base_tests_Camera2Tests_SmartCamera_SimpleCamera_jni.nix {})
    libsmartcamera_jni;

  inherit (callBPPackage "frameworks/base/tests/CameraPrewarmTest" ./frameworks_base_tests_CameraPrewarmTest.nix {})
    CameraPrewarmTest;

  inherit (callBPPackage "frameworks/base/tests/Compatibility" ./frameworks_base_tests_Compatibility.nix {})
    AppCompatibilityTest;

  inherit (callBPPackage "frameworks/base/tests/CoreTests/android" ./frameworks_base_tests_CoreTests_android.nix {})
    LegacyCoreTests;

  inherit (callBPPackage "frameworks/base/tests/DataIdleTest" ./frameworks_base_tests_DataIdleTest.nix {})
    DataIdleTest;

  inherit (callBPPackage "frameworks/base/tests/DozeTest" ./frameworks_base_tests_DozeTest.nix {})
    DozeTest;

  inherit (callBPPackage "frameworks/base/tests/DpiTest" ./frameworks_base_tests_DpiTest.nix {})
    DensityTest;

  inherit (callBPPackage "frameworks/base/tests/FeatureSplit/base" ./frameworks_base_tests_FeatureSplit_base.nix {})
    FeatureSplitBase;

  inherit (callBPPackage "frameworks/base/tests/FeatureSplit/feature1" ./frameworks_base_tests_FeatureSplit_feature1.nix {})
    FeatureSplit1;

  inherit (callBPPackage "frameworks/base/tests/FeatureSplit/feature2" ./frameworks_base_tests_FeatureSplit_feature2.nix {})
    FeatureSplit2;

  inherit (callBPPackage "frameworks/base/tests/FixVibrateSetting" ./frameworks_base_tests_FixVibrateSetting.nix {})
    FixVibrateSetting;

  inherit (callBPPackage "frameworks/base/tests/FlickerTests" ./frameworks_base_tests_FlickerTests.nix {})
    FlickerTests;

  inherit (callBPPackage "frameworks/base/tests/FlickerTests/lib" ./frameworks_base_tests_FlickerTests_lib.nix {})
    flickerautomationhelperlib flickerlib;

  inherit (callBPPackage "frameworks/base/tests/FlickerTests/lib/test" ./frameworks_base_tests_FlickerTests_lib_test.nix {})
    FlickerLibTest;

  inherit (callBPPackage "frameworks/base/tests/FlickerTests/test-apps/flickerapp" ./frameworks_base_tests_FlickerTests_test-apps_flickerapp.nix {})
    FlickerTestApp flickertestapplib;

  inherit (callBPPackage "frameworks/base/tests/FrameworkPerf" ./frameworks_base_tests_FrameworkPerf.nix {})
    FrameworkPerf;

  inherit (callBPPackage "frameworks/base/tests/GridLayoutTest" ./frameworks_base_tests_GridLayoutTest.nix {})
    GridLayoutTest;

  inherit (callBPPackage "frameworks/base/tests/HierarchyViewerTest" ./frameworks_base_tests_HierarchyViewerTest.nix {})
    HierarchyViewerTest;

  inherit (callBPPackage "frameworks/base/tests/HugeBackup" ./frameworks_base_tests_HugeBackup.nix {})
    HugeBackup;

  inherit (callBPPackage "frameworks/base/tests/HwAccelerationTest" ./frameworks_base_tests_HwAccelerationTest.nix {})
    HwAccelerationTest;

  inherit (callBPPackage "frameworks/base/tests/Internal" ./frameworks_base_tests_Internal.nix {})
    InternalTests;

  inherit (callBPPackage "frameworks/base/tests/JankBench" ./frameworks_base_tests_JankBench.nix {})
    JankBench;

  inherit (callBPPackage "frameworks/base/tests/JobSchedulerTestApp" ./frameworks_base_tests_JobSchedulerTestApp.nix {})
    JobSchedulerTestApp;

  inherit (callBPPackage "frameworks/base/tests/LargeAssetTest" ./frameworks_base_tests_LargeAssetTest.nix {})
    LargeAssetTest;

  inherit (callBPPackage "frameworks/base/tests/LegacyAssistant" ./frameworks_base_tests_LegacyAssistant.nix {})
    LegacyAssistant;

  inherit (callBPPackage "frameworks/base/tests/LocationTracker" ./frameworks_base_tests_LocationTracker.nix {})
    LocationTracker;

  inherit (callBPPackage "frameworks/base/tests/LotsOfApps" ./frameworks_base_tests_LotsOfApps.nix {})
    LotsOfApps;

  inherit (callBPPackage "frameworks/base/tests/LowStorageTest" ./frameworks_base_tests_LowStorageTest.nix {})
    lowstoragetest;

  inherit (callBPPackage "frameworks/base/tests/MemoryUsage" ./frameworks_base_tests_MemoryUsage.nix {})
    MemoryUsage;

  inherit (callBPPackage "frameworks/base/tests/NativeProcessesMemoryTest" ./frameworks_base_tests_NativeProcessesMemoryTest.nix {})
    native-processes-memory-test;

  inherit (callBPPackage "frameworks/base/tests/NetworkSecurityConfigTest" ./frameworks_base_tests_NetworkSecurityConfigTest.nix {})
    NetworkSecurityConfigTests;

  inherit (callBPPackage "frameworks/base/tests/OdmApps" ./frameworks_base_tests_OdmApps.nix {})
    OdmAppsTest;

  inherit (callBPPackage "frameworks/base/tests/OdmApps/app" ./frameworks_base_tests_OdmApps_app.nix {})
    TestOdmApp;

  inherit (callBPPackage "frameworks/base/tests/OdmApps/priv-app" ./frameworks_base_tests_OdmApps_priv-app.nix {})
    TestOdmPrivApp;

  inherit (callBPPackage "frameworks/base/tests/OneMedia" ./frameworks_base_tests_OneMedia.nix {})
    OneMedia;

  inherit (callBPPackage "frameworks/base/tests/PackageWatchdog" ./frameworks_base_tests_PackageWatchdog.nix {})
    PackageWatchdogTest;

  inherit (callBPPackage "frameworks/base/tests/RcsTests" ./frameworks_base_tests_RcsTests.nix {})
    RcsTests;

  inherit (callBPPackage "frameworks/base/tests/RemoteDisplayProvider" ./frameworks_base_tests_RemoteDisplayProvider.nix {})
    RemoteDisplayProviderTest;

  inherit (callBPPackage "frameworks/base/tests/RenderThreadTest" ./frameworks_base_tests_RenderThreadTest.nix {})
    RenderThreadTest;

  inherit (callBPPackage "frameworks/base/tests/RollbackTest" ./frameworks_base_tests_RollbackTest.nix {})
    RollbackTest RollbackTestAppACrashingV2 RollbackTestAppASplitV1 RollbackTestAppASplitV2 RollbackTestAppAv1 RollbackTestAppAv2 RollbackTestAppAv3 RollbackTestAppBv1 RollbackTestAppBv2 StagedRollbackTest;

  inherit (callBPPackage "frameworks/base/tests/SerialChat" ./frameworks_base_tests_SerialChat.nix {})
    SerialChat;

  inherit (callBPPackage "frameworks/base/tests/ServiceCrashTest" ./frameworks_base_tests_ServiceCrashTest.nix {})
    ServiceCrashTest;

  inherit (callBPPackage "frameworks/base/tests/SharedLibrary/client" ./frameworks_base_tests_SharedLibrary_client.nix {})
    SharedLibraryClient;

  inherit (callBPPackage "frameworks/base/tests/SharedLibrary/lib" ./frameworks_base_tests_SharedLibrary_lib.nix {})
    SharedLibrary;

  inherit (callBPPackage "frameworks/base/tests/ShowWhenLockedApp" ./frameworks_base_tests_ShowWhenLockedApp.nix {})
    ShowWhenLocked;

  inherit (callBPPackage "frameworks/base/tests/SmokeTest" ./frameworks_base_tests_SmokeTest.nix {})
    SmokeTestApp;

  inherit (callBPPackage "frameworks/base/tests/SmokeTest/tests" ./frameworks_base_tests_SmokeTest_tests.nix {})
    SmokeTest;

  inherit (callBPPackage "frameworks/base/tests/SmokeTestApps" ./frameworks_base_tests_SmokeTestApps.nix {})
    SmokeTestTriggerApps;

  inherit (callBPPackage "frameworks/base/tests/SoundTriggerTestApp" ./frameworks_base_tests_SoundTriggerTestApp.nix {})
    SoundTriggerTestApp;

  inherit (callBPPackage "frameworks/base/tests/Split" ./frameworks_base_tests_Split.nix {})
    Split;

  inherit (callBPPackage "frameworks/base/tests/StatusBar" ./frameworks_base_tests_StatusBar.nix {})
    StatusBarTest;

  inherit (callBPPackage "frameworks/base/tests/SurfaceComposition" ./frameworks_base_tests_SurfaceComposition.nix {})
    SurfaceComposition;

  inherit (callBPPackage "frameworks/base/tests/SystemMemoryTest/host" ./frameworks_base_tests_SystemMemoryTest_host.nix {})
    system-memory-test;

  inherit (callBPPackage "frameworks/base/tests/SystemUIDemoModeController" ./frameworks_base_tests_SystemUIDemoModeController.nix {})
    DemoModeController;

  inherit (callBPPackage "frameworks/base/tests/TouchLatency" ./frameworks_base_tests_TouchLatency.nix {})
    TouchLatency;

  inherit (callBPPackage "frameworks/base/tests/TransformTest" ./frameworks_base_tests_TransformTest.nix {})
    TransformTest;

  inherit (callBPPackage "frameworks/base/tests/TransitionTests" ./frameworks_base_tests_TransitionTests.nix {})
    TransitionTests;

  inherit (callBPPackage "frameworks/base/tests/TtsTests" ./frameworks_base_tests_TtsTests.nix {})
    TtsTests;

  inherit (callBPPackage "frameworks/base/tests/UiBench" ./frameworks_base_tests_UiBench.nix {})
    UiBench;

  inherit (callBPPackage "frameworks/base/tests/UsageReportingTest" ./frameworks_base_tests_UsageReportingTest.nix {})
    UsageReportingTest;

  inherit (callBPPackage "frameworks/base/tests/UsageStatsPerfTests" ./frameworks_base_tests_UsageStatsPerfTests.nix {})
    UsageStatsPerfTests;

  inherit (callBPPackage "frameworks/base/tests/UsageStatsTest" ./frameworks_base_tests_UsageStatsTest.nix {})
    UsageStatsTest;

  inherit (callBPPackage "frameworks/base/tests/UsbHostExternalManagmentTest/AoapTestDevice" ./frameworks_base_tests_UsbHostExternalManagmentTest_AoapTestDevice.nix {})
    AoapTestDeviceApp;

  inherit (callBPPackage "frameworks/base/tests/UsbHostExternalManagmentTest/AoapTestHost" ./frameworks_base_tests_UsbHostExternalManagmentTest_AoapTestHost.nix {})
    AoapTestHostApp;

  inherit (callBPPackage "frameworks/base/tests/UsbHostExternalManagmentTest/UsbHostExternalManagmentTestApp" ./frameworks_base_tests_UsbHostExternalManagmentTest_UsbHostExternalManagmentTestApp.nix {})
    UsbHostExternalManagementTestApp;

  inherit (callBPPackage "frameworks/base/tests/UsbTests" ./frameworks_base_tests_UsbTests.nix {})
    UsbTests;

  inherit (callBPPackage "frameworks/base/tests/UsesFeature2Test" ./frameworks_base_tests_UsesFeature2Test.nix {})
    UsesFeature2Test;

  inherit (callBPPackage "frameworks/base/tests/VectorDrawableTest" ./frameworks_base_tests_VectorDrawableTest.nix {})
    VectorDrawableTest;

  inherit (callBPPackage "frameworks/base/tests/VoiceEnrollment" ./frameworks_base_tests_VoiceEnrollment.nix {})
    VoiceEnrollment;

  inherit (callBPPackage "frameworks/base/tests/VoiceInteraction" ./frameworks_base_tests_VoiceInteraction.nix {})
    VoiceInteraction;

  inherit (callBPPackage "frameworks/base/tests/WallpaperTest" ./frameworks_base_tests_WallpaperTest.nix {})
    WallpaperTest;

  inherit (callBPPackage "frameworks/base/tests/WindowAnimationJank" ./frameworks_base_tests_WindowAnimationJank.nix {})
    WindowAnimationJank;

  inherit (callBPPackage "frameworks/base/tests/WindowManagerStressTest" ./frameworks_base_tests_WindowManagerStressTest.nix {})
    WindowManagerStressTest;

  inherit (callBPPackage "frameworks/base/tests/appwidgets/AppWidgetHostTest" ./frameworks_base_tests_appwidgets_AppWidgetHostTest.nix {})
    AppWidgetHostTest;

  inherit (callBPPackage "frameworks/base/tests/appwidgets/AppWidgetProviderTest" ./frameworks_base_tests_appwidgets_AppWidgetProviderTest.nix {})
    AppWidgetProvider;

  inherit (callBPPackage "frameworks/base/tests/benchmarks" ./frameworks_base_tests_benchmarks.nix {})
    networkStatsFactory-benchmarks;

  inherit (callBPPackage "frameworks/base/tests/libs-permissions" ./frameworks_base_tests_libs-permissions.nix {})
    "com.android.test.libs.product" "com.android.test.libs.product.xml" "com.android.test.libs.product_services" "com.android.test.libs.product_services.xml";

  inherit (callBPPackage "frameworks/base/tests/net" ./frameworks_base_tests_net.nix {})
    FrameworksNetTests FrameworksNetTests-jni-defaults;

  inherit (callBPPackage "frameworks/base/tests/net/common" ./frameworks_base_tests_net_common.nix {})
    FrameworksNetCommonTests;

  inherit (callBPPackage "frameworks/base/tests/net/jni" ./frameworks_base_tests_net_jni.nix {})
    libnetworkstatsfactorytestjni;

  inherit (callBPPackage "frameworks/base/tests/net/smoketest" ./frameworks_base_tests_net_smoketest.nix {})
    FrameworksNetSmokeTests;

  inherit (callBPPackage "frameworks/base/tests/net/util" ./frameworks_base_tests_net_util.nix {})
    frameworks-net-testutils;

  inherit (callBPPackage "frameworks/base/tests/notification" ./frameworks_base_tests_notification.nix {})
    NotificationTests;

  inherit (callBPPackage "frameworks/base/tests/permission" ./frameworks_base_tests_permission.nix {})
    FrameworkPermissionTests;

  inherit (callBPPackage "frameworks/base/tests/privapp-permissions" ./frameworks_base_tests_privapp-permissions.nix {})
    "privapp-permissions-test.xml" "product_servicesprivapp-permissions-test.xml" "productprivapp-permissions-test.xml" "vendorprivapp-permissions-test.xml" PrivAppPermissionTest ProductPrivAppPermissionTest ProductServicesPrivAppPermissionTest VendorPrivAppPermissionTest;

  inherit (callBPPackage "frameworks/base/tests/testables" ./frameworks_base_tests_testables.nix {})
    testables;

  inherit (callBPPackage "frameworks/base/tests/testables/tests" ./frameworks_base_tests_testables_tests.nix {})
    TestablesTests;

  inherit (callBPPackage "frameworks/base/tests/touchlag" ./frameworks_base_tests_touchlag.nix {})
    test-touchlag;

  inherit (callBPPackage "frameworks/base/tests/utils/DummyIME" ./frameworks_base_tests_utils_DummyIME.nix {})
    DummyIME;

  inherit (callBPPackage "frameworks/base/tests/utils/testutils" ./frameworks_base_tests_utils_testutils.nix {})
    frameworks-base-testutils;

  inherit (callBPPackage "frameworks/base/tools/aapt" ./frameworks_base_tools_aapt.nix {})
    aapt aapt_defaults libaapt libaapt_tests;

  inherit (callBPPackage "frameworks/base/tools/aapt2" ./frameworks_base_tools_aapt2.nix {})
    aapt2 aapt2-protos aapt2_defaults aapt2_tests libaapt2 libaapt2_jni;

  inherit (callBPPackage "frameworks/base/tools/aapt2/integration-tests/AutoVersionTest" ./frameworks_base_tools_aapt2_integration-tests_AutoVersionTest.nix {})
    AaptAutoVersionTest;

  inherit (callBPPackage "frameworks/base/tools/aapt2/integration-tests/BasicTest" ./frameworks_base_tools_aapt2_integration-tests_BasicTest.nix {})
    AaptBasicTest;

  inherit (callBPPackage "frameworks/base/tools/aapt2/integration-tests/StaticLibTest/App" ./frameworks_base_tools_aapt2_integration-tests_StaticLibTest_App.nix {})
    AaptTestStaticLib_App;

  inherit (callBPPackage "frameworks/base/tools/aapt2/integration-tests/StaticLibTest/LibOne" ./frameworks_base_tools_aapt2_integration-tests_StaticLibTest_LibOne.nix {})
    AaptTestStaticLib_LibOne;

  inherit (callBPPackage "frameworks/base/tools/aapt2/integration-tests/StaticLibTest/LibTwo" ./frameworks_base_tools_aapt2_integration-tests_StaticLibTest_LibTwo.nix {})
    AaptTestStaticLib_LibTwo;

  inherit (callBPPackage "frameworks/base/tools/aapt2/integration-tests/SymlinkTest" ./frameworks_base_tools_aapt2_integration-tests_SymlinkTest.nix {})
    AaptSymlinkTest;

  inherit (callBPPackage "frameworks/base/tools/bit" ./frameworks_base_tools_bit.nix {})
    bit;

  inherit (callBPPackage "frameworks/base/tools/dump-coverage" ./frameworks_base_tools_dump-coverage.nix {})
    libdumpcoverage;

  inherit (callBPPackage "frameworks/base/tools/incident_report" ./frameworks_base_tools_incident_report.nix {})
    incident_report;

  inherit (callBPPackage "frameworks/base/tools/incident_section_gen" ./frameworks_base_tools_incident_section_gen.nix {})
    incident-section-gen;

  inherit (callBPPackage "frameworks/base/tools/locked_region_code_injection" ./frameworks_base_tools_locked_region_code_injection.nix {})
    lockedregioncodeinjection;

  inherit (callBPPackage "frameworks/base/tools/obbtool" ./frameworks_base_tools_obbtool.nix {})
    obbtool pbkdf2gen;

  inherit (callBPPackage "frameworks/base/tools/powermodel" ./frameworks_base_tools_powermodel.nix {})
    powermodel powermodel-test;

  inherit (callBPPackage "frameworks/base/tools/preload" ./frameworks_base_tools_preload.nix {})
    preload;

  inherit (callBPPackage "frameworks/base/tools/preload/loadclass" ./frameworks_base_tools_preload_loadclass.nix {})
    loadclass;

  inherit (callBPPackage "frameworks/base/tools/processors/unsupportedappusage" ./frameworks_base_tools_processors_unsupportedappusage.nix {})
    unsupportedappusage-annotation-processor;

  inherit (callBPPackage "frameworks/base/tools/processors/view_inspector" ./frameworks_base_tools_processors_view_inspector.nix {})
    view-inspector-annotation-processor view-inspector-annotation-processor-test;

  inherit (callBPPackage "frameworks/base/tools/sdkparcelables" ./frameworks_base_tools_sdkparcelables.nix {})
    sdkparcelables sdkparcelables_test;

  inherit (callBPPackage "frameworks/base/tools/split-select" ./frameworks_base_tools_split-select.nix {})
    libsplit-select libsplit-select_tests split-select split-select_defaults;

  inherit (callBPPackage "frameworks/base/tools/stats_log_api_gen" ./frameworks_base_tools_stats_log_api_gen.nix {})
    "statslog.cpp" "statslog.h" libstatslog stats-log-api-gen stats-log-api-gen-test;

  inherit (callBPPackage "frameworks/base/tools/streaming_proto" ./frameworks_base_tools_streaming_proto.nix {})
    protoc-gen-cppstream protoc-gen-javastream protoc-gen-stream-defaults;

  inherit (callBPPackage "frameworks/base/tools/validatekeymaps" ./frameworks_base_tools_validatekeymaps.nix {})
    validatekeymaps;

  inherit (callBPPackage "frameworks/compile/libbcc" ./frameworks_compile_libbcc.nix {})
    libbcc-defaults libbcc-targets;

  inherit (callBPPackage "frameworks/compile/libbcc/bcinfo" ./frameworks_compile_libbcc_bcinfo.nix {})
    libbcinfo libbcinfo-headers;

  inherit (callBPPackage "frameworks/compile/libbcc/bcinfo/BitReader_2_7" ./frameworks_compile_libbcc_bcinfo_BitReader_2_7.nix {})
    libLLVMBitReader_2_7;

  inherit (callBPPackage "frameworks/compile/libbcc/bcinfo/BitReader_3_0" ./frameworks_compile_libbcc_bcinfo_BitReader_3_0.nix {})
    libLLVMBitReader_3_0;

  inherit (callBPPackage "frameworks/compile/libbcc/bcinfo/Wrap" ./frameworks_compile_libbcc_bcinfo_Wrap.nix {})
    libLLVMWrap;

  inherit (callBPPackage "frameworks/compile/libbcc/bcinfo/tools" ./frameworks_compile_libbcc_bcinfo_tools.nix {})
    bcinfo;

  inherit (callBPPackage "frameworks/compile/libbcc/lib" ./frameworks_compile_libbcc_lib.nix {})
    libbcc;

  inherit (callBPPackage "frameworks/compile/libbcc/tools/bcc" ./frameworks_compile_libbcc_tools_bcc.nix {})
    bcc libbcc_binary;

  inherit (callBPPackage "frameworks/compile/libbcc/tools/bcc_compat" ./frameworks_compile_libbcc_tools_bcc_compat.nix {})
    bcc_compat;

  inherit (callBPPackage "frameworks/compile/libbcc/tools/bcc_strip_attr" ./frameworks_compile_libbcc_tools_bcc_strip_attr.nix {})
    bcc_strip_attr;

  inherit (callBPPackage "frameworks/compile/mclinker" ./frameworks_compile_mclinker.nix {})
    mcld-defaults;

  inherit (callBPPackage "frameworks/compile/mclinker/lib/ADT" ./frameworks_compile_mclinker_lib_ADT.nix {})
    libmcldADT;

  inherit (callBPPackage "frameworks/compile/mclinker/lib/Core" ./frameworks_compile_mclinker_lib_Core.nix {})
    libmcldCore;

  inherit (callBPPackage "frameworks/compile/mclinker/lib/Fragment" ./frameworks_compile_mclinker_lib_Fragment.nix {})
    libmcldFragment;

  inherit (callBPPackage "frameworks/compile/mclinker/lib/LD" ./frameworks_compile_mclinker_lib_LD.nix {})
    libmcldLD libmcldLDVariant;

  inherit (callBPPackage "frameworks/compile/mclinker/lib/MC" ./frameworks_compile_mclinker_lib_MC.nix {})
    libmcldMC;

  inherit (callBPPackage "frameworks/compile/mclinker/lib/Object" ./frameworks_compile_mclinker_lib_Object.nix {})
    libmcldObject;

  inherit (callBPPackage "frameworks/compile/mclinker/lib/Script" ./frameworks_compile_mclinker_lib_Script.nix {})
    libmcldScript;

  inherit (callBPPackage "frameworks/compile/mclinker/lib/Support" ./frameworks_compile_mclinker_lib_Support.nix {})
    libmcldSupport;

  inherit (callBPPackage "frameworks/compile/mclinker/lib/Target/AArch64" ./frameworks_compile_mclinker_lib_Target_AArch64.nix {})
    libmcldAArch64Target;

  inherit (callBPPackage "frameworks/compile/mclinker/lib/Target/AArch64/TargetInfo" ./frameworks_compile_mclinker_lib_Target_AArch64_TargetInfo.nix {})
    libmcldAArch64Info;

  inherit (callBPPackage "frameworks/compile/mclinker/lib/Target/ARM" ./frameworks_compile_mclinker_lib_Target_ARM.nix {})
    libmcldARMTarget;

  inherit (callBPPackage "frameworks/compile/mclinker/lib/Target/ARM/TargetInfo" ./frameworks_compile_mclinker_lib_Target_ARM_TargetInfo.nix {})
    libmcldARMInfo;

  inherit (callBPPackage "frameworks/compile/mclinker/lib/Target" ./frameworks_compile_mclinker_lib_Target.nix {})
    libmcldTarget;

  inherit (callBPPackage "frameworks/compile/mclinker/lib/Target/Mips" ./frameworks_compile_mclinker_lib_Target_Mips.nix {})
    libmcldMipsTarget;

  inherit (callBPPackage "frameworks/compile/mclinker/lib/Target/Mips/TargetInfo" ./frameworks_compile_mclinker_lib_Target_Mips_TargetInfo.nix {})
    libmcldMipsInfo;

  inherit (callBPPackage "frameworks/compile/mclinker/lib/Target/X86" ./frameworks_compile_mclinker_lib_Target_X86.nix {})
    libmcldX86Target;

  inherit (callBPPackage "frameworks/compile/mclinker/lib/Target/X86/TargetInfo" ./frameworks_compile_mclinker_lib_Target_X86_TargetInfo.nix {})
    libmcldX86Info;

  inherit (callBPPackage "frameworks/compile/mclinker/tools/mcld" ./frameworks_compile_mclinker_tools_mcld.nix {})
    "ld.mc" mcld-gen-options;

  inherit (callBPPackage "frameworks/compile/slang" ./frameworks_compile_slang.nix {})
    libslang lld llvm-rs-as llvm-rs-cc rs-version slang-defaults slang-gen-options slang_headers;

  inherit (callBPPackage "frameworks/compile/slang/BitWriter_2_9" ./frameworks_compile_slang_BitWriter_2_9.nix {})
    libLLVMBitWriter_2_9;

  inherit (callBPPackage "frameworks/compile/slang/BitWriter_2_9_func" ./frameworks_compile_slang_BitWriter_2_9_func.nix {})
    libLLVMBitWriter_2_9_func;

  inherit (callBPPackage "frameworks/compile/slang/BitWriter_3_2" ./frameworks_compile_slang_BitWriter_3_2.nix {})
    libLLVMBitWriter_3_2;

  inherit (callBPPackage "frameworks/compile/slang/StripUnkAttr" ./frameworks_compile_slang_StripUnkAttr.nix {})
    libStripUnkAttr;

  inherit (callBPPackage "frameworks/ex/camera2/portability" ./frameworks_ex_camera2_portability.nix {})
    android-ex-camera2-portability;

  inherit (callBPPackage "frameworks/ex/camera2/portability/tests" ./frameworks_ex_camera2_portability_tests.nix {})
    android-ex-camera2-portability-tests;

  inherit (callBPPackage "frameworks/ex/camera2/public" ./frameworks_ex_camera2_public.nix {})
    android-ex-camera2;

  inherit (callBPPackage "frameworks/ex/camera2/utils" ./frameworks_ex_camera2_utils.nix {})
    android-ex-camera2-utils;

  inherit (callBPPackage "frameworks/ex/camera2/utils/tests" ./frameworks_ex_camera2_utils_tests.nix {})
    android-ex-camera2-utils-tests;

  inherit (callBPPackage "frameworks/ex/common" ./frameworks_ex_common.nix {})
    android-common;

  inherit (callBPPackage "frameworks/ex/common/tests" ./frameworks_ex_common_tests.nix {})
    AndroidCommonTests;

  inherit (callBPPackage "frameworks/ex/framesequence" ./frameworks_ex_framesequence.nix {})
    android-common-framesequence;

  inherit (callBPPackage "frameworks/ex/framesequence/jni" ./frameworks_ex_framesequence_jni.nix {})
    libframesequence;

  inherit (callBPPackage "frameworks/ex/framesequence/samples/FrameSequenceSamples" ./frameworks_ex_framesequence_samples_FrameSequenceSamples.nix {})
    FrameSequenceSample;

  inherit (callBPPackage "frameworks/minikin" ./frameworks_minikin.nix {})
    libminikin_headers;

  inherit (callBPPackage "frameworks/minikin/app" ./frameworks_minikin_app.nix {})
    hyphtool;

  inherit (callBPPackage "frameworks/minikin/libs/minikin" ./frameworks_minikin_libs_minikin.nix {})
    libminikin libminikin-headers-for-tests;

  inherit (callBPPackage "frameworks/minikin/tests" ./frameworks_minikin_tests.nix {})
    minikin-test-data;

  inherit (callBPPackage "frameworks/minikin/tests/perftests" ./frameworks_minikin_tests_perftests.nix {})
    minikin_perftests;

  inherit (callBPPackage "frameworks/minikin/tests/stresstest" ./frameworks_minikin_tests_stresstest.nix {})
    minikin_stress_tests;

  inherit (callBPPackage "frameworks/minikin/tests/unittest" ./frameworks_minikin_tests_unittest.nix {})
    minikin_tests;

  inherit (callBPPackage "frameworks/minikin/tests/util" ./frameworks_minikin_tests_util.nix {})
    libminikin-tests-util;

  inherit (callBPPackage "frameworks/ml/nn" ./frameworks_ml_nn.nix {})
    libneuralnetworks_generated_test_harness libneuralnetworks_generated_test_harness_headers libneuralnetworks_generated_tests neuralnetworks_defaults;

  inherit (callBPPackage "frameworks/ml/nn/common" ./frameworks_ml_nn_common.nix {})
    NeuralNetworksTest_operations NeuralNetworksTest_utils libneuralnetworks_common libneuralnetworks_common_headers libneuralnetworks_utils neuralnetworks_operations;

  inherit (callBPPackage "frameworks/ml/nn/common/random" ./frameworks_ml_nn_common_random.nix {})
    philox_random philox_random_headers;

  inherit (callBPPackage "frameworks/ml/nn/driver/cache" ./frameworks_ml_nn_driver_cache.nix {})
    ml_nn_cache_libs_defaults ml_nn_cache_libs_defaults_android_host;

  inherit (callBPPackage "frameworks/ml/nn/driver/cache/BlobCache" ./frameworks_ml_nn_driver_cache_BlobCache.nix {})
    BlobCache_test libBlobCache;

  inherit (callBPPackage "frameworks/ml/nn/driver/cache/nnCache" ./frameworks_ml_nn_driver_cache_nnCache.nix {})
    lib_nnCache nnCache_test;

  inherit (callBPPackage "frameworks/ml/nn/driver/sample" ./frameworks_ml_nn_driver_sample.nix {})
    "android.hardware.neuralnetworks@1.2-service-sample-all" "android.hardware.neuralnetworks@1.2-service-sample-float-fast" "android.hardware.neuralnetworks@1.2-service-sample-float-slow" "android.hardware.neuralnetworks@1.2-service-sample-minimal" "android.hardware.neuralnetworks@1.2-service-sample-quant" NeuralNetworksSampleDriver_defaults NeuralNetworksSampleDriver_server_defaults libSampleDriver;

  inherit (callBPPackage "frameworks/ml/nn/extensions/test_vendor/fibonacci" ./frameworks_ml_nn_extensions_test_vendor_fibonacci.nix {})
    neuralnetworks_test_vendor_fibonacci_extension;

  inherit (callBPPackage "frameworks/ml/nn/runtime" ./frameworks_ml_nn_runtime.nix {})
    libneuralnetworks libneuralnetworks_headers libneuralnetworks_private_headers;

  inherit (callBPPackage "frameworks/ml/nn/runtime/test" ./frameworks_ml_nn_runtime_test.nix {})
    NeuralNetworksTest_default_libs NeuralNetworksTest_defaults NeuralNetworksTest_mt_defaults NeuralNetworksTest_mt_static NeuralNetworksTest_mt_static_asan NeuralNetworksTest_shared_partial NeuralNetworksTest_static NeuralNetworksTest_static_asan NeuralNetworksTest_static_defaults NeuralNetworksTest_static_fuzzing NeuralNetworksTest_static_ubsan;

  inherit (callBPPackage "frameworks/ml/nn/tools/ion_watcher" ./frameworks_ml_nn_tools_ion_watcher.nix {})
    ion_watcher;

  inherit (callBPPackage "frameworks/multidex/instrumentation" ./frameworks_multidex_instrumentation.nix {})
    android-support-multidex-instrumentation android-support-multidex-instrumentation-version;

  inherit (callBPPackage "frameworks/multidex/library" ./frameworks_multidex_library.nix {})
    android-support-multidex android-support-multidex-version;

  inherit (callBPPackage "frameworks/native" ./frameworks_native.nix {})
    libandroid_sensor_headers;

  inherit (callBPPackage "frameworks/native/cmds/atrace" ./frameworks_native_cmds_atrace.nix {})
    atrace;

  inherit (callBPPackage "frameworks/native/cmds/bugreport" ./frameworks_native_cmds_bugreport.nix {})
    bugreport;

  inherit (callBPPackage "frameworks/native/cmds/bugreportz" ./frameworks_native_cmds_bugreportz.nix {})
    bugreportz bugreportz_test;

  inherit (callBPPackage "frameworks/native/cmds/cmd" ./frameworks_native_cmds_cmd.nix {})
    cmd libcmd;

  inherit (callBPPackage "frameworks/native/cmds/dumpstate" ./frameworks_native_cmds_dumpstate.nix {})
    dumpstate dumpstate_aidl dumpstate_cflag_defaults dumpstate_defaults dumpstate_smoke_test dumpstate_test dumpstate_test_fixture libdumpstateaidl libdumpstateutil;

  inherit (callBPPackage "frameworks/native/cmds/dumpsys" ./frameworks_native_cmds_dumpsys.nix {})
    dumpsys dumpsys_defaults dumpsys_vendor libdumpsys;

  inherit (callBPPackage "frameworks/native/cmds/dumpsys/tests" ./frameworks_native_cmds_dumpsys_tests.nix {})
    dumpsys_test;

  inherit (callBPPackage "frameworks/native/cmds/installd" ./frameworks_native_cmds_installd.nix {})
    "migrate_legacy_obb_data.sh" installd installd_aidl installd_defaults libinstalld libinstalld_headers libotapreoptparameters otapreopt otapreopt_chroot otapreopt_script otapreopt_slot;

  inherit (callBPPackage "frameworks/native/cmds/installd/art_helper" ./frameworks_native_cmds_installd_art_helper.nix {})
    libartimagevalues libartimagevalues_defaults;

  inherit (callBPPackage "frameworks/native/cmds/installd/tests" ./frameworks_native_cmds_installd_tests.nix {})
    installd_cache_test installd_dexopt_test installd_otapreopt_test installd_service_test installd_utils_test;

  inherit (callBPPackage "frameworks/native/cmds/lshal" ./frameworks_native_cmds_lshal.nix {})
    liblshal lshal lshal_defaults lshal_test;

  inherit (callBPPackage "frameworks/native/cmds/lshal/libprocpartition" ./frameworks_native_cmds_lshal_libprocpartition.nix {})
    libprocpartition;

  inherit (callBPPackage "frameworks/native/cmds/rawbu" ./frameworks_native_cmds_rawbu.nix {})
    rawbu;

  inherit (callBPPackage "frameworks/native/cmds/rss_hwm_reset" ./frameworks_native_cmds_rss_hwm_reset.nix {})
    rss_hwm_reset;

  inherit (callBPPackage "frameworks/native/cmds/service" ./frameworks_native_cmds_service.nix {})
    service vndservice;

  inherit (callBPPackage "frameworks/native/cmds/servicemanager" ./frameworks_native_cmds_servicemanager.nix {})
    bctest servicemanager servicemanager_flags vndservicemanager;

  inherit (callBPPackage "frameworks/native/cmds/surfacereplayer/proto" ./frameworks_native_cmds_surfacereplayer_proto.nix {})
    libtrace_proto;

  inherit (callBPPackage "frameworks/native/cmds/surfacereplayer/replayer" ./frameworks_native_cmds_surfacereplayer_replayer.nix {})
    libsurfacereplayer surfacereplayer;

  inherit (callBPPackage "frameworks/native/headers" ./frameworks_native_headers.nix {})
    media_plugin_headers;

  inherit (callBPPackage "frameworks/native/libs/android_runtime_lazy" ./frameworks_native_libs_android_runtime_lazy.nix {})
    libandroid_runtime_lazy;

  inherit (callBPPackage "frameworks/native/libs/arect" ./frameworks_native_libs_arect.nix {})
    libarect;

  inherit (callBPPackage "frameworks/native/libs/binder" ./frameworks_native_libs_binder.nix {})
    libbinder libbinder_aidl libbinder_headers;

  inherit (callBPPackage "frameworks/native/libs/binder/ndk" ./frameworks_native_libs_binder_ndk.nix {})
    libbinder_ndk;

  inherit (callBPPackage "frameworks/native/libs/binder/ndk/test" ./frameworks_native_libs_binder_ndk_test.nix {})
    libbinder_ndk_test_client libbinder_ndk_test_server test_libbinder_ndk_defaults test_libbinder_ndk_library test_libbinder_ndk_test_defaults;

  inherit (callBPPackage "frameworks/native/libs/binder/tests" ./frameworks_native_libs_binder_tests.nix {})
    binderDriverInterfaceTest binderDriverInterfaceTest_IPC_32 binderLibTest binderLibTest_IPC_32 binderSafeInterfaceTest binderTextOutputTest binderThroughputTest binderValueTypeTest binder_test_defaults schd-dbg;

  inherit (callBPPackage "frameworks/native/libs/binderthreadstate" ./frameworks_native_libs_binderthreadstate.nix {})
    libbinderthreadstate;

  inherit (callBPPackage "frameworks/native/libs/cputimeinstate" ./frameworks_native_libs_cputimeinstate.nix {})
    libtimeinstate libtimeinstate_test;

  inherit (callBPPackage "frameworks/native/libs/diskusage" ./frameworks_native_libs_diskusage.nix {})
    libdiskusage;

  inherit (callBPPackage "frameworks/native/libs/dumputils" ./frameworks_native_libs_dumputils.nix {})
    libdumputils;

  inherit (callBPPackage "frameworks/native/libs/graphicsenv" ./frameworks_native_libs_graphicsenv.nix {})
    libgraphicsenv;

  inherit (callBPPackage "frameworks/native/libs/gui" ./frameworks_native_libs_gui.nix {})
    libgui libgui_bufferqueue-defaults libgui_bufferqueue_static libgui_headers;

  inherit (callBPPackage "frameworks/native/libs/gui/tests" ./frameworks_native_libs_gui_tests.nix {})
    SamplingDemo SurfaceParcelable_test libgui_test;

  inherit (callBPPackage "frameworks/native/libs/incidentcompanion" ./frameworks_native_libs_incidentcompanion.nix {})
    incidentcompanion_aidl libincidentcompanion;

  inherit (callBPPackage "frameworks/native/libs/input" ./frameworks_native_libs_input.nix {})
    libinput;

  inherit (callBPPackage "frameworks/native/libs/input/tests" ./frameworks_native_libs_input_tests.nix {})
    StructLayout_test libinput_tests;

  inherit (callBPPackage "frameworks/native/libs/math" ./frameworks_native_libs_math.nix {})
    libmath;

  inherit (callBPPackage "frameworks/native/libs/math/tests" ./frameworks_native_libs_math_tests.nix {})
    half_test mat_test quat_test vec_test;

  inherit (callBPPackage "frameworks/native/libs/nativebase" ./frameworks_native_libs_nativebase.nix {})
    libnativebase_headers;

  inherit (callBPPackage "frameworks/native/libs/nativewindow" ./frameworks_native_libs_nativewindow.nix {})
    libnativewindow libnativewindow_headers;

  inherit (callBPPackage "frameworks/native/libs/nativewindow/tests" ./frameworks_native_libs_nativewindow_tests.nix {})
    AHardwareBufferTest;

  inherit (callBPPackage "frameworks/native/libs/renderengine" ./frameworks_native_libs_renderengine.nix {})
    librenderengine librenderengine_defaults librenderengine_gl_sources librenderengine_mocks librenderengine_sources renderengine_defaults;

  inherit (callBPPackage "frameworks/native/libs/renderengine/tests" ./frameworks_native_libs_renderengine_tests.nix {})
    librenderengine_test;

  inherit (callBPPackage "frameworks/native/libs/sensor" ./frameworks_native_libs_sensor.nix {})
    libsensor;

  inherit (callBPPackage "frameworks/native/libs/sensor/tests" ./frameworks_native_libs_sensor_tests.nix {})
    libsensor_test;

  inherit (callBPPackage "frameworks/native/libs/sensorprivacy" ./frameworks_native_libs_sensorprivacy.nix {})
    libsensorprivacy;

  inherit (callBPPackage "frameworks/native/libs/ui" ./frameworks_native_libs_ui.nix {})
    libui libui-validate-regions-defaults libui_headers;

  inherit (callBPPackage "frameworks/native/libs/ui/tests" ./frameworks_native_libs_ui_tests.nix {})
    BufferHub_test GraphicBufferAllocator_test GraphicBuffer_test Region_test Size_test colorspace_test;

  inherit (callBPPackage "frameworks/native/libs/ui/tools" ./frameworks_native_libs_ui_tools.nix {})
    libui_tools_default lutgen;

  inherit (callBPPackage "frameworks/native/libs/vibrator" ./frameworks_native_libs_vibrator.nix {})
    libvibrator;

  inherit (callBPPackage "frameworks/native/libs/vr/libbroadcastring" ./frameworks_native_libs_vr_libbroadcastring.nix {})
    broadcast_ring_tests libbroadcastring;

  inherit (callBPPackage "frameworks/native/libs/vr/libbufferhub" ./frameworks_native_libs_vr_libbufferhub.nix {})
    buffer_hub-test libbufferhub libbufferhub_headers;

  inherit (callBPPackage "frameworks/native/libs/vr/libbufferhubqueue" ./frameworks_native_libs_vr_libbufferhubqueue.nix {})
    libbufferhubqueue;

  inherit (callBPPackage "frameworks/native/libs/vr/libbufferhubqueue/benchmarks" ./frameworks_native_libs_vr_libbufferhubqueue_benchmarks.nix {})
    buffer_transport_benchmark;

  inherit (callBPPackage "frameworks/native/libs/vr/libbufferhubqueue/tests" ./frameworks_native_libs_vr_libbufferhubqueue_tests.nix {})
    buffer_hub_queue-test buffer_hub_queue_producer-test;

  inherit (callBPPackage "frameworks/native/libs/vr/libdisplay" ./frameworks_native_libs_vr_libdisplay.nix {})
    libdisplay;

  inherit (callBPPackage "frameworks/native/libs/vr/libdvr" ./frameworks_native_libs_vr_libdvr.nix {})
    "libdvr.google" "libdvr_static.google" libdvr_headers libdvr_private_headers;

  inherit (callBPPackage "frameworks/native/libs/vr/libdvr/tests" ./frameworks_native_libs_vr_libdvr_tests.nix {})
    dvr_api-test dvr_buffer_queue-test dvr_display-test;

  inherit (callBPPackage "frameworks/native/libs/vr/libdvrcommon" ./frameworks_native_libs_vr_libdvrcommon.nix {})
    libdvrcommon libdvrcommon_test;

  inherit (callBPPackage "frameworks/native/libs/vr/libpdx" ./frameworks_native_libs_vr_libpdx.nix {})
    libpdx libpdx_headers pdx_encoder_performance_test pdx_tests;

  inherit (callBPPackage "frameworks/native/libs/vr/libpdx_default_transport" ./frameworks_native_libs_vr_libpdx_default_transport.nix {})
    libpdx_default_transport pdx_benchmarks pdx_default_transport_compiler_defaults pdx_default_transport_lib_defaults pdx_tool pdx_use_transport_servicefs pdx_use_transport_uds;

  inherit (callBPPackage "frameworks/native/libs/vr/libpdx_uds" ./frameworks_native_libs_vr_libpdx_uds.nix {})
    libpdx_uds libpdx_uds_tests;

  inherit (callBPPackage "frameworks/native/libs/vr/libperformance" ./frameworks_native_libs_vr_libperformance.nix {})
    libperformance;

  inherit (callBPPackage "frameworks/native/libs/vr/libvr_manager" ./frameworks_native_libs_vr_libvr_manager.nix {})
    libvr_manager;

  inherit (callBPPackage "frameworks/native/libs/vr/libvrflinger" ./frameworks_native_libs_vr_libvrflinger.nix {})
    libvrflinger;

  inherit (callBPPackage "frameworks/native/libs/vr/libvrflinger/tests" ./frameworks_native_libs_vr_libvrflinger_tests.nix {})
    vrflinger_test;

  inherit (callBPPackage "frameworks/native/libs/vr/libvrsensor" ./frameworks_native_libs_vr_libvrsensor.nix {})
    libvrsensor;

  inherit (callBPPackage "frameworks/native/opengl" ./frameworks_native_opengl.nix {})
    gl_headers;

  inherit (callBPPackage "frameworks/native/opengl/libagl" ./frameworks_native_opengl_libagl.nix {})
    libGLES_android libGLES_android_arm libGLES_android_defaults;

  inherit (callBPPackage "frameworks/native/opengl/libs" ./frameworks_native_opengl_libs.nix {})
    egl_libs_defaults gl_libs_defaults gles_libs_defaults libEGL libEGL_blobCache libEGL_getProcAddress libEGL_test libETC1 libGLESv1_CM libGLESv2 libGLESv3;

  inherit (callBPPackage "frameworks/native/opengl/tests/EGLTest" ./frameworks_native_opengl_tests_EGLTest.nix {})
    EGL_test;

  inherit (callBPPackage "frameworks/native/opengl/tests/angeles" ./frameworks_native_opengl_tests_angeles.nix {})
    angeles;

  inherit (callBPPackage "frameworks/native/opengl/tests/configdump" ./frameworks_native_opengl_tests_configdump.nix {})
    test-opengl-configdump;

  inherit (callBPPackage "frameworks/native/opengl/tests/fillrate" ./frameworks_native_opengl_tests_fillrate.nix {})
    test-opengl-fillrate;

  inherit (callBPPackage "frameworks/native/opengl/tests/filter" ./frameworks_native_opengl_tests_filter.nix {})
    test-opengl-filter;

  inherit (callBPPackage "frameworks/native/opengl/tests/finish" ./frameworks_native_opengl_tests_finish.nix {})
    test-opengl-finish;

  inherit (callBPPackage "frameworks/native/opengl/tests/gl2_basic" ./frameworks_native_opengl_tests_gl2_basic.nix {})
    test-opengl-gl2_basic;

  inherit (callBPPackage "frameworks/native/opengl/tests/gl2_cameraeye" ./frameworks_native_opengl_tests_gl2_cameraeye.nix {})
    GL2CameraEye;

  inherit (callBPPackage "frameworks/native/opengl/tests/gl2_copyTexImage" ./frameworks_native_opengl_tests_gl2_copyTexImage.nix {})
    test-opengl-gl2_copyTexImage;

  inherit (callBPPackage "frameworks/native/opengl/tests/gl2_java" ./frameworks_native_opengl_tests_gl2_java.nix {})
    GL2Java;

  inherit (callBPPackage "frameworks/native/opengl/tests/gl2_jni" ./frameworks_native_opengl_tests_gl2_jni.nix {})
    GL2JNI libgl2jni;

  inherit (callBPPackage "frameworks/native/opengl/tests/gl2_yuvtex" ./frameworks_native_opengl_tests_gl2_yuvtex.nix {})
    test-opengl-gl2_yuvtex;

  inherit (callBPPackage "frameworks/native/opengl/tests/gl_basic" ./frameworks_native_opengl_tests_gl_basic.nix {})
    test-opengl-gl_basic;

  inherit (callBPPackage "frameworks/native/opengl/tests/gl_jni" ./frameworks_native_opengl_tests_gl_jni.nix {})
    GLJNI libgljni;

  inherit (callBPPackage "frameworks/native/opengl/tests/gl_perf" ./frameworks_native_opengl_tests_gl_perf.nix {})
    test-opengl-gl2_perf;

  inherit (callBPPackage "frameworks/native/opengl/tests/gl_perfapp" ./frameworks_native_opengl_tests_gl_perfapp.nix {})
    GLPerf libglperf;

  inherit (callBPPackage "frameworks/native/opengl/tests/gl_yuvtex" ./frameworks_native_opengl_tests_gl_yuvtex.nix {})
    test-opengl-gl_yuvtex;

  inherit (callBPPackage "frameworks/native/opengl/tests/gldual" ./frameworks_native_opengl_tests_gldual.nix {})
    GLDual libgldualjni;

  inherit (callBPPackage "frameworks/native/opengl/tests/gralloc" ./frameworks_native_opengl_tests_gralloc.nix {})
    test-opengl-gralloc;

  inherit (callBPPackage "frameworks/native/opengl/tests/hwc" ./frameworks_native_opengl_tests_hwc.nix {})
    hwcColorEquiv hwcCommit hwcRects hwcStress hwc_lib_defaults hwc_tests_defaults libhwcTest;

  inherit (callBPPackage "frameworks/native/opengl/tests/lib" ./frameworks_native_opengl_tests_lib.nix {})
    libglTest;

  inherit (callBPPackage "frameworks/native/opengl/tests/lighting1709" ./frameworks_native_opengl_tests_lighting1709.nix {})
    LightingTest;

  inherit (callBPPackage "frameworks/native/opengl/tests/linetex" ./frameworks_native_opengl_tests_linetex.nix {})
    test-opengl-linetex;

  inherit (callBPPackage "frameworks/native/opengl/tests/swapinterval" ./frameworks_native_opengl_tests_swapinterval.nix {})
    test-opengl-swapinterval;

  inherit (callBPPackage "frameworks/native/opengl/tests/testFramerate" ./frameworks_native_opengl_tests_testFramerate.nix {})
    TestFramerate;

  inherit (callBPPackage "frameworks/native/opengl/tests/testLatency" ./frameworks_native_opengl_tests_testLatency.nix {})
    TestLatency;

  inherit (callBPPackage "frameworks/native/opengl/tests/testPauseResume" ./frameworks_native_opengl_tests_testPauseResume.nix {})
    TestEGL;

  inherit (callBPPackage "frameworks/native/opengl/tests/testViewport" ./frameworks_native_opengl_tests_testViewport.nix {})
    TestViewport;

  inherit (callBPPackage "frameworks/native/opengl/tests/textures" ./frameworks_native_opengl_tests_textures.nix {})
    test-opengl-textures;

  inherit (callBPPackage "frameworks/native/opengl/tests/tritex" ./frameworks_native_opengl_tests_tritex.nix {})
    test-opengl-tritex;

  inherit (callBPPackage "frameworks/native/services/audiomanager" ./frameworks_native_services_audiomanager.nix {})
    libaudiomanager;

  inherit (callBPPackage "frameworks/native/services/batteryservice" ./frameworks_native_services_batteryservice.nix {})
    libbatteryservice_headers;

  inherit (callBPPackage "frameworks/native/services/bufferhub" ./frameworks_native_services_bufferhub.nix {})
    "android.frameworks.bufferhub@1.0-service" libbufferhubservice;

  inherit (callBPPackage "frameworks/native/services/bufferhub/tests" ./frameworks_native_services_bufferhub_tests.nix {})
    BufferHubServer_test;

  inherit (callBPPackage "frameworks/native/services/displayservice" ./frameworks_native_services_displayservice.nix {})
    libdisplayservicehidl;

  inherit (callBPPackage "frameworks/native/services/gpuservice" ./frameworks_native_services_gpuservice.nix {})
    gpuservice gpuservice_binary gpuservice_binary_sources gpuservice_defaults gpuservice_production_defaults gpuservice_sources;

  inherit (callBPPackage "frameworks/native/services/inputflinger" ./frameworks_native_services_inputflinger.nix {})
    inputflinger_defaults libinputflinger libinputflinger_base libinputflinger_headers libinputreader libinputreporter;

  inherit (callBPPackage "frameworks/native/services/inputflinger/host" ./frameworks_native_services_inputflinger_host.nix {})
    inputflinger libinputflingerhost;

  inherit (callBPPackage "frameworks/native/services/inputflinger/tests" ./frameworks_native_services_inputflinger_tests.nix {})
    inputflinger_tests;

  inherit (callBPPackage "frameworks/native/services/nativeperms" ./frameworks_native_services_nativeperms.nix {})
    nativeperms;

  inherit (callBPPackage "frameworks/native/services/powermanager" ./frameworks_native_services_powermanager.nix {})
    libpowermanager;

  inherit (callBPPackage "frameworks/native/services/schedulerservice" ./frameworks_native_services_schedulerservice.nix {})
    libschedulerservicehidl;

  inherit (callBPPackage "frameworks/native/services/sensorservice" ./frameworks_native_services_sensorservice.nix {})
    libsensorservice sensorservice;

  inherit (callBPPackage "frameworks/native/services/sensorservice/hidl" ./frameworks_native_services_sensorservice_hidl.nix {})
    libsensorservicehidl;

  inherit (callBPPackage "frameworks/native/services/sensorservice/tests" ./frameworks_native_services_sensorservice_tests.nix {})
    test-sensorservice;

  inherit (callBPPackage "frameworks/native/services/surfaceflinger" ./frameworks_native_services_surfaceflinger.nix {})
    libSurfaceFlingerProp libsurfaceflinger libsurfaceflinger_binary libsurfaceflinger_defaults libsurfaceflinger_headers libsurfaceflinger_production_defaults libsurfaceflinger_sources surfaceflinger surfaceflinger_binary_sources surfaceflinger_defaults;

  inherit (callBPPackage "frameworks/native/services/surfaceflinger/CompositionEngine" ./frameworks_native_services_surfaceflinger_CompositionEngine.nix {})
    libcompositionengine libcompositionengine_defaults libcompositionengine_mocks libcompositionengine_test;

  inherit (callBPPackage "frameworks/native/services/surfaceflinger/TimeStats/timestatsproto" ./frameworks_native_services_surfaceflinger_TimeStats_timestatsproto.nix {})
    libtimestats_proto;

  inherit (callBPPackage "frameworks/native/services/surfaceflinger/layerproto" ./frameworks_native_services_surfaceflinger_layerproto.nix {})
    layersprotosnano liblayers_proto;

  inherit (callBPPackage "frameworks/native/services/surfaceflinger/sysprop" ./frameworks_native_services_surfaceflinger_sysprop.nix {})
    SurfaceFlingerProperties;

  inherit (callBPPackage "frameworks/native/services/surfaceflinger/tests" ./frameworks_native_services_surfaceflinger_tests.nix {})
    SurfaceFlinger_test;

  inherit (callBPPackage "frameworks/native/services/surfaceflinger/tests/fakehwc" ./frameworks_native_services_surfaceflinger_tests_fakehwc.nix {})
    sffakehwc_test;

  inherit (callBPPackage "frameworks/native/services/surfaceflinger/tests/hwc2" ./frameworks_native_services_surfaceflinger_tests_hwc2.nix {})
    test-hwc2;

  inherit (callBPPackage "frameworks/native/services/surfaceflinger/tests/unittests" ./frameworks_native_services_surfaceflinger_tests_unittests.nix {})
    libsurfaceflinger_unittest;

  inherit (callBPPackage "frameworks/native/services/surfaceflinger/tests/vsync" ./frameworks_native_services_surfaceflinger_tests_vsync.nix {})
    test-vsync-events;

  inherit (callBPPackage "frameworks/native/services/surfaceflinger/tests/waitforvsync" ./frameworks_native_services_surfaceflinger_tests_waitforvsync.nix {})
    test-waitforvsync;

  inherit (callBPPackage "frameworks/native/services/utils" ./frameworks_native_services_utils.nix {})
    libserviceutils;

  inherit (callBPPackage "frameworks/native/services/utils/tests" ./frameworks_native_services_utils_tests.nix {})
    prioritydumper_test;

  inherit (callBPPackage "frameworks/native/services/vr/bufferhubd" ./frameworks_native_services_vr_bufferhubd.nix {})
    bufferhubd libbufferhubd;

  inherit (callBPPackage "frameworks/native/services/vr/hardware_composer" ./frameworks_native_services_vr_hardware_composer.nix {})
    libvr_hwc-binder libvr_hwc-hal libvr_hwc-impl vr_hwc vr_hwc_test;

  inherit (callBPPackage "frameworks/native/services/vr/performanced" ./frameworks_native_services_vr_performanced.nix {})
    performance_service_tests performanced performanced_defaults;

  inherit (callBPPackage "frameworks/native/services/vr/virtual_touchpad" ./frameworks_native_services_vr_virtual_touchpad.nix {})
    VirtualTouchpad_test libvirtualtouchpad libvirtualtouchpadclient virtual_touchpad;

  inherit (callBPPackage "frameworks/native/vulkan" ./frameworks_native_vulkan.nix {})
    hwvulkan_headers;

  inherit (callBPPackage "frameworks/native/vulkan/libvulkan" ./frameworks_native_vulkan_libvulkan.nix {})
    libvulkan;

  inherit (callBPPackage "frameworks/native/vulkan/nulldrv" ./frameworks_native_vulkan_nulldrv.nix {})
    "vulkan.default";

  inherit (callBPPackage "frameworks/native/vulkan/tools" ./frameworks_native_vulkan_tools.nix {})
    vkinfo;

  inherit (callBPPackage "frameworks/native/vulkan/vkjson" ./frameworks_native_vulkan_vkjson.nix {})
    libvkjson libvkjson_ndk;

  inherit (callBPPackage "frameworks/opt/bitmap" ./frameworks_opt_bitmap.nix {})
    android-opt-bitmap;

  inherit (callBPPackage "frameworks/opt/bitmap/sample" ./frameworks_opt_bitmap_sample.nix {})
    bitmapcache-sample;

  inherit (callBPPackage "frameworks/opt/calendar" ./frameworks_opt_calendar.nix {})
    calendar-common;

  inherit (callBPPackage "frameworks/opt/calendar/tests" ./frameworks_opt_calendar_tests.nix {})
    CalendarCommonTests;

  inherit (callBPPackage "frameworks/opt/car/services" ./frameworks_opt_car_services.nix {})
    car-frameworks-service libcar-framework-service-jni;

  inherit (callBPPackage "frameworks/opt/car/setupwizard/library/main" ./frameworks_opt_car_setupwizard_library_main.nix {})
    car-setup-wizard-lib;

  inherit (callBPPackage "frameworks/opt/car/setupwizard/library/utils" ./frameworks_opt_car_setupwizard_library_utils.nix {})
    car-setup-wizard-lib-utils;

  inherit (callBPPackage "frameworks/opt/chips" ./frameworks_opt_chips.nix {})
    libchips;

  inherit (callBPPackage "frameworks/opt/chips/sample" ./frameworks_opt_chips_sample.nix {})
    libChipsSample;

  inherit (callBPPackage "frameworks/opt/chips/tests" ./frameworks_opt_chips_tests.nix {})
    libChipsTests;

  inherit (callBPPackage "frameworks/opt/colorpicker" ./frameworks_opt_colorpicker.nix {})
    colorpicker;

  inherit (callBPPackage "frameworks/opt/datetimepicker" ./frameworks_opt_datetimepicker.nix {})
    android-opt-datetimepicker;

  inherit (callBPPackage "frameworks/opt/gamesdk/samples/tuningfork/tfvalidate" ./frameworks_opt_gamesdk_samples_tuningfork_tfvalidate.nix {})
    tfvalidate tfvalidate_defaults;

  inherit (callBPPackage "frameworks/opt/net/ethernet" ./frameworks_opt_net_ethernet.nix {})
    ethernet-service;

  inherit (callBPPackage "frameworks/opt/net/ethernet/tests" ./frameworks_opt_net_ethernet_tests.nix {})
    EthernetServiceTests;

  inherit (callBPPackage "frameworks/opt/net/ims" ./frameworks_opt_net_ims.nix {})
    ims-common;

  inherit (callBPPackage "frameworks/opt/net/ims/tests" ./frameworks_opt_net_ims_tests.nix {})
    ImsCommonTests;

  inherit (callBPPackage "frameworks/opt/net/voip" ./frameworks_opt_net_voip.nix {})
    opt-net-voip-htmls opt-net-voip-srcs voip-common;

  inherit (callBPPackage "frameworks/opt/net/voip/src/jni/rtp" ./frameworks_opt_net_voip_src_jni_rtp.nix {})
    librtp_jni;

  inherit (callBPPackage "frameworks/opt/net/wifi/libwifi_system" ./frameworks_opt_net_wifi_libwifi_system.nix {})
    libwifi-system libwifi-system-defaults libwifi-system-test;

  inherit (callBPPackage "frameworks/opt/net/wifi/libwifi_system_iface" ./frameworks_opt_net_wifi_libwifi_system_iface.nix {})
    libwifi-system-iface libwifi-system-iface-test;

  inherit (callBPPackage "frameworks/opt/net/wifi/service" ./frameworks_opt_net_wifi_service.nix {})
    libwifi-service;

  inherit (callBPPackage "frameworks/opt/net/wifi/service/proto" ./frameworks_opt_net_wifi_service_proto.nix {})
    wifi_service_proto;

  inherit (callBPPackage "frameworks/opt/photoviewer" ./frameworks_opt_photoviewer.nix {})
    libphotoviewer libphotoviewer_appcompat;

  inherit (callBPPackage "frameworks/opt/photoviewer/sample" ./frameworks_opt_photoviewer_sample.nix {})
    AppcompatPhotoViewerSample PhotoViewerSample;

  inherit (callBPPackage "frameworks/opt/setupwizard/library" ./frameworks_opt_setupwizard_library.nix {})
    setup-wizard-lib setup-wizard-lib-gingerbread-compat;

  inherit (callBPPackage "frameworks/opt/telephony" ./frameworks_opt_telephony.nix {})
    opt-telephony-common-srcs opt-telephony-htmls opt-telephony-srcs telephony-common;

  inherit (callBPPackage "frameworks/opt/telephony/proto" ./frameworks_opt_telephony_proto.nix {})
    telephony-protos;

  inherit (callBPPackage "frameworks/opt/telephony/tests/telephonytests" ./frameworks_opt_telephony_tests_telephonytests.nix {})
    FrameworksTelephonyTests;

  inherit (callBPPackage "frameworks/opt/timezonepicker" ./frameworks_opt_timezonepicker.nix {})
    android-opt-timezonepicker;

  inherit (callBPPackage "frameworks/opt/vcard" ./frameworks_opt_vcard.nix {})
    "com.android.vcard";

  inherit (callBPPackage "frameworks/opt/vcard/tests" ./frameworks_opt_vcard_tests.nix {})
    AndroidVCardTests;

  inherit (callBPPackage "frameworks/rs" ./frameworks_rs.nix {})
    libRS libRSCacheDir libRSDriver libRS_internal rs-headers rs_defaults rs_generated_headers rs_generated_sources rsg-generator;

  inherit (callBPPackage "frameworks/rs/cpp" ./frameworks_rs_cpp.nix {})
    libRSDispatch libRScpp libRScpp-defaults libRScpp_static;

  inherit (callBPPackage "frameworks/rs/cpu_ref" ./frameworks_rs_cpu_ref.nix {})
    libRSCpuRef;

  inherit (callBPPackage "frameworks/rs/rsov/compiler" ./frameworks_rs_rsov_compiler.nix {})
    Builtin_test Wrapper_test rs2spirv;

  inherit (callBPPackage "frameworks/rs/rsov/compiler/spirit" ./frameworks_rs_rsov_compiler_spirit.nix {})
    instructions_test libspirit libspirit_gen libspirit_generate_py libspirit_test pass_queue_test spirit_defaults word_stream_test;

  inherit (callBPPackage "frameworks/rs/script_api" ./frameworks_rs_script_api.nix {})
    rs-api-doc-generator;

  inherit (callBPPackage "frameworks/rs" ./frameworks_rs_support.bp.nix {})
    libRSSupport rs_generated_headers_support rs_generated_sources_support rs_support_defaults;

  inherit (callBPPackage "frameworks/rs/support" ./frameworks_rs_support.nix {})
    android-support-v8-renderscript;

  inherit (callBPPackage "frameworks/rs/support/jni" ./frameworks_rs_support_jni.nix {})
    libRSSupportIO librsjni;

  inherit (callBPPackage "frameworks/wilhelm" ./frameworks_wilhelm.nix {})
    libOpenSLES_headers;

  inherit (callBPPackage "frameworks/wilhelm/src" ./frameworks_wilhelm_src.nix {})
    libOpenMAXAL libOpenSLES libOpenSLESUT libopensles_helper libwilhelm;

  inherit (callBPPackage "frameworks/wilhelm/tests" ./frameworks_wilhelm_tests.nix {})
    libopenslestests;

  inherit (callBPPackage "frameworks/wilhelm/tests/automated" ./frameworks_wilhelm_tests_automated.nix {})
    BufferQueue_test;

  inherit (callBPPackage "frameworks/wilhelm/tests/examples" ./frameworks_wilhelm_tests_examples.nix {})
    slesTest_bassboostPath slesTest_decodeAac slesTest_decodeToBuffQueue slesTest_effectCapabilities slesTest_eqFdPath slesTest_eqOutputPath slesTest_feedback slesTest_playFdPath slesTest_recBuffQueue slesTest_sawtoothBufferQueue slesTest_sendToPresetReverb slesTest_virtualizer xaVideoDecoderCapabilities;

  inherit (callBPPackage "frameworks/wilhelm/tests/listening" ./frameworks_wilhelm_tests_listening.nix {})
    slesTest_playMuteSolo slesTest_seekTorture;

  inherit (callBPPackage "frameworks/wilhelm/tests/mimeUri" ./frameworks_wilhelm_tests_mimeUri.nix {})
    slesTest_getPositionUri slesTest_loopUri slesTest_manyPlayers slesTest_playStates slesTest_playStreamType slesTest_playUri slesTest_playUri2 slesTest_slowDownUri;

  inherit (callBPPackage "frameworks/wilhelm/tests/native-media" ./frameworks_wilhelm_tests_native-media.nix {})
    native-media;

  inherit (callBPPackage "frameworks/wilhelm/tests/native-media/jni" ./frameworks_wilhelm_tests_native-media_jni.nix {})
    libnative-media-jni;

  inherit (callBPPackage "frameworks/wilhelm/tests/sandbox" ./frameworks_wilhelm_tests_sandbox.nix {})
    slesTest_configbq slesTest_dim slesTest_dual slesTest_engine slesTest_intbufq slesTest_monkey slesTest_multiplay slesTest_multithread slesTest_object slesTest_outputmix slesTest_playbq slesTest_reverb slesTest_srcsink slesTest_urimime slesTest_xa slesTest_xaplay;

  inherit (callBPPackage "frameworks/wilhelm/tests/sandbox/streamSource" ./frameworks_wilhelm_tests_sandbox_streamSource.nix {})
    slesTest_playStream;

  inherit (callBPPackage "kernel/configs/build" ./kernel_configs_build.nix {})
    kernel-config-soong-rules;

  inherit (callBPPackage "kernel/configs/o-mr1/android-3.18" ./kernel_configs_o-mr1_android-3.18.nix {})
    "kernel_config_o_mr1_3.18";

  inherit (callBPPackage "kernel/configs/o-mr1/android-4.4" ./kernel_configs_o-mr1_android-4.4.nix {})
    "kernel_config_o_mr1_4.4";

  inherit (callBPPackage "kernel/configs/o-mr1/android-4.9" ./kernel_configs_o-mr1_android-4.9.nix {})
    "kernel_config_o_mr1_4.9";

  inherit (callBPPackage "kernel/configs/o/android-3.18" ./kernel_configs_o_android-3.18.nix {})
    "kernel_config_o_3.18";

  inherit (callBPPackage "kernel/configs/o/android-4.4" ./kernel_configs_o_android-4.4.nix {})
    "kernel_config_o_4.4";

  inherit (callBPPackage "kernel/configs/o/android-4.9" ./kernel_configs_o_android-4.9.nix {})
    "kernel_config_o_4.9";

  inherit (callBPPackage "kernel/configs/p/android-4.14" ./kernel_configs_p_android-4.14.nix {})
    "kernel_config_p_4.14";

  inherit (callBPPackage "kernel/configs/p/android-4.4" ./kernel_configs_p_android-4.4.nix {})
    "kernel_config_p_4.4";

  inherit (callBPPackage "kernel/configs/p/android-4.9" ./kernel_configs_p_android-4.9.nix {})
    "kernel_config_p_4.9";

  inherit (callBPPackage "kernel/configs/q/android-4.14" ./kernel_configs_q_android-4.14.nix {})
    "kernel_config_q_4.14";

  inherit (callBPPackage "kernel/configs/q/android-4.19" ./kernel_configs_q_android-4.19.nix {})
    "kernel_config_q_4.19";

  inherit (callBPPackage "kernel/configs/q/android-4.9" ./kernel_configs_q_android-4.9.nix {})
    "kernel_config_q_4.9";

  inherit (callBPPackage "kernel/configs/tools" ./kernel_configs_tools.nix {})
    kconfig_xml_fixup;

  inherit (callBPPackage "kernel/tests" ./kernel_tests.nix {})
    kernel_tests_defaults;

  inherit (callBPPackage "kernel/tests/devicetree/early_mount" ./kernel_tests_devicetree_early_mount.nix {})
    dt_early_mount_test;

  inherit (callBPPackage "kernel/tests/net/test" ./kernel_tests_net_test.nix {})
    kernel_net_tests;

  inherit (callBPPackage "libcore" ./libcore.nix {})
    notices-for-framework-stubs;

  inherit (callBPPackage "libcore" ./libcore_JavaLibrary.bp.nix {})
    "core.current.stubs" android_icu4j_resources_lib core-all core-all-system-modules core-current-stubs-gen core-current-stubs-nullability-validation core-lambda-stubs core-lambda-stubs-for-system-modules core-libart core-libart-testdex core-oj core-oj-hiddenapi core-oj-testdex core-ojtests core-ojtests-public core-system-modules core-test-rules core-tests core-tests-support core_api_files core_lambda_stubs_defaults core_libart_api_files core_libart_java_files core_oj_api_files core_oj_java_files core_public_api_files filesystemstest jsr166-tests known-oj-tags libcore_java_defaults ojluni-annotated-mmodule-stubs ojluni-annotated-nullability-stubs ojluni-annotated-sdk-stubs parameter-metadata-test timezone-host;

  inherit (callBPPackage "libcore" ./libcore_NativeCode.bp.nix {})
    core_native_default_flags core_native_default_libs libandroidio libjavacore libjavacore-benchmarks libjavacore-unit-tests libjavacoretests libopenjdk libopenjdk_native_defaults libopenjdkd;

  inherit (callBPPackage "libcore/luni/src/main/native" ./libcore_luni_src_main_native.nix {})
    libandroidio_srcs luni_native_srcs;

  inherit (callBPPackage "libcore/metrictests/memory/apps" ./libcore_metrictests_memory_apps.nix {})
    LibcoreHeapDumper;

  inherit (callBPPackage "libcore/metrictests/memory/host" ./libcore_metrictests_memory_host.nix {})
    libcore-memory-metrics-tests;

  inherit (callBPPackage "libcore/mmodules/core_platform_api" ./libcore_mmodules_core_platform_api.nix {})
    "core.platform.api.stubs" core-platform-api-stubs core-platform-api-stubs-system-modules;

  inherit (callBPPackage "libcore/mmodules/intracoreapi" ./libcore_mmodules_intracoreapi.nix {})
    "core-libart-oj.depscheck" "core.intra.stubs" core-intra-stubs core-intra-stubs-system-modules;

  inherit (callBPPackage "libcore" ./libcore_non_openjdk_java_files.bp.nix {})
    non_openjdk_java_files non_openjdk_javadoc_files timezone_host_files;

  inherit (callBPPackage "libcore/ojluni/src/main/native" ./libcore_ojluni_src_main_native.nix {})
    libopenjdk_native_srcs;

  inherit (callBPPackage "libcore" ./libcore_openjdk_java_files.bp.nix {})
    openjdk-mmodule-stubs-no-javadoc openjdk-sdk-stubs-no-javadoc openjdk_hiddenapi_javadoc_files openjdk_internal_files openjdk_java_files openjdk_javadoc_files openjdk_lambda_duplicate_stub_files openjdk_lambda_stub_files openjdk_mmodule_extra_files;

  inherit (callBPPackage "libcore/tools/upstream" ./libcore_tools_upstream.nix {})
    libcore-compare-upstreams libcore-copy-upstream-files;

  inherit (callBPPackage "libnativehelper" ./libnativehelper.nix {})
    "libnativehelper_compat_libc++" jni_headers jni_platform_headers libnativehelper libnativehelper_header_only;

  inherit (callBPPackage "libnativehelper/tests" ./libnativehelper_tests.nix {})
    JniInvocation_test JniSafeRegisterNativeMethods_test libnativehelper_api_test;

  inherit (callBPPackage "libnativehelper/tests/jni_gtest" ./libnativehelper_tests_jni_gtest.nix {})
    jni_gtest_defaults jni_gtest_headers;

  inherit (callBPPackage "packages/apps/BasicSmsReceiver" ./packages_apps_BasicSmsReceiver.nix {})
    BasicSmsReceiver;

  inherit (callBPPackage "packages/apps/BasicSmsReceiver/tests" ./packages_apps_BasicSmsReceiver_tests.nix {})
    BasicSmsReceiverTests;

  inherit (callBPPackage "packages/apps/Bluetooth/jni" ./packages_apps_Bluetooth_jni.nix {})
    libbluetooth_jni;

  inherit (callBPPackage "packages/apps/Browser2" ./packages_apps_Browser2.nix {})
    Browser2;

  inherit (callBPPackage "packages/apps/Car/CompanionDeviceSupport" ./packages_apps_Car_CompanionDeviceSupport.nix {})
    CompanionDeviceSupport CompanionDeviceSupport-aidl CompanionDeviceSupport-lib;

  inherit (callBPPackage "packages/apps/Car/CompanionDeviceSupport/proto" ./packages_apps_Car_CompanionDeviceSupport_proto.nix {})
    CompanionDeviceSupport-proto;

  inherit (callBPPackage "packages/apps/Car/CompanionDeviceSupport/src/com/android/car/companiondevicesupport/feature/calendarsync/proto" ./packages_apps_Car_CompanionDeviceSupport_src_com_android_car_companiondevicesupport_feature_calendarsync_proto.nix {})
    companion-feature-calendarsync-protos;

  inherit (callBPPackage "packages/apps/Car/CompanionDeviceSupport/tests/unit" ./packages_apps_Car_CompanionDeviceSupport_tests_unit.nix {})
    CompanionDeviceSupport-unit-tests;

  inherit (callBPPackage "packages/apps/Car/Notification" ./packages_apps_Car_Notification.nix {})
    CarNotification CarNotificationLib;

  inherit (callBPPackage "packages/apps/Car/libs/EncryptionRunner" ./packages_apps_Car_libs_EncryptionRunner.nix {})
    EncryptionRunner-lib;

  inherit (callBPPackage "packages/apps/Car/libs/androidx-room" ./packages_apps_Car_libs_androidx-room.nix {})
    car-androidx-annotation-nodeps-bp car-androidx-room-common-nodeps-bp car-androidx-room-compiler car-androidx-room-compiler-nodeps-bp car-androidx-room-migration-nodeps-bp car-androidx-room-runtime-nodeps-bp;

  inherit (callBPPackage "packages/apps/Car/libs/car-apps-common" ./packages_apps_Car_libs_car-apps-common.nix {})
    car-apps-common-bp;

  inherit (callBPPackage "packages/apps/Car/libs/car-assist-client-lib" ./packages_apps_Car_libs_car-assist-client-lib.nix {})
    car-assist-client-lib;

  inherit (callBPPackage "packages/apps/Car/libs/car-assist-lib" ./packages_apps_Car_libs_car-assist-lib.nix {})
    car-assist-lib;

  inherit (callBPPackage "packages/apps/Car/libs/car-messenger-common" ./packages_apps_Car_libs_car-messenger-common.nix {})
    car-messenger-common;

  inherit (callBPPackage "packages/apps/Car/libs/car-messenger-common/proto" ./packages_apps_Car_libs_car-messenger-common_proto.nix {})
    car-messenger-protos;

  inherit (callBPPackage "packages/apps/Car/libs/car-theme-lib" ./packages_apps_Car_libs_car-theme-lib.nix {})
    car-theme-lib-bp;

  inherit (callBPPackage "packages/apps/Car/libs/car-ui-lib" ./packages_apps_Car_libs_car-ui-lib.nix {})
    car-ui-lib-bp;

  inherit (callBPPackage "packages/apps/Car/libs/connected-device-lib" ./packages_apps_Car_libs_connected-device-lib.nix {})
    connected-device-lib;

  inherit (callBPPackage "packages/apps/Car/libs/connected-device-lib/proto" ./packages_apps_Car_libs_connected-device-lib_proto.nix {})
    connected-device-protos;

  inherit (callBPPackage "packages/apps/Car/libs/connected-device-lib/tests/unit" ./packages_apps_Car_libs_connected-device-lib_tests_unit.nix {})
    connected-device-lib-unit-tests;

  inherit (callBPPackage "packages/apps/CarrierConfig" ./packages_apps_CarrierConfig.nix {})
    CarrierConfig;

  inherit (callBPPackage "packages/apps/CarrierConfig/tests" ./packages_apps_CarrierConfig_tests.nix {})
    CarrierConfigTests;

  inherit (callBPPackage "packages/apps/CellBroadcastReceiver" ./packages_apps_CellBroadcastReceiver.nix {})
    CellBroadcastReceiver;

  inherit (callBPPackage "packages/apps/CellBroadcastReceiver/tests/testapp" ./packages_apps_CellBroadcastReceiver_tests_testapp.nix {})
    CellBroadcastReceiverTests;

  inherit (callBPPackage "packages/apps/CellBroadcastReceiver/tests/unit" ./packages_apps_CellBroadcastReceiver_tests_unit.nix {})
    CellBroadcastReceiverUnitTests;

  inherit (callBPPackage "packages/apps/CertInstaller" ./packages_apps_CertInstaller.nix {})
    CertInstaller;

  inherit (callBPPackage "packages/apps/DeskClock" ./packages_apps_DeskClock.nix {})
    DeskClock;

  inherit (callBPPackage "packages/apps/DevCamera" ./packages_apps_DevCamera.nix {})
    DevCamera;

  inherit (callBPPackage "packages/apps/DocumentsUI" ./packages_apps_DocumentsUI.nix {})
    DocumentsUI DocumentsUI-res-lib DocumentsUI-srcs docsui-statsd documentsui_defaults statslog-docsui-java-gen;

  inherit (callBPPackage "packages/apps/DocumentsUI/app-perf-tests" ./packages_apps_DocumentsUI_app-perf-tests.nix {})
    DocumentsUIAppPerfTests;

  inherit (callBPPackage "packages/apps/DocumentsUI/perf-tests" ./packages_apps_DocumentsUI_perf-tests.nix {})
    DocumentsUIPerfTests;

  inherit (callBPPackage "packages/apps/DocumentsUI/tests" ./packages_apps_DocumentsUI_tests.nix {})
    DocumentsUIPerfTests-files DocumentsUITests DocumentsUITests-res-lib DocumentsUITests-srcs;

  inherit (callBPPackage "packages/apps/EmergencyInfo" ./packages_apps_EmergencyInfo.nix {})
    EmergencyInfo EmergencyInfo-lib;

  inherit (callBPPackage "packages/apps/EmergencyInfo/tests/common" ./packages_apps_EmergencyInfo_tests_common.nix {})
    emergencyinfo-test-common;

  inherit (callBPPackage "packages/apps/EmergencyInfo/tests/unit" ./packages_apps_EmergencyInfo_tests_unit.nix {})
    EmergencyInfoUnitTests;

  inherit (callBPPackage "packages/apps/Gallery" ./packages_apps_Gallery.nix {})
    Gallery;

  inherit (callBPPackage "packages/apps/Gallery/tests" ./packages_apps_Gallery_tests.nix {})
    GalleryTests;

  inherit (callBPPackage "packages/apps/HTMLViewer" ./packages_apps_HTMLViewer.nix {})
    HTMLViewer;

  inherit (callBPPackage "packages/apps/KeyChain" ./packages_apps_KeyChain.nix {})
    KeyChain;

  inherit (callBPPackage "packages/apps/KeyChain/support" ./packages_apps_KeyChain_support.nix {})
    "com.android.keychain.tests.support" KeyChainTestsSupport;

  inherit (callBPPackage "packages/apps/KeyChain/tests" ./packages_apps_KeyChain_tests.nix {})
    KeyChainTests;

  inherit (callBPPackage "packages/apps/Launcher3" ./packages_apps_Launcher3.nix {})
    launcher-aosp-tapl;

  inherit (callBPPackage "packages/apps/Launcher3/iconloaderlib" ./packages_apps_Launcher3_iconloaderlib.nix {})
    iconloader iconloader_base;

  inherit (callBPPackage "packages/apps/Music" ./packages_apps_Music.nix {})
    Music;

  inherit (callBPPackage "packages/apps/MusicFX" ./packages_apps_MusicFX.nix {})
    MusicFX;

  inherit (callBPPackage "packages/apps/Nfc" ./packages_apps_Nfc.nix {})
    NfcNci;

  inherit (callBPPackage "packages/apps/Nfc/nci/jni" ./packages_apps_Nfc_nci_jni.nix {})
    libnfc_nci_jni;

  inherit (callBPPackage "packages/apps/Nfc/tests" ./packages_apps_Nfc_tests.nix {})
    NfcTests;

  inherit (callBPPackage "packages/apps/OneTimeInitializer" ./packages_apps_OneTimeInitializer.nix {})
    OneTimeInitializer;

  inherit (callBPPackage "packages/apps/PermissionController" ./packages_apps_PermissionController.nix {})
    PermissionController permissioncontroller-statsd statslog-permissioncontroller-java-gen;

  inherit (callBPPackage "packages/apps/PhoneCommon" ./packages_apps_PhoneCommon.nix {})
    "com.android.phone.common";

  inherit (callBPPackage "packages/apps/Protips" ./packages_apps_Protips.nix {})
    Protips;

  inherit (callBPPackage "packages/apps/Provision" ./packages_apps_Provision.nix {})
    Provision;

  inherit (callBPPackage "packages/apps/QuickSearchBox" ./packages_apps_QuickSearchBox.nix {})
    QuickSearchBox;

  inherit (callBPPackage "packages/apps/QuickSearchBox/benchmarks" ./packages_apps_QuickSearchBox_benchmarks.nix {})
    QuickSearchBoxBenchmarks;

  inherit (callBPPackage "packages/apps/QuickSearchBox/tests" ./packages_apps_QuickSearchBox_tests.nix {})
    QuickSearchBoxTests;

  inherit (callBPPackage "packages/apps/QuickSearchBox/tests/naughty" ./packages_apps_QuickSearchBox_tests_naughty.nix {})
    NaughtySuggestions;

  inherit (callBPPackage "packages/apps/QuickSearchBox/tests/partial" ./packages_apps_QuickSearchBox_tests_partial.nix {})
    PartialSuggestions;

  inherit (callBPPackage "packages/apps/QuickSearchBox/tests/slow" ./packages_apps_QuickSearchBox_tests_slow.nix {})
    SlowSuggestions;

  inherit (callBPPackage "packages/apps/QuickSearchBox/tests/spammy" ./packages_apps_QuickSearchBox_tests_spammy.nix {})
    SpammySuggestions;

  inherit (callBPPackage "packages/apps/SafetyRegulatoryInfo" ./packages_apps_SafetyRegulatoryInfo.nix {})
    SafetyRegulatoryInfo;

  inherit (callBPPackage "packages/apps/SecureElement" ./packages_apps_SecureElement.nix {})
    SecureElement;

  inherit (callBPPackage "packages/apps/Settings/protos" ./packages_apps_Settings_protos.nix {})
    settings-contextual-card-protos-lite settings-log-bridge-protos-lite;

  inherit (callBPPackage "packages/apps/SettingsIntelligence" ./packages_apps_SettingsIntelligence.nix {})
    SettingsIntelligence;

  inherit (callBPPackage "packages/apps/SoundRecorder" ./packages_apps_SoundRecorder.nix {})
    SoundRecorder;

  inherit (callBPPackage "packages/apps/SpareParts" ./packages_apps_SpareParts.nix {})
    SpareParts;

  inherit (callBPPackage "packages/apps/Stk" ./packages_apps_Stk.nix {})
    Stk;

  inherit (callBPPackage "packages/apps/TV" ./packages_apps_TV.nix {})
    LiveTv;

  inherit (callBPPackage "packages/apps/TV/common" ./packages_apps_TV_common.nix {})
    tv-common;

  inherit (callBPPackage "packages/apps/TV/jni" ./packages_apps_TV_jni.nix {})
    libtunertvinput_jni;

  inherit (callBPPackage "packages/apps/TV/libs" ./packages_apps_TV_libs.nix {})
    tv-auto-factory tv-auto-factory-jar tv-auto-value tv-auto-value-jar tv-error-prone-annotations-jar tv-guava-android-jar tv-guava-jre-jar tv-javawriter-jar tv-javax-annotations-jar tv-lib-dagger tv-lib-dagger-android tv-lib-dagger-android-processor tv-lib-dagger-android-processor-import tv-lib-dagger-compiler tv-lib-dagger-compiler-deps tv-lib-dagger-compiler-import tv-lib-exoplayer tv-lib-exoplayer-v2-core tv-lib-truth;

  inherit (callBPPackage "packages/apps/TV/partner_support" ./packages_apps_TV_partner_support.nix {})
    live-channels-partner-support;

  inherit (callBPPackage "packages/apps/TV/tuner" ./packages_apps_TV_tuner.nix {})
    live-tv-tuner;

  inherit (callBPPackage "packages/apps/TV/tuner/proto" ./packages_apps_TV_tuner_proto.nix {})
    live-tv-tuner-proto;

  inherit (callBPPackage "packages/apps/Terminal" ./packages_apps_Terminal.nix {})
    Terminal;

  inherit (callBPPackage "packages/apps/Terminal/jni" ./packages_apps_Terminal_jni.nix {})
    libjni_terminal;

  inherit (callBPPackage "packages/apps/Test/connectivity/PMC" ./packages_apps_Test_connectivity_PMC.nix {})
    PMC;

  inherit (callBPPackage "packages/apps/Test/connectivity/UID" ./packages_apps_Test_connectivity_UID.nix {})
    ConnectivityUIDTest;

  inherit (callBPPackage "packages/apps/Test/connectivity/sl4n" ./packages_apps_Test_connectivity_sl4n.nix {})
    sl4n;

  inherit (callBPPackage "packages/apps/TimeZoneUpdater" ./packages_apps_TimeZoneUpdater.nix {})
    TimeZoneUpdater time_zone_updater;

  inherit (callBPPackage "packages/apps/Traceur" ./packages_apps_Traceur.nix {})
    "notify_traceur.sh" Traceur;

  inherit (callBPPackage "packages/apps/Traceur/uitests" ./packages_apps_Traceur_uitests.nix {})
    TraceurUiTests;

  inherit (callBPPackage "packages/apps/UniversalMediaPlayer" ./packages_apps_UniversalMediaPlayer.nix {})
    UniversalMediaPlayer;

  inherit (callBPPackage "packages/inputmethods/LatinIME" ./packages_inputmethods_LatinIME.nix {})
    dicttool_deps;

  inherit (callBPPackage "packages/inputmethods/LatinIME/common" ./packages_inputmethods_LatinIME_common.nix {})
    latinime-common;

  inherit (callBPPackage "packages/inputmethods/LatinIME/java" ./packages_inputmethods_LatinIME_java.nix {})
    LatinIME;

  inherit (callBPPackage "packages/inputmethods/LatinIME/native/dicttoolkit" ./packages_inputmethods_LatinIME_native_dicttoolkit.nix {})
    dicttoolkit dicttoolkit_defaults dicttoolkit_unittests liblatinime_dicttoolkit;

  inherit (callBPPackage "packages/inputmethods/LatinIME/native/jni" ./packages_inputmethods_LatinIME_native_jni.nix {})
    LATIN_IME_CORE_SRC_FILES libjni_latinime liblatinime_static_for_unittests liblatinime_unittests;

  inherit (callBPPackage "packages/inputmethods/LatinIME/tests" ./packages_inputmethods_LatinIME_tests.nix {})
    LatinIMETests;

  inherit (callBPPackage "packages/inputmethods/LatinIME/tools/EditTextVariations" ./packages_inputmethods_LatinIME_tools_EditTextVariations.nix {})
    EditTextVariations;

  inherit (callBPPackage "packages/inputmethods/LatinIME/tools/dicttool" ./packages_inputmethods_LatinIME_tools_dicttool.nix {})
    dicttool_aosp;

  inherit (callBPPackage "packages/inputmethods/LatinIME/tools/make-keyboard-text" ./packages_inputmethods_LatinIME_tools_make-keyboard-text.nix {})
    make-keyboard-text;

  inherit (callBPPackage "packages/modules/CaptivePortalLogin" ./packages_modules_CaptivePortalLogin.nix {})
    CaptivePortalLogin CaptivePortalLoginDefaults PlatformCaptivePortalLogin;

  inherit (callBPPackage "packages/modules/ExtServices" ./packages_modules_ExtServices.nix {})
    ExtServices ExtServices-core;

  inherit (callBPPackage "packages/modules/ExtServices/tests" ./packages_modules_ExtServices_tests.nix {})
    ExtServicesUnitTests;

  inherit (callBPPackage "packages/modules/ModuleMetadata" ./packages_modules_ModuleMetadata.nix {})
    ModuleMetadata;

  inherit (callBPPackage "packages/modules/NetworkPermissionConfig" ./packages_modules_NetworkPermissionConfig.nix {})
    NetworkPermissionConfig NetworkPermissionConfigDefaults PlatformNetworkPermissionConfig;

  inherit (callBPPackage "packages/modules/NetworkStack" ./packages_modules_NetworkStack.nix {})
    InProcessNetworkStack NetworkStack NetworkStackAppCommon NetworkStackBase NetworkStackCommon captiveportal-lib libnetworkstackutilsjni statslog-networkstack-java-gen;

  inherit (callBPPackage "packages/modules/NetworkStack/tests/unit" ./packages_modules_NetworkStack_tests_unit.nix {})
    NetworkStackTests libnetworkstacktestsjni;

  inherit (callBPPackage "packages/providers/BlockedNumberProvider" ./packages_providers_BlockedNumberProvider.nix {})
    BlockedNumberProvider;

  inherit (callBPPackage "packages/providers/BlockedNumberProvider/tests" ./packages_providers_BlockedNumberProvider_tests.nix {})
    BlockedNumberProviderTest;

  inherit (callBPPackage "packages/providers/BookmarkProvider" ./packages_providers_BookmarkProvider.nix {})
    BookmarkProvider;

  inherit (callBPPackage "packages/providers/CalendarProvider" ./packages_providers_CalendarProvider.nix {})
    CalendarProvider;

  inherit (callBPPackage "packages/providers/CalendarProvider/tests" ./packages_providers_CalendarProvider_tests.nix {})
    CalendarProviderTests;

  inherit (callBPPackage "packages/providers/CallLogProvider" ./packages_providers_CallLogProvider.nix {})
    CallLogBackup;

  inherit (callBPPackage "packages/providers/CallLogProvider/tests" ./packages_providers_CallLogProvider_tests.nix {})
    CallLogBackupTests;

  inherit (callBPPackage "packages/providers/ContactsProvider" ./packages_providers_ContactsProvider.nix {})
    ContactsProvider;

  inherit (callBPPackage "packages/providers/ContactsProvider/test_common" ./packages_providers_ContactsProvider_test_common.nix {})
    ContactsProviderTestUtils;

  inherit (callBPPackage "packages/providers/ContactsProvider/tests" ./packages_providers_ContactsProvider_tests.nix {})
    ContactsProviderTests;

  inherit (callBPPackage "packages/providers/ContactsProvider/tests2" ./packages_providers_ContactsProvider_tests2.nix {})
    ContactsProviderTests2;

  inherit (callBPPackage "packages/providers/DownloadProvider" ./packages_providers_DownloadProvider.nix {})
    DownloadProvider download_provider-files;

  inherit (callBPPackage "packages/providers/DownloadProvider/tests" ./packages_providers_DownloadProvider_tests.nix {})
    DownloadProviderTests;

  inherit (callBPPackage "packages/providers/DownloadProvider/tests/permission" ./packages_providers_DownloadProvider_tests_permission.nix {})
    DownloadProviderPermissionTests;

  inherit (callBPPackage "packages/providers/DownloadProvider/tests/public_api_access" ./packages_providers_DownloadProvider_tests_public_api_access.nix {})
    DownloadPublicApiAccessTests;

  inherit (callBPPackage "packages/providers/DownloadProvider/ui" ./packages_providers_DownloadProvider_ui.nix {})
    DownloadProviderUi;

  inherit (callBPPackage "packages/providers/MediaProvider" ./packages_providers_MediaProvider.nix {})
    MediaProvider;

  inherit (callBPPackage "packages/providers/MediaProvider/tests" ./packages_providers_MediaProvider_tests.nix {})
    MediaProviderTests;

  inherit (callBPPackage "packages/providers/PartnerBookmarksProvider" ./packages_providers_PartnerBookmarksProvider.nix {})
    PartnerBookmarksProvider;

  inherit (callBPPackage "packages/providers/PartnerBookmarksProvider/tests" ./packages_providers_PartnerBookmarksProvider_tests.nix {})
    PartnerBookmarksProviderTest;

  inherit (callBPPackage "packages/providers/TelephonyProvider" ./packages_providers_TelephonyProvider.nix {})
    TelephonyProvider;

  inherit (callBPPackage "packages/providers/TelephonyProvider/tests" ./packages_providers_TelephonyProvider_tests.nix {})
    TelephonyProviderTests;

  inherit (callBPPackage "packages/providers/TvProvider" ./packages_providers_TvProvider.nix {})
    TvProvider;

  inherit (callBPPackage "packages/providers/TvProvider/tests" ./packages_providers_TvProvider_tests.nix {})
    TvProviderTests;

  inherit (callBPPackage "packages/providers/UserDictionaryProvider" ./packages_providers_UserDictionaryProvider.nix {})
    UserDictionaryProvider;

  inherit (callBPPackage "packages/screensavers/Basic" ./packages_screensavers_Basic.nix {})
    BasicDreams;

  inherit (callBPPackage "packages/screensavers/PhotoTable" ./packages_screensavers_PhotoTable.nix {})
    PhotoTable;

  inherit (callBPPackage "packages/services/AlternativeNetworkAccess" ./packages_services_AlternativeNetworkAccess.nix {})
    ONS;

  inherit (callBPPackage "packages/services/AlternativeNetworkAccess/tests" ./packages_services_AlternativeNetworkAccess_tests.nix {})
    ONSTests;

  inherit (callBPPackage "packages/services/BuiltInPrintService" ./packages_services_BuiltInPrintService.nix {})
    BuiltInPrintService;

  inherit (callBPPackage "packages/services/BuiltInPrintService/jni" ./packages_services_BuiltInPrintService_jni.nix {})
    libwfds;

  inherit (callBPPackage "packages/services/Car/EncryptionRunner" ./packages_services_Car_EncryptionRunner.nix {})
    EncryptionRunner EncryptionRunnerTest;

  inherit (callBPPackage "packages/services/Car/car-bugreportd" ./packages_services_Car_car-bugreportd.nix {})
    car-bugreportd;

  inherit (callBPPackage "packages/services/Car/car-lib" ./packages_services_Car_car-lib.nix {})
    "android.car" "android.car-docs-default" "android.car-stub-docs" "android.car-stubs" "android.car-stubs-docs" "android.car-system-stubs" "android.car-system-stubs-docs" "android.car-test-stubs" "android.car-test-stubs-docs" "android.car.cluster.navigation" "android.car.settings" android-car-last-released-api android-car-last-released-system-api libcarpowermanager;

  inherit (callBPPackage "packages/services/Car/car-test-lib" ./packages_services_Car_car-test-lib.nix {})
    "android.car.testapi";

  inherit (callBPPackage "packages/services/Car/service/proto" ./packages_services_Car_service_proto.nix {})
    blestream-protos;

  inherit (callBPPackage "packages/services/Car/tests/CarDeveloperOptions/protos" ./packages_services_Car_tests_CarDeveloperOptions_protos.nix {})
    carsettings-contextual-card-protos-lite carsettings-log-bridge-protos-lite;

  inherit (callBPPackage "packages/services/Car/user/car-user-lib" ./packages_services_Car_user_car-user-lib.nix {})
    "android.car.userlib";

  inherit (callBPPackage "packages/services/Mms" ./packages_services_Mms.nix {})
    MmsService;

  inherit (callBPPackage "packages/services/Telecomm" ./packages_services_Telecomm.nix {})
    Telecom TelecomUnitTests;

  inherit (callBPPackage "packages/services/Telecomm/testapps" ./packages_services_Telecomm_testapps.nix {})
    TelecomTestApps;

  inherit (callBPPackage "packages/services/Telephony/ecc/conversion_toolset_v1/proto" ./packages_services_Telephony_ecc_conversion_toolset_v1_proto.nix {})
    ecc-protos-lite;

  inherit (callBPPackage "packages/wallpapers/LivePicker" ./packages_wallpapers_LivePicker.nix {})
    "android.software.live_wallpaper.xml" LiveWallpapersPicker;

  inherit (callBPPackage "platform_testing/libraries/annotations" ./platform_testing_libraries_annotations.nix {})
    platform-test-annotations platform-test-annotations-host;

  inherit (callBPPackage "platform_testing/libraries/aoa-helper" ./platform_testing_libraries_aoa-helper.nix {})
    aoa-helper aoa-helper-test;

  inherit (callBPPackage "platform_testing/libraries/app-helpers/core" ./platform_testing_libraries_app-helpers_core.nix {})
    app-helpers-core;

  inherit (callBPPackage "platform_testing/libraries/app-helpers/handheld" ./platform_testing_libraries_app-helpers_handheld.nix {})
    handheld-app-helpers;

  inherit (callBPPackage "platform_testing/libraries/app-helpers/handheld/business-card-app-helper" ./platform_testing_libraries_app-helpers_handheld_business-card-app-helper.nix {})
    business-card-app-helper;

  inherit (callBPPackage "platform_testing/libraries/app-helpers/handheld/performance-launch-app-helper" ./platform_testing_libraries_app-helpers_handheld_performance-launch-app-helper.nix {})
    performance-launch-app-helper;

  inherit (callBPPackage "platform_testing/libraries/app-helpers/interfaces" ./platform_testing_libraries_app-helpers_interfaces.nix {})
    app-helpers-auto-interfaces app-helpers-clockwork-interfaces app-helpers-common-interfaces app-helpers-handheld-interfaces app-helpers-tv-interfaces;

  inherit (callBPPackage "platform_testing/libraries/aupt-lib" ./platform_testing_libraries_aupt-lib.nix {})
    AuptLib AuptRunner;

  inherit (callBPPackage "platform_testing/libraries/car-helpers/multiuser-helper" ./platform_testing_libraries_car-helpers_multiuser-helper.nix {})
    multi-user-helper;

  inherit (callBPPackage "platform_testing/libraries/collectors-helper/jank" ./platform_testing_libraries_collectors-helper_jank.nix {})
    jank-helper;

  inherit (callBPPackage "platform_testing/libraries/collectors-helper/jank/test" ./platform_testing_libraries_collectors-helper_jank_test.nix {})
    jank-helper-test;

  inherit (callBPPackage "platform_testing/libraries/collectors-helper/memory" ./platform_testing_libraries_collectors-helper_memory.nix {})
    memory-helper;

  inherit (callBPPackage "platform_testing/libraries/collectors-helper/memory/test" ./platform_testing_libraries_collectors-helper_memory_test.nix {})
    memory-helper-test;

  inherit (callBPPackage "platform_testing/libraries/collectors-helper/perfetto" ./platform_testing_libraries_collectors-helper_perfetto.nix {})
    perfetto-helper;

  inherit (callBPPackage "platform_testing/libraries/collectors-helper/perfetto/test" ./platform_testing_libraries_collectors-helper_perfetto_test.nix {})
    perfetto-helper-test;

  inherit (callBPPackage "platform_testing/libraries/collectors-helper/statsd" ./platform_testing_libraries_collectors-helper_statsd.nix {})
    statsd-helper;

  inherit (callBPPackage "platform_testing/libraries/collectors-helper/statsd/test" ./platform_testing_libraries_collectors-helper_statsd_test.nix {})
    statsd-helper-test;

  inherit (callBPPackage "platform_testing/libraries/collectors-helper/system" ./platform_testing_libraries_collectors-helper_system.nix {})
    system-metric-helper;

  inherit (callBPPackage "platform_testing/libraries/collectors-helper/system/test" ./platform_testing_libraries_collectors-helper_system_test.nix {})
    system-helper-test;

  inherit (callBPPackage "platform_testing/libraries/collectors-helper/utilities" ./platform_testing_libraries_collectors-helper_utilities.nix {})
    collector-helper-utilities;

  inherit (callBPPackage "platform_testing/libraries/device-collectors/src/hostsidetests" ./platform_testing_libraries_device-collectors_src_hostsidetests.nix {})
    CollectorHostsideLibTest;

  inherit (callBPPackage "platform_testing/libraries/device-collectors/src/main" ./platform_testing_libraries_device-collectors_src_main.nix {})
    collector-device-lib;

  inherit (callBPPackage "platform_testing/libraries/device-collectors/src/main/platform-collectors" ./platform_testing_libraries_device-collectors_src_main_platform-collectors.nix {})
    collector-device-lib-platform statsd-config-protos;

  inherit (callBPPackage "platform_testing/libraries/device-collectors/src/test/java" ./platform_testing_libraries_device-collectors_src_test_java.nix {})
    CollectorDeviceLibTest;

  inherit (callBPPackage "platform_testing/libraries/device-collectors/src/test/platform" ./platform_testing_libraries_device-collectors_src_test_platform.nix {})
    CollectorDeviceLibPlatformTest;

  inherit (callBPPackage "platform_testing/libraries/health/composers/host" ./platform_testing_libraries_health_composers_host.nix {})
    test-composers;

  inherit (callBPPackage "platform_testing/libraries/health/composers/host/tests" ./platform_testing_libraries_health_composers_host_tests.nix {})
    HostTestComposersTests test-composers-tests;

  inherit (callBPPackage "platform_testing/libraries/health/composers/platform" ./platform_testing_libraries_health_composers_platform.nix {})
    platform-test-composers;

  inherit (callBPPackage "platform_testing/libraries/health/composers/platform/tests" ./platform_testing_libraries_health_composers_platform_tests.nix {})
    PlatformTestComposersTests;

  inherit (callBPPackage "platform_testing/libraries/health/options" ./platform_testing_libraries_health_options.nix {})
    platform-test-options;

  inherit (callBPPackage "platform_testing/libraries/health/options/tests" ./platform_testing_libraries_health_options_tests.nix {})
    PlatformTestOptionsTests;

  inherit (callBPPackage "platform_testing/libraries/health/rules" ./platform_testing_libraries_health_rules.nix {})
    platform-test-rules;

  inherit (callBPPackage "platform_testing/libraries/health/rules/tests" ./platform_testing_libraries_health_rules_tests.nix {})
    PlatformRuleTests;

  inherit (callBPPackage "platform_testing/libraries/health/runners/longevity/host" ./platform_testing_libraries_health_runners_longevity_host.nix {})
    longevity-base-lib longevity-host-lib;

  inherit (callBPPackage "platform_testing/libraries/health/runners/longevity/host/samples" ./platform_testing_libraries_health_runners_longevity_host_samples.nix {})
    LongevityHostLibSamples;

  inherit (callBPPackage "platform_testing/libraries/health/runners/longevity/host/tests" ./platform_testing_libraries_health_runners_longevity_host_tests.nix {})
    LongevityHostLibTests;

  inherit (callBPPackage "platform_testing/libraries/health/runners/longevity/platform" ./platform_testing_libraries_health_runners_longevity_platform.nix {})
    longevity-device-lib profile-proto-def;

  inherit (callBPPackage "platform_testing/libraries/health/runners/longevity/platform/samples" ./platform_testing_libraries_health_runners_longevity_platform_samples.nix {})
    LongevityPlatformLibSamples sample-profile-text-protos;

  inherit (callBPPackage "platform_testing/libraries/health/runners/longevity/platform/tests" ./platform_testing_libraries_health_runners_longevity_platform_tests.nix {})
    LongevityPlatformLibTests lib-test-profile-text-protos;

  inherit (callBPPackage "platform_testing/libraries/health/runners/microbenchmark" ./platform_testing_libraries_health_runners_microbenchmark.nix {})
    microbenchmark-device-lib;

  inherit (callBPPackage "platform_testing/libraries/health/runners/microbenchmark/tests" ./platform_testing_libraries_health_runners_microbenchmark_tests.nix {})
    MicrobenchmarkRunnerTests;

  inherit (callBPPackage "platform_testing/libraries/health/utils" ./platform_testing_libraries_health_utils.nix {})
    health-testing-utils;

  inherit (callBPPackage "platform_testing/libraries/health/utils/tests" ./platform_testing_libraries_health_utils_tests.nix {})
    HealthTestingUtilsTests;

  inherit (callBPPackage "platform_testing/libraries/junitxml" ./platform_testing_libraries_junitxml.nix {})
    junitxml;

  inherit (callBPPackage "platform_testing/libraries/launcher-helper" ./platform_testing_libraries_launcher-helper.nix {})
    launcher-helper-lib;

  inherit (callBPPackage "platform_testing/libraries/metrics-helper" ./platform_testing_libraries_metrics-helper.nix {})
    metrics-helper-lib;

  inherit (callBPPackage "platform_testing/libraries/metrics-helper/tests" ./platform_testing_libraries_metrics-helper_tests.nix {})
    MetricsHelperTests;

  inherit (callBPPackage "platform_testing/libraries/power-helper" ./platform_testing_libraries_power-helper.nix {})
    PowerTestHelper-src;

  inherit (callBPPackage "platform_testing/libraries/power-helper/sample" ./platform_testing_libraries_power-helper_sample.nix {})
    DummyPowerTest;

  inherit (callBPPackage "platform_testing/libraries/system-helpers" ./platform_testing_libraries_system-helpers.nix {})
    system-helpers;

  inherit (callBPPackage "platform_testing/libraries/system-helpers/accessibility-helper" ./platform_testing_libraries_system-helpers_accessibility-helper.nix {})
    accessibility-helper;

  inherit (callBPPackage "platform_testing/libraries/system-helpers/account-helper" ./platform_testing_libraries_system-helpers_account-helper.nix {})
    account-helper;

  inherit (callBPPackage "platform_testing/libraries/system-helpers/activity-helper" ./platform_testing_libraries_system-helpers_activity-helper.nix {})
    activity-helper;

  inherit (callBPPackage "platform_testing/libraries/system-helpers/commands-helper" ./platform_testing_libraries_system-helpers_commands-helper.nix {})
    commands-helper;

  inherit (callBPPackage "platform_testing/libraries/system-helpers/connectivity-helper" ./platform_testing_libraries_system-helpers_connectivity-helper.nix {})
    connectivity-helper;

  inherit (callBPPackage "platform_testing/libraries/system-helpers/device-helper" ./platform_testing_libraries_system-helpers_device-helper.nix {})
    device-helper;

  inherit (callBPPackage "platform_testing/libraries/system-helpers/package-helper" ./platform_testing_libraries_system-helpers_package-helper.nix {})
    package-helper;

  inherit (callBPPackage "platform_testing/libraries/system-helpers/permission-helper" ./platform_testing_libraries_system-helpers_permission-helper.nix {})
    permission-helper;

  inherit (callBPPackage "platform_testing/libraries/system-helpers/settings-helper" ./platform_testing_libraries_system-helpers_settings-helper.nix {})
    settings-helper;

  inherit (callBPPackage "platform_testing/libraries/system-helpers/sysui-helper" ./platform_testing_libraries_system-helpers_sysui-helper.nix {})
    sysui-helper;

  inherit (callBPPackage "platform_testing/libraries/system-helpers/user-helper" ./platform_testing_libraries_system-helpers_user-helper.nix {})
    user-helper;

  inherit (callBPPackage "platform_testing/libraries/telephony-utility" ./platform_testing_libraries_telephony-utility.nix {})
    TelephonyUtility;

  inherit (callBPPackage "platform_testing/libraries/timeresult-helper" ./platform_testing_libraries_timeresult-helper.nix {})
    timeresult-helper-lib;

  inherit (callBPPackage "platform_testing/tests/example/devcodelab" ./platform_testing_tests_example_devcodelab.nix {})
    DevCodelabTest;

  inherit (callBPPackage "platform_testing/tests/example/instrumentation" ./platform_testing_tests_example_instrumentation.nix {})
    HelloWorldTests;

  inherit (callBPPackage "platform_testing/tests/example/jarhosttest" ./platform_testing_tests_example_jarhosttest.nix {})
    HelloWorldHostTest;

  inherit (callBPPackage "platform_testing/tests/example/native" ./platform_testing_tests_example_native.nix {})
    hello_world_test;

  inherit (callBPPackage "platform_testing/tests/functional/applinktests" ./platform_testing_tests_functional_applinktests.nix {})
    AppLinkFunctionalTests;

  inherit (callBPPackage "platform_testing/tests/functional/appsmoke" ./platform_testing_tests_functional_appsmoke.nix {})
    AppSmoke;

  inherit (callBPPackage "platform_testing/tests/functional/calculator" ./platform_testing_tests_functional_calculator.nix {})
    CalculatorFunctionalTests;

  inherit (callBPPackage "platform_testing/tests/functional/devicehealthchecks" ./platform_testing_tests_functional_devicehealthchecks.nix {})
    DeviceHealthChecks;

  inherit (callBPPackage "platform_testing/tests/functional/devicehealthtests" ./platform_testing_tests_functional_devicehealthtests.nix {})
    DeviceHealthTests;

  inherit (callBPPackage "platform_testing/tests/functional/downloadapp" ./platform_testing_tests_functional_downloadapp.nix {})
    DownloadAppFunctionalTests;

  inherit (callBPPackage "platform_testing/tests/functional/notificationtests" ./platform_testing_tests_functional_notificationtests.nix {})
    NotificationFunctionalTests;

  inherit (callBPPackage "platform_testing/tests/functional/overviewtests" ./platform_testing_tests_functional_overviewtests.nix {})
    OverviewFunctionalTests;

  inherit (callBPPackage "platform_testing/tests/functional/permission" ./platform_testing_tests_functional_permission.nix {})
    PermissionFunctionalTests;

  inherit (callBPPackage "platform_testing/tests/functional/testapks/applinktestapp" ./platform_testing_tests_functional_testapks_applinktestapp.nix {})
    AppLinkTestApp;

  inherit (callBPPackage "platform_testing/tests/functional/testapks/permissiontestappmv1" ./platform_testing_tests_functional_testapks_permissiontestappmv1.nix {})
    PermissionTestAppMV1;

  inherit (callBPPackage "platform_testing/tests/health/scenarios" ./platform_testing_tests_health_scenarios.nix {})
    common-platform-scenarios;

  inherit (callBPPackage "platform_testing/tests/health/scenarios/tests" ./platform_testing_tests_health_scenarios_tests.nix {})
    PlatformCommonScenarioTests common-platform-scenario-tests common-profile-text-protos;

  inherit (callBPPackage "platform_testing/tests/jank/UbSystemUiJankTests" ./platform_testing_tests_jank_UbSystemUiJankTests.nix {})
    UbSystemUiJankTests;

  inherit (callBPPackage "platform_testing/tests/jank/androidtvjanktests" ./platform_testing_tests_jank_androidtvjanktests.nix {})
    AndroidTVJankTests;

  inherit (callBPPackage "platform_testing/tests/jank/dialer" ./platform_testing_tests_jank_dialer.nix {})
    DialerJankTests;

  inherit (callBPPackage "platform_testing/tests/jank/jankmicrobenchmark" ./platform_testing_tests_jank_jankmicrobenchmark.nix {})
    JankMicroBenchmarkTests;

  inherit (callBPPackage "platform_testing/tests/jank/sysapp_wear" ./platform_testing_tests_jank_sysapp_wear.nix {})
    SysAppJankTestsWear;

  inherit (callBPPackage "platform_testing/tests/jank/touch_latency_wear" ./platform_testing_tests_jank_touch_latency_wear.nix {})
    TouchLatencyJankTestWear;

  inherit (callBPPackage "platform_testing/tests/jank/uibench" ./platform_testing_tests_jank_uibench.nix {})
    UiBenchJankTests;

  inherit (callBPPackage "platform_testing/tests/jank/uibench_wear" ./platform_testing_tests_jank_uibench_wear.nix {})
    UiBenchJankTestsWear;

  inherit (callBPPackage "platform_testing/tests/jank/webview" ./platform_testing_tests_jank_webview.nix {})
    UbWebViewJankTests;

  inherit (callBPPackage "platform_testing/tests/perf/BootHelperApp" ./platform_testing_tests_perf_BootHelperApp.nix {})
    BootHelperApp;

  inherit (callBPPackage "platform_testing/tests/perf/PerfTransitionTest" ./platform_testing_tests_perf_PerfTransitionTest.nix {})
    AppTransitionTests;

  inherit (callBPPackage "platform_testing/tests/perf/PerformanceAppTest" ./platform_testing_tests_perf_PerformanceAppTest.nix {})
    PerformanceAppTest;

  inherit (callBPPackage "platform_testing/tests/perf/PerformanceLaunch" ./platform_testing_tests_perf_PerformanceLaunch.nix {})
    PerformanceLaunch;

  inherit (callBPPackage "platform_testing/tests/perf/PowerPerfTest" ./platform_testing_tests_perf_PowerPerfTest.nix {})
    PowerPerfTest;

  inherit (callBPPackage "platform_testing/utils/dpad" ./platform_testing_utils_dpad.nix {})
    dpad-util;

  inherit (callBPPackage "platform_testing/utils/esimutility" ./platform_testing_utils_esimutility.nix {})
    ESimUtility;

  inherit (callBPPackage "platform_testing/utils/permissions" ./platform_testing_utils_permissions.nix {})
    PermissionUtils permission-utils-lib;

  inherit (callBPPackage "platform_testing/utils/wifistrengthscanner" ./platform_testing_utils_wifistrengthscanner.nix {})
    WifiStrengthScannerUtil;

  inherit (callBPPackage "prebuilts/clang/host/darwin-x86" ./prebuilts_clang_host_darwin-x86.nix {})
    "libc++_darwin" "libc++abi_darwin" libLLVM_darwin libclang_cxx_darwin;

  inherit (callBPPackage "prebuilts/clang/host/linux-x86" ./prebuilts_clang_host_linux-x86.nix {})
    "libc++_host" "libc++abi_host" "libclang_rt.asan-aarch64-android" "libclang_rt.asan-arm-android" "libclang_rt.asan-i686-android" "libclang_rt.asan-x86_64-android" "libclang_rt.builtins-aarch64-android" "libclang_rt.builtins-arm-android" "libclang_rt.builtins-i686-android" "libclang_rt.builtins-x86_64-android" "libclang_rt.hwasan-aarch64-android" "libclang_rt.hwasan_static-aarch64-android" "libclang_rt.profile-aarch64-android" "libclang_rt.profile-arm-android" "libclang_rt.profile-i386" "libclang_rt.profile-i686-android" "libclang_rt.profile-x86_64" "libclang_rt.profile-x86_64-android" "libclang_rt.scudo-aarch64-android" "libclang_rt.scudo-aarch64-android.static" "libclang_rt.scudo-arm-android" "libclang_rt.scudo-arm-android.static" "libclang_rt.scudo-i686-android" "libclang_rt.scudo-i686-android.static" "libclang_rt.scudo-x86_64-android" "libclang_rt.scudo-x86_64-android.static" "libclang_rt.scudo_minimal-aarch64-android" "libclang_rt.scudo_minimal-aarch64-android.static" "libclang_rt.scudo_minimal-arm-android" "libclang_rt.scudo_minimal-arm-android.static" "libclang_rt.scudo_minimal-i686-android" "libclang_rt.scudo_minimal-i686-android.static" "libclang_rt.scudo_minimal-x86_64-android" "libclang_rt.scudo_minimal-x86_64-android.static" "libclang_rt.ubsan_minimal-aarch64-android" "libclang_rt.ubsan_minimal-arm-android" "libclang_rt.ubsan_minimal-i686-android" "libclang_rt.ubsan_minimal-x86_64-android" "libclang_rt.ubsan_standalone-aarch64-android" "libclang_rt.ubsan_standalone-arm-android" "libclang_rt.ubsan_standalone-i686-android" "libclang_rt.ubsan_standalone-x86_64-android" clang_builtin_headers_resources libFuzzer libLLVM_host libclang_cxx_host libomp llvm-build-host-tools-defaults;

  inherit (callBPPackage "prebuilts/clang/host/linux-x86/soong" ./prebuilts_clang_host_linux-x86_soong.nix {})
    soong-clang-prebuilts;

  inherit (callBPPackage "prebuilts/gcc/linux-x86/host/x86_64-w64-mingw32-4.8" ./prebuilts_gcc_linux-x86_host_x86_64-w64-mingw32-4.8.nix {})
    mingw-libwinpthread-notice;

  inherit (callBPPackage "prebuilts/gradle-plugin" ./prebuilts_gradle-plugin.nix {})
    metalava-gradle-plugin-deps;

  inherit (callBPPackage "prebuilts/manifest-merger" ./prebuilts_manifest-merger.nix {})
    manifest-merger manifest-merger-jars;

  inherit (callBPPackage "prebuilts/misc/common/android-support-test" ./prebuilts_misc_common_android-support-test.nix {})
    android-support-test android-support-test-monitor-nodep android-support-test-nodep android-support-test-rules-nodep android-support-test-runner-nodep espresso-contrib espresso-contrib-nodep espresso-core espresso-core-nodep espresso-idling-resource-nodep espresso-intents espresso-intents-nodep espresso-web espresso-web-nodep;

  inherit (callBPPackage "prebuilts/misc/common/androidx-test" ./prebuilts_misc_common_androidx-test.nix {})
    "androidx.test.core" "androidx.test.core-nodeps" "androidx.test.espresso.contrib" "androidx.test.espresso.contrib-nodeps" "androidx.test.espresso.core" "androidx.test.espresso.core-nodeps" "androidx.test.espresso.idling-resource" "androidx.test.espresso.idling-resource-nodeps" "androidx.test.espresso.intents" "androidx.test.espresso.intents-nodeps" "androidx.test.espresso.web" "androidx.test.espresso.web-nodeps" "androidx.test.ext.junit" "androidx.test.ext.junit-nodeps" "androidx.test.ext.truth" "androidx.test.ext.truth-nodeps" "androidx.test.janktesthelper" "androidx.test.janktesthelper-nodeps" "androidx.test.monitor" "androidx.test.monitor-nodeps" "androidx.test.rules" "androidx.test.rules-nodeps" "androidx.test.runner" "androidx.test.runner-nodeps" "androidx.test.uiautomator" "androidx.test.uiautomator-nodeps";

  inherit (callBPPackage "prebuilts/misc/common/antlr" ./prebuilts_misc_common_antlr.nix {})
    antlr;

  inherit (callBPPackage "prebuilts/misc/common/args4j" ./prebuilts_misc_common_args4j.nix {})
    "args4j-2.0.28";

  inherit (callBPPackage "prebuilts/misc/common/asm" ./prebuilts_misc_common_asm.nix {})
    "asm-5.2" "asm-6.0" "asm-analysis-5.2" "asm-analysis-6.0" "asm-commons-5.2" "asm-commons-6.0" "asm-tree-5.2" "asm-tree-6.0" "asm-util-6.0";

  inherit (callBPPackage "prebuilts/misc/common/commons-cli" ./prebuilts_misc_common_commons-cli.nix {})
    "commons-cli-1.2";

  inherit (callBPPackage "prebuilts/misc/common/commons-compress" ./prebuilts_misc_common_commons-compress.nix {})
    commons-compress-prebuilt;

  inherit (callBPPackage "prebuilts/misc/common/ddmlib" ./prebuilts_misc_common_ddmlib.nix {})
    ddmlib-prebuilt;

  inherit (callBPPackage "prebuilts/misc/common/devtools-annotations" ./prebuilts_misc_common_devtools-annotations.nix {})
    devtools-annotations-prebuilt;

  inherit (callBPPackage "prebuilts/misc/common/droiddriver" ./prebuilts_misc_common_droiddriver.nix {})
    "droiddriver-0.9-prebuilt" "droiddriver-1.0.0-BETA1-prebuilt";

  inherit (callBPPackage "prebuilts/misc/common/error_prone_annotations" ./prebuilts_misc_common_error_prone_annotations.nix {})
    "error_prone_annotations-2.0.18";

  inherit (callBPPackage "prebuilts/misc/common/frameworks" ./prebuilts_misc_common_frameworks.nix {})
    platformprotos;

  inherit (callBPPackage "prebuilts/misc/common/guava" ./prebuilts_misc_common_guava.nix {})
    "guava-21.0";

  inherit (callBPPackage "prebuilts/misc/common/jacoco" ./prebuilts_misc_common_jacoco.nix {})
    jvm-jacoco-agent jvm-jacoco-report jvm-jacoco-reporter;

  inherit (callBPPackage "prebuilts/misc/common/json" ./prebuilts_misc_common_json.nix {})
    json-prebuilt;

  inherit (callBPPackage "prebuilts/misc/common/jsr305" ./prebuilts_misc_common_jsr305.nix {})
    "jsr305-3.0.1";

  inherit (callBPPackage "prebuilts/misc/common/jython" ./prebuilts_misc_common_jython.nix {})
    jython;

  inherit (callBPPackage "prebuilts/misc/common/kxml2" ./prebuilts_misc_common_kxml2.nix {})
    "kxml2-2.3.0" kxml2-android;

  inherit (callBPPackage "prebuilts/misc/common/layoutlib_api" ./prebuilts_misc_common_layoutlib_api.nix {})
    layoutlib_api-prebuilt;

  inherit (callBPPackage "prebuilts/misc/common/nimbus-jose-jwt" ./prebuilts_misc_common_nimbus-jose-jwt.nix {})
    nimbus_jose_jwt;

  inherit (callBPPackage "prebuilts/misc/common/ninepatch" ./prebuilts_misc_common_ninepatch.nix {})
    ninepatch-prebuilt;

  inherit (callBPPackage "prebuilts/misc/common/perflib" ./prebuilts_misc_common_perflib.nix {})
    perflib-prebuilt;

  inherit (callBPPackage "prebuilts/misc/common/robolectric/3.6.1" ./prebuilts_misc_common_robolectric_3.6.1.nix {})
    "platform-robolectric-3.6.1-prebuilt";

  inherit (callBPPackage "prebuilts/misc/common/robolectric/3.6.2" ./prebuilts_misc_common_robolectric_3.6.2.nix {})
    "platform-robolectric-3.6.2-prebuilt";

  inherit (callBPPackage "prebuilts/misc/common/robolectric" ./prebuilts_misc_common_robolectric.nix {})
    platform-robolectric-android-all-stubs;

  inherit (callBPPackage "prebuilts/misc/common/sdk-common" ./prebuilts_misc_common_sdk-common.nix {})
    sdk-common;

  inherit (callBPPackage "prebuilts/misc/common/sdklib" ./prebuilts_misc_common_sdklib.nix {})
    sdklib-prebuilt;

  inherit (callBPPackage "prebuilts/misc/common/tools-common" ./prebuilts_misc_common_tools-common.nix {})
    tools-common-prebuilt;

  inherit (callBPPackage "prebuilts/misc/common/tradefed" ./prebuilts_misc_common_tradefed.nix {})
    tradefed-prebuilt-deprecated;

  inherit (callBPPackage "prebuilts/misc/common/ub-janktesthelper" ./prebuilts_misc_common_ub-janktesthelper.nix {})
    ub-janktesthelper;

  inherit (callBPPackage "prebuilts/misc/common/ub-uiautomator" ./prebuilts_misc_common_ub-uiautomator.nix {})
    "androidx.test.uiautomator_uiautomator" ub-uiautomator;

  inherit (callBPPackage "prebuilts/misc/gdbserver" ./prebuilts_misc_gdbserver.nix {})
    gdbserver;

  inherit (callBPPackage "prebuilts/ndk" ./prebuilts_ndk_android_native_app_glue.bp.nix {})
    android_native_app_glue;

  inherit (callBPPackage "prebuilts/ndk" ./prebuilts_ndk_cpufeatures.bp.nix {})
    cpufeatures;

  inherit (callBPPackage "prebuilts/r8" ./prebuilts_r8.nix {})
    d8 d8-compat-dx d8-compat-dx-master r8-compat-proguard r8-compat-proguard-master r8-master;

  inherit (callBPPackage "prebuilts/sdk" ./prebuilts_sdk.nix {})
    api-version-xml current-support-api last-released-public-api last-released-system-api metalava-sdk-android-jars public-api-incompatibilities-with-last-released sdk sdk-dir system-api-incompatibilities-with-last-released;

  inherit (callBPPackage "prebuilts/sdk/current/androidx-legacy" ./prebuilts_sdk_current_androidx-legacy.nix {})
    "androidx.legacy_legacy-preference-v14" "androidx.legacy_legacy-support-v4";

  inherit (callBPPackage "prebuilts/sdk/current/androidx" ./prebuilts_sdk_current_androidx.nix {})
    "androidx.activity_activity" "androidx.activity_activity-nodeps" "androidx.annotation_annotation" "androidx.annotation_annotation-nodeps" "androidx.appcompat_appcompat" "androidx.appcompat_appcompat-nodeps" "androidx.appcompat_appcompat-resources" "androidx.appcompat_appcompat-resources-nodeps" "androidx.arch.core_core-common" "androidx.arch.core_core-common-nodeps" "androidx.arch.core_core-runtime" "androidx.arch.core_core-runtime-nodeps" "androidx.asynclayoutinflater_asynclayoutinflater" "androidx.asynclayoutinflater_asynclayoutinflater-nodeps" "androidx.biometric_biometric" "androidx.biometric_biometric-nodeps" "androidx.browser_browser" "androidx.browser_browser-nodeps" "androidx.car_car" "androidx.car_car-cluster" "androidx.car_car-cluster-nodeps" "androidx.car_car-nodeps" "androidx.cardview_cardview" "androidx.cardview_cardview-nodeps" "androidx.collection_collection" "androidx.collection_collection-nodeps" "androidx.concurrent_concurrent-futures" "androidx.concurrent_concurrent-futures-nodeps" "androidx.coordinatorlayout_coordinatorlayout" "androidx.coordinatorlayout_coordinatorlayout-nodeps" "androidx.core_core" "androidx.core_core-nodeps" "androidx.cursoradapter_cursoradapter" "androidx.cursoradapter_cursoradapter-nodeps" "androidx.customview_customview" "androidx.customview_customview-nodeps" "androidx.documentfile_documentfile" "androidx.documentfile_documentfile-nodeps" "androidx.drawerlayout_drawerlayout" "androidx.drawerlayout_drawerlayout-nodeps" "androidx.dynamicanimation_dynamicanimation" "androidx.dynamicanimation_dynamicanimation-nodeps" "androidx.emoji_emoji" "androidx.emoji_emoji-appcompat" "androidx.emoji_emoji-appcompat-nodeps" "androidx.emoji_emoji-bundled" "androidx.emoji_emoji-bundled-nodeps" "androidx.emoji_emoji-nodeps" "androidx.exifinterface_exifinterface" "androidx.exifinterface_exifinterface-nodeps" "androidx.fragment_fragment" "androidx.fragment_fragment-nodeps" "androidx.gridlayout_gridlayout" "androidx.gridlayout_gridlayout-nodeps" "androidx.heifwriter_heifwriter" "androidx.heifwriter_heifwriter-nodeps" "androidx.interpolator_interpolator" "androidx.interpolator_interpolator-nodeps" "androidx.leanback_leanback" "androidx.leanback_leanback-nodeps" "androidx.leanback_leanback-preference" "androidx.leanback_leanback-preference-nodeps" "androidx.legacy_legacy-support-core-ui" "androidx.legacy_legacy-support-core-ui-nodeps" "androidx.legacy_legacy-support-core-utils" "androidx.legacy_legacy-support-core-utils-nodeps" "androidx.legacy_legacy-support-v13" "androidx.legacy_legacy-support-v13-nodeps" "androidx.lifecycle_lifecycle-common" "androidx.lifecycle_lifecycle-common-java8" "androidx.lifecycle_lifecycle-common-java8-nodeps" "androidx.lifecycle_lifecycle-common-nodeps" "androidx.lifecycle_lifecycle-extensions" "androidx.lifecycle_lifecycle-extensions-nodeps" "androidx.lifecycle_lifecycle-livedata" "androidx.lifecycle_lifecycle-livedata-core" "androidx.lifecycle_lifecycle-livedata-core-nodeps" "androidx.lifecycle_lifecycle-livedata-nodeps" "androidx.lifecycle_lifecycle-process" "androidx.lifecycle_lifecycle-process-nodeps" "androidx.lifecycle_lifecycle-runtime" "androidx.lifecycle_lifecycle-runtime-nodeps" "androidx.lifecycle_lifecycle-service" "androidx.lifecycle_lifecycle-service-nodeps" "androidx.lifecycle_lifecycle-viewmodel" "androidx.lifecycle_lifecycle-viewmodel-nodeps" "androidx.loader_loader" "androidx.loader_loader-nodeps" "androidx.localbroadcastmanager_localbroadcastmanager" "androidx.localbroadcastmanager_localbroadcastmanager-nodeps" "androidx.media2_media2" "androidx.media2_media2-exoplayer" "androidx.media2_media2-exoplayer-nodeps" "androidx.media2_media2-nodeps" "androidx.media2_media2-widget" "androidx.media2_media2-widget-nodeps" "androidx.media_media" "androidx.media_media-nodeps" "androidx.mediarouter_mediarouter" "androidx.mediarouter_mediarouter-nodeps" "androidx.paging_paging-common" "androidx.paging_paging-common-nodeps" "androidx.paging_paging-runtime" "androidx.paging_paging-runtime-nodeps" "androidx.palette_palette" "androidx.palette_palette-nodeps" "androidx.percentlayout_percentlayout" "androidx.percentlayout_percentlayout-nodeps" "androidx.preference_preference" "androidx.preference_preference-nodeps" "androidx.print_print" "androidx.print_print-nodeps" "androidx.recommendation_recommendation" "androidx.recommendation_recommendation-nodeps" "androidx.recyclerview_recyclerview" "androidx.recyclerview_recyclerview-nodeps" "androidx.recyclerview_recyclerview-selection" "androidx.recyclerview_recyclerview-selection-nodeps" "androidx.remotecallback_remotecallback" "androidx.remotecallback_remotecallback-nodeps" "androidx.remotecallback_remotecallback-processor" "androidx.remotecallback_remotecallback-processor-nodeps" "androidx.room_room-common" "androidx.room_room-common-nodeps" "androidx.room_room-runtime" "androidx.room_room-runtime-nodeps" "androidx.savedstate_savedstate" "androidx.savedstate_savedstate-nodeps" "androidx.slice_slice-builders" "androidx.slice_slice-builders-nodeps" "androidx.slice_slice-core" "androidx.slice_slice-core-nodeps" "androidx.slice_slice-view" "androidx.slice_slice-view-nodeps" "androidx.slidingpanelayout_slidingpanelayout" "androidx.slidingpanelayout_slidingpanelayout-nodeps" "androidx.sqlite_sqlite" "androidx.sqlite_sqlite-framework" "androidx.sqlite_sqlite-framework-nodeps" "androidx.sqlite_sqlite-nodeps" "androidx.swiperefreshlayout_swiperefreshlayout" "androidx.swiperefreshlayout_swiperefreshlayout-nodeps" "androidx.textclassifier_textclassifier" "androidx.textclassifier_textclassifier-nodeps" "androidx.transition_transition" "androidx.transition_transition-nodeps" "androidx.tvprovider_tvprovider" "androidx.tvprovider_tvprovider-nodeps" "androidx.vectordrawable_vectordrawable" "androidx.vectordrawable_vectordrawable-animated" "androidx.vectordrawable_vectordrawable-animated-nodeps" "androidx.vectordrawable_vectordrawable-nodeps" "androidx.versionedparcelable_versionedparcelable" "androidx.versionedparcelable_versionedparcelable-nodeps" "androidx.viewpager_viewpager" "androidx.viewpager_viewpager-nodeps" "androidx.wear_wear" "androidx.wear_wear-nodeps" "androidx.webkit_webkit" "androidx.webkit_webkit-nodeps";

  inherit (callBPPackage "prebuilts/sdk/current/extras/app-toolkit" ./prebuilts_sdk_current_extras_app-toolkit.nix {})
    android-arch-core-common android-arch-core-common-nodeps android-arch-core-runtime android-arch-core-runtime-nodeps android-arch-lifecycle-common android-arch-lifecycle-common-java8 android-arch-lifecycle-common-java8-nodeps android-arch-lifecycle-common-nodeps android-arch-lifecycle-extensions android-arch-lifecycle-extensions-nodeps android-arch-lifecycle-livedata android-arch-lifecycle-livedata-core android-arch-lifecycle-livedata-core-nodeps android-arch-lifecycle-livedata-nodeps android-arch-lifecycle-runtime android-arch-lifecycle-runtime-nodeps android-arch-lifecycle-viewmodel android-arch-lifecycle-viewmodel-nodeps android-arch-paging-common android-arch-paging-common-nodeps android-arch-paging-runtime android-arch-paging-runtime-nodeps android-arch-persistence-db android-arch-persistence-db-framework android-arch-persistence-db-framework-nodeps android-arch-persistence-db-nodeps android-arch-room-common android-arch-room-common-nodeps android-arch-room-runtime android-arch-room-runtime-nodeps;

  inherit (callBPPackage "prebuilts/sdk/current/extras/constraint-layout-x" ./prebuilts_sdk_current_extras_constraint-layout-x.nix {})
    androidx-constraintlayout_constraintlayout androidx-constraintlayout_constraintlayout-nodeps androidx-constraintlayout_constraintlayout-solver androidx-constraintlayout_constraintlayout-solver-nodeps;

  inherit (callBPPackage "prebuilts/sdk/current/extras/constraint-layout" ./prebuilts_sdk_current_extras_constraint-layout.nix {})
    android-support-constraint-layout android-support-constraint-layout-nodeps android-support-constraint-layout-solver android-support-constraint-layout-solver-nodeps;

  inherit (callBPPackage "prebuilts/sdk/current/extras/material-design-x" ./prebuilts_sdk_current_extras_material-design-x.nix {})
    "com.google.android.material_material" "com.google.android.material_material-nodeps";

  inherit (callBPPackage "prebuilts/sdk/current/extras/material-design" ./prebuilts_sdk_current_extras_material-design.nix {})
    android-support-design android-support-design-nodeps;

  inherit (callBPPackage "prebuilts/sdk/current/optional" ./prebuilts_sdk_current_optional.nix {})
    "prebuilt-android.car-stubs";

  inherit (callBPPackage "prebuilts/sdk/current/support" ./prebuilts_sdk_current_support.nix {})
    android-slices-builders android-slices-builders-nodeps android-slices-core android-slices-core-nodeps android-slices-view android-slices-view-nodeps android-support-animatedvectordrawable android-support-animatedvectordrawable-nodeps android-support-annotations android-support-annotations-nodeps android-support-asynclayoutinflater android-support-asynclayoutinflater-nodeps android-support-car android-support-car-nodeps android-support-collections android-support-collections-nodeps android-support-compat android-support-compat-nodeps android-support-coordinatorlayout android-support-coordinatorlayout-nodeps android-support-core-ui android-support-core-ui-nodeps android-support-core-utils android-support-core-utils-nodeps android-support-cursoradapter android-support-cursoradapter-nodeps android-support-customtabs android-support-customtabs-nodeps android-support-customview android-support-customview-nodeps android-support-documentfile android-support-documentfile-nodeps android-support-drawerlayout android-support-drawerlayout-nodeps android-support-dynamic-animation android-support-dynamic-animation-nodeps android-support-emoji android-support-emoji-appcompat android-support-emoji-appcompat-nodeps android-support-emoji-bundled android-support-emoji-bundled-nodeps android-support-emoji-nodeps android-support-exifinterface android-support-exifinterface-nodeps android-support-fragment android-support-fragment-nodeps android-support-heifwriter android-support-heifwriter-nodeps android-support-interpolator android-support-interpolator-nodeps android-support-loader android-support-loader-nodeps android-support-localbroadcastmanager android-support-localbroadcastmanager-nodeps android-support-media-compat android-support-media-compat-nodeps android-support-percent android-support-percent-nodeps android-support-print android-support-print-nodeps android-support-recommendation android-support-recommendation-nodeps android-support-recyclerview-selection android-support-recyclerview-selection-nodeps android-support-slidingpanelayout android-support-slidingpanelayout-nodeps android-support-swiperefreshlayout android-support-swiperefreshlayout-nodeps android-support-transition android-support-transition-nodeps android-support-tv-provider android-support-tv-provider-nodeps android-support-v13 android-support-v13-nodeps android-support-v14-preference android-support-v14-preference-nodeps android-support-v17-leanback android-support-v17-leanback-nodeps android-support-v17-preference-leanback android-support-v17-preference-leanback-nodeps android-support-v4 android-support-v4-nodeps android-support-v7-appcompat android-support-v7-appcompat-nodeps android-support-v7-cardview android-support-v7-cardview-nodeps android-support-v7-gridlayout android-support-v7-gridlayout-nodeps android-support-v7-mediarouter android-support-v7-mediarouter-nodeps android-support-v7-palette android-support-v7-palette-nodeps android-support-v7-preference android-support-v7-preference-nodeps android-support-v7-recyclerview android-support-v7-recyclerview-nodeps android-support-vectordrawable android-support-vectordrawable-nodeps android-support-viewpager android-support-viewpager-nodeps android-support-wear android-support-wear-nodeps android-support-webkit android-support-webkit-nodeps android-versionedparcelable android-versionedparcelable-nodeps;

  inherit (callBPPackage "prebuilts/sdk/tools/jetifier/jetifier-standalone" ./prebuilts_sdk_tools_jetifier_jetifier-standalone.nix {})
    jetifier jetifier-prebuilt-jar;

  inherit (callBPPackage "prebuilts/tools" ./prebuilts_tools.nix {})
    api-versions-jars-dir;

  inherit (callBPPackage "prebuilts/tools/common/google-api-java-client/1.23.0" ./prebuilts_tools_common_google-api-java-client_1.23.0.nix {})
    google-api-java-client-min-repackaged;

  inherit (callBPPackage "prebuilts/tools/common/google-api-services-compute" ./prebuilts_tools_common_google-api-services-compute.nix {})
    google-api-services-compute;

  inherit (callBPPackage "prebuilts/tools/common/google-api-services-storage/1.23.0" ./prebuilts_tools_common_google-api-services-storage_1.23.0.nix {})
    google-api-services-storage;

  inherit (callBPPackage "prebuilts/tools/common/m2" ./prebuilts_tools_common_m2.nix {})
    "dagger2-2.19" "dagger2-compiler-2.19" "dagger2-compiler-2.19-import" accessibility-test-framework asm-analysis-prebuilt-host-jar asm-commons-prebuilt-host-jar asm-commons-prebuilt-jar asm-prebuilt-host-jar asm-prebuilt-jar asm-tree-prebuilt-host-jar asm-tree-prebuilt-jar asm-util-prebuilt-host-jar assertj-core-prebuilt-jar byte-buddy-prebuilt-jar car-androidx-room-compiler-tools-common-m2-deps gson-prebuilt-jar guava-listenablefuture-prebuilt-jar guava-prebuilt-host-jar javapoet-prebuilt-jar javawriter jna-prebuilt metalava-tools-common-m2-deps mockito-robolectric-prebuilt mockito2-prebuilt-jar objenesis-prebuilt-jar protobuf-java-host-prebuilt protobuf-java-prebuilt-jar protobuf-java-util-prebuilt-jar squareup-haha-prebuilt trove-prebuilt truth-host-prebuilt truth-prebuilt truth-prebuilt-host-jar truth-prebuilt-jar;

  inherit (callBPPackage "prebuilts/tools/common/m2/repository/io/grpc/grpc-context" ./prebuilts_tools_common_m2_repository_io_grpc_grpc-context.nix {})
    "grpc-java-context-1.0.1";

  inherit (callBPPackage "prebuilts/tools/common/m2/repository/io/grpc/grpc-core" ./prebuilts_tools_common_m2_repository_io_grpc_grpc-core.nix {})
    "grpc-java-core-1.0.1";

  inherit (callBPPackage "prebuilts/tools/common/m2/repository/io/grpc/grpc-netty" ./prebuilts_tools_common_m2_repository_io_grpc_grpc-netty.nix {})
    "grpc-java-netty-1.0.1";

  inherit (callBPPackage "prebuilts/tools/common/m2/repository/io/grpc/grpc-protobuf-lite" ./prebuilts_tools_common_m2_repository_io_grpc_grpc-protobuf-lite.nix {})
    "grpc-java-protobuf-lite-1.0.1";

  inherit (callBPPackage "prebuilts/tools/common/m2/repository/io/grpc/grpc-protobuf" ./prebuilts_tools_common_m2_repository_io_grpc_grpc-protobuf.nix {})
    "grpc-java-protobuf-1.0.1";

  inherit (callBPPackage "prebuilts/tools/common/m2/repository/io/grpc/grpc-stub" ./prebuilts_tools_common_m2_repository_io_grpc_grpc-stub.nix {})
    "grpc-java-stub-1.0.1";

  inherit (callBPPackage "prebuilts/tools/common/m2/repository/io/netty/netty-buffer" ./prebuilts_tools_common_m2_repository_io_netty_netty-buffer.nix {})
    "netty-buffer-java-4.1.3.Final";

  inherit (callBPPackage "prebuilts/tools/common/m2/repository/io/netty/netty-codec-http2" ./prebuilts_tools_common_m2_repository_io_netty_netty-codec-http2.nix {})
    "netty-codec-http2-java-4.1.3.Final";

  inherit (callBPPackage "prebuilts/tools/common/m2/repository/io/netty/netty-codec" ./prebuilts_tools_common_m2_repository_io_netty_netty-codec.nix {})
    "netty-codec-java-4.1.3.Final";

  inherit (callBPPackage "prebuilts/tools/common/m2/repository/io/netty/netty-common" ./prebuilts_tools_common_m2_repository_io_netty_netty-common.nix {})
    "netty-common-java-4.1.3.Final";

  inherit (callBPPackage "prebuilts/tools/common/m2/repository/io/netty/netty-handler" ./prebuilts_tools_common_m2_repository_io_netty_netty-handler.nix {})
    "netty-handler-java-4.1.3.Final";

  inherit (callBPPackage "prebuilts/tools/common/m2/repository/io/netty/netty-resolver" ./prebuilts_tools_common_m2_repository_io_netty_netty-resolver.nix {})
    "netty-resolver-java-4.1.3.Final";

  inherit (callBPPackage "prebuilts/tools/common/m2/repository/io/netty/netty-transport" ./prebuilts_tools_common_m2_repository_io_netty_netty-transport.nix {})
    "netty-transport-java-4.1.3.Final";

  inherit (callBPPackage "prebuilts/tools/common/m2/repository/net/sf/jopt-simple/jopt-simple/4.9" ./prebuilts_tools_common_m2_repository_net_sf_jopt-simple_jopt-simple_4.9.nix {})
    "jopt-simple-4.9";

  inherit (callBPPackage "prebuilts/tools/common/netbeans-visual" ./prebuilts_tools_common_netbeans-visual.nix {})
    org-netbeans-api-visual org-openide-util;

  inherit (callBPPackage "system/apex/apexd" ./system_apex_apexd.nix {})
    apex_aidl_interface apex_database_test apex_defaults apex_file_test apex_flags_defaults apex_manifest_test apexd apexservice_test gen_bad_apexes gen_corrupt_apex libapex libapexd libapexd_checkpoint_vold libapexservice libapexservice-deps;

  inherit (callBPPackage "system/apex/apexd/apexd_testdata" ./system_apex_apexd_apexd_testdata.nix {})
    "apex.apexd_test" "apex.apexd_test_different_app" "apex.apexd_test_no_inst_key" "apex.apexd_test_postinstall" "apex.apexd_test_preinstall" "apex.apexd_test_prepostinstall.fail" "apex.apexd_test_v2" "com.android.apex.test_package.key" "com.android.apex.test_package.no_inst_key.key" "com.android.apex.test_package.postinstall.key" "com.android.apex.test_package.preinstall.key" "com.android.apex.test_package.prepostinstall.fail.key" "com.android.apex.test_package_2.key" apex_test_postInstallHook apex_test_preInstallHook apex_test_prePostInstallHookFail;

  inherit (callBPPackage "system/apex/apexd/sysprop" ./system_apex_apexd_sysprop.nix {})
    "com.android.sysprop.apex" "com.android.sysprop.apex.apis" apex-properties;

  inherit (callBPPackage "system/apex/apexer" ./system_apex_apexer.nix {})
    "com.android.support.apexer" "com.android.support.apexer.key" apexer;

  inherit (callBPPackage "system/apex/proto" ./system_apex_proto.nix {})
    apex_manifest_proto lib_apex_manifest_proto lib_apex_session_state_proto;

  inherit (callBPPackage "system/apex/shim" ./system_apex_shim.nix {})
    "com.android.apex.cts.shim.v1_prebuilt" "com.android.apex.cts.shim.v2_additional_file_prebuilt" "com.android.apex.cts.shim.v2_additional_folder_prebuilt" "com.android.apex.cts.shim.v2_prebuilt" "com.android.apex.cts.shim.v2_with_post_install_hook_prebuilt" "com.android.apex.cts.shim.v2_with_pre_install_hook_prebuilt" "com.android.apex.cts.shim.v2_wrong_sha_prebuilt";

  inherit (callBPPackage "system/apex/shim/build" ./system_apex_shim_build.nix {})
    "com.android.apex.cts.shim.key" "com.android.apex.cts.shim.pem" "com.android.apex.cts.shim.pubkey" "com.android.apex.cts.shim.v1" "com.android.apex.cts.shim.v2" "com.android.apex.cts.shim.v2_additional_file" "com.android.apex.cts.shim.v2_additional_folder" "com.android.apex.cts.shim.v2_with_post_install_hook" "com.android.apex.cts.shim.v2_with_pre_install_hook" "com.android.apex.cts.shim.v2_wrong_sha" "com.android.apex.cts.shim.v3" "com.android.apex.cts.shim_not_pre_installed" "com.android.apex.cts.shim_not_pre_installed.key" "com.android.apex.cts.shim_not_pre_installed.pem" "com.android.apex.cts.shim_not_pre_installed.pubkey" apex_shim_additional_file apex_shim_additional_folder empty_hash generate_empty_hash generate_hash_of_dev_null generate_hash_v1 hash_of_dev_null hash_v1;

  inherit (callBPPackage "system/apex/tests" ./system_apex_tests.nix {})
    "apex.test" "apex.test.certificate" "apex.test.init.rc" "apex.test.key" "apex.test.ld.config.txt" apex_e2e_base_test apex_targetprep_tests apex_test_build_features conscrypt_e2e_tests media_e2e_tests media_swcodec_e2e_tests sample_prebuilt_file timezone_data_e2e_tests;

  inherit (callBPPackage "system/ashmemd" ./system_ashmemd.nix {})
    ashmemd ashmemd_aidl_interface ashmemd_defaults ashmemd_test libashmemd_client;

  inherit (callBPPackage "system/bpf" ./system_bpf.nix {})
    bpf_defaults;

  inherit (callBPPackage "system/bpf/bpfloader" ./system_bpf_bpfloader.nix {})
    bpfloader;

  inherit (callBPPackage "system/bpf/libbpf_android" ./system_bpf_libbpf_android.nix {})
    libbpf_android libbpf_android_headers libbpf_android_test libbpf_load_test;

  inherit (callBPPackage "system/bpfprogs" ./system_bpfprogs.nix {})
    "time_in_state.o";

  inherit (callBPPackage "system/bpfprogs/test" ./system_bpfprogs_test.nix {})
    "bpf_load_tp_prog.o";

  inherit (callBPPackage "system/bt" ./system_bt.nix {})
    BluetoothTestConfigTemplate;

  inherit (callBPPackage "system/bt/audio_a2dp_hw" ./system_bt_audio_a2dp_hw.nix {})
    "audio.a2dp.default" audio_a2dp_hw_defaults libaudio-a2dp-hw-utils net_test_audio_a2dp_hw;

  inherit (callBPPackage "system/bt/audio_bluetooth_hw" ./system_bt_audio_bluetooth_hw.nix {})
    "audio.bluetooth.default" audio_bluetooth_hw_test;

  inherit (callBPPackage "system/bt/audio_hal_interface" ./system_bt_audio_hal_interface.nix {})
    bluetooth-test-audio-hal-interface libbt-audio-hal-interface;

  inherit (callBPPackage "system/bt/audio_hearing_aid_hw" ./system_bt_audio_hearing_aid_hw.nix {})
    "audio.hearing_aid.default" audio_hearing_aid_hw_defaults libaudio-hearing-aid-hw-utils net_test_audio_hearing_aid_hw;

  inherit (callBPPackage "system/bt/binder" ./system_bt_binder.nix {})
    libbluetooth-binder libbluetooth-binder-aidl;

  inherit (callBPPackage "system/bt/bta" ./system_bt_bta.nix {})
    fluoride_bta_defaults libbt-bta net_test_bta;

  inherit (callBPPackage "system/bt/btcore" ./system_bt_btcore.nix {})
    libbtcore net_test_btcore;

  inherit (callBPPackage "system/bt/btif" ./system_bt_btif.nix {})
    libbtif net_test_btif net_test_btif_profile_queue net_test_btif_rc;

  inherit (callBPPackage "system/bt/build" ./system_bt_build.nix {})
    clang_coverage_bin clang_file_coverage fluoride_defaults fluoride_types_defaults libchrome_support_defaults soong-fluoride;

  inherit (callBPPackage "system/bt/common" ./system_bt_common.nix {})
    bluetooth_benchmark_thread_performance bluetooth_benchmark_timer_performance bluetooth_test_common libbt-common net_test_performance;

  inherit (callBPPackage "system/bt/conf" ./system_bt_conf.nix {})
    "bt_did.conf" "bt_stack.conf";

  inherit (callBPPackage "system/bt/embdrv/g722" ./system_bt_embdrv_g722.nix {})
    libg722codec;

  inherit (callBPPackage "system/bt/embdrv/sbc/decoder" ./system_bt_embdrv_sbc_decoder.nix {})
    libbt-sbc-decoder;

  inherit (callBPPackage "system/bt/embdrv/sbc/encoder" ./system_bt_embdrv_sbc_encoder.nix {})
    libbt-sbc-encoder;

  inherit (callBPPackage "system/bt/gd" ./system_bt_gd.nix {})
    bluetooth_benchmark_gd bluetooth_test_gd gd_clang_coverage_bin gd_clang_file_coverage gd_defaults libbluetooth_gd;

  inherit (callBPPackage "system/bt/gd/common" ./system_bt_gd_common.nix {})
    BluetoothCommonSources BluetoothCommonTestSources;

  inherit (callBPPackage "system/bt/gd/os" ./system_bt_gd_os.nix {})
    BluetoothOsBenchmarkSources BluetoothOsSources_linux_generic BluetoothOsTestSources_linux_generic;

  inherit (callBPPackage "system/bt/gd/packet" ./system_bt_gd_packet.nix {})
    BluetoothPacketSources BluetoothPacketTestSources;

  inherit (callBPPackage "system/bt/hci" ./system_bt_hci.nix {})
    libbt-hci libbt-hci_defaults net_test_hci;

  inherit (callBPPackage "system/bt/include" ./system_bt_include.nix {})
    avrcp_headers libbluetooth_headers;

  inherit (callBPPackage "system/bt/internal_include" ./system_bt_internal_include.nix {})
    internal_include_headers;

  inherit (callBPPackage "system/bt/main" ./system_bt_main.nix {})
    libbluetooth libbluetooth-for-tests;

  inherit (callBPPackage "system/bt/osi" ./system_bt_osi.nix {})
    fluoride_osi_defaults libosi libosi-AlarmTestHarness libosi-AllocationTestHarness net_test_osi;

  inherit (callBPPackage "system/bt/packet" ./system_bt_packet.nix {})
    lib-bt-packets net_test_btpackets;

  inherit (callBPPackage "system/bt/packet/avrcp" ./system_bt_packet_avrcp.nix {})
    lib-bt-packets-avrcp;

  inherit (callBPPackage "system/bt/packet/base" ./system_bt_packet_base.nix {})
    lib-bt-packets-base;

  inherit (callBPPackage "system/bt/profile/avrcp" ./system_bt_profile_avrcp.nix {})
    avrcp-target-service net_test_avrcp;

  inherit (callBPPackage "system/bt/profile/sdp" ./system_bt_profile_sdp.nix {})
    bluetooth_test_sdp sdp_service;

  inherit (callBPPackage "system/bt/proto" ./system_bt_proto.nix {})
    bluetooth-protos-lite libbt-protos-lite;

  inherit (callBPPackage "system/bt/service" ./system_bt_service.nix {})
    bluetooth-cli bluetoothtbd bluetoothtbd_test bt-example-hr-server fluoride_service_defaults libbluetoothtbd_hal;

  inherit (callBPPackage "system/bt/service/common" ./system_bt_service_common.nix {})
    libbluetooth-binder-common libbluetooth-common;

  inherit (callBPPackage "system/bt/stack" ./system_bt_stack.nix {})
    libbt-stack net_test_btu_message_loop net_test_gatt_conn_multiplexing net_test_stack net_test_stack_ad_parser net_test_stack_multi_adv net_test_stack_rfcomm net_test_stack_smp;

  inherit (callBPPackage "system/bt/test/rootcanal" ./system_bt_test_rootcanal.nix {})
    "android.hardware.bluetooth@1.0-impl-sim" "android.hardware.bluetooth@1.0-service.sim";

  inherit (callBPPackage "system/bt/test/suite" ./system_bt_test_suite.nix {})
    net_test_bluetooth net_test_rfcomm_suite;

  inherit (callBPPackage "system/bt/types" ./system_bt_types.nix {})
    libbluetooth-types libbluetooth-types-header net_test_types;

  inherit (callBPPackage "system/bt/udrv" ./system_bt_udrv.nix {})
    libudrv-uipc;

  inherit (callBPPackage "system/bt/utils" ./system_bt_utils.nix {})
    libbt-utils;

  inherit (callBPPackage "system/bt/vendor_libs/linux/interface" ./system_bt_vendor_libs_linux_interface.nix {})
    "android.hardware.bluetooth@1.0-service.btlinux";

  inherit (callBPPackage "system/bt/vendor_libs/test_vendor_lib" ./system_bt_vendor_libs_test_vendor_lib.nix {})
    libbt-rootcanal root-canal test-vendor_test_host;

  inherit (callBPPackage "system/bt/vendor_libs/test_vendor_lib/packets" ./system_bt_vendor_libs_test_vendor_lib_packets.nix {})
    libbt-rootcanal-packets rootcanal-packets_test_host;

  inherit (callBPPackage "system/bt/vendor_libs/test_vendor_lib/types" ./system_bt_vendor_libs_test_vendor_lib_types.nix {})
    libbt-rootcanal-types libbt-rootcanal-types-header rootcanal-test_types;

  inherit (callBPPackage "system/ca-certificates" ./system_ca-certificates.nix {})
    cacerts cacerts-host;

  inherit (callBPPackage "system/ca-certificates/google" ./system_ca-certificates_google.nix {})
    cacerts_google cacerts_google-host;

  inherit (callBPPackage "system/ca-certificates/soong" ./system_ca-certificates_soong.nix {})
    soong-ca-certificates;

  inherit (callBPPackage "system/ca-certificates/wfa_certs" ./system_ca-certificates_wfa_certs.nix {})
    cacerts_wfa cacerts_wfa-host;

  inherit (callBPPackage "system/chre" ./system_chre.nix {})
    "android.hardware.contexthub@1.0-impl.generic" audio_stress_test chre_api chre_client chre_flatbuffers chre_test_client;

  inherit (callBPPackage "system/chre/apps/chqts/src" ./system_chre_apps_chqts_src.nix {})
    nanoapp_chqts_shared_tests;

  inherit (callBPPackage "system/chre/apps/wifi_offload" ./system_chre_apps_wifi_offload.nix {})
    wifi_offload_types;

  inherit (callBPPackage "system/connectivity/wificond" ./system_connectivity_wificond.nix {})
    libwificond libwificond_event_loop libwificond_ipc libwificond_nl libwificond_test_utils wificond wificond_defaults wificond_integration_test wificond_unit_test;

  inherit (callBPPackage "system/connectivity/wifilogd" ./system_connectivity_wifilogd.nix {})
    libwifilogd libwifilogd_flags wifilogd_unit_test;

  inherit (callBPPackage "system/core" ./system_core.nix {})
    android_filesystem_config_header;

  inherit (callBPPackage "system/core/adb" ./system_core_adb.nix {})
    abb adb adb_benchmark adb_defaults adb_integration_test_adb adb_integration_test_device adb_test adbd adbd_defaults adbd_test host_adbd_supported libadb_host libadbd libadbd_core libadbd_services;

  inherit (callBPPackage "system/core/adb/fastdeploy" ./system_core_adb_fastdeploy.nix {})
    deployagent deploypatchgenerator;

  inherit (callBPPackage "system/core/base" ./system_core_base.nix {})
    libbase libbase_cflags_defaults libbase_defaults libbase_headers libbase_ndk libbase_test;

  inherit (callBPPackage "system/core/bootstat" ./system_core_bootstat.nix {})
    bootstat bootstat_defaults bootstat_tests libbootstat libbootstat_debug;

  inherit (callBPPackage "system/core/cpio" ./system_core_cpio.nix {})
    mkbootfs;

  inherit (callBPPackage "system/core/debuggerd" ./system_core_debuggerd.nix {})
    crash_dump debuggerd debuggerd_benchmark debuggerd_defaults debuggerd_test libdebuggerd libdebuggerd_client libdebuggerd_common_headers libdebuggerd_handler libdebuggerd_handler_core libdebuggerd_handler_fallback libtombstoned_client libtombstoned_client_static tombstoned;

  inherit (callBPPackage "system/core/debuggerd/crasher" ./system_core_debuggerd_crasher.nix {})
    crasher crasher-defaults static_crasher;

  inherit (callBPPackage "system/core/demangle" ./system_core_demangle.nix {})
    demangle libdemangle libdemangle_defaults libdemangle_test;

  inherit (callBPPackage "system/core/deprecated-adf/libadf" ./system_core_deprecated-adf_libadf.nix {})
    libadf;

  inherit (callBPPackage "system/core/deprecated-adf/libadf/tests" ./system_core_deprecated-adf_libadf_tests.nix {})
    adf-unit-tests;

  inherit (callBPPackage "system/core/deprecated-adf/libadfhwc" ./system_core_deprecated-adf_libadfhwc.nix {})
    libadfhwc;

  inherit (callBPPackage "system/core/diagnose_usb" ./system_core_diagnose_usb.nix {})
    libdiagnose_usb;

  inherit (callBPPackage "system/core/fastboot" ./system_core_fastboot.nix {})
    fastboot fastboot_defaults fastboot_host_defaults fastboot_test fastbootd libfastboot libfastboot2;

  inherit (callBPPackage "system/core/fastboot/fuzzy_fastboot" ./system_core_fastboot_fuzzy_fastboot.nix {})
    fuzzy_fastboot;

  inherit (callBPPackage "system/core/fs_mgr" ./system_core_fs_mgr.nix {})
    fs_mgr_defaults libfs_mgr libfstab remount;

  inherit (callBPPackage "system/core/fs_mgr/libdm" ./system_core_fs_mgr_libdm.nix {})
    libdm libdm_test;

  inherit (callBPPackage "system/core/fs_mgr/libfiemap_writer" ./system_core_fs_mgr_libfiemap_writer.nix {})
    fiemap_writer_test libfiemap_writer;

  inherit (callBPPackage "system/core/fs_mgr/libfs_avb" ./system_core_fs_mgr_libfs_avb.nix {})
    libfs_avb libfs_avb_device_test libfs_avb_host_test_defaults libfs_avb_internal_test libfs_avb_test libfs_avb_test_util;

  inherit (callBPPackage "system/core/fs_mgr/liblp" ./system_core_fs_mgr_liblp.nix {})
    liblp liblp_test_static;

  inherit (callBPPackage "system/core/fs_mgr/tests" ./system_core_fs_mgr_tests.nix {})
    "adb-remount-test.sh" adb-remount-sh fs_mgr_unit_test fs_mgr_vendor_overlay_test;

  inherit (callBPPackage "system/core/fs_mgr/tools" ./system_core_fs_mgr_tools.nix {})
    dmctl;

  inherit (callBPPackage "system/core/gatekeeperd" ./system_core_gatekeeperd.nix {})
    gatekeeperd;

  inherit (callBPPackage "system/core/gatekeeperd/tests" ./system_core_gatekeeperd_tests.nix {})
    gatekeeperd-unit-tests;

  inherit (callBPPackage "system/core/healthd" ./system_core_healthd.nix {})
    "android.hardware.health@2.0-service" "android.hardware.health@2.0-service_defaults" healthd libbatterymonitor libhealthd_charger_nops libhealthd_headers;

  inherit (callBPPackage "system/core/init" ./system_core_init.nix {})
    generated_stub_builtin_function_map host_init_verifier init_benchmarks init_defaults init_second_stage init_tests libinit;

  inherit (callBPPackage "system/core/init/test_service" ./system_core_init_test_service.nix {})
    test_service;

  inherit (callBPPackage "system/core/libappfuse" ./system_core_libappfuse.nix {})
    libappfuse libappfuse_defaults libappfuse_test;

  inherit (callBPPackage "system/core/libasyncio" ./system_core_libasyncio.nix {})
    libasyncio libasyncio_defaults;

  inherit (callBPPackage "system/core/libbacktrace" ./system_core_libbacktrace.nix {})
    backtrace_benchmarks backtrace_test libbacktrace libbacktrace_common libbacktrace_headers libbacktrace_test;

  inherit (callBPPackage "system/core/libbinderwrapper" ./system_core_libbinderwrapper.nix {})
    libbinderwrapper libbinderwrapper_defaults libbinderwrapper_test_support;

  inherit (callBPPackage "system/core/libcrypto_utils" ./system_core_libcrypto_utils.nix {})
    libcrypto_utils;

  inherit (callBPPackage "system/core/libcrypto_utils/tests" ./system_core_libcrypto_utils_tests.nix {})
    libcrypto_utils_test;

  inherit (callBPPackage "system/core/libcutils" ./system_core_libcutils.nix {})
    libcutils libcutils_headers libcutils_test libcutils_test_default libcutils_test_static;

  inherit (callBPPackage "system/core/libdiskconfig" ./system_core_libdiskconfig.nix {})
    libdiskconfig;

  inherit (callBPPackage "system/core/libgrallocusage" ./system_core_libgrallocusage.nix {})
    libgrallocusage;

  inherit (callBPPackage "system/core/libion" ./system_core_libion.nix {})
    iontest libion;

  inherit (callBPPackage "system/core/libion/tests" ./system_core_libion_tests.nix {})
    ion-unit-tests;

  inherit (callBPPackage "system/core/libkeyutils" ./system_core_libkeyutils.nix {})
    libkeyutils libkeyutils-tests mini-keyctl;

  inherit (callBPPackage "system/core/liblog" ./system_core_liblog.nix {})
    liblog liblog_headers;

  inherit (callBPPackage "system/core/liblog/tests" ./system_core_liblog_tests.nix {})
    CtsLiblogTestCases liblog-benchmarks liblog-tests-defaults liblog-unit-tests;

  inherit (callBPPackage "system/core/libmeminfo" ./system_core_libmeminfo.nix {})
    libmeminfo libmeminfo_benchmark libmeminfo_defaults libmeminfo_test;

  inherit (callBPPackage "system/core/libmeminfo/libdmabufinfo" ./system_core_libmeminfo_libdmabufinfo.nix {})
    dmabufinfo_defaults dmabufinfo_test libdmabufinfo;

  inherit (callBPPackage "system/core/libmeminfo/libdmabufinfo/tools" ./system_core_libmeminfo_libdmabufinfo_tools.nix {})
    dmabuf_dump;

  inherit (callBPPackage "system/core/libmeminfo/tools" ./system_core_libmeminfo_tools.nix {})
    librank procmem procrank showmap wsstop;

  inherit (callBPPackage "system/core/libmeminfo/vts" ./system_core_libmeminfo_vts.nix {})
    vts_meminfo_test;

  inherit (callBPPackage "system/core/libmemtrack" ./system_core_libmemtrack.nix {})
    libmemtrack memtrack_test;

  inherit (callBPPackage "system/core/libmemunreachable" ./system_core_libmemunreachable.nix {})
    libmemunreachable libmemunreachable_defaults memunreachable_binder_test memunreachable_test;

  inherit (callBPPackage "system/core/libmetricslogger" ./system_core_libmetricslogger.nix {})
    libmetricslogger libmetricslogger_debug metricslogger_defaults metricslogger_tests;

  inherit (callBPPackage "system/core/libnativebridge" ./system_core_libnativebridge.nix {})
    libnativebridge libnativebridge-defaults libnativebridge-headers libnativebridge_lazy;

  inherit (callBPPackage "system/core/libnativebridge/tests" ./system_core_libnativebridge_tests.nix {})
    libnativebridge-api-tests libnativebridge-dummy libnativebridge-dummy-defaults libnativebridge-lazy-tests libnativebridge-tests libnativebridge-tests-defaults libnativebridge2-dummy libnativebridge3-dummy;

  inherit (callBPPackage "system/core/libnativeloader" ./system_core_libnativeloader.nix {})
    libnativeloader libnativeloader-defaults libnativeloader-dummy-headers libnativeloader-headers libnativeloader_lazy;

  inherit (callBPPackage "system/core/libnativeloader/test" ./system_core_libnativeloader_test.nix {})
    "libbar.oem1" "libbar.oem2" "libbar.product1" "libfoo.oem1" "libfoo.oem2" "libfoo.product1" libnativeloader-api-tests;

  inherit (callBPPackage "system/core/libnetutils" ./system_core_libnetutils.nix {})
    dhcpdbg libnetutils;

  inherit (callBPPackage "system/core/libpackagelistparser" ./system_core_libpackagelistparser.nix {})
    libpackagelistparser;

  inherit (callBPPackage "system/core/libpixelflinger" ./system_core_libpixelflinger.nix {})
    libpixelflinger libpixelflinger-arm libpixelflinger_internal pixelflinger_defaults;

  inherit (callBPPackage "system/core/libpixelflinger/tests" ./system_core_libpixelflinger_tests.nix {})
    pixelflinger-tests;

  inherit (callBPPackage "system/core/libpixelflinger/tests/arch-arm64" ./system_core_libpixelflinger_tests_arch-arm64.nix {})
    pixelflinger-tests-arm64;

  inherit (callBPPackage "system/core/libpixelflinger/tests/arch-arm64/assembler" ./system_core_libpixelflinger_tests_arch-arm64_assembler.nix {})
    test-pixelflinger-arm64-assembler-test;

  inherit (callBPPackage "system/core/libpixelflinger/tests/arch-arm64/col32cb16blend" ./system_core_libpixelflinger_tests_arch-arm64_col32cb16blend.nix {})
    test-pixelflinger-arm64-col32cb16blend;

  inherit (callBPPackage "system/core/libpixelflinger/tests/arch-arm64/disassembler" ./system_core_libpixelflinger_tests_arch-arm64_disassembler.nix {})
    test-pixelflinger-arm64-disassembler-test;

  inherit (callBPPackage "system/core/libpixelflinger/tests/arch-arm64/t32cb16blend" ./system_core_libpixelflinger_tests_arch-arm64_t32cb16blend.nix {})
    test-pixelflinger-arm64-t32cb16blend;

  inherit (callBPPackage "system/core/libpixelflinger/tests/arch-mips" ./system_core_libpixelflinger_tests_arch-mips.nix {})
    pixelflinger-tests-mips;

  inherit (callBPPackage "system/core/libpixelflinger/tests/arch-mips/col32cb16blend" ./system_core_libpixelflinger_tests_arch-mips_col32cb16blend.nix {})
    test-pixelflinger-mips-col32cb16blend;

  inherit (callBPPackage "system/core/libpixelflinger/tests/arch-mips/t32cb16blend" ./system_core_libpixelflinger_tests_arch-mips_t32cb16blend.nix {})
    test-pixelflinger-mips-t32cb16blend;

  inherit (callBPPackage "system/core/libpixelflinger/tests/arch-mips64" ./system_core_libpixelflinger_tests_arch-mips64.nix {})
    pixelflinger-tests-mips64;

  inherit (callBPPackage "system/core/libpixelflinger/tests/arch-mips64/assembler" ./system_core_libpixelflinger_tests_arch-mips64_assembler.nix {})
    test-pixelflinger-mips64-assembler-test;

  inherit (callBPPackage "system/core/libpixelflinger/tests/arch-mips64/col32cb16blend" ./system_core_libpixelflinger_tests_arch-mips64_col32cb16blend.nix {})
    test-pixelflinger-mips64-col32cb16blend;

  inherit (callBPPackage "system/core/libpixelflinger/tests/arch-mips64/disassembler" ./system_core_libpixelflinger_tests_arch-mips64_disassembler.nix {})
    test-pixelflinger-mips64-disassembler-test;

  inherit (callBPPackage "system/core/libpixelflinger/tests/codegen" ./system_core_libpixelflinger_tests_codegen.nix {})
    test-opengl-codegen;

  inherit (callBPPackage "system/core/libpixelflinger/tests/gglmul" ./system_core_libpixelflinger_tests_gglmul.nix {})
    test-pixelflinger-gglmul;

  inherit (callBPPackage "system/core/libprocessgroup" ./system_core_libprocessgroup.nix {})
    libprocessgroup libprocessgroup_headers;

  inherit (callBPPackage "system/core/libprocessgroup/cgrouprc" ./system_core_libprocessgroup_cgrouprc.nix {})
    libcgrouprc;

  inherit (callBPPackage "system/core/libprocessgroup/cgrouprc_format" ./system_core_libprocessgroup_cgrouprc_format.nix {})
    libcgrouprc_format;

  inherit (callBPPackage "system/core/libprocessgroup/profiles" ./system_core_libprocessgroup_profiles.nix {})
    "cgroups.json" "cgroups.recovery.json" "task_profiles.json" libprocessgroup_proto libprocessgroup_proto_test libprocessgroup_test_defaults vts_processgroup_validate_test;

  inherit (callBPPackage "system/core/libprocessgroup/setup" ./system_core_libprocessgroup_setup.nix {})
    libprocessgroup_setup;

  inherit (callBPPackage "system/core/libprocinfo" ./system_core_libprocinfo.nix {})
    libprocinfo libprocinfo_benchmark libprocinfo_defaults libprocinfo_test;

  inherit (callBPPackage "system/core/libqtaguid" ./system_core_libqtaguid.nix {})
    libqtaguid libqtaguid_headers;

  inherit (callBPPackage "system/core/libsparse" ./system_core_libsparse.nix {})
    "simg_dump.py" append2simg img2simg libsparse simg2img;

  inherit (callBPPackage "system/core/libstats" ./system_core_libstats.nix {})
    libstatssocket;

  inherit (callBPPackage "system/core/libsuspend" ./system_core_libsuspend.nix {})
    libsuspend;

  inherit (callBPPackage "system/core/libsync" ./system_core_libsync.nix {})
    libsync libsync_defaults sync-unit-tests;

  inherit (callBPPackage "system/core/libsystem" ./system_core_libsystem.nix {})
    libsystem_headers;

  inherit (callBPPackage "system/core/libsysutils" ./system_core_libsysutils.nix {})
    libsysutils libsysutils_tests;

  inherit (callBPPackage "system/core/libunwindstack" ./system_core_libunwindstack.nix {})
    gen_gnudebugdata libunwindstack libunwindstack_flags libunwindstack_local libunwindstack_test libunwindstack_tools unwind unwind_benchmarks unwind_for_offline unwind_info unwind_reg_info unwind_symbols;

  inherit (callBPPackage "system/core/libusbhost" ./system_core_libusbhost.nix {})
    libusbhost;

  inherit (callBPPackage "system/core/libutils" ./system_core_libutils.nix {})
    libutils libutils_defaults libutils_headers libutils_singleton_test libutils_test libutils_test_singleton1 libutils_test_singleton2 libutilscallstack;

  inherit (callBPPackage "system/core/libvndksupport" ./system_core_libvndksupport.nix {})
    libvndksupport;

  inherit (callBPPackage "system/core/libvndksupport/tests" ./system_core_libvndksupport_tests.nix {})
    libvndksupport-tests;

  inherit (callBPPackage "system/core/libziparchive" ./system_core_libziparchive.nix {})
    libziparchive libziparchive_defaults libziparchive_flags unzip ziparchive-benchmarks ziparchive-tests;

  inherit (callBPPackage "system/core/llkd" ./system_core_llkd.nix {})
    libllkd llkd llkd_headers;

  inherit (callBPPackage "system/core/llkd/tests" ./system_core_llkd_tests.nix {})
    llkd_unit_test;

  inherit (callBPPackage "system/core/lmkd" ./system_core_lmkd.nix {})
    liblmkd_utils libstatslogc lmkd;

  inherit (callBPPackage "system/core/lmkd/libpsi" ./system_core_lmkd_libpsi.nix {})
    libpsi libpsi_headers;

  inherit (callBPPackage "system/core/lmkd/tests" ./system_core_lmkd_tests.nix {})
    lmkd_unit_test;

  inherit (callBPPackage "system/core/logcat" ./system_core_logcat.nix {})
    "logpersist.start" logcat logcat_defaults logcatd;

  inherit (callBPPackage "system/core/logcat/tests" ./system_core_logcat_tests.nix {})
    logcat-benchmarks logcat-tests-defaults logcat-unit-tests;

  inherit (callBPPackage "system/core/logd" ./system_core_logd.nix {})
    "logtagd.rc" auditctl liblogd logd;

  inherit (callBPPackage "system/core/logd/tests" ./system_core_logd_tests.nix {})
    CtsLogdTestCases logd-unit-test-defaults logd-unit-tests;

  inherit (callBPPackage "system/core/logwrapper" ./system_core_logwrapper.nix {})
    android_fork_execvp_ext_benchmark liblogwrap logwrapper logwrapper_common logwrapper_defaults logwrapper_vendor;

  inherit (callBPPackage "system/core/mkbootimg" ./system_core_mkbootimg.nix {})
    bootimg_headers libmkbootimg_abi_check libmkbootimg_abi_headers mkbootimg mkbootimg_defaults unpack_bootimg;

  inherit (callBPPackage "system/core/property_service/libpropertyinfoparser" ./system_core_property_service_libpropertyinfoparser.nix {})
    libpropertyinfoparser;

  inherit (callBPPackage "system/core/property_service/libpropertyinfoserializer" ./system_core_property_service_libpropertyinfoserializer.nix {})
    libpropertyinfoserializer propertyinfoserializer_defaults propertyinfoserializer_tests;

  inherit (callBPPackage "system/core/property_service/property_info_checker" ./system_core_property_service_property_info_checker.nix {})
    property_info_checker;

  inherit (callBPPackage "system/core/qemu_pipe" ./system_core_qemu_pipe.nix {})
    libqemu_pipe;

  inherit (callBPPackage "system/core/reboot" ./system_core_reboot.nix {})
    reboot;

  inherit (callBPPackage "system/core/run-as" ./system_core_run-as.nix {})
    run-as;

  inherit (callBPPackage "system/core/sdcard" ./system_core_sdcard.nix {})
    sdcard;

  inherit (callBPPackage "system/core/shell_and_utilities" ./system_core_shell_and_utilities.nix {})
    shell_and_utilities shell_and_utilities_recovery shell_and_utilities_system shell_and_utilities_vendor;

  inherit (callBPPackage "system/core/storaged" ./system_core_storaged.nix {})
    libstoraged storaged storaged-unit-tests storaged_aidl storaged_aidl_private storaged_defaults;

  inherit (callBPPackage "system/core/toolbox" ./system_core_toolbox.nix {})
    grep grep_common grep_vendor r toolbox toolbox_binary_defaults toolbox_defaults toolbox_input_labels toolbox_vendor;

  inherit (callBPPackage "system/core/trusty/gatekeeper" ./system_core_trusty_gatekeeper.nix {})
    "gatekeeper.trusty";

  inherit (callBPPackage "system/core/trusty/keymaster" ./system_core_trusty_keymaster.nix {})
    "android.hardware.keymaster@3.0-service.trusty" "keystore.trusty" trusty_keymaster_tipc;

  inherit (callBPPackage "system/core/trusty/libtrusty" ./system_core_trusty_libtrusty.nix {})
    libtrusty;

  inherit (callBPPackage "system/core/trusty/libtrusty/tipc-test" ./system_core_trusty_libtrusty_tipc-test.nix {})
    tipc-test;

  inherit (callBPPackage "system/core/trusty/storage/interface" ./system_core_trusty_storage_interface.nix {})
    libtrustystorageinterface;

  inherit (callBPPackage "system/core/trusty/storage/lib" ./system_core_trusty_storage_lib.nix {})
    libtrustystorage;

  inherit (callBPPackage "system/core/trusty/storage/proxy" ./system_core_trusty_storage_proxy.nix {})
    storageproxyd;

  inherit (callBPPackage "system/core/trusty/storage/tests" ./system_core_trusty_storage_tests.nix {})
    secure-storage-unit-test;

  inherit (callBPPackage "system/core/trusty/utils/trusty-ut-ctrl" ./system_core_trusty_utils_trusty-ut-ctrl.nix {})
    trusty-ut-ctrl;

  inherit (callBPPackage "system/core/usbd" ./system_core_usbd.nix {})
    usbd;

  inherit (callBPPackage "system/core/watchdogd" ./system_core_watchdogd.nix {})
    watchdogd;

  inherit (callBPPackage "system/extras/ANRdaemon" ./system_extras_ANRdaemon.nix {})
    anrd;

  inherit (callBPPackage "system/extras/alloc-stress" ./system_extras_alloc-stress.nix {})
    alloc-stress mem-pressure;

  inherit (callBPPackage "system/extras/app-launcher" ./system_extras_app-launcher.nix {})
    app-launcher computestats computestats-defaults computestatsf;

  inherit (callBPPackage "system/extras/boot_control_copy" ./system_extras_boot_control_copy.nix {})
    "bootctrl.copy";

  inherit (callBPPackage "system/extras/bootctl" ./system_extras_bootctl.nix {})
    bootctl;

  inherit (callBPPackage "system/extras/boottime_tools/bootanalyze/stressfs" ./system_extras_boottime_tools_bootanalyze_stressfs.nix {})
    StressFS;

  inherit (callBPPackage "system/extras/boottime_tools/bootio" ./system_extras_boottime_tools_bootio.nix {})
    bootio bootio_defaults libbootio;

  inherit (callBPPackage "system/extras/checkpoint_gc" ./system_extras_checkpoint_gc.nix {})
    checkpoint_gc;

  inherit (callBPPackage "system/extras/cppreopts" ./system_extras_cppreopts.nix {})
    "cppreopts.sh" "fstab.postinstall" "preloads_copy.sh";

  inherit (callBPPackage "system/extras/cpustats" ./system_extras_cpustats.nix {})
    cpustats;

  inherit (callBPPackage "system/extras/crypto-perf" ./system_extras_crypto-perf.nix {})
    crypto;

  inherit (callBPPackage "system/extras/ext4_utils" ./system_extras_ext4_utils.nix {})
    "mke2fs.conf" blk_alloc_to_base_fs libext4_utils mkuserimg_mke2fs;

  inherit (callBPPackage "system/extras/f2fs_utils" ./system_extras_f2fs_utils.nix {})
    "mkf2fsuserimg.sh" f2fs_sparseblock libf2fs_sparseblock;

  inherit (callBPPackage "system/extras/ioblame" ./system_extras_ioblame.nix {})
    ioblame;

  inherit (callBPPackage "system/extras/ioshark" ./system_extras_ioshark.nix {})
    compile_ioshark convert_format dump_ioshark_filenames ioshark_bench ioshark_defaults;

  inherit (callBPPackage "system/extras/iotop" ./system_extras_iotop.nix {})
    iotop;

  inherit (callBPPackage "system/extras/kexec_tools" ./system_extras_kexec_tools.nix {})
    kexecload;

  inherit (callBPPackage "system/extras/latencytop" ./system_extras_latencytop.nix {})
    latencytop;

  inherit (callBPPackage "system/extras/libfec" ./system_extras_libfec.nix {})
    libfec;

  inherit (callBPPackage "system/extras/libfec/test" ./system_extras_libfec_test.nix {})
    fec_test_defaults fec_test_read fec_test_rs;

  inherit (callBPPackage "system/extras/libfscrypt" ./system_extras_libfscrypt.nix {})
    libfscrypt;

  inherit (callBPPackage "system/extras/libjsonpb/parse" ./system_extras_libjsonpb_parse.nix {})
    libjsonpbparse;

  inherit (callBPPackage "system/extras/libjsonpb/verify" ./system_extras_libjsonpb_verify.nix {})
    libjsonpbverify libjsonpbverify_test;

  inherit (callBPPackage "system/extras/libperfmgr" ./system_extras_libperfmgr.nix {})
    libperfmgr libperfmgr_defaults libperfmgr_test perfmgr_config_verifier;

  inherit (callBPPackage "system/extras/memory_replay" ./system_extras_memory_replay.nix {})
    memory_replay memory_replay_defaults memory_replay_tests;

  inherit (callBPPackage "system/extras/memtrack" ./system_extras_memtrack.nix {})
    memtrack memtrack_defaults memtrack_share;

  inherit (callBPPackage "system/extras/mmap-perf" ./system_extras_mmap-perf.nix {})
    mmapPerf;

  inherit (callBPPackage "system/extras/multinetwork" ./system_extras_multinetwork.nix {})
    dnschk httpurl multinetwork_defaults;

  inherit (callBPPackage "system/extras/pagecache" ./system_extras_pagecache.nix {})
    dumpcache;

  inherit (callBPPackage "system/extras/partition_tools" ./system_extras_partition_tools.nix {})
    liblpdump lp_defaults lpdump lpdumpd lpflash lpmake lpunpack;

  inherit (callBPPackage "system/extras/partition_tools/aidl" ./system_extras_partition_tools_aidl.nix {})
    liblpdump_interface;

  inherit (callBPPackage "system/extras/perfprofd" ./system_extras_perfprofd.nix {})
    libperfprofd_proto_config libperfprofd_record_proto libperfprofdcore libperfprofdcore_defaults libperfprofdcored perfprofd perfprofd_config_proto perfprofd_debug_defaults perfprofd_defaults perfprofd_record_proto;

  inherit (callBPPackage "system/extras/perfprofd/binder_interface" ./system_extras_perfprofd_binder_interface.nix {})
    libperfprofd_binder perfprofd_aidl;

  inherit (callBPPackage "system/extras/perfprofd/dropbox" ./system_extras_perfprofd_dropbox.nix {})
    libperfprofd_dropbox;

  inherit (callBPPackage "system/extras/perfprofd/scripts" ./system_extras_perfprofd_scripts.nix {})
    perf_config_proto perf_proto_flames perf_proto_json2sqlite perf_proto_stack perfprofd_python_default;

  inherit (callBPPackage "system/extras/perfprofd/tests" ./system_extras_perfprofd_tests.nix {})
    perfprofd_test perfprofd_test_defaults;

  inherit (callBPPackage "system/extras/postinst" ./system_extras_postinst.nix {})
    postinst_example;

  inherit (callBPPackage "system/extras/preopt2cachename" ./system_extras_preopt2cachename.nix {})
    preopt2cachename;

  inherit (callBPPackage "system/extras/puncture_fs" ./system_extras_puncture_fs.nix {})
    puncture_fs;

  inherit (callBPPackage "system/extras/runconuid" ./system_extras_runconuid.nix {})
    runconuid;

  inherit (callBPPackage "system/extras/sane_schedstat" ./system_extras_sane_schedstat.nix {})
    sane_schedstat;

  inherit (callBPPackage "system/extras/showslab" ./system_extras_showslab.nix {})
    showslab;

  inherit (callBPPackage "system/extras/simpleperf" ./system_extras_simpleperf.nix {})
    libsimpleperf libsimpleperf_cts_test libsimpleperf_dex_read libsimpleperf_dex_read_static_reqs_defaults libsimpleperf_elf_read libsimpleperf_elf_read_static_reqs_defaults libsimpleperf_inplace_sampler libsimpleperf_record libsimpleperf_report libsimpleperf_srcs simpleperf simpleperf_cflags simpleperf_cpu_hotplug_test simpleperf_defaults simpleperf_libs_for_tests simpleperf_ndk simpleperf_record_test simpleperf_shared_libs simpleperf_static_libs simpleperf_test_srcs simpleperf_unit_test;

  inherit (callBPPackage "system/extras/simpleperf/runtest" ./system_extras_simpleperf_runtest.nix {})
    simpleperf_runtest_comm_change simpleperf_runtest_defaults simpleperf_runtest_function_fork simpleperf_runtest_function_indirect_recursive simpleperf_runtest_function_pthread simpleperf_runtest_function_recursive simpleperf_runtest_one_function simpleperf_runtest_run_and_sleep simpleperf_runtest_two_functions;

  inherit (callBPPackage "system/extras/simpleperf/scripts/inferno" ./system_extras_simpleperf_scripts_inferno.nix {})
    simpleperf-inferno;

  inherit (callBPPackage "system/extras/simpleperf/simpleperf_app_runner" ./system_extras_simpleperf_simpleperf_app_runner.nix {})
    simpleperf_app_runner;

  inherit (callBPPackage "system/extras/sound" ./system_extras_sound.nix {})
    sound;

  inherit (callBPPackage "system/extras/squashfs_utils" ./system_extras_squashfs_utils.nix {})
    "mksquashfsimage.sh" libsquashfs_utils;

  inherit (callBPPackage "system/extras/taskstats" ./system_extras_taskstats.nix {})
    taskstats;

  inherit (callBPPackage "system/extras/tests/audio/alsa" ./system_extras_tests_audio_alsa.nix {})
    pcmtest;

  inherit (callBPPackage "system/extras/tests/binder/benchmarks" ./system_extras_tests_binder_benchmarks.nix {})
    binderAddInts;

  inherit (callBPPackage "system/extras/tests/cpueater" ./system_extras_tests_cpueater.nix {})
    cpueater daemonize;

  inherit (callBPPackage "system/extras/tests/crypto" ./system_extras_tests_crypto.nix {})
    get_dm_versions;

  inherit (callBPPackage "system/extras/tests/directiotest" ./system_extras_tests_directiotest.nix {})
    directiotest;

  inherit (callBPPackage "system/extras/tests/framebuffer" ./system_extras_tests_framebuffer.nix {})
    test-fb-refresh test-fb-simple;

  inherit (callBPPackage "system/extras/tests/fstest" ./system_extras_tests_fstest.nix {})
    recovery_test;

  inherit (callBPPackage "system/extras/tests/icachetest" ./system_extras_tests_icachetest.nix {})
    icache;

  inherit (callBPPackage "system/extras/tests/iptables/qtaguid" ./system_extras_tests_iptables_qtaguid.nix {})
    socketTag;

  inherit (callBPPackage "system/extras/tests/lib/testUtil" ./system_extras_tests_lib_testUtil.nix {})
    libtestUtil;

  inherit (callBPPackage "system/extras/tests/pftest" ./system_extras_tests_pftest.nix {})
    pftest;

  inherit (callBPPackage "system/extras/tests/schedtest" ./system_extras_tests_schedtest.nix {})
    schedtest;

  inherit (callBPPackage "system/extras/tests/storage" ./system_extras_tests_storage.nix {})
    opentest wipe_blkdev;

  inherit (callBPPackage "system/extras/tests/suspend_stress" ./system_extras_tests_suspend_stress.nix {})
    suspend_stress;

  inherit (callBPPackage "system/extras/tests/tcp_nuke_addr" ./system_extras_tests_tcp_nuke_addr.nix {})
    tcp_nuke_addr_test;

  inherit (callBPPackage "system/extras/tests/timetest" ./system_extras_tests_timetest.nix {})
    time-unit-tests timetest;

  inherit (callBPPackage "system/extras/tests/uevents" ./system_extras_tests_uevents.nix {})
    uevents;

  inherit (callBPPackage "system/extras/toolchain-extras" ./system_extras_toolchain-extras.nix {})
    libprofile-defaults libprofile-extras libprofile-extras-test libprofile-extras_ndk;

  inherit (callBPPackage "system/extras/verity" ./system_extras_verity.nix {})
    "build_verity_metadata.py" BootSignature VeritySigner boot_signer build_verity_tree build_verity_tree_test generate_verity_key libverity_tree verity_signer verity_tree_defaults verity_verifier;

  inherit (callBPPackage "system/extras/verity/fec" ./system_extras_verity_fec.nix {})
    fec;

  inherit (callBPPackage "system/extras/zram-perf" ./system_extras_zram-perf.nix {})
    zram-perf;

  inherit (callBPPackage "system/gatekeeper" ./system_gatekeeper.nix {})
    libgatekeeper libgatekeeper_static;

  inherit (callBPPackage "system/gatekeeper/tests" ./system_gatekeeper_tests.nix {})
    gatekeeper-unit-tests;

  inherit (callBPPackage "system/gsid" ./system_gsid.nix {})
    gsi_aidl_interface gsi_boot_test gsi_tool gsid gsiservice_aidl libgsi libgsi_headers;

  inherit (callBPPackage "system/hwservicemanager" ./system_hwservicemanager.nix {})
    hwservicemanager hwservicemanager_defaults hwservicemanager_test libhwservicemanager libhwservicemanager_shared_libs libtokenmanager libtokenmanager_shared_libs;

  inherit (callBPPackage "system/iorap" ./system_iorap.nix {})
    "iorap.cmd.perfetto" "iorap.inode2filename" iorap-aidl iorap-default-dependencies iorap-default-flags iorapd iorapd-tests libiorap-binder libiorap-inode2filename libiorap-manager libiorap-manager-default-dependencies libiorap-perfetto libiorap-perfetto-default-dependencies libiorap-perfetto-protos;

  inherit (callBPPackage "system/keymaster" ./system_keymaster.nix {})
    libkeymaster3device libkeymaster4 libkeymaster_messages libkeymaster_portable libkeymasterfiles libpuresoftkeymasterdevice libsoftkeymasterdevice;

  inherit (callBPPackage "system/libfmq" ./system_libfmq.nix {})
    libfmq;

  inherit (callBPPackage "system/libfmq/tests" ./system_libfmq_tests.nix {})
    mq_test mq_test_client;

  inherit (callBPPackage "system/libhidl" ./system_libhidl.nix {})
    libhidl-defaults libhidl_test libhidlbase libhidlbase-combined-impl libhidlbase_pgo libhidltransport;

  inherit (callBPPackage "system/libhidl/adapter" ./system_libhidl_adapter.nix {})
    libhidladapter;

  inherit (callBPPackage "system/libhidl/base" ./system_libhidl_base.nix {})
    libhidlbase-impl-internal libhidlbase-impl-shared-libs;

  inherit (callBPPackage "system/libhidl/libhidlcache" ./system_libhidl_libhidlcache.nix {})
    libhidlcache libhidlcache_test;

  inherit (callBPPackage "system/libhidl/libhidlmemory" ./system_libhidl_libhidlmemory.nix {})
    libhidlmemory;

  inherit (callBPPackage "system/libhidl/minijail" ./system_libhidl_minijail.nix {})
    libhwminijail;

  inherit (callBPPackage "system/libhidl/transport" ./system_libhidl_transport.nix {})
    "android.hidl" libhidltransport-impl-internal libhidltransport-impl-shared-libs;

  inherit (callBPPackage "system/libhidl/transport/allocator/1.0" ./system_libhidl_transport_allocator_1.0.nix {})
    "android.hidl.allocator@1.0";

  inherit (callBPPackage "system/libhidl/transport/allocator/1.0/default" ./system_libhidl_transport_allocator_1.0_default.nix {})
    "android.hidl.allocator@1.0-service";

  inherit (callBPPackage "system/libhidl/transport/allocator/1.0/utils" ./system_libhidl_transport_allocator_1.0_utils.nix {})
    libhidlallocatorutils;

  inherit (callBPPackage "system/libhidl/transport/allocator/1.0/vts/functional" ./system_libhidl_transport_allocator_1.0_vts_functional.nix {})
    VtsHidlAllocatorV1_0TargetTest;

  inherit (callBPPackage "system/libhidl/transport/base/1.0" ./system_libhidl_transport_base_1.0.nix {})
    "android.hidl.base@1.0";

  inherit (callBPPackage "system/libhidl/transport/base/1.0/vts/functional" ./system_libhidl_transport_base_1.0_vts_functional.nix {})
    vts_ibase_test;

  inherit (callBPPackage "system/libhidl/transport/manager/1.0" ./system_libhidl_transport_manager_1.0.nix {})
    "android.hidl.manager@1.0";

  inherit (callBPPackage "system/libhidl/transport/manager/1.1" ./system_libhidl_transport_manager_1.1.nix {})
    "android.hidl.manager@1.1";

  inherit (callBPPackage "system/libhidl/transport/manager/1.2" ./system_libhidl_transport_manager_1.2.nix {})
    "android.hidl.manager@1.2";

  inherit (callBPPackage "system/libhidl/transport/memory/1.0" ./system_libhidl_transport_memory_1.0.nix {})
    "android.hidl.memory@1.0";

  inherit (callBPPackage "system/libhidl/transport/memory/1.0/default" ./system_libhidl_transport_memory_1.0_default.nix {})
    "android.hidl.memory@1.0-impl";

  inherit (callBPPackage "system/libhidl/transport/memory/block/1.0" ./system_libhidl_transport_memory_block_1.0.nix {})
    "android.hidl.memory.block@1.0";

  inherit (callBPPackage "system/libhidl/transport/memory/token/1.0" ./system_libhidl_transport_memory_token_1.0.nix {})
    "android.hidl.memory.token@1.0";

  inherit (callBPPackage "system/libhidl/transport/safe_union/1.0" ./system_libhidl_transport_safe_union_1.0.nix {})
    "android.hidl.safe_union@1.0";

  inherit (callBPPackage "system/libhidl/transport/token/1.0" ./system_libhidl_transport_token_1.0.nix {})
    "android.hidl.token@1.0";

  inherit (callBPPackage "system/libhidl/transport/token/1.0/utils" ./system_libhidl_transport_token_1.0_utils.nix {})
    "android.hidl.token@1.0-utils";

  inherit (callBPPackage "system/libhwbinder" ./system_libhwbinder.nix {})
    hwbinder_benchmark_pgo hwbinder_lto hwbinder_pgo libhwbinder libhwbinder-impl-internal libhwbinder-impl-shared-libs libhwbinder-impl-shared-libs-no-vndk-private libhwbinder_defaults libhwbinder_noltopgo libhwbinder_pgo-impl-internal;

  inherit (callBPPackage "system/libhwbinder/vts/performance" ./system_libhwbinder_vts_performance.nix {})
    hwbinderThroughputTest libbinder_benchmark libhwbinder_benchmark libhwbinder_latency libhwbinder_test_defaults;

  inherit (callBPPackage "system/libsysprop/srcs" ./system_libsysprop_srcs.nix {})
    platform-properties;

  inherit (callBPPackage "system/libufdt" ./system_libufdt.nix {})
    libufdt;

  inherit (callBPPackage "system/libufdt/sysdeps" ./system_libufdt_sysdeps.nix {})
    libufdt_sysdeps;

  inherit (callBPPackage "system/libufdt/tests/libufdt_verify" ./system_libufdt_tests_libufdt_verify.nix {})
    libufdt_verify;

  inherit (callBPPackage "system/libufdt/tests/src" ./system_libufdt_tests_src.nix {})
    extract_dtb fdt_apply_overlay ufdt_apply_overlay ufdt_gen_test_dts ufdt_verify_overlay ufdt_verify_overlay_host;

  inherit (callBPPackage "system/libufdt/utils/src" ./system_libufdt_utils_src.nix {})
    "mkdtboimg.py" mkdtimg;

  inherit (callBPPackage "system/libvintf" ./system_libvintf.nix {})
    assemble_vintf checkvintf libassemblevintf libvintf libvintf-defaults libvintf_recovery vintf;

  inherit (callBPPackage "system/libvintf/analyze_matrix" ./system_libvintf_analyze_matrix.nix {})
    analyze_matrix;

  inherit (callBPPackage "system/libvintf/test" ./system_libvintf_test.nix {})
    libvintf_test vintf_object_recovery_test vintf_object_test;

  inherit (callBPPackage "system/libvintf/xsd/compatibilityMatrix" ./system_libvintf_xsd_compatibilityMatrix.nix {})
    compatibility_matrix;

  inherit (callBPPackage "system/libvintf/xsd/compatibilityMatrix/vts" ./system_libvintf_xsd_compatibilityMatrix_vts.nix {})
    vts_compatibilityMatrix_validate_test;

  inherit (callBPPackage "system/libvintf/xsd/halManifest" ./system_libvintf_xsd_halManifest.nix {})
    hal_manifest;

  inherit (callBPPackage "system/libvintf/xsd/halManifest/vts" ./system_libvintf_xsd_halManifest_vts.nix {})
    vts_halManifest_validate_test;

  inherit (callBPPackage "system/linkerconfig" ./system_linkerconfig.nix {})
    linkerconfig_defaults linkerconfig_headers linkerconfig_modules linkerconfig_modules_unittest;

  inherit (callBPPackage "system/media/alsa_utils" ./system_media_alsa_utils.nix {})
    libalsautils;

  inherit (callBPPackage "system/media/audio" ./system_media_audio.nix {})
    libaudio_system_headers;

  inherit (callBPPackage "system/media/audio_effects" ./system_media_audio_effects.nix {})
    libaudioeffects;

  inherit (callBPPackage "system/media/audio_route" ./system_media_audio_route.nix {})
    libaudioroute;

  inherit (callBPPackage "system/media/audio_utils" ./system_media_audio_utils.nix {})
    audio_utils_defaults libaudiospdif libaudioutils libaudioutils_fixedfft libfifo libsndfile;

  inherit (callBPPackage "system/media/audio_utils/tests" ./system_media_audio_utils_tests.nix {})
    channels_tests errorlog_tests fdtostring_tests fifo_multiprocess fifo_tests fifo_threads format_tests limiter_tests logplot_tests power_tests powerlog_tests primitives_benchmark primitives_tests sample_tests simplelog_tests statistics_benchmark statistics_tests string_tests timestampverifier_tests variadic_tests;

  inherit (callBPPackage "system/media/camera" ./system_media_camera.nix {})
    libcamera_metadata;

  inherit (callBPPackage "system/media/camera/tests" ./system_media_camera_tests.nix {})
    camera_metadata_tests;

  inherit (callBPPackage "system/media/radio" ./system_media_radio.nix {})
    libradio_metadata;

  inherit (callBPPackage "system/netd" ./system_netd.nix {})
    libnetd_client_headers netd_defaults;

  inherit (callBPPackage "system/netd/apex" ./system_netd_apex.nix {})
    "com.android.resolv" "com.android.resolv.certificate" "com.android.resolv.key";

  inherit (callBPPackage "system/netd/bpf_progs" ./system_netd_bpf_progs.nix {})
    "clatd.o" "netd.o";

  inherit (callBPPackage "system/netd/client" ./system_netd_client.nix {})
    libnetd_client netdclient_test;

  inherit (callBPPackage "system/netd/libnetdbpf" ./system_netd_libnetdbpf.nix {})
    libnetdbpf libnetdbpf_test;

  inherit (callBPPackage "system/netd/libnetdutils" ./system_netd_libnetdutils.nix {})
    libnetdutils netdutils_test;

  inherit (callBPPackage "system/netd/netutils_wrappers" ./system_netd_netutils_wrappers.nix {})
    "netutils-wrapper-1.0" netutils_wrapper_test;

  inherit (callBPPackage "system/netd/resolv" ./system_netd_resolv.nix {})
    "statslog_resolv.cpp" "statslog_resolv.h" dnsresolver_aidl_interface libnetd_resolv libnetd_resolv_headers libnetd_test_metrics_listener libstatslog_resolv resolv_integration_test resolv_unit_test stats_proto;

  inherit (callBPPackage "system/netd/resolv/dns_responder" ./system_netd_resolv_dns_responder.nix {})
    libnetd_test_dnsresponder;

  inherit (callBPPackage "system/netd/server" ./system_netd_server.nix {})
    libnetd_server ndc netd netd_aidl_interface netd_event_listener_interface netd_integration_test_shared netd_unit_test oemnetd_aidl_interface;

  inherit (callBPPackage "system/netd/tests" ./system_netd_tests.nix {})
    libnetd_test_tun_interface libnetd_test_unsol_service netd_integration_test;

  inherit (callBPPackage "system/netd/tests/benchmarks" ./system_netd_tests_benchmarks.nix {})
    bpf_benchmark netd_benchmark;

  inherit (callBPPackage "system/nfc/src" ./system_nfc_src.nix {})
    libnfc-nci;

  inherit (callBPPackage "system/nfc/utils" ./system_nfc_utils.nix {})
    libnfcutils nfc_test_utils nfc_utils_defaults;

  inherit (callBPPackage "system/nvram/client" ./system_nvram_client.nix {})
    nvram-client;

  inherit (callBPPackage "system/nvram/core" ./system_nvram_core.nix {})
    libnvram-core;

  inherit (callBPPackage "system/nvram/core/tests" ./system_nvram_core_tests.nix {})
    libnvram-core-tests;

  inherit (callBPPackage "system/nvram/hal" ./system_nvram_hal.nix {})
    "nvram.testing" libnvram-hal;

  inherit (callBPPackage "system/nvram/hal/tests" ./system_nvram_hal_tests.nix {})
    nvram_hal_test;

  inherit (callBPPackage "system/nvram/messages" ./system_nvram_messages.nix {})
    libnvram-messages;

  inherit (callBPPackage "system/nvram/messages/tests" ./system_nvram_messages_tests.nix {})
    libnvram-messages-tests;

  inherit (callBPPackage "system/security/keystore-engine" ./system_security_keystore-engine.nix {})
    libkeystore-engine libkeystore-engine-wifi-hidl;

  inherit (callBPPackage "system/security/keystore" ./system_security_keystore.nix {})
    keystore keystore_aidl keystore_cli keystore_cli_v2 keystore_defaults libkeystore-wifi-hidl libkeystore_aidl libkeystore_binder libkeystore_parcelables libkeystore_test;

  inherit (callBPPackage "system/security/keystore/tests" ./system_security_keystore_tests.nix {})
    confirmationui_invocation_test keystore_unit_tests;

  inherit (callBPPackage "system/sepolicy" ./system_sepolicy.nix {})
    "26.0.board.compat.map" "26.0.board.ignore.map" "26.0.cil" "26.0.ignore.cil" "27.0.board.compat.map" "27.0.board.ignore.map" "27.0.cil" "27.0.ignore.cil" "28.0.board.compat.map" "28.0.board.ignore.map" "28.0.cil" "28.0.ignore.cil" selinux_policy_version;

  inherit (callBPPackage "system/sepolicy/build" ./system_sepolicy_build.nix {})
    build_sepolicy;

  inherit (callBPPackage "system/sepolicy/build/soong" ./system_sepolicy_build_soong.nix {})
    soong-selinux;

  inherit (callBPPackage "system/sepolicy/tests" ./system_sepolicy_tests.nix {})
    combine_maps libsepolwrap py2_only searchpolicy sepolicy_tests treble_sepolicy_tests;

  inherit (callBPPackage "system/sepolicy/tools" ./system_sepolicy_tools.nix {})
    "insertkeys.py" checkfc checkseapp sepolicy-check sepolicy_tools_defaults version_policy;

  inherit (callBPPackage "system/sepolicy/tools/fc_sort" ./system_sepolicy_tools_fc_sort.nix {})
    fc_sort;

  inherit (callBPPackage "system/server_configurable_flags/disaster_recovery" ./system_server_configurable_flags_disaster_recovery.nix {})
    flags_health_check;

  inherit (callBPPackage "system/server_configurable_flags/libflags" ./system_server_configurable_flags_libflags.nix {})
    server_configurable_flags server_configurable_flags_test;

  inherit (callBPPackage "system/testing/gtest_extras" ./system_testing_gtest_extras.nix {})
    gtest_isolated_tests libgtest_isolated libgtest_isolated_main;

  inherit (callBPPackage "system/timezone/apex" ./system_timezone_apex.nix {})
    "apex.tzdata.key" "com.android.tzdata" "com.android.tzdata-androidManifest" "com.android.tzdata-defaults" "com.android.tzdata.certificate";

  inherit (callBPPackage "system/timezone/distro/core" ./system_timezone_distro_core.nix {})
    time_zone_distro time_zone_distro-tests time_zone_distro_unbundled;

  inherit (callBPPackage "system/timezone/distro/installer" ./system_timezone_distro_installer.nix {})
    time_zone_distro_installer time_zone_distro_installer-tests;

  inherit (callBPPackage "system/timezone/distro/tools" ./system_timezone_distro_tools.nix {})
    create_time_zone_distro time_zone_distro_builder;

  inherit (callBPPackage "system/timezone/output_data" ./system_timezone_output_data.nix {})
    "apex_icu_tzdata.dat" "apex_tzlookup.xml" apex_tz_version apex_tzdata;

  inherit (callBPPackage "system/timezone/testing" ./system_timezone_testing.nix {})
    tzdata-testing;

  inherit (callBPPackage "system/timezone/testing/data/test1/apex" ./system_timezone_testing_data_test1_apex.nix {})
    "test1_com.android.tzdata";

  inherit (callBPPackage "system/timezone/testing/data/test1/output_data" ./system_timezone_testing_data_test1_output_data.nix {})
    "apex_icu_tzdata.dat_test1" "apex_tzlookup.xml_test1" apex_tz_version_test1 apex_tzdata_test1;

  inherit (callBPPackage "system/timezone/tzdatacheck" ./system_timezone_tzdatacheck.nix {})
    tzdatacheck;

  inherit (callBPPackage "system/timezone/tzlookup_generator" ./system_timezone_tzlookup_generator.nix {})
    countryzonesprotos tzlookup_generator;

  inherit (callBPPackage "system/timezone/zone_compactor" ./system_timezone_zone_compactor.nix {})
    zone_compactor;

  inherit (callBPPackage "system/tools/aidl" ./system_tools_aidl.nix {})
    aidl aidl-cpp aidl_defaults aidl_test_client aidl_test_defaults aidl_test_loggable_interface aidl_test_loggable_interface_ndk aidl_test_sentinel_searcher aidl_test_service aidl_test_services aidl_unittests libaidl-common libaidl-integration-test;

  inherit (callBPPackage "system/tools/aidl/build" ./system_tools_aidl_build.nix {})
    aidl-cpp-module-defaults aidl-java-module-defaults aidl-soong-rules test-piece-1 test-piece-2 test-piece-3 test-piece-4 test-root-package test-vendor;

  inherit (callBPPackage "system/tools/hidl" ./system_tools_hidl.nix {})
    hidl-gen hidl-gen-defaults hidl-java-module-defaults hidl-module-defaults libhidl-gen libhidl-gen-ast;

  inherit (callBPPackage "system/tools/hidl/build" ./system_tools_hidl_build.nix {})
    hidl-soong-rules;

  inherit (callBPPackage "system/tools/hidl/c2hal" ./system_tools_hidl_c2hal.nix {})
    c2hal;

  inherit (callBPPackage "system/tools/hidl/c2hal/test" ./system_tools_hidl_c2hal_test.nix {})
    "c2hal_test_genc++" "c2hal_test_genc++_headers" c2hal_test;

  inherit (callBPPackage "system/tools/hidl/docs" ./system_tools_hidl_docs.nix {})
    hidl-doc;

  inherit (callBPPackage "system/tools/hidl/hashing" ./system_tools_hidl_hashing.nix {})
    libhidl-gen-hash;

  inherit (callBPPackage "system/tools/hidl/host_utils" ./system_tools_hidl_host_utils.nix {})
    libhidl-gen-host-utils;

  inherit (callBPPackage "system/tools/hidl/test" ./system_tools_hidl_test.nix {})
    "hidl.tests";

  inherit (callBPPackage "system/tools/hidl/test/error_test" ./system_tools_hidl_test_error_test.nix {})
    hidl_error_test hidl_error_test_gen;

  inherit (callBPPackage "system/tools/hidl/test/export_test" ./system_tools_hidl_test_export_test.nix {})
    hidl_export_test hidl_export_test_gen-headers;

  inherit (callBPPackage "system/tools/hidl/test/hash_test" ./system_tools_hidl_test_hash_test.nix {})
    hidl_hash_test hidl_hash_test_gen;

  inherit (callBPPackage "system/tools/hidl/test/hidl_test" ./system_tools_hidl_test_hidl_test.nix {})
    hidl_test_client hidl_test_client-defaults hidl_test_servers;

  inherit (callBPPackage "system/tools/hidl/test/host_test" ./system_tools_hidl_test_host_test.nix {})
    hidl-gen-host_test;

  inherit (callBPPackage "system/tools/hidl/test/host_utils_test" ./system_tools_hidl_test_host_utils_test.nix {})
    libhidl-gen-host-utils_test;

  inherit (callBPPackage "system/tools/hidl/test/impl_test" ./system_tools_hidl_test_impl_test.nix {})
    hidl_impl_test hidl_impl_test_gen-headers hidl_impl_test_gen-sources;

  inherit (callBPPackage "system/tools/hidl/test/java_test" ./system_tools_hidl_test_java_test.nix {})
    hidl_test_java_java hidl_test_java_native;

  inherit (callBPPackage "system/tools/hidl/test/lazy_test" ./system_tools_hidl_test_lazy_test.nix {})
    hidl_lazy_test;

  inherit (callBPPackage "system/tools/hidl/test/system_api_test" ./system_tools_hidl_test_system_api_test.nix {})
    hidl_system_api_test;

  inherit (callBPPackage "system/tools/hidl/test/utils_test" ./system_tools_hidl_test_utils_test.nix {})
    libhidl-gen-utils_test;

  inherit (callBPPackage "system/tools/hidl/test/vendor/1.0" ./system_tools_hidl_test_vendor_1.0.nix {})
    "hidl.tests.vendor@1.0";

  inherit (callBPPackage "system/tools/hidl/test/vendor/1.1" ./system_tools_hidl_test_vendor_1.1.nix {})
    "hidl.tests.vendor@1.1";

  inherit (callBPPackage "system/tools/hidl/test/version_test" ./system_tools_hidl_test_version_test.nix {})
    hidl_hash_version_gen hidl_version_test;

  inherit (callBPPackage "system/tools/hidl/utils" ./system_tools_hidl_utils.nix {})
    libhidl-gen-utils;

  inherit (callBPPackage "system/tools/sysprop" ./system_tools_sysprop.nix {})
    sysprop-defaults sysprop_cpp sysprop_java sysprop_test;

  inherit (callBPPackage "system/tools/xsdc" ./system_tools_xsdc.nix {})
    xsdc;

  inherit (callBPPackage "system/tools/xsdc/build" ./system_tools_xsdc_build.nix {})
    xsdc-soong-rules;

  inherit (callBPPackage "system/tools/xsdc/tests" ./system_tools_xsdc_tests.nix {})
    xsdc-cpp-tests xsdc-java-tests;

  inherit (callBPPackage "system/tools/xsdc/tests/resources/nested_type" ./system_tools_xsdc_tests_resources_nested_type.nix {})
    xsdc_nested_type_tests;

  inherit (callBPPackage "system/tools/xsdc/tests/resources/predefined_types" ./system_tools_xsdc_tests_resources_predefined_types.nix {})
    xsdc_predefined_types_tests;

  inherit (callBPPackage "system/tools/xsdc/tests/resources/purchase_simple" ./system_tools_xsdc_tests_resources_purchase_simple.nix {})
    xsdc_purchase_simple_tests;

  inherit (callBPPackage "system/tools/xsdc/tests/resources/reference" ./system_tools_xsdc_tests_resources_reference.nix {})
    xsdc_reference_tests;

  inherit (callBPPackage "system/tools/xsdc/tests/resources/simple_complex_content" ./system_tools_xsdc_tests_resources_simple_complex_content.nix {})
    xsdc_simple_complex_content_tests;

  inherit (callBPPackage "system/tools/xsdc/tests/resources/simple_type" ./system_tools_xsdc_tests_resources_simple_type.nix {})
    xsdc_simple_type_tests;

  inherit (callBPPackage "system/update_engine" ./system_update_engine.nix {})
    brillo_update_payload delta_generator libpayload_consumer libpayload_consumer_exports libpayload_generator libpayload_generator_exports libupdate_engine_aidl libupdate_engine_android libupdate_engine_android_exports libupdate_engine_boot_control libupdate_engine_boot_control_exports libupdate_engine_client test_http_server test_subprocess things_update_engine_aidl ue_defaults ue_unittest_delta_generator ue_unittest_disk_imgs ue_unittest_keys update_engine update_engine_client update_engine_sideload update_engine_unittests update_metadata-protos update_metadata-protos_exports;

  inherit (callBPPackage "system/vold" ./system_vold.nix {})
    libvold libvold_binder libvold_headers secdiscard vdc vold vold_aidl vold_default_flags vold_default_libs vold_prepare_subdirs wait_for_keymaster;

  inherit (callBPPackage "system/vold/tests" ./system_vold_tests.nix {})
    vold_tests;

  inherit (callBPPackage "test/framework/harnesses" ./test_framework_harnesses.nix {})
    tradefed-cts-prebuilt;

  inherit (callBPPackage "test/framework/tools/host_controller" ./test_framework_tools_host_controller.nix {})
    run;

  inherit (callBPPackage "test/suite_harness/build" ./test_suite_harness_build.nix {})
    soong-suite-harness;

  inherit (callBPPackage "test/suite_harness/common/host-side/manifest-generator" ./test_suite_harness_common_host-side_manifest-generator.nix {})
    compatibility-manifest-generator;

  inherit (callBPPackage "test/suite_harness/common/host-side/manifest-generator/tests" ./test_suite_harness_common_host-side_manifest-generator_tests.nix {})
    compatibility-manifest-generator-tests;

  inherit (callBPPackage "test/suite_harness/common/host-side/tradefed" ./test_suite_harness_common_host-side_tradefed.nix {})
    compatibility-tradefed;

  inherit (callBPPackage "test/suite_harness/common/host-side/tradefed/tests" ./test_suite_harness_common_host-side_tradefed_tests.nix {})
    compatibility-mock-tradefed compatibility-tradefed-tests;

  inherit (callBPPackage "test/suite_harness/common/host-side/util" ./test_suite_harness_common_host-side_util.nix {})
    compatibility-host-util;

  inherit (callBPPackage "test/suite_harness/common/host-side/util/tests" ./test_suite_harness_common_host-side_util_tests.nix {})
    compatibility-host-util-tests;

  inherit (callBPPackage "test/suite_harness/common/util" ./test_suite_harness_common_util.nix {})
    compatibility-common-util-devicesidelib compatibility-common-util-hostsidelib;

  inherit (callBPPackage "test/suite_harness/common/util/tests" ./test_suite_harness_common_util_tests.nix {})
    compatibility-common-util-tests;

  inherit (callBPPackage "test/suite_harness/tools/cts-instant-tradefed" ./test_suite_harness_tools_cts-instant-tradefed.nix {})
    cts-instant-resources cts-instant-tradefed;

  inherit (callBPPackage "test/suite_harness/tools/cts-instant-tradefed/tests" ./test_suite_harness_tools_cts-instant-tradefed_tests.nix {})
    cts-instant-tradefed-tests;

  inherit (callBPPackage "test/suite_harness/tools/cts-tradefed" ./test_suite_harness_tools_cts-tradefed.nix {})
    cts-tradefed cts-tradefed-harness;

  inherit (callBPPackage "test/suite_harness/tools/cts-tradefed/tests" ./test_suite_harness_tools_cts-tradefed_tests.nix {})
    cts-tradefed-tests;

  inherit (callBPPackage "test/suite_harness/tools/dex-tools" ./test_suite_harness_tools_dex-tools.nix {})
    dex-tools;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/audio/V2_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_audio_V2_0_iface_fuzzer.nix {})
    VtsHalAudioV2_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/audio/V4_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_audio_V4_0_iface_fuzzer.nix {})
    VtsHalAudioV4_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/audio/common/V2_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_audio_common_V2_0_iface_fuzzer.nix {})
    VtsHalAudioCommonV2_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/audio/common/V4_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_audio_common_V4_0_iface_fuzzer.nix {})
    VtsHalAudioCommonV4_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/audio/effect/V2_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_audio_effect_V2_0_iface_fuzzer.nix {})
    VtsHalAudioEffectV2_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/audio/effect/V4_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_audio_effect_V4_0_iface_fuzzer.nix {})
    VtsHalAudioEffectV4_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/authsecret/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_authsecret_V1_0_iface_fuzzer.nix {})
    VtsHalAuthsecretV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/automotive/audiocontrol/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_automotive_audiocontrol_V1_0_iface_fuzzer.nix {})
    VtsHalAutomotiveAudiocontrolV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/automotive/evs/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_automotive_evs_V1_0_iface_fuzzer.nix {})
    VtsHalAutomotiveEvsV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/automotive/vehicle/V2_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_automotive_vehicle_V2_0_iface_fuzzer.nix {})
    VtsHalAutomotiveVehicleV2_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/biometrics/fingerprint/V2_1/iface_fuzzer" ./test_vts-testcase_fuzz_config_biometrics_fingerprint_V2_1_iface_fuzzer.nix {})
    VtsHalBiometricsFingerprintV2_1IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/bluetooth/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_bluetooth_V1_0_iface_fuzzer.nix {})
    VtsHalBluetoothV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/boot/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_boot_V1_0_iface_fuzzer.nix {})
    VtsHalBootV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/broadcastradio/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_broadcastradio_V1_0_iface_fuzzer.nix {})
    VtsHalBroadcastradioV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/broadcastradio/V1_1/iface_fuzzer" ./test_vts-testcase_fuzz_config_broadcastradio_V1_1_iface_fuzzer.nix {})
    VtsHalBroadcastradioV1_1IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/broadcastradio/V2_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_broadcastradio_V2_0_iface_fuzzer.nix {})
    VtsHalBroadcastradioV2_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/camera/common/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_camera_common_V1_0_iface_fuzzer.nix {})
    VtsHalCameraCommonV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/camera/metadata/V3_2/iface_fuzzer" ./test_vts-testcase_fuzz_config_camera_metadata_V3_2_iface_fuzzer.nix {})
    VtsHalCameraMetadataV3_2IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/camera/metadata/V3_3/iface_fuzzer" ./test_vts-testcase_fuzz_config_camera_metadata_V3_3_iface_fuzzer.nix {})
    VtsHalCameraMetadataV3_3IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/camera/provider/V2_4/iface_fuzzer" ./test_vts-testcase_fuzz_config_camera_provider_V2_4_iface_fuzzer.nix {})
    VtsHalCameraProviderV2_4IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/cas/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_cas_V1_0_iface_fuzzer.nix {})
    VtsHalCasV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/cas/native/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_cas_native_V1_0_iface_fuzzer.nix {})
    VtsHalCasNativeV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/configstore/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_configstore_V1_0_iface_fuzzer.nix {})
    VtsHalConfigstoreV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/configstore/V1_1/iface_fuzzer" ./test_vts-testcase_fuzz_config_configstore_V1_1_iface_fuzzer.nix {})
    VtsHalConfigstoreV1_1IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/confirmationui/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_confirmationui_V1_0_iface_fuzzer.nix {})
    VtsHalConfirmationuiV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/contexthub/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_contexthub_V1_0_iface_fuzzer.nix {})
    VtsHalContexthubV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/drm/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_drm_V1_0_iface_fuzzer.nix {})
    VtsHalDrmV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/drm/V1_1/iface_fuzzer" ./test_vts-testcase_fuzz_config_drm_V1_1_iface_fuzzer.nix {})
    VtsHalDrmV1_1IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/dumpstate/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_dumpstate_V1_0_iface_fuzzer.nix {})
    VtsHalDumpstateV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/gatekeeper/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_gatekeeper_V1_0_iface_fuzzer.nix {})
    VtsHalGatekeeperV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/gnss/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_gnss_V1_0_iface_fuzzer.nix {})
    VtsHalGnssV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/gnss/V1_1/iface_fuzzer" ./test_vts-testcase_fuzz_config_gnss_V1_1_iface_fuzzer.nix {})
    VtsHalGnssV1_1IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/graphics/allocator/V2_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_graphics_allocator_V2_0_iface_fuzzer.nix {})
    VtsHalGraphicsAllocatorV2_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/graphics/bufferqueue/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_graphics_bufferqueue_V1_0_iface_fuzzer.nix {})
    VtsHalGraphicsBufferqueueV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/graphics/common/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_graphics_common_V1_0_iface_fuzzer.nix {})
    VtsHalGraphicsCommonV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/graphics/common/V1_1/iface_fuzzer" ./test_vts-testcase_fuzz_config_graphics_common_V1_1_iface_fuzzer.nix {})
    VtsHalGraphicsCommonV1_1IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/graphics/composer/V2_1/iface_fuzzer" ./test_vts-testcase_fuzz_config_graphics_composer_V2_1_iface_fuzzer.nix {})
    VtsHalGraphicsComposerV2_1IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/graphics/composer/V2_2/iface_fuzzer" ./test_vts-testcase_fuzz_config_graphics_composer_V2_2_iface_fuzzer.nix {})
    VtsHalGraphicsComposerV2_2IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/graphics/mapper/V2_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_graphics_mapper_V2_0_iface_fuzzer.nix {})
    VtsHalGraphicsMapperV2_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/graphics/mapper/V2_1/iface_fuzzer" ./test_vts-testcase_fuzz_config_graphics_mapper_V2_1_iface_fuzzer.nix {})
    VtsHalGraphicsMapperV2_1IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/health/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_health_V1_0_iface_fuzzer.nix {})
    VtsHalHealthV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/health/V2_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_health_V2_0_iface_fuzzer.nix {})
    VtsHalHealthV2_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/ir/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_ir_V1_0_iface_fuzzer.nix {})
    VtsHalIrV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/keymaster/V3_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_keymaster_V3_0_iface_fuzzer.nix {})
    VtsHalKeymasterV3_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/keymaster/V4_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_keymaster_V4_0_iface_fuzzer.nix {})
    VtsHalKeymasterV4_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/light/V2_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_light_V2_0_iface_fuzzer.nix {})
    VtsHalLightV2_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/media/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_media_V1_0_iface_fuzzer.nix {})
    VtsHalMediaV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/media/bufferpool/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_media_bufferpool_V1_0_iface_fuzzer.nix {})
    VtsHalMediaBufferpoolV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/media/omx/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_media_omx_V1_0_iface_fuzzer.nix {})
    VtsHalMediaOmxV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/memtrack/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_memtrack_V1_0_iface_fuzzer.nix {})
    VtsHalMemtrackV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/neuralnetworks/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_neuralnetworks_V1_0_iface_fuzzer.nix {})
    VtsHalNeuralnetworksV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/neuralnetworks/V1_1/iface_fuzzer" ./test_vts-testcase_fuzz_config_neuralnetworks_V1_1_iface_fuzzer.nix {})
    VtsHalNeuralnetworksV1_1IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/nfc/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_nfc_V1_0_iface_fuzzer.nix {})
    VtsHalNfcV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/nfc/V1_1/iface_fuzzer" ./test_vts-testcase_fuzz_config_nfc_V1_1_iface_fuzzer.nix {})
    VtsHalNfcV1_1IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/oemlock/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_oemlock_V1_0_iface_fuzzer.nix {})
    VtsHalOemlockV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/power/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_power_V1_0_iface_fuzzer.nix {})
    VtsHalPowerV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/power/V1_1/iface_fuzzer" ./test_vts-testcase_fuzz_config_power_V1_1_iface_fuzzer.nix {})
    VtsHalPowerV1_1IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/power/V1_2/iface_fuzzer" ./test_vts-testcase_fuzz_config_power_V1_2_iface_fuzzer.nix {})
    VtsHalPowerV1_2IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/radio/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_radio_V1_0_iface_fuzzer.nix {})
    VtsHalRadioV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/radio/V1_1/iface_fuzzer" ./test_vts-testcase_fuzz_config_radio_V1_1_iface_fuzzer.nix {})
    VtsHalRadioV1_1IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/radio/V1_2/iface_fuzzer" ./test_vts-testcase_fuzz_config_radio_V1_2_iface_fuzzer.nix {})
    VtsHalRadioV1_2IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/radio/config/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_radio_config_V1_0_iface_fuzzer.nix {})
    VtsHalRadioConfigV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/radio/deprecated/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_radio_deprecated_V1_0_iface_fuzzer.nix {})
    VtsHalRadioDeprecatedV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/renderscript/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_renderscript_V1_0_iface_fuzzer.nix {})
    VtsHalRenderscriptV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/secure_element/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_secure_element_V1_0_iface_fuzzer.nix {})
    VtsHalSecure_ElementV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/sensors/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_sensors_V1_0_iface_fuzzer.nix {})
    VtsHalSensorsV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/soundtrigger/V2_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_soundtrigger_V2_0_iface_fuzzer.nix {})
    VtsHalSoundtriggerV2_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/soundtrigger/V2_1/iface_fuzzer" ./test_vts-testcase_fuzz_config_soundtrigger_V2_1_iface_fuzzer.nix {})
    VtsHalSoundtriggerV2_1IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/tetheroffload/config/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_tetheroffload_config_V1_0_iface_fuzzer.nix {})
    VtsHalTetheroffloadConfigV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/tetheroffload/control/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_tetheroffload_control_V1_0_iface_fuzzer.nix {})
    VtsHalTetheroffloadControlV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/thermal/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_thermal_V1_0_iface_fuzzer.nix {})
    VtsHalThermalV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/thermal/V1_1/iface_fuzzer" ./test_vts-testcase_fuzz_config_thermal_V1_1_iface_fuzzer.nix {})
    VtsHalThermalV1_1IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/tv/cec/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_tv_cec_V1_0_iface_fuzzer.nix {})
    VtsHalTvCecV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/tv/input/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_tv_input_V1_0_iface_fuzzer.nix {})
    VtsHalTvInputV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/usb/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_usb_V1_0_iface_fuzzer.nix {})
    VtsHalUsbV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/usb/V1_1/iface_fuzzer" ./test_vts-testcase_fuzz_config_usb_V1_1_iface_fuzzer.nix {})
    VtsHalUsbV1_1IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/usb/gadget/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_usb_gadget_V1_0_iface_fuzzer.nix {})
    VtsHalUsbGadgetV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/vibrator/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_vibrator_V1_0_iface_fuzzer.nix {})
    VtsHalVibratorV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/vibrator/V1_1/iface_fuzzer" ./test_vts-testcase_fuzz_config_vibrator_V1_1_iface_fuzzer.nix {})
    VtsHalVibratorV1_1IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/vibrator/V1_2/iface_fuzzer" ./test_vts-testcase_fuzz_config_vibrator_V1_2_iface_fuzzer.nix {})
    VtsHalVibratorV1_2IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/vr/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_vr_V1_0_iface_fuzzer.nix {})
    VtsHalVrV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/weaver/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_weaver_V1_0_iface_fuzzer.nix {})
    VtsHalWeaverV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/wifi/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_wifi_V1_0_iface_fuzzer.nix {})
    VtsHalWifiV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/wifi/V1_1/iface_fuzzer" ./test_vts-testcase_fuzz_config_wifi_V1_1_iface_fuzzer.nix {})
    VtsHalWifiV1_1IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/wifi/V1_2/iface_fuzzer" ./test_vts-testcase_fuzz_config_wifi_V1_2_iface_fuzzer.nix {})
    VtsHalWifiV1_2IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/wifi/hostapd/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_wifi_hostapd_V1_0_iface_fuzzer.nix {})
    VtsHalWifiHostapdV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/wifi/offload/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_wifi_offload_V1_0_iface_fuzzer.nix {})
    VtsHalWifiOffloadV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/wifi/supplicant/V1_0/iface_fuzzer" ./test_vts-testcase_fuzz_config_wifi_supplicant_V1_0_iface_fuzzer.nix {})
    VtsHalWifiSupplicantV1_0IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/config/wifi/supplicant/V1_1/iface_fuzzer" ./test_vts-testcase_fuzz_config_wifi_supplicant_V1_1_iface_fuzzer.nix {})
    VtsHalWifiSupplicantV1_1IfaceFuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/iface_fuzzer" ./test_vts-testcase_fuzz_iface_fuzzer.nix {})
    libvts_proto_fuzzer vts_proto_fuzzer;

  inherit (callBPPackage "test/vts-testcase/fuzz/kernel/syzkaller" ./test_vts-testcase_fuzz_kernel_syzkaller.nix {})
    VtsKernelFuzzTest;

  inherit (callBPPackage "test/vts-testcase/hal" ./test_vts-testcase_hal.nix {})
    VtsHalDriverDefaults VtsHalLibDefaults VtsHalProfilerDefaults;

  inherit (callBPPackage "test/vts-testcase/hal/atrace/V1_0/target" ./test_vts-testcase_hal_atrace_V1_0_target.nix {})
    VtsHalAtraceV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/audio/V2_0/target" ./test_vts-testcase_hal_audio_V2_0_target.nix {})
    VtsHalAudioV2_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/audio/V4_0/target" ./test_vts-testcase_hal_audio_V4_0_target.nix {})
    VtsHalAudioV4_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/audio/V5_0/target" ./test_vts-testcase_hal_audio_V5_0_target.nix {})
    VtsHalAudioV5_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/audio/effect/V2_0/target" ./test_vts-testcase_hal_audio_effect_V2_0_target.nix {})
    VtsHalAudioEffectV2_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/audio/effect/V2_0/target_replay" ./test_vts-testcase_hal_audio_effect_V2_0_target_replay.nix {})
    VtsHalAudioEffectV2_0TargetReplay;

  inherit (callBPPackage "test/vts-testcase/hal/audio/effect/V4_0/target" ./test_vts-testcase_hal_audio_effect_V4_0_target.nix {})
    VtsHalAudioEffectV4_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/audio/effect/V5_0/target" ./test_vts-testcase_hal_audio_effect_V5_0_target.nix {})
    VtsHalAudioEffectV5_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/authsecret/V1_0/target" ./test_vts-testcase_hal_authsecret_V1_0_target.nix {})
    VtsHalAuthSecretV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/automotive/evs/V1_0/target" ./test_vts-testcase_hal_automotive_evs_V1_0_target.nix {})
    VtsHalEvsV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/automotive/vehicle/V2_0/host" ./test_vts-testcase_hal_automotive_vehicle_V2_0_host.nix {})
    VtsHalAutomotiveVehicleV2_0Host;

  inherit (callBPPackage "test/vts-testcase/hal/automotive/vehicle/V2_0/host_profiling" ./test_vts-testcase_hal_automotive_vehicle_V2_0_host_profiling.nix {})
    VtsHalAutomotiveVehicleV2_0HostProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/biometrics/face/V1_0/target" ./test_vts-testcase_hal_biometrics_face_V1_0_target.nix {})
    VtsHalBiometricsFaceV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/biometrics/fingerprint/V2_1/target" ./test_vts-testcase_hal_biometrics_fingerprint_V2_1_target.nix {})
    VtsHalBiometricsFingerprintV2_1Target;

  inherit (callBPPackage "test/vts-testcase/hal/biometrics/fingerprint/V2_1/target_profiling" ./test_vts-testcase_hal_biometrics_fingerprint_V2_1_target_profiling.nix {})
    VtsHalBiometricsFingerprintV2_1TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/biometrics/fingerprint/V2_1/target_replay" ./test_vts-testcase_hal_biometrics_fingerprint_V2_1_target_replay.nix {})
    VtsHalBiometricsFingerprintV2_1TargetReplay;

  inherit (callBPPackage "test/vts-testcase/hal/bluetooth/V1_0/target" ./test_vts-testcase_hal_bluetooth_V1_0_target.nix {})
    VtsHalBluetoothV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/bluetooth/V1_0/target_profiling" ./test_vts-testcase_hal_bluetooth_V1_0_target_profiling.nix {})
    VtsHalBluetoothV1_0TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/bluetooth/V1_0/target_replay" ./test_vts-testcase_hal_bluetooth_V1_0_target_replay.nix {})
    VtsHalBluetoothV1_0TargetReplay;

  inherit (callBPPackage "test/vts-testcase/hal/boot/V1_0/target" ./test_vts-testcase_hal_boot_V1_0_target.nix {})
    VtsHalBootV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/boot/V1_0/target_profiling" ./test_vts-testcase_hal_boot_V1_0_target_profiling.nix {})
    VtsHalBootV1_0TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/broadcastradio/V1_0/target" ./test_vts-testcase_hal_broadcastradio_V1_0_target.nix {})
    VtsHalBroadcastradioV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/broadcastradio/V1_0/target_profiling" ./test_vts-testcase_hal_broadcastradio_V1_0_target_profiling.nix {})
    VtsHalBroadcastradioV1_0TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/broadcastradio/V1_1/adapter" ./test_vts-testcase_hal_broadcastradio_V1_1_adapter.nix {})
    VtsHalBroadcastradioV1_1Adapter;

  inherit (callBPPackage "test/vts-testcase/hal/broadcastradio/V1_1/target" ./test_vts-testcase_hal_broadcastradio_V1_1_target.nix {})
    VtsHalBroadcastradioV1_1Target;

  inherit (callBPPackage "test/vts-testcase/hal/broadcastradio/V1_1/target_profiling" ./test_vts-testcase_hal_broadcastradio_V1_1_target_profiling.nix {})
    VtsHalBroadcastradioV1_1TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/broadcastradio/V2_0/target" ./test_vts-testcase_hal_broadcastradio_V2_0_target.nix {})
    VtsHalBroadcastradioV2_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/broadcastradio/V2_0/target_profiling" ./test_vts-testcase_hal_broadcastradio_V2_0_target_profiling.nix {})
    VtsHalBroadcastradioV2_0TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/camera/metadata/V3_3/adapter" ./test_vts-testcase_hal_camera_metadata_V3_3_adapter.nix {})
    VtsHalCameraMetadataV3_3Adapter;

  inherit (callBPPackage "test/vts-testcase/hal/camera/provider/V2_4/target" ./test_vts-testcase_hal_camera_provider_V2_4_target.nix {})
    VtsHalCameraProviderV2_4Target;

  inherit (callBPPackage "test/vts-testcase/hal/camera/provider/V2_4/target_profiling" ./test_vts-testcase_hal_camera_provider_V2_4_target_profiling.nix {})
    VtsHalCameraProviderV2_4TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/cas/V1_0/target" ./test_vts-testcase_hal_cas_V1_0_target.nix {})
    VtsHalCasV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/cas/V1_1/target" ./test_vts-testcase_hal_cas_V1_1_target.nix {})
    VtsHalCasV1_1Target;

  inherit (callBPPackage "test/vts-testcase/hal/configstore/V1_0/target" ./test_vts-testcase_hal_configstore_V1_0_target.nix {})
    VtsHalConfigstoreV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/configstore/V1_0/target_profiling" ./test_vts-testcase_hal_configstore_V1_0_target_profiling.nix {})
    VtsHalConfigstoreV1_0TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/configstore/V1_0/target_replay" ./test_vts-testcase_hal_configstore_V1_0_target_replay.nix {})
    VtsHalConfigstoreV1_0TargetReplay;

  inherit (callBPPackage "test/vts-testcase/hal/contexthub/V1_0/host" ./test_vts-testcase_hal_contexthub_V1_0_host.nix {})
    VtsHalContexthubV1_0Host;

  inherit (callBPPackage "test/vts-testcase/hal/contexthub/V1_0/target" ./test_vts-testcase_hal_contexthub_V1_0_target.nix {})
    VtsHalContexthubV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/contexthub/V1_0/target_profiling" ./test_vts-testcase_hal_contexthub_V1_0_target_profiling.nix {})
    VtsHalContexthubV1_0TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/contexthub/V1_0/target_replay" ./test_vts-testcase_hal_contexthub_V1_0_target_replay.nix {})
    VtsHalContexthubV1_0TargetReplay;

  inherit (callBPPackage "test/vts-testcase/hal/drm/V1_0/target" ./test_vts-testcase_hal_drm_V1_0_target.nix {})
    VtsHalDrmV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/drm/V1_1/adapter" ./test_vts-testcase_hal_drm_V1_1_adapter.nix {})
    VtsHalDrmV1_1Adapter;

  inherit (callBPPackage "test/vts-testcase/hal/drm/V1_1/target" ./test_vts-testcase_hal_drm_V1_1_target.nix {})
    VtsHalDrmV1_1Target;

  inherit (callBPPackage "test/vts-testcase/hal/drm/V1_1/target_profiling" ./test_vts-testcase_hal_drm_V1_1_target_profiling.nix {})
    VtsHalDrmV1_1TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/dumpstate/V1_0/target" ./test_vts-testcase_hal_dumpstate_V1_0_target.nix {})
    VtsHalDumpstateV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/gatekeeper/V1_0/target" ./test_vts-testcase_hal_gatekeeper_V1_0_target.nix {})
    VtsHalGatekeeperV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/gatekeeper/V1_0/target_profiling" ./test_vts-testcase_hal_gatekeeper_V1_0_target_profiling.nix {})
    VtsHalGatekeeperV1_0TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/gatekeeper/V1_0/target_replay" ./test_vts-testcase_hal_gatekeeper_V1_0_target_replay.nix {})
    VtsHalGatekeeperV1_0TargetReplay;

  inherit (callBPPackage "test/vts-testcase/hal/gnss/V1_0/host/binderize" ./test_vts-testcase_hal_gnss_V1_0_host_binderize.nix {})
    VtsHalGnssV1_0HostBinderize;

  inherit (callBPPackage "test/vts-testcase/hal/gnss/V1_0/target" ./test_vts-testcase_hal_gnss_V1_0_target.nix {})
    VtsHalGnssV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/gnss/V1_0/target_profiling" ./test_vts-testcase_hal_gnss_V1_0_target_profiling.nix {})
    VtsHalGnssV1_0TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/gnss/V1_1/adapter/CtsLocationTestCases" ./test_vts-testcase_hal_gnss_V1_1_adapter_CtsLocationTestCases.nix {})
    VtsHalGnssV1_1AdapterCtsLocationTestCases;

  inherit (callBPPackage "test/vts-testcase/hal/gnss/V1_1/adapter/CtsStatsdHostTestCases" ./test_vts-testcase_hal_gnss_V1_1_adapter_CtsStatsdHostTestCases.nix {})
    VtsHalGnssV1_1AdapterCtsStatsdHostTestCases;

  inherit (callBPPackage "test/vts-testcase/hal/graphics/composer/V2_1/target" ./test_vts-testcase_hal_graphics_composer_V2_1_target.nix {})
    VtsHalGraphicsComposerV2_1Target;

  inherit (callBPPackage "test/vts-testcase/hal/graphics/composer/V2_1/target_profiling" ./test_vts-testcase_hal_graphics_composer_V2_1_target_profiling.nix {})
    VtsHalGraphicsComposerV2_1TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/graphics/composer/V2_2/adapter" ./test_vts-testcase_hal_graphics_composer_V2_2_adapter.nix {})
    VtsHalGraphicsComposerV2_2Adapter;

  inherit (callBPPackage "test/vts-testcase/hal/graphics/composer/V2_2/target" ./test_vts-testcase_hal_graphics_composer_V2_2_target.nix {})
    VtsHalGraphicsComposerV2_2Target;

  inherit (callBPPackage "test/vts-testcase/hal/graphics/composer/V2_3/target" ./test_vts-testcase_hal_graphics_composer_V2_3_target.nix {})
    VtsHalGraphicsComposerV2_3Target;

  inherit (callBPPackage "test/vts-testcase/hal/graphics/mapper/V2_0/target" ./test_vts-testcase_hal_graphics_mapper_V2_0_target.nix {})
    VtsHalGraphicsMapperV2_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/graphics/mapper/V2_0/target_profiling" ./test_vts-testcase_hal_graphics_mapper_V2_0_target_profiling.nix {})
    VtsHalGraphicsMapperV2_0TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/graphics/mapper/V2_1/target_profiling" ./test_vts-testcase_hal_graphics_mapper_V2_1_target_profiling.nix {})
    VtsHalGraphicsMapperV2_1TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/health/V1_0/target" ./test_vts-testcase_hal_health_V1_0_target.nix {})
    VtsHalHealthV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/health/V1_0/target_profiling" ./test_vts-testcase_hal_health_V1_0_target_profiling.nix {})
    VtsHalHealthV1_0TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/health/V2_0/target" ./test_vts-testcase_hal_health_V2_0_target.nix {})
    VtsHalHealthV2_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/health/storage/V1_0/target" ./test_vts-testcase_hal_health_storage_V1_0_target.nix {})
    VtsHalHealthStorageV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/ir/V1_0/target" ./test_vts-testcase_hal_ir_V1_0_target.nix {})
    VtsHalIrV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/ir/V1_0/target_profiling" ./test_vts-testcase_hal_ir_V1_0_target_profiling.nix {})
    VtsHalIrV1_0TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/keymaster/V3_0/target" ./test_vts-testcase_hal_keymaster_V3_0_target.nix {})
    VtsHalKeymasterV3_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/keymaster/V3_0/target_replay" ./test_vts-testcase_hal_keymaster_V3_0_target_replay.nix {})
    VtsHalKeymasterV3_0TargetReplay;

  inherit (callBPPackage "test/vts-testcase/hal/keymaster/V4_0/target" ./test_vts-testcase_hal_keymaster_V4_0_target.nix {})
    VtsHalKeymasterV4_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/light/V2_0/target" ./test_vts-testcase_hal_light_V2_0_target.nix {})
    VtsHalLightV2_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/light/V2_0/target_profiling" ./test_vts-testcase_hal_light_V2_0_target_profiling.nix {})
    VtsHalLightV2_0TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/light/V2_0/target_replay" ./test_vts-testcase_hal_light_V2_0_target_replay.nix {})
    VtsHalLightV2_0TargetReplay;

  inherit (callBPPackage "test/vts-testcase/hal/media/c2/V1_0/host" ./test_vts-testcase_hal_media_c2_V1_0_host.nix {})
    VtsHalMediaC2V1_0Host;

  inherit (callBPPackage "test/vts-testcase/hal/media/omx/V1_0/host" ./test_vts-testcase_hal_media_omx_V1_0_host.nix {})
    VtsHalMediaOmxV1_0Host;

  inherit (callBPPackage "test/vts-testcase/hal/media/omx/V1_0/host_omxstore" ./test_vts-testcase_hal_media_omx_V1_0_host_omxstore.nix {})
    VtsHalMediaOmxStoreV1_0Host;

  inherit (callBPPackage "test/vts-testcase/hal/memtrack/V1_0/target" ./test_vts-testcase_hal_memtrack_V1_0_target.nix {})
    VtsHalMemtrackV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/memtrack/V1_0/target_profiling" ./test_vts-testcase_hal_memtrack_V1_0_target_profiling.nix {})
    VtsHalMemtrackV1_0TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/memtrack/V1_0/target_replay" ./test_vts-testcase_hal_memtrack_V1_0_target_replay.nix {})
    VtsHalMemtrackV1_0TargetReplay;

  inherit (callBPPackage "test/vts-testcase/hal/net/netd/V1_0/target" ./test_vts-testcase_hal_net_netd_V1_0_target.nix {})
    VtsHalNetNetdV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/net/netd/V1_1/target" ./test_vts-testcase_hal_net_netd_V1_1_target.nix {})
    VtsHalNetNetdV1_1Target;

  inherit (callBPPackage "test/vts-testcase/hal/neuralnetworks/V1_0/target" ./test_vts-testcase_hal_neuralnetworks_V1_0_target.nix {})
    VtsHalNeuralnetworksV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/neuralnetworks/V1_0/target_profiling" ./test_vts-testcase_hal_neuralnetworks_V1_0_target_profiling.nix {})
    VtsHalNeuralnetworksV1_0TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/neuralnetworks/V1_1/target_profiling" ./test_vts-testcase_hal_neuralnetworks_V1_1_target_profiling.nix {})
    VtsHalNeuralnetworksV1_1TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/neuralnetworks/V1_2/adapter" ./test_vts-testcase_hal_neuralnetworks_V1_2_adapter.nix {})
    VtsHalNeuralnetworksV1_2Adapter;

  inherit (callBPPackage "test/vts-testcase/hal/neuralnetworks/V1_2/benchmark" ./test_vts-testcase_hal_neuralnetworks_V1_2_benchmark.nix {})
    VtsHalNeuralnetworksV1_2Benchmark;

  inherit (callBPPackage "test/vts-testcase/hal/neuralnetworks/V1_2/target" ./test_vts-testcase_hal_neuralnetworks_V1_2_target.nix {})
    VtsHalNeuralnetworksV1_2Target;

  inherit (callBPPackage "test/vts-testcase/hal/nfc/V1_0/host/binderize" ./test_vts-testcase_hal_nfc_V1_0_host_binderize.nix {})
    VtsHalNfcV1_0HostBinderize;

  inherit (callBPPackage "test/vts-testcase/hal/nfc/V1_0/host/passthrough" ./test_vts-testcase_hal_nfc_V1_0_host_passthrough.nix {})
    VtsHalNfcV1_0HostPassthrough;

  inherit (callBPPackage "test/vts-testcase/hal/nfc/V1_0/host_profiling" ./test_vts-testcase_hal_nfc_V1_0_host_profiling.nix {})
    VtsHalNfcV1_0HostProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/nfc/V1_0/target" ./test_vts-testcase_hal_nfc_V1_0_target.nix {})
    VtsHalNfcV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/nfc/V1_0/target_profiling" ./test_vts-testcase_hal_nfc_V1_0_target_profiling.nix {})
    VtsHalNfcV1_0TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/nfc/V1_0/target_replay" ./test_vts-testcase_hal_nfc_V1_0_target_replay.nix {})
    VtsHalNfcV1_0TargetReplay;

  inherit (callBPPackage "test/vts-testcase/hal/nfc/V1_1/adapter" ./test_vts-testcase_hal_nfc_V1_1_adapter.nix {})
    VtsHalNfcV1_1Adapter;

  inherit (callBPPackage "test/vts-testcase/hal/nfc/V1_1/target" ./test_vts-testcase_hal_nfc_V1_1_target.nix {})
    VtsHalNfcV1_1Target;

  inherit (callBPPackage "test/vts-testcase/hal/nfc/V1_2/adapter" ./test_vts-testcase_hal_nfc_V1_2_adapter.nix {})
    VtsHalNfcV1_2Adapter;

  inherit (callBPPackage "test/vts-testcase/hal/nfc/V1_2/target" ./test_vts-testcase_hal_nfc_V1_2_target.nix {})
    VtsHalNfcV1_2Target;

  inherit (callBPPackage "test/vts-testcase/hal/oemlock/V1_0/target" ./test_vts-testcase_hal_oemlock_V1_0_target.nix {})
    VtsHalOemLockV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/oemlock/V1_0/target_profiling" ./test_vts-testcase_hal_oemlock_V1_0_target_profiling.nix {})
    VtsHalOemLockV1_0TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/power/V1_0/target" ./test_vts-testcase_hal_power_V1_0_target.nix {})
    VtsHalPowerV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/power/V1_0/target_replay" ./test_vts-testcase_hal_power_V1_0_target_replay.nix {})
    VtsHalPowerV1_0TargetReplay;

  inherit (callBPPackage "test/vts-testcase/hal/power/V1_1/adapter" ./test_vts-testcase_hal_power_V1_1_adapter.nix {})
    VtsHalPowerV1_1Adapter;

  inherit (callBPPackage "test/vts-testcase/hal/power/V1_1/target" ./test_vts-testcase_hal_power_V1_1_target.nix {})
    VtsHalPowerV1_1Target;

  inherit (callBPPackage "test/vts-testcase/hal/power/V1_1/target_profiling" ./test_vts-testcase_hal_power_V1_1_target_profiling.nix {})
    VtsHalPowerV1_1TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/power/V1_2/adapter" ./test_vts-testcase_hal_power_V1_2_adapter.nix {})
    VtsHalPowerV1_2Adapter;

  inherit (callBPPackage "test/vts-testcase/hal/power/V1_2/target" ./test_vts-testcase_hal_power_V1_2_target.nix {})
    VtsHalPowerV1_2Target;

  inherit (callBPPackage "test/vts-testcase/hal/power/V1_3/target" ./test_vts-testcase_hal_power_V1_3_target.nix {})
    VtsHalPowerV1_3Target;

  inherit (callBPPackage "test/vts-testcase/hal/power/stats/V1_0/target" ./test_vts-testcase_hal_power_stats_V1_0_target.nix {})
    VtsHalPowerStatsV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/radio/V1_0/host" ./test_vts-testcase_hal_radio_V1_0_host.nix {})
    VtsHalRadioV1_0Host;

  inherit (callBPPackage "test/vts-testcase/hal/radio/V1_0/target/radio" ./test_vts-testcase_hal_radio_V1_0_target_radio.nix {})
    VtsHalRadioV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/radio/V1_0/target/sap" ./test_vts-testcase_hal_radio_V1_0_target_sap.nix {})
    VtsHalSapV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/radio/V1_0/target_profiling/radio" ./test_vts-testcase_hal_radio_V1_0_target_profiling_radio.nix {})
    VtsHalRadioV1_0TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/radio/V1_0/target_profiling/sap" ./test_vts-testcase_hal_radio_V1_0_target_profiling_sap.nix {})
    VtsHalSapV1_0TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/radio/V1_1/adapter/CtsDevicePolicyManagerTestCases" ./test_vts-testcase_hal_radio_V1_1_adapter_CtsDevicePolicyManagerTestCases.nix {})
    VtsHalRadioV1_1AdapterCtsDevicePolicyManagerTestCases;

  inherit (callBPPackage "test/vts-testcase/hal/radio/V1_1/adapter/CtsJobSchedulerTestCases" ./test_vts-testcase_hal_radio_V1_1_adapter_CtsJobSchedulerTestCases.nix {})
    VtsHalRadioV1_1AdapterCtsJobSchedulerTestCases;

  inherit (callBPPackage "test/vts-testcase/hal/radio/V1_1/adapter/CtsTelephonyTestCases" ./test_vts-testcase_hal_radio_V1_1_adapter_CtsTelephonyTestCases.nix {})
    VtsHalRadioV1_1AdapterCtsTelephonyTestCases;

  inherit (callBPPackage "test/vts-testcase/hal/radio/V1_1/target/radio" ./test_vts-testcase_hal_radio_V1_1_target_radio.nix {})
    VtsHalRadioV1_1Target;

  inherit (callBPPackage "test/vts-testcase/hal/radio/V1_2/target/radio" ./test_vts-testcase_hal_radio_V1_2_target_radio.nix {})
    VtsHalRadioV1_2Target;

  inherit (callBPPackage "test/vts-testcase/hal/radio/V1_4/target/radio" ./test_vts-testcase_hal_radio_V1_4_target_radio.nix {})
    VtsHalRadioV1_4Target;

  inherit (callBPPackage "test/vts-testcase/hal/renderscript/V1_0/target" ./test_vts-testcase_hal_renderscript_V1_0_target.nix {})
    VtsHalRenderscriptV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/secure_element/V1_0/target" ./test_vts-testcase_hal_secure_element_V1_0_target.nix {})
    VtsHalSecureElementV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/sensors/V1_0/host" ./test_vts-testcase_hal_sensors_V1_0_host.nix {})
    VtsHalSensorsV1_0Host;

  inherit (callBPPackage "test/vts-testcase/hal/sensors/V1_0/host_profiling" ./test_vts-testcase_hal_sensors_V1_0_host_profiling.nix {})
    VtsHalSensorsV1_0HostProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/sensors/V1_0/target" ./test_vts-testcase_hal_sensors_V1_0_target.nix {})
    VtsHalSensorsV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/sensors/V1_0/target_profiling" ./test_vts-testcase_hal_sensors_V1_0_target_profiling.nix {})
    VtsHalSensorsV1_0TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/sensors/V2_0/host" ./test_vts-testcase_hal_sensors_V2_0_host.nix {})
    VtsHalSensorsV2_0Host;

  inherit (callBPPackage "test/vts-testcase/hal/sensors/V2_0/host_profiling" ./test_vts-testcase_hal_sensors_V2_0_host_profiling.nix {})
    VtsHalSensorsV2_0HostProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/sensors/V2_0/target" ./test_vts-testcase_hal_sensors_V2_0_target.nix {})
    VtsHalSensorsV2_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/sensors/V2_0/target_profiling" ./test_vts-testcase_hal_sensors_V2_0_target_profiling.nix {})
    VtsHalSensorsV2_0TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/soundtrigger/V2_0/target" ./test_vts-testcase_hal_soundtrigger_V2_0_target.nix {})
    VtsHalSoundtriggerV2_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/soundtrigger/V2_0/target_profiling" ./test_vts-testcase_hal_soundtrigger_V2_0_target_profiling.nix {})
    VtsHalSoundtriggerV2_0TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/soundtrigger/V2_1/adapter/CtsStatsdHostTestCases" ./test_vts-testcase_hal_soundtrigger_V2_1_adapter_CtsStatsdHostTestCases.nix {})
    VtsHalSoundtriggerV2_1AdapterCtsStatsdHostTestCases;

  inherit (callBPPackage "test/vts-testcase/hal/soundtrigger/V2_1/adapter/CtsWidgetTestCases" ./test_vts-testcase_hal_soundtrigger_V2_1_adapter_CtsWidgetTestCases.nix {})
    VtsHalSoundtriggerV2_1AdapterCtsWidgetTestCases;

  inherit (callBPPackage "test/vts-testcase/hal/soundtrigger/V2_1/target_profiling" ./test_vts-testcase_hal_soundtrigger_V2_1_target_profiling.nix {})
    VtsHalSoundtriggerV2_1TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/soundtrigger/V2_2/adapter/CtsStatsdHostTestCases" ./test_vts-testcase_hal_soundtrigger_V2_2_adapter_CtsStatsdHostTestCases.nix {})
    VtsHalSoundtriggerV2_2AdapterCtsStatsdHostTestCases;

  inherit (callBPPackage "test/vts-testcase/hal/soundtrigger/V2_2/adapter/CtsWidgetTestCases" ./test_vts-testcase_hal_soundtrigger_V2_2_adapter_CtsWidgetTestCases.nix {})
    VtsHalSoundtriggerV2_2AdapterCtsWidgetTestCases;

  inherit (callBPPackage "test/vts-testcase/hal/soundtrigger/V2_2/target" ./test_vts-testcase_hal_soundtrigger_V2_2_target.nix {})
    VtsHalSoundtriggerV2_2Target;

  inherit (callBPPackage "test/vts-testcase/hal/soundtrigger/V2_2/target_profiling" ./test_vts-testcase_hal_soundtrigger_V2_2_target_profiling.nix {})
    VtsHalSoundtriggerV2_2TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/tetheroffload/config/V1_0/target" ./test_vts-testcase_hal_tetheroffload_config_V1_0_target.nix {})
    VtsHalTetheroffloadConfigV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/tetheroffload/control/V1_0/target" ./test_vts-testcase_hal_tetheroffload_control_V1_0_target.nix {})
    VtsHalTetheroffloadControlV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/thermal/V1_0/target" ./test_vts-testcase_hal_thermal_V1_0_target.nix {})
    VtsHalThermalV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/thermal/V1_0/target_profiling" ./test_vts-testcase_hal_thermal_V1_0_target_profiling.nix {})
    VtsHalThermalV1_0TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/thermal/V1_0/target_replay" ./test_vts-testcase_hal_thermal_V1_0_target_replay.nix {})
    VtsHalThermalV1_0TargetReplay;

  inherit (callBPPackage "test/vts-testcase/hal/thermal/V1_0/target_stress" ./test_vts-testcase_hal_thermal_V1_0_target_stress.nix {})
    ThermalHidlTargetStressTest thermal_hidl_stress_test;

  inherit (callBPPackage "test/vts-testcase/hal/thermal/V1_1/adapter" ./test_vts-testcase_hal_thermal_V1_1_adapter.nix {})
    VtsHalThermalV1_1Adapter;

  inherit (callBPPackage "test/vts-testcase/hal/thermal/V1_1/target" ./test_vts-testcase_hal_thermal_V1_1_target.nix {})
    VtsHalThermalV1_1Target;

  inherit (callBPPackage "test/vts-testcase/hal/thermal/V1_1/target_profiling" ./test_vts-testcase_hal_thermal_V1_1_target_profiling.nix {})
    VtsHalThermalV1_1TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/treble/framework_vintf" ./test_vts-testcase_hal_treble_framework_vintf.nix {})
    VtsTrebleFrameworkVintfTest;

  inherit (callBPPackage "test/vts-testcase/hal/treble/platform_version" ./test_vts-testcase_hal_treble_platform_version.nix {})
    VtsTreblePlatformVersionTest;

  inherit (callBPPackage "test/vts-testcase/hal/treble/vendor_vintf" ./test_vts-testcase_hal_treble_vendor_vintf.nix {})
    VtsTrebleVendorVintfTest;

  inherit (callBPPackage "test/vts-testcase/hal/treble/vintf" ./test_vts-testcase_hal_treble_vintf.nix {})
    VtsTrebleVintfTestOMr1 vts_treble_vintf_framework_test vts_treble_vintf_test_all vts_treble_vintf_test_defaults vts_treble_vintf_test_o_mr1 vts_treble_vintf_vendor_test;

  inherit (callBPPackage "test/vts-testcase/hal/tv/cec/V1_0/host" ./test_vts-testcase_hal_tv_cec_V1_0_host.nix {})
    VtsHalTvCecV1_0Host;

  inherit (callBPPackage "test/vts-testcase/hal/tv/cec/V1_0/host_profiling" ./test_vts-testcase_hal_tv_cec_V1_0_host_profiling.nix {})
    VtsHalTvCecV1_0HostProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/tv/input/V1_0/host" ./test_vts-testcase_hal_tv_input_V1_0_host.nix {})
    VtsHalTvInputV1_0Host;

  inherit (callBPPackage "test/vts-testcase/hal/tv/input/V1_0/host_profiling" ./test_vts-testcase_hal_tv_input_V1_0_host_profiling.nix {})
    VtsHalTvInputV1_0HostProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/tv/input/V1_0/target" ./test_vts-testcase_hal_tv_input_V1_0_target.nix {})
    VtsHalTvInputV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/tv/input/V1_0/target_profiling" ./test_vts-testcase_hal_tv_input_V1_0_target_profiling.nix {})
    VtsHalTvInputV1_0TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/usb/V1_0/target" ./test_vts-testcase_hal_usb_V1_0_target.nix {})
    VtsHalUsbV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/usb/V1_0/target_profiling" ./test_vts-testcase_hal_usb_V1_0_target_profiling.nix {})
    VtsHalUsbV1_0TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/usb/V1_0/target_replay" ./test_vts-testcase_hal_usb_V1_0_target_replay.nix {})
    VtsHalUsbV1_0TargetReplay;

  inherit (callBPPackage "test/vts-testcase/hal/usb/V1_1/adapter" ./test_vts-testcase_hal_usb_V1_1_adapter.nix {})
    VtsHalUsbV1_1Adapter;

  inherit (callBPPackage "test/vts-testcase/hal/usb/V1_1/target" ./test_vts-testcase_hal_usb_V1_1_target.nix {})
    VtsHalUsbV1_1Target;

  inherit (callBPPackage "test/vts-testcase/hal/usb/gadget/V1_0/host" ./test_vts-testcase_hal_usb_gadget_V1_0_host.nix {})
    VtsHalUsbGadgetV1_0Host;

  inherit (callBPPackage "test/vts-testcase/hal/vibrator/V1_0/host" ./test_vts-testcase_hal_vibrator_V1_0_host.nix {})
    VtsHalVibratorV1_0Host;

  inherit (callBPPackage "test/vts-testcase/hal/vibrator/V1_0/host_profiling" ./test_vts-testcase_hal_vibrator_V1_0_host_profiling.nix {})
    VtsHalVibratorV1_0HostProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/vibrator/V1_0/target" ./test_vts-testcase_hal_vibrator_V1_0_target.nix {})
    VtsHalVibratorV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/vibrator/V1_0/target_profiling" ./test_vts-testcase_hal_vibrator_V1_0_target_profiling.nix {})
    VtsHalVibratorV1_0TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/vibrator/V1_0/target_replay" ./test_vts-testcase_hal_vibrator_V1_0_target_replay.nix {})
    VtsHalVibratorV1_0TargetReplay;

  inherit (callBPPackage "test/vts-testcase/hal/vibrator/V1_1/adapter" ./test_vts-testcase_hal_vibrator_V1_1_adapter.nix {})
    VtsHalVibratorV1_1Adapter;

  inherit (callBPPackage "test/vts-testcase/hal/vibrator/V1_1/target" ./test_vts-testcase_hal_vibrator_V1_1_target.nix {})
    VtsHalVibratorV1_1Target;

  inherit (callBPPackage "test/vts-testcase/hal/vr/V1_0/host" ./test_vts-testcase_hal_vr_V1_0_host.nix {})
    VtsHalVrV1_0Host;

  inherit (callBPPackage "test/vts-testcase/hal/vr/V1_0/target" ./test_vts-testcase_hal_vr_V1_0_target.nix {})
    VtsHalVrV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/vr/V1_0/target_replay" ./test_vts-testcase_hal_vr_V1_0_target_replay.nix {})
    VtsHalVrV1_0TargetReplay;

  inherit (callBPPackage "test/vts-testcase/hal/weaver/V1_0/target" ./test_vts-testcase_hal_weaver_V1_0_target.nix {})
    VtsHalWeaverV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/weaver/V1_0/target_profiling" ./test_vts-testcase_hal_weaver_V1_0_target_profiling.nix {})
    VtsHalWeaverV1_0TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/wifi/V1_0/host" ./test_vts-testcase_hal_wifi_V1_0_host.nix {})
    VtsHalWifiV1_0Host;

  inherit (callBPPackage "test/vts-testcase/hal/wifi/V1_0/target/nan" ./test_vts-testcase_hal_wifi_V1_0_target_nan.nix {})
    VtsHalWifiNanV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/wifi/V1_0/target_profiling/base" ./test_vts-testcase_hal_wifi_V1_0_target_profiling_base.nix {})
    VtsHalWifiV1_0TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/wifi/V1_0/target_profiling/nan" ./test_vts-testcase_hal_wifi_V1_0_target_profiling_nan.nix {})
    VtsHalWifiNanV1_0TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/wifi/V1_1/target/base" ./test_vts-testcase_hal_wifi_V1_1_target_base.nix {})
    VtsHalWifiV1_1Target;

  inherit (callBPPackage "test/vts-testcase/hal/wifi/V1_1/target_profiling/base" ./test_vts-testcase_hal_wifi_V1_1_target_profiling_base.nix {})
    VtsHalWifiV1_1TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/wifi/V1_2/target_profiling" ./test_vts-testcase_hal_wifi_V1_2_target_profiling.nix {})
    VtsHalWifiV1_2TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/wifi/V1_2/target_profiling/nan" ./test_vts-testcase_hal_wifi_V1_2_target_profiling_nan.nix {})
    VtsHalWifiNanV1_2TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/wifi/offload/V1_0/target" ./test_vts-testcase_hal_wifi_offload_V1_0_target.nix {})
    VtsHalWifiOffloadV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/wifi/supplicant/V1_0/target" ./test_vts-testcase_hal_wifi_supplicant_V1_0_target.nix {})
    VtsHalWifiSupplicantV1_0Target;

  inherit (callBPPackage "test/vts-testcase/hal/wifi/supplicant/V1_0/target_profiling" ./test_vts-testcase_hal_wifi_supplicant_V1_0_target_profiling.nix {})
    VtsHalWifiSupplicantV1_0TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/hal/wifi/supplicant/V1_1/adapter" ./test_vts-testcase_hal_wifi_supplicant_V1_1_adapter.nix {})
    VtsHalWifiSupplicantV1_1Adapter;

  inherit (callBPPackage "test/vts-testcase/hal/wifi/supplicant/V1_1/target" ./test_vts-testcase_hal_wifi_supplicant_V1_1_target.nix {})
    VtsHalWifiSupplicantV1_1Target;

  inherit (callBPPackage "test/vts-testcase/hal/wifi/supplicant/V1_1/target_profiling" ./test_vts-testcase_hal_wifi_supplicant_V1_1_target_profiling.nix {})
    VtsHalWifiSupplicantV1_1TargetProfiling;

  inherit (callBPPackage "test/vts-testcase/kernel/api/binder" ./test_vts-testcase_kernel_api_binder.nix {})
    VtsKernelBinderTest;

  inherit (callBPPackage "test/vts-testcase/kernel/api/bpf_native_test" ./test_vts-testcase_kernel_api_bpf_native_test.nix {})
    "kern.o" VtsKernelNetBpfTest vts_test_binary_bpf_module;

  inherit (callBPPackage "test/vts-testcase/kernel/api/hwbinder" ./test_vts-testcase_kernel_api_hwbinder.nix {})
    VtsKernelHwBinder;

  inherit (callBPPackage "test/vts-testcase/kernel/api/libcutils" ./test_vts-testcase_kernel_api_libcutils.nix {})
    VtsKernelLibcutilsTest;

  inherit (callBPPackage "test/vts-testcase/kernel/api/net" ./test_vts-testcase_kernel_api_net.nix {})
    VtsKernelNetTest;

  inherit (callBPPackage "test/vts-testcase/kernel/api/netd" ./test_vts-testcase_kernel_api_netd.nix {})
    VtsKernelNetdTest;

  inherit (callBPPackage "test/vts-testcase/kernel/api/proc" ./test_vts-testcase_kernel_api_proc.nix {})
    VtsKernelProcFileApi;

  inherit (callBPPackage "test/vts-testcase/kernel/api/qtaguid" ./test_vts-testcase_kernel_api_qtaguid.nix {})
    VtsKernelQtaguidTest vts_test_binary_qtaguid_module;

  inherit (callBPPackage "test/vts-testcase/kernel/api/rootdir" ./test_vts-testcase_kernel_api_rootdir.nix {})
    VtsKernelRootDir;

  inherit (callBPPackage "test/vts-testcase/kernel/api/selinux" ./test_vts-testcase_kernel_api_selinux.nix {})
    VtsKernelSelinuxFileApi;

  inherit (callBPPackage "test/vts-testcase/kernel/api/sysfs" ./test_vts-testcase_kernel_api_sysfs.nix {})
    VtsKernelApiSysfsTest;

  inherit (callBPPackage "test/vts-testcase/kernel/api/tun" ./test_vts-testcase_kernel_api_tun.nix {})
    VtsKernelTunTest vts_kernel_tun_test;

  inherit (callBPPackage "test/vts-testcase/kernel/bow" ./test_vts-testcase_kernel_bow.nix {})
    vts_test_binary_bow_module;

  inherit (callBPPackage "test/vts-testcase/kernel/checkpoint" ./test_vts-testcase_kernel_checkpoint.nix {})
    VtsKernelCheckpointTest;

  inherit (callBPPackage "test/vts-testcase/kernel/cpu_profiling" ./test_vts-testcase_kernel_cpu_profiling.nix {})
    CpuProfilingTest;

  inherit (callBPPackage "test/vts-testcase/kernel/linux_kselftest/presubmit" ./test_vts-testcase_kernel_linux_kselftest_presubmit.nix {})
    VtsKernelLinuxKselftestPresubmit;

  inherit (callBPPackage "test/vts-testcase/kernel/linux_kselftest/stable" ./test_vts-testcase_kernel_linux_kselftest_stable.nix {})
    VtsKernelLinuxKselftest;

  inherit (callBPPackage "test/vts-testcase/kernel/linux_kselftest/staging" ./test_vts-testcase_kernel_linux_kselftest_staging.nix {})
    VtsKernelLinuxKselftestStaging;

  inherit (callBPPackage "test/vts-testcase/kernel/loop" ./test_vts-testcase_kernel_loop.nix {})
    vts_kernel_loopconfig_test;

  inherit (callBPPackage "test/vts-testcase/kernel/ltp/stable" ./test_vts-testcase_kernel_ltp_stable.nix {})
    VtsKernelLtp;

  inherit (callBPPackage "test/vts-testcase/kernel/ltp/staging" ./test_vts-testcase_kernel_ltp_staging.nix {})
    VtsKernelLtpStaging;

  inherit (callBPPackage "test/vts-testcase/kernel/memory" ./test_vts-testcase_kernel_memory.nix {})
    MemorySystemStressTest;

  inherit (callBPPackage "test/vts-testcase/kernel/toolchain" ./test_vts-testcase_kernel_toolchain.nix {})
    VtsKernelToolchain vts_kernel_toolchain;

  inherit (callBPPackage "test/vts-testcase/nbu" ./test_vts-testcase_nbu.nix {})
    VtsNbu;

  inherit (callBPPackage "test/vts-testcase/performance/audio_loopback_test" ./test_vts-testcase_performance_audio_loopback_test.nix {})
    AudioLoopbackTest;

  inherit (callBPPackage "test/vts-testcase/performance/binder_benchmark/binder_performance_systrace_test" ./test_vts-testcase_performance_binder_benchmark_binder_performance_systrace_test.nix {})
    BinderPerformanceSystraceTest;

  inherit (callBPPackage "test/vts-testcase/performance/binder_benchmark/binder_performance_test" ./test_vts-testcase_performance_binder_benchmark_binder_performance_test.nix {})
    BinderPerformanceTest;

  inherit (callBPPackage "test/vts-testcase/performance/binder_throughput_test/binder_throughput_benchmark" ./test_vts-testcase_performance_binder_throughput_test_binder_throughput_benchmark.nix {})
    BinderThroughputBenchmark;

  inherit (callBPPackage "test/vts-testcase/performance/binder_throughput_test/binder_throughput_benchmark_systrace" ./test_vts-testcase_performance_binder_throughput_test_binder_throughput_benchmark_systrace.nix {})
    BinderThroughputBenchmarkSystrace;

  inherit (callBPPackage "test/vts-testcase/performance/fmq_benchmark" ./test_vts-testcase_performance_fmq_benchmark.nix {})
    FmqPerformanceTest;

  inherit (callBPPackage "test/vts-testcase/performance/hwbinder_benchmark/binderize" ./test_vts-testcase_performance_hwbinder_benchmark_binderize.nix {})
    HwBinderBinderizePerformanceTest;

  inherit (callBPPackage "test/vts-testcase/performance/hwbinder_benchmark/binderize_systrace" ./test_vts-testcase_performance_hwbinder_benchmark_binderize_systrace.nix {})
    HwBinderBinderizePerformanceSystraceTest;

  inherit (callBPPackage "test/vts-testcase/performance/hwbinder_benchmark/passthrough" ./test_vts-testcase_performance_hwbinder_benchmark_passthrough.nix {})
    HwBinderPassthroughPerformanceTest;

  inherit (callBPPackage "test/vts-testcase/performance/hwbinder_benchmark/passthrough_systrace" ./test_vts-testcase_performance_hwbinder_benchmark_passthrough_systrace.nix {})
    HwBinderPassthroughPerformanceSystraceTest;

  inherit (callBPPackage "test/vts-testcase/performance/hwbinder_latency_test/binderize" ./test_vts-testcase_performance_hwbinder_latency_test_binderize.nix {})
    HwBinderBinderizeLatencyTest;

  inherit (callBPPackage "test/vts-testcase/performance/hwbinder_latency_test/binderize_systrace" ./test_vts-testcase_performance_hwbinder_latency_test_binderize_systrace.nix {})
    HwBinderBinderizeLatencySystraceTest;

  inherit (callBPPackage "test/vts-testcase/performance/hwbinder_latency_test/passthrough" ./test_vts-testcase_performance_hwbinder_latency_test_passthrough.nix {})
    HwBinderPassthroughLatencyTest;

  inherit (callBPPackage "test/vts-testcase/performance/hwbinder_latency_test/passthrough_systrace" ./test_vts-testcase_performance_hwbinder_latency_test_passthrough_systrace.nix {})
    HwBinderPassthroughLatencySystraceTest;

  inherit (callBPPackage "test/vts-testcase/performance/hwbinder_throughput_test/binderize" ./test_vts-testcase_performance_hwbinder_throughput_test_binderize.nix {})
    HwBinderBinderizeThroughputTest;

  inherit (callBPPackage "test/vts-testcase/performance/hwbinder_throughput_test/binderize_systrace" ./test_vts-testcase_performance_hwbinder_throughput_test_binderize_systrace.nix {})
    HwBinderBinderizeThroughputSystraceTest;

  inherit (callBPPackage "test/vts-testcase/performance/hwbinder_throughput_test/passthrough" ./test_vts-testcase_performance_hwbinder_throughput_test_passthrough.nix {})
    HwBinderPassthroughThroughputTest;

  inherit (callBPPackage "test/vts-testcase/performance/hwbinder_throughput_test/passthrough_systrace" ./test_vts-testcase_performance_hwbinder_throughput_test_passthrough_systrace.nix {})
    HwBinderPassthroughThroughputSystraceTest;

  inherit (callBPPackage "test/vts-testcase/security/avb" ./test_vts-testcase_security_avb.nix {})
    VtsSecurityAvb VtsSecurityAvbTest;

  inherit (callBPPackage "test/vts-testcase/security/poc/config/stable" ./test_vts-testcase_security_poc_config_stable.nix {})
    SecurityPoCKernelTest;

  inherit (callBPPackage "test/vts-testcase/security/poc/config/staging" ./test_vts-testcase_security_poc_config_staging.nix {})
    SecurityPoCKernelTestStaging;

  inherit (callBPPackage "test/vts-testcase/security/selinux/policy" ./test_vts-testcase_security_selinux_policy.nix {})
    VtsSecuritySelinuxPolicyHost VtsSecuritySelinuxPolicyHostTest;

  inherit (callBPPackage "test/vts-testcase/security/system_property" ./test_vts-testcase_security_system_property.nix {})
    VtsTrebleSysProp;

  inherit (callBPPackage "test/vts-testcase/vndk/abi" ./test_vts-testcase_vndk_abi.nix {})
    VtsVndkAbi;

  inherit (callBPPackage "test/vts-testcase/vndk/dependency" ./test_vts-testcase_vndk_dependency.nix {})
    VtsVndkDependency;

  inherit (callBPPackage "test/vts-testcase/vndk/files" ./test_vts-testcase_vndk_files.nix {})
    VtsVndkFiles;

  inherit (callBPPackage "test/vts-testcase/vndk/golden" ./test_vts-testcase_vndk_golden.nix {})
    extract_lsdump;

  inherit (callBPPackage "test/vts-testcase/vndk/hidl/bufferpool/V1_0/target" ./test_vts-testcase_vndk_hidl_bufferpool_V1_0_target.nix {})
    VtsVndkHidlBufferpoolV1_0Target;

  inherit (callBPPackage "test/vts-testcase/vndk/hidl/bufferpool/V2_0/target" ./test_vts-testcase_vndk_hidl_bufferpool_V2_0_target.nix {})
    VtsVndkHidlBufferpoolV2_0Target;

  inherit (callBPPackage "test/vts-testcase/vndk/open_libraries" ./test_vts-testcase_vndk_open_libraries.nix {})
    VtsVndkOpenLibraries;

  inherit (callBPPackage "test/vts/compilation_tools/vtsc" ./test_vts_compilation_tools_vtsc.nix {})
    libvtsc vtsc;

  inherit (callBPPackage "test/vts/drivers/hal/common" ./test_vts_drivers_hal_common.nix {})
    libvts_common;

  inherit (callBPPackage "test/vts/drivers/hal/libcodecoverage" ./test_vts_drivers_hal_libcodecoverage.nix {})
    libvts_codecoverage;

  inherit (callBPPackage "test/vts/drivers/hal/libdatatype" ./test_vts_drivers_hal_libdatatype.nix {})
    libvts_datatype;

  inherit (callBPPackage "test/vts/drivers/hal/libmeasurement" ./test_vts_drivers_hal_libmeasurement.nix {})
    libvts_measurement;

  inherit (callBPPackage "test/vts/drivers/hal/replayer" ./test_vts_drivers_hal_replayer.nix {})
    vts_hal_replayer;

  inherit (callBPPackage "test/vts/drivers/hal/server" ./test_vts_drivers_hal_server.nix {})
    vts_hal_driver;

  inherit (callBPPackage "test/vts/drivers/libdrivercomm" ./test_vts_drivers_libdrivercomm.nix {})
    libvts_drivercomm;

  inherit (callBPPackage "test/vts/drivers/resource" ./test_vts_drivers_resource.nix {})
    libvts_resource-defaults libvts_resource_driver libvts_resource_manager vts_resource_fmq_test vts_resource_hidl_handle_test vts_resource_hidl_memory_test;

  inherit (callBPPackage "test/vts/proto" ./test_vts_proto.nix {})
    libvts_multidevice_proto libvts_proto_fuzzer_proto;

  inherit (callBPPackage "test/vts/runners/target/vts_hal_hidl_target" ./test_vts_runners_target_vts_hal_hidl_target.nix {})
    VtsHalHidlTargetTestBase;

  inherit (callBPPackage "test/vts/testcases/vts_selftest/manual_tests/flaky_test" ./test_vts_testcases_vts_selftest_manual_tests_flaky_test.nix {})
    vts_selftest_flaky_test;

  inherit (callBPPackage "test/vts/testcases/vts_selftest/manual_tests/zero_testcase_binary_test" ./test_vts_testcases_vts_selftest_manual_tests_zero_testcase_binary_test.nix {})
    vts_selftest_zero_testcase_binary_test;

  inherit (callBPPackage "test/vts/tools/build" ./test_vts_tools_build.nix {})
    vts_target_tests_defaults;

  inherit (callBPPackage "test/vts/tools/vts-tradefed/etc" ./test_vts_tools_vts-tradefed_etc.nix {})
    vtf vts-tradefed vts-tradefed_win;

  inherit (callBPPackage "test/vts/utils/native/libcoverage" ./test_vts_utils_native_libcoverage.nix {})
    vts_coverage_configure;

  inherit (callBPPackage "test/vts/utils/native/libprofiling" ./test_vts_utils_native_libprofiling.nix {})
    libvts_profiling libvts_profiling_utils vts_profiling_configure;

  inherit (callBPPackage "test/vts/utils/native/testability_checker" ./test_vts_utils_native_testability_checker.nix {})
    VtsTestabilityCheckerDefaults libvts_testability_checker libvts_testability_checker_test vts_testability_checker;

  inherit (callBPPackage "test/vts/utils/native/trace_processor" ./test_vts_utils_native_trace_processor.nix {})
    libvts_traceprocessor trace_processor;

  inherit (callBPPackage "test/vts/utils/python" ./test_vts_utils_python.nix {})
    vts_runner_utils_python;

  inherit (callBPPackage "tools/acloud" ./tools_acloud.nix {})
    acloud acloud_create acloud_default acloud_delete acloud_internal acloud_list acloud_metrics acloud_proto acloud_public acloud_reconnect acloud_setup acloud_test;

  inherit (callBPPackage "tools/apifinder" ./tools_apifinder.nix {})
    JavaApiUsedByMainlineModuleTest java_api_finder java_api_used_by_mainline_module java_api_used_by_mainline_module_testdata;

  inherit (callBPPackage "tools/apksig" ./tools_apksig.nix {})
    apksig apksigner;

  inherit (callBPPackage "tools/apkzlib" ./tools_apkzlib.nix {})
    apkzlib apkzlib_zip;

  inherit (callBPPackage "tools/asuite/aidegen" ./tools_asuite_aidegen.nix {})
    aidegen aidegen_default aidegen_lib aidegen_unittests;

  inherit (callBPPackage "tools/asuite/aidegen_functional_test" ./tools_asuite_aidegen_functional_test.nix {})
    aidegen_functional_test aidegen_functional_test_default;

  inherit (callBPPackage "tools/asuite/atest" ./tools_asuite_atest.nix {})
    atest-tradefed atest-tradefed-shell;

  inherit (callBPPackage "tools/dexter/dexter" ./tools_dexter_dexter.nix {})
    dexter;

  inherit (callBPPackage "tools/dexter/slicer" ./tools_dexter_slicer.nix {})
    slicer slicer_defaults slicer_ndk slicer_ndk_no_rtti slicer_no_rtti;

  inherit (callBPPackage "tools/external/fat32lib" ./tools_external_fat32lib.nix {})
    fat32lib;

  inherit (callBPPackage "tools/external_updater" ./tools_external_updater.nix {})
    external_updater external_updater_lib external_updater_notifier external_updater_test;

  inherit (callBPPackage "tools/loganalysis" ./tools_loganalysis.nix {})
    loganalysis;

  inherit (callBPPackage "tools/metalava" ./tools_metalava.nix {})
    metalava metalava-manual private-stub-annotations private-stub-annotations-jar stub-annotations;

  inherit (callBPPackage "tools/security/fuzzing/fuzz" ./tools_security_fuzzing_fuzz.nix {})
    fuzz;

  inherit (callBPPackage "tools/security/sanitizer-status" ./tools_security_sanitizer-status.nix {})
    libsanitizer-status sanitizer-status sanitizer-status_defaults soong-sanitizer_status;

  inherit (callBPPackage "tools/test/graphicsbenchmark/apps/alloc_stress_app" ./tools_test_graphicsbenchmark_apps_alloc_stress_app.nix {})
    GameQualificationAllocstress libstress;

  inherit (callBPPackage "tools/test/graphicsbenchmark/apps/sample_app" ./tools_test_graphicsbenchmark_apps_sample_app.nix {})
    libgamecore_sample;

  inherit (callBPPackage "tools/test/graphicsbenchmark/benchmark_libs" ./tools_test_graphicsbenchmark_benchmark_libs.nix {})
    libagq;

  inherit (callBPPackage "tools/test/graphicsbenchmark/functional_tests/hostside" ./tools_test_graphicsbenchmark_functional_tests_hostside.nix {})
    GameQualificationHostTestCases;

  inherit (callBPPackage "tools/test/graphicsbenchmark/functional_tests/java" ./tools_test_graphicsbenchmark_functional_tests_java.nix {})
    libgamecore_java_tests_jni;

  inherit (callBPPackage "tools/test/graphicsbenchmark/functional_tests/native" ./tools_test_graphicsbenchmark_functional_tests_native.nix {})
    GameQualificationNativeTestCases;

  inherit (callBPPackage "tools/test/graphicsbenchmark/performance_tests/deviceside" ./tools_test_graphicsbenchmark_performance_tests_deviceside.nix {})
    GameQualificationDevice;

  inherit (callBPPackage "tools/test/graphicsbenchmark/performance_tests/helper" ./tools_test_graphicsbenchmark_performance_tests_helper.nix {})
    GameQualificationHelper GameQualificationHelperHost GameQualificationHelperTest;

  inherit (callBPPackage "tools/test/graphicsbenchmark/performance_tests/hostside" ./tools_test_graphicsbenchmark_performance_tests_hostside.nix {})
    GameQualificationPerformanceTest;

  inherit (callBPPackage "tools/test/graphicsbenchmark/performance_tests/hostside/test" ./tools_test_graphicsbenchmark_performance_tests_hostside_test.nix {})
    GameQualificationPerformanceTestTest;

  inherit (callBPPackage "tools/tradefederation/core" ./tools_tradefederation_core.nix {})
    tradefed tradefed-doc-stubs tradefed-docs tradefed-protos tradefed_defaults tradefed_errorprone_defaults;

  inherit (callBPPackage "tools/tradefederation/core/atest" ./tools_tradefederation_core_atest.nix {})
    asuite_cc_client asuite_default asuite_metrics asuite_proto asuite_proto_java atest atest_integration_tests atest_lib_default atest_module_info atest_proto atest_py2_default atest_unittests;

  inherit (callBPPackage "tools/tradefederation/core/python-lib" ./tools_tradefederation_core_python-lib.nix {})
    tradefed_python_lib;

  inherit (callBPPackage "tools/tradefederation/core/python-lib/helloWorld" ./tools_tradefederation_core_python-lib_helloWorld.nix {})
    tradefed_hello_world;

  inherit (callBPPackage "tools/tradefederation/core/remote" ./tools_tradefederation_core_remote.nix {})
    tf-remote-client;

  inherit (callBPPackage "tools/tradefederation/core/util-apps/ContentProvider/androidTest" ./tools_tradefederation_core_util-apps_ContentProvider_androidTest.nix {})
    TradefedContentProviderTest;

  inherit (callBPPackage "tools/tradefederation/core/util-apps/ContentProvider/hostsidetests" ./tools_tradefederation_core_util-apps_ContentProvider_hostsidetests.nix {})
    TradefedContentProviderHostTest;

  inherit (callBPPackage "tools/tradefederation/core/util-apps/ContentProvider/main" ./tools_tradefederation_core_util-apps_ContentProvider_main.nix {})
    TradefedContentProvider;

  inherit (callBPPackage "tools/trebuchet" ./tools_trebuchet.nix {})
    AnalyzerKt StartupAnalyzerKt StartupSummarizerKt traceutils traceviewer trebuchet-core trebuchet-core-tests trebuchet-defaults trebuchet-startup-common trebuchet-startup-common-tests;

}
