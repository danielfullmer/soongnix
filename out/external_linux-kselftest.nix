{ cc_defaults, cc_test, sh_test }:
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

kselftest_defaults = cc_defaults {
    name = "kselftest_defaults";
    cflags = [
        #  Hacks for bionic compatibility
        "-include bionic-compat.h"

        "-Wall"

        #  Silence noisy warnings
        "-Wno-deprecated"
        "-Wno-format"
        "-Wno-gnu-designator"
        "-Wno-macro-redefined"
        "-Wno-missing-field-initializers"
        "-Wno-parentheses-equality"
        "-Wno-pointer-arith"
        "-Wno-sign-compare"
        "-Wno-unused-parameter"
        "-Wno-shift-negative-value"
        "-Wno-switch"
        "-Wno-absolute-value"
        "-Wno-non-literal-null-conversion"
        "-Wno-unused-value"
        "-Wno-unused-variable"
        "-Wno-unused-parameter"
        "-Wno-empty-body"
        "-Wno-literal-conversion"
        "-Werror"
    ];

    local_include_dirs = ["android/include"];
    gtest = false;
    no_named_install_directory = true;

    test_per_src = true;
    arch = {
        mips = {
            enabled = false;
        };
        mips64 = {
            enabled = false;
        };
    };
};

#  breakpoints test
kselftest_breakpoints_tests = cc_test {
    name = "kselftest_breakpoints_tests";
    relative_install_path = "linux-kselftest/breakpoints";
    srcs = [
        "tools/testing/selftests/breakpoints/step_after_suspend_test.c"
    ];
    defaults = ["kselftest_defaults"];
    arch = {
        arm = {
            enabled = false;
        };
        arm64 = {
            srcs = [
                "tools/testing/selftests/breakpoints/breakpoint_test_arm64.c"
            ];
        };
        x86 = {
            srcs = [
                "tools/testing/selftests/breakpoints/breakpoint_test.c"
            ];
        };
    };
};

#  capabilities test
kselftest_capabilities_test = cc_test {
    name = "kselftest_capabilities_test";
    relative_install_path = "linux-kselftest/capabilities";
    srcs = [
        "tools/testing/selftests/capabilities/test_execve.c"
        "tools/testing/selftests/capabilities/validate_cap.c"
    ];
    defaults = ["kselftest_defaults"];
    static_libs = ["libcap-ng"];
};

#  Cpu-hotplug test
kselftest_cpu-hotplug_cpu-on-off-test = sh_test {
    name = "kselftest_cpu-hotplug_cpu-on-off-test";
    sub_dir = "linux-kselftest/cpu-hotplug";
    src = "tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh";
    filename_from_src = true;
    compile_multilib = "both";
};

#  Efivarfs test
kselftest_efivarfs_tests = cc_test {
    name = "kselftest_efivarfs_tests";
    relative_install_path = "linux-kselftest/efivarfs";
    srcs = [
        "tools/testing/selftests/efivarfs/open-unlink.c"
        "tools/testing/selftests/efivarfs/create-read.c"
    ];
    defaults = ["kselftest_defaults"];
};

kselftest_efivarfs_efivarfs = sh_test {
    name = "kselftest_efivarfs_efivarfs";
    sub_dir = "linux-kselftest/efivarfs";
    src = "tools/testing/selftests/efivarfs/efivarfs.sh";
    filename_from_src = true;
    compile_multilib = "both";
};

#  Exec test
kselftest_exec_test = cc_test {
    name = "kselftest_exec_test";
    relative_install_path = "linux-kselftest/exec";
    srcs = [
        "tools/testing/selftests/exec/execveat.c"
    ];
    defaults = ["kselftest_defaults"];
};

"kselftest_exec_execveat.sh" = sh_test {
    name = "kselftest_exec_execveat.sh";
    sub_dir = "linux-kselftest/exec";
    src = "tools/testing/selftests/exec/execveat.sh";
    filename_from_src = true;
    compile_multilib = "both";
};

#  Firmware test
kselftest_firmware_fw_fallback = sh_test {
    name = "kselftest_firmware_fw_fallback";
    sub_dir = "linux-kselftest/firmware";
    src = "tools/testing/selftests/firmware/fw_fallback.sh";
    filename_from_src = true;
    compile_multilib = "both";
};

kselftest_firmware_fw_filesystem = sh_test {
    name = "kselftest_firmware_fw_filesystem";
    sub_dir = "linux-kselftest/firmware";
    src = "tools/testing/selftests/firmware/fw_filesystem.sh";
    filename_from_src = true;
    compile_multilib = "both";
};

#  Ftrace test
kselftest_ftrace_ftracetest = sh_test {
    name = "kselftest_ftrace_ftracetest";
    sub_dir = "linux-kselftest/ftrace";
    src = "tools/testing/selftests/ftrace/ftracetest";
    filename_from_src = true;
    compile_multilib = "both";
};

"kselftest_ftrace_test.d_functions" = sh_test {
    name = "kselftest_ftrace_test.d_functions";
    sub_dir = "linux-kselftest/ftrace/test.d";
    src = "tools/testing/selftests/ftrace/test.d/functions";
    filename_from_src = true;
    compile_multilib = "both";
};

"kselftest_ftrace_test.d_00basic_basic2" = sh_test {
    name = "kselftest_ftrace_test.d_00basic_basic2";
    sub_dir = "linux-kselftest/ftrace/test.d/00basic";
    src = "tools/testing/selftests/ftrace/test.d/00basic/basic2.tc";
    filename_from_src = true;
    compile_multilib = "both";
};

"kselftest_ftrace_test.d_00basic_basic4" = sh_test {
    name = "kselftest_ftrace_test.d_00basic_basic4";
    sub_dir = "linux-kselftest/ftrace/test.d/00basic";
    src = "tools/testing/selftests/ftrace/test.d/00basic/basic4.tc";
    filename_from_src = true;
    compile_multilib = "both";
};

"kselftest_ftrace_test.d_00basic_basic1" = sh_test {
    name = "kselftest_ftrace_test.d_00basic_basic1";
    sub_dir = "linux-kselftest/ftrace/test.d/00basic";
    src = "tools/testing/selftests/ftrace/test.d/00basic/basic1.tc";
    filename_from_src = true;
    compile_multilib = "both";
};

"kselftest_ftrace_test.d_00basic_basic3" = sh_test {
    name = "kselftest_ftrace_test.d_00basic_basic3";
    sub_dir = "linux-kselftest/ftrace/test.d/00basic";
    src = "tools/testing/selftests/ftrace/test.d/00basic/basic3.tc";
    filename_from_src = true;
    compile_multilib = "both";
};

"kselftest_ftrace_test.d_template" = sh_test {
    name = "kselftest_ftrace_test.d_template";
    sub_dir = "linux-kselftest/ftrace/test.d";
    src = "tools/testing/selftests/ftrace/test.d/template";
    filename_from_src = true;
    compile_multilib = "both";
};

"kselftest_ftrace_test.d_instances_instance" = sh_test {
    name = "kselftest_ftrace_test.d_instances_instance";
    sub_dir = "linux-kselftest/ftrace/test.d/instances";
    src = "tools/testing/selftests/ftrace/test.d/instances/instance.tc";
    filename_from_src = true;
    compile_multilib = "both";
};

"kselftest_ftrace_test.d_instances_instance-event" = sh_test {
    name = "kselftest_ftrace_test.d_instances_instance-event";
    sub_dir = "linux-kselftest/ftrace/test.d/instances";
    src = "tools/testing/selftests/ftrace/test.d/instances/instance-event.tc";
    filename_from_src = true;
    compile_multilib = "both";
};

#  Futex test
kselftest_futex_tests = cc_test {
    name = "kselftest_futex_tests";
    relative_install_path = "linux-kselftest/futex/functional";
    srcs = [
        "tools/testing/selftests/futex/functional/futex_requeue_pi.c"
        "tools/testing/selftests/futex/functional/futex_requeue_pi_mismatched_ops.c"
        "tools/testing/selftests/futex/functional/futex_requeue_pi_signal_restart.c"
        "tools/testing/selftests/futex/functional/futex_wait_private_mapped_file.c"
        "tools/testing/selftests/futex/functional/futex_wait_timeout.c"
        "tools/testing/selftests/futex/functional/futex_wait_uninitialized_heap.c"
        "tools/testing/selftests/futex/functional/futex_wait_wouldblock.c"
    ];
    local_include_dirs = [
        "tools/testing/selftests/futex/include"
        "tools/testing/selftests"
    ];
    cflags = [
        "-D_GNU_SOURCE"
        "-pthread"
    ];
    defaults = ["kselftest_defaults"];
};

"kselftest_futex_functional_run.sh" = sh_test {
    name = "kselftest_futex_functional_run.sh";
    sub_dir = "linux-kselftest/futex/functional";
    src = "tools/testing/selftests/futex/functional/run.sh";
    filename_from_src = true;
    compile_multilib = "both";
};

#  intel_pstate test
kselftest_intel_pstate_tests = cc_test {
    name = "kselftest_intel_pstate_tests";
    relative_install_path = "linux-kselftest/intel_pstate";
    srcs = [
        "tools/testing/selftests/intel_pstate/aperf.c"
        "tools/testing/selftests/intel_pstate/msr.c"
    ];
    cflags = [
        "-D_GNU_SOURCE"
    ];
    defaults = ["kselftest_defaults"];
    #  TODO: test_data: intel_pstate/run.sh
};

"kselftest_intel_pstate_run.sh" = sh_test {
    name = "kselftest_intel_pstate_run.sh";
    sub_dir = "linux-kselftest/intel_pstate";
    src = "tools/testing/selftests/intel_pstate/run.sh";
    filename_from_src = true;
    compile_multilib = "both";
};

#  Kcmp test
kselftest_kcmp_tests = cc_test {
    name = "kselftest_kcmp_tests";
    relative_install_path = "linux-kselftest/kcmp";
    srcs = ["tools/testing/selftests/kcmp/kcmp_test.c"];
    defaults = ["kselftest_defaults"];
};

#  Lib test
kselftest_lib_printf = sh_test {
    name = "kselftest_lib_printf";
    sub_dir = "linux-kselftest/lib";
    src = "tools/testing/selftests/lib/printf.sh";
    filename_from_src = true;
    compile_multilib = "both";
};

kselftest_lib_bitmap = sh_test {
    name = "kselftest_lib_bitmap";
    sub_dir = "linux-kselftest/lib";
    src = "tools/testing/selftests/lib/bitmap.sh";
    filename_from_src = true;
    compile_multilib = "both";
};

#  media_tests test
kselftest_media_tests = cc_test {
    name = "kselftest_media_tests";
    relative_install_path = "linux-kselftest/media_tests";
    srcs = [
        "tools/testing/selftests/media_tests/media_device_test.c"
        "tools/testing/selftests/media_tests/media_device_open.c"
        "tools/testing/selftests/media_tests/video_device_test.c"
    ];
    defaults = ["kselftest_defaults"];
};

#  Membarrier test
kselftest_membarrier_tests = cc_test {
    name = "kselftest_membarrier_tests";
    relative_install_path = "linux-kselftest/membarrier";
    srcs = ["tools/testing/selftests/membarrier/membarrier_test.c"];
    defaults = ["kselftest_defaults"];
};

#  Memory-hotplug test
kselftest_memory-hotplug_mem-on-off-test = sh_test {
    name = "kselftest_memory-hotplug_mem-on-off-test";
    sub_dir = "linux-kselftest/memory-hotplug";
    src = "tools/testing/selftests/memory-hotplug/mem-on-off-test.sh";
    filename_from_src = true;
    compile_multilib = "both";
};

#  Mount test
kselftest_mount_tests = cc_test {
    name = "kselftest_mount_tests";
    relative_install_path = "linux-kselftest/mount";
    srcs = ["tools/testing/selftests/mount/unprivileged-remount-test.c"];
    defaults = ["kselftest_defaults"];
};

#  Net test
kselftest_net_tests = cc_test {
    name = "kselftest_net_tests";
    relative_install_path = "linux-kselftest/net";
    srcs = [
        "tools/testing/selftests/net/socket.c"
        "tools/testing/selftests/net/psock_fanout.c"
        "tools/testing/selftests/net/psock_tpacket.c"
        "tools/testing/selftests/net/reuseport_dualstack.c"
        "tools/testing/selftests/net/reuseaddr_conflict.c"
    ];
    defaults = ["kselftest_defaults"];
    #  TODO: test_data: net/test_bpf.sh
};

kselftest_net_test_bpf = sh_test {
    name = "kselftest_net_test_bpf";
    sub_dir = "linux-kselftest/net";
    src = "tools/testing/selftests/net/test_bpf.sh";
    filename_from_src = true;
    compile_multilib = "both";
};

#  Pstore test
kselftest_pstore_pstore_tests = sh_test {
    name = "kselftest_pstore_pstore_tests";
    sub_dir = "linux-kselftest/pstore";
    src = "tools/testing/selftests/pstore/pstore_tests";
    filename_from_src = true;
    compile_multilib = "both";
};

kselftest_pstore_pstore_post_reboot_tests = sh_test {
    name = "kselftest_pstore_pstore_post_reboot_tests";
    sub_dir = "linux-kselftest/pstore";
    src = "tools/testing/selftests/pstore/pstore_post_reboot_tests";
    filename_from_src = true;
    compile_multilib = "both";
};

kselftest_pstore_common_tests = sh_test {
    name = "kselftest_pstore_common_tests";
    sub_dir = "linux-kselftest/pstore";
    src = "tools/testing/selftests/pstore/common_tests";
    filename_from_src = true;
    compile_multilib = "both";
};

kselftest_pstore_pstore_crash_test = sh_test {
    name = "kselftest_pstore_pstore_crash_test";
    sub_dir = "linux-kselftest/pstore";
    src = "tools/testing/selftests/pstore/pstore_crash_test";
    filename_from_src = true;
    compile_multilib = "both";
};

#  Ptrace test
kselftest_ptrace_tests = cc_test {
    name = "kselftest_ptrace_tests";
    relative_install_path = "linux-kselftest/ptrace";
    srcs = ["tools/testing/selftests/ptrace/peeksiginfo.c"];
    defaults = ["kselftest_defaults"];
};

#  rtc test
kselftest_rtc_tests = cc_test {
    name = "kselftest_rtc_tests";
    relative_install_path = "linux-kselftest/rtc";
    srcs = ["tools/testing/selftests/rtc/rtctest.c"];
    defaults = ["kselftest_defaults"];
};

#  seccomp test
kselftest_seccomp_tests = cc_test {
    name = "kselftest_seccomp_tests";
    relative_install_path = "linux-kselftest/seccomp";
    srcs = ["tools/testing/selftests/seccomp/seccomp_bpf.c"];
    defaults = ["kselftest_defaults"];
};

#  size test
kselftest_size_test = cc_test {
    name = "kselftest_size_test";
    relative_install_path = "linux-kselftest/size";
    srcs = ["tools/testing/selftests/size/get_size.c"];
    defaults = ["kselftest_defaults"];
    nocrt = true;
};

#  splice test
kselftest_splice_test = cc_test {
    name = "kselftest_splice_test";
    relative_install_path = "linux-kselftest/splice";
    srcs = ["tools/testing/selftests/splice/default_file_splice_read.c"];
    defaults = ["kselftest_defaults"];
};

"kselftest_splice_default_file_splice_read.sh" = sh_test {
    name = "kselftest_splice_default_file_splice_read.sh";
    sub_dir = "linux-kselftest/splice";
    src = "tools/testing/selftests/splice/default_file_splice_read.sh";
    filename_from_src = true;
    compile_multilib = "both";
};

#  Static keys test
kselftest_static_keys_test_static_keys = sh_test {
    name = "kselftest_static_keys_test_static_keys";
    sub_dir = "linux-kselftest/static_keys";
    src = "tools/testing/selftests/static_keys/test_static_keys.sh";
    filename_from_src = true;
    compile_multilib = "both";
};

#  Timer test
kselftest_timer_tests = cc_test {
    name = "kselftest_timer_tests";
    relative_install_path = "linux-kselftest/timers";
    srcs = [
        "tools/testing/selftests/timers/adjtick.c"
        "tools/testing/selftests/timers/alarmtimer-suspend.c"
        "tools/testing/selftests/timers/change_skew.c"
        "tools/testing/selftests/timers/clocksource-switch.c"
        "tools/testing/selftests/timers/freq-step.c"
        "tools/testing/selftests/timers/inconsistency-check.c"
        "tools/testing/selftests/timers/leap-a-day.c"
        "tools/testing/selftests/timers/leapcrash.c"
        "tools/testing/selftests/timers/nanosleep.c"
        "tools/testing/selftests/timers/nsleep-lat.c"
        "tools/testing/selftests/timers/posix_timers.c"
        "tools/testing/selftests/timers/raw_skew.c"
        "tools/testing/selftests/timers/set-2038.c"
        "tools/testing/selftests/timers/set-tai.c"
        "tools/testing/selftests/timers/set-timer-lat.c"
        "tools/testing/selftests/timers/set-tz.c"
        "tools/testing/selftests/timers/skew_consistency.c"
        "tools/testing/selftests/timers/threadtest.c"
        "tools/testing/selftests/timers/valid-adjtimex.c"
    ];
    cflags = [
        "-O3"
        "-DKTEST"
    ];
    defaults = ["kselftest_defaults"];
};

#  User test
kselftest_user_test_user_copy = sh_test {
    name = "kselftest_user_test_user_copy";
    sub_dir = "linux-kselftest/user";
    src = "tools/testing/selftests/user/test_user_copy.sh";
    filename_from_src = true;
    compile_multilib = "both";
};

#  vdso test
kselftest_vdso_test = cc_test {
    name = "kselftest_vdso_test";
    relative_install_path = "linux-kselftest/vDSO";
    srcs = [
        "tools/testing/selftests/vDSO/parse_vdso.c"
        "tools/testing/selftests/vDSO/vdso_test.c"
    ];
    defaults = ["kselftest_defaults"];
    test_per_src = false;
};

#  Vm test
kselftest_vm_tests = cc_test {
    name = "kselftest_vm_tests";
    relative_install_path = "linux-kselftest/vm";
    srcs = [
        "tools/testing/selftests/vm/compaction_test.c"
        "tools/testing/selftests/vm/hugepage-mmap.c"
        "tools/testing/selftests/vm/hugepage-shm.c"
        "tools/testing/selftests/vm/map_hugetlb.c"
        "tools/testing/selftests/vm/mlock-random-test.c"
        "tools/testing/selftests/vm/mlock2-tests.c"
        "tools/testing/selftests/vm/on-fault-limit.c"
        "tools/testing/selftests/vm/thuge-gen.c"
        "tools/testing/selftests/vm/transhuge-stress.c"
    ];
    defaults = ["kselftest_defaults"];
    static_libs = ["libcap"];
};

kselftest_vm64_tests = cc_test {
    name = "kselftest_vm64_tests";
    relative_install_path = "linux-kselftest/vm";
    srcs = [
        "tools/testing/selftests/vm/virtual_address_range.c"
    ];
    defaults = ["kselftest_defaults"];
    enabled = false;
    arch = {
        arm64 = {
            enabled = true;
            cflags = ["-D__aarch64__"];
        };
    };
};

kselftest_vm_run_vmtests = sh_test {
    name = "kselftest_vm_run_vmtests";
    sub_dir = "linux-kselftest/vm";
    src = "tools/testing/selftests/vm/run_vmtests";
    filename_from_src = true;
    compile_multilib = "both";
};

#  x86 tests
kselftest_x86_tests = cc_test {
    name = "kselftest_x86_tests";
    relative_install_path = "linux-kselftest/x86";
    srcs = [
        "tools/testing/selftests/x86/single_step_syscall.c"
        "tools/testing/selftests/x86/syscall_nt.c"
        "tools/testing/selftests/x86/test_mremap_vdso.c"
        "tools/testing/selftests/x86/ldt_gdt.c"
    ];
    arch = {
        arm = {
            enabled = false;
        };
        arm64 = {
            enabled = false;
        };
        x86 = {
            srcs = [
                "tools/testing/selftests/x86/sysret_ss_attrs.c"
                # "tools/testing/selftests/x86/entry_from_vm86.c",
                "tools/testing/selftests/x86/syscall_arg_fault.c"
                "tools/testing/selftests/x86/unwind_vdso.c"
                "tools/testing/selftests/x86/test_FCMOV.c"
                "tools/testing/selftests/x86/test_FCOMI.c"
                "tools/testing/selftests/x86/test_FISTTP.c"
                "tools/testing/selftests/x86/vdso_restorer.c"
            ];
        };
    };
    cflags = [
        "-O2"
        "-pthread"
    ];
    c_std = "gnu99";
    static_executable = true;
    defaults = ["kselftest_defaults"];
};

kselftest_x86_check_initial_reg_state = cc_test {
    name = "kselftest_x86_check_initial_reg_state";
    stem = "check_initial_reg_state";
    relative_install_path = "linux-kselftest/x86";
    srcs = [
        "tools/testing/selftests/x86/check_initial_reg_state.c"
    ];
    arch = {
        arm = {
            enabled = false;
        };
        arm64 = {
            enabled = false;
        };
    };
    cflags = [
        "-O2"
        "-pthread"
    ];
    c_std = "gnu99";
    #  check_initial_reg_state is special: it needs a custom entry, and it needs to be static so
    #  that its interpreter doesn't destroy its initial state.
    ldflags = ["-Wl,-ereal_start"];
    static_executable = true;
    test_per_src = false;
    defaults = ["kselftest_defaults"];
};

kselftest_x86_ptrace_syscall = cc_test {
    name = "kselftest_x86_ptrace_syscall";
    stem = "ptrace_syscall";
    relative_install_path = "linux-kselftest/x86";
    srcs = [
        "tools/testing/selftests/x86/ptrace_syscall.c"
        "tools/testing/selftests/x86/raw_syscall_helper_32.S"
    ];
    cflags = [
        "-O2"
        "-pthread"
    ];
    c_std = "gnu99";
    test_per_src = false;
    defaults = ["kselftest_defaults"];
    enabled = false;
    arch = {
        x86 = {
            enabled = true;
        };
    };
};

kselftest_x86_test_syscall_vdso = cc_test {
    name = "kselftest_x86_test_syscall_vdso";
    stem = "test_syscall_vdso";
    relative_install_path = "linux-kselftest/x86";
    srcs = [
        "tools/testing/selftests/x86/test_syscall_vdso.c"
        "tools/testing/selftests/x86/thunks_32.S"
    ];
    cflags = [
        "-O2"
        "-pthread"
    ];
    c_std = "gnu99";
    static_executable = true;
    test_per_src = false;
    defaults = ["kselftest_defaults"];
    enabled = false;
    arch = {
        x86 = {
            enabled = true;
        };
    };
};

#  zram tests
"kselftest_zram_zram.sh" = sh_test {
    name = "kselftest_zram_zram.sh";
    sub_dir = "linux-kselftest/zram";
    src = "tools/testing/selftests/zram/zram.sh";
    filename_from_src = true;
    compile_multilib = "both";
};

"kselftest_zram_zram01.sh" = sh_test {
    name = "kselftest_zram_zram01.sh";
    sub_dir = "linux-kselftest/zram";
    src = "tools/testing/selftests/zram/zram01.sh";
    filename_from_src = true;
    compile_multilib = "both";
};

"kselftest_zram_zram02.sh" = sh_test {
    name = "kselftest_zram_zram02.sh";
    sub_dir = "linux-kselftest/zram";
    src = "tools/testing/selftests/zram/zram02.sh";
    filename_from_src = true;
    compile_multilib = "both";
};

"kselftest_zram_zram_lib.sh" = sh_test {
    name = "kselftest_zram_zram_lib.sh";
    sub_dir = "linux-kselftest/zram";
    src = "tools/testing/selftests/zram/zram_lib.sh";
    filename_from_src = true;
    compile_multilib = "both";
};

in { inherit "kselftest_exec_execveat.sh" "kselftest_ftrace_test.d_00basic_basic1" "kselftest_ftrace_test.d_00basic_basic2" "kselftest_ftrace_test.d_00basic_basic3" "kselftest_ftrace_test.d_00basic_basic4" "kselftest_ftrace_test.d_functions" "kselftest_ftrace_test.d_instances_instance" "kselftest_ftrace_test.d_instances_instance-event" "kselftest_ftrace_test.d_template" "kselftest_futex_functional_run.sh" "kselftest_intel_pstate_run.sh" "kselftest_splice_default_file_splice_read.sh" "kselftest_zram_zram.sh" "kselftest_zram_zram01.sh" "kselftest_zram_zram02.sh" "kselftest_zram_zram_lib.sh" kselftest_breakpoints_tests kselftest_capabilities_test kselftest_cpu-hotplug_cpu-on-off-test kselftest_defaults kselftest_efivarfs_efivarfs kselftest_efivarfs_tests kselftest_exec_test kselftest_firmware_fw_fallback kselftest_firmware_fw_filesystem kselftest_ftrace_ftracetest kselftest_futex_tests kselftest_intel_pstate_tests kselftest_kcmp_tests kselftest_lib_bitmap kselftest_lib_printf kselftest_media_tests kselftest_membarrier_tests kselftest_memory-hotplug_mem-on-off-test kselftest_mount_tests kselftest_net_test_bpf kselftest_net_tests kselftest_pstore_common_tests kselftest_pstore_pstore_crash_test kselftest_pstore_pstore_post_reboot_tests kselftest_pstore_pstore_tests kselftest_ptrace_tests kselftest_rtc_tests kselftest_seccomp_tests kselftest_size_test kselftest_splice_test kselftest_static_keys_test_static_keys kselftest_timer_tests kselftest_user_test_user_copy kselftest_vdso_test kselftest_vm64_tests kselftest_vm_run_vmtests kselftest_vm_tests kselftest_x86_check_initial_reg_state kselftest_x86_ptrace_syscall kselftest_x86_test_syscall_vdso kselftest_x86_tests; }
