{ cc_binary }:
let

#
#  Copyright (C) 2006 The Android Open Source Project
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

strace = cc_binary {

    srcs = [
        "access.c"
        "affinity.c"
        "aio.c"
        "basic_filters.c"
        "bind.c"
        "bjm.c"
        "block.c"
        "bpf.c"
        "bpf_filter.c"
        "bpf_seccomp_filter.c"
        "bpf_sock_filter.c"
        "btrfs.c"
        "cacheflush.c"
        "capability.c"
        "chdir.c"
        "chmod.c"
        "clone.c"
        "copy_file_range.c"
        "count.c"
        "delay.c"
        "desc.c"
        "dirent.c"
        "dirent64.c"
        "dm.c"
        "dyxlat.c"
        "epoll.c"
        "error_prints.c"
        "evdev.c"
        "evdev_mpers.c"
        "eventfd.c"
        "execve.c"
        "fadvise.c"
        "fallocate.c"
        "fanotify.c"
        "fchownat.c"
        "fcntl.c"
        "fetch_bpf_fprog.c"
        "fetch_indirect_syscall_args.c"
        "fetch_struct_flock.c"
        "fetch_struct_keyctl_kdf_params.c"
        "fetch_struct_mmsghdr.c"
        "fetch_struct_msghdr.c"
        "fetch_struct_stat.c"
        "fetch_struct_stat64.c"
        "fetch_struct_statfs.c"
        "fetch_struct_xfs_quotastat.c"
        "file_handle.c"
        "file_ioctl.c"
        "filter_qualify.c"
        "flock.c"
        "fstatfs.c"
        "fstatfs64.c"
        "fs_x_ioctl.c"
        "futex.c"
        "getcpu.c"
        "getcwd.c"
        "getpagesize.c"
        "getrandom.c"
        "get_robust_list.c"
        "hdio.c"
        "hostname.c"
        "inotify.c"
        "inotify_ioctl.c"
        "io.c"
        "ioctl.c"
        "ioperm.c"
        "iopl.c"
        "ioprio.c"
        "ipc.c"
        "ipc_msg.c"
        "ipc_msgctl.c"
        "ipc_sem.c"
        "ipc_shm.c"
        "ipc_shmctl.c"
        "kcmp.c"
        "kexec.c"
        "keyctl.c"
        "kvm.c"
        "ldt.c"
        "link.c"
        "listen.c"
        "lookup_dcookie.c"
        "loop.c"
        "lseek.c"
        "mem.c"
        "membarrier.c"
        "memfd_create.c"
        "mknod.c"
        "mmap_cache.c"
        "mmap_notify.c"
        "mmsghdr.c"
        "mount.c"
        "mq.c"
        "msghdr.c"
        "mtd.c"
        "nbd_ioctl.c"
        "net.c"
        "netlink.c"
        "netlink_crypto.c"
        "netlink_inet_diag.c"
        "netlink_kobject_uevent.c"
        "netlink_netfilter.c"
        "netlink_netlink_diag.c"
        "netlink_packet_diag.c"
        "netlink_route.c"
        "netlink_selinux.c"
        "netlink_smc_diag.c"
        "netlink_sock_diag.c"
        "netlink_unix_diag.c"
        "nlattr.c"
        "nsfs.c"
        "numa.c"
        "number_set.c"
        "oldstat.c"
        "open.c"
        "pathtrace.c"
        "perf.c"
        "perf_ioctl.c"
        "personality.c"
        "pkeys.c"
        "poll.c"
        "prctl.c"
        "print_aio_sigset.c"
        "print_dev_t.c"
        "print_group_req.c"
        "print_ifindex.c"
        "print_mac.c"
        "print_mq_attr.c"
        "print_msgbuf.c"
        "print_sigevent.c"
        "print_sg_req_info.c"
        "print_statfs.c"
        "print_struct_stat.c"
        "print_time.c"
        "print_timespec.c"
        "print_timeval.c"
        "print_timex.c"
        "printmode.c"
        "printrusage.c"
        "printsiginfo.c"
        "process.c"
        "process_vm.c"
        "ptp.c"
        "quota.c"
        "readahead.c"
        "readlink.c"
        "reboot.c"
        "renameat.c"
        "resource.c"
        "retval.c"
        "rtc.c"
        "rtnl_addr.c"
        "rtnl_addrlabel.c"
        "rtnl_dcb.c"
        "rtnl_link.c"
        "rtnl_mdb.c"
        "rtnl_neigh.c"
        "rtnl_neightbl.c"
        "rtnl_netconf.c"
        "rtnl_nsid.c"
        "rtnl_route.c"
        "rtnl_rule.c"
        "rtnl_tc.c"
        "rtnl_tc_action.c"
        "rt_sigframe.c"
        "rt_sigreturn.c"
        "sched.c"
        "scsi.c"
        "seccomp.c"
        "sendfile.c"
        "sg_io_v3.c"
        "sg_io_v4.c"
        "shutdown.c"
        "sigaltstack.c"
        "signal.c"
        "signalfd.c"
        "sigreturn.c"
        "sock.c"
        "sockaddr.c"
        "socketcall.c"
        "socketutils.c"
        "sram_alloc.c"
        "stat.c"
        "stat64.c"
        "statfs.c"
        "statfs64.c"
        "statx.c"
        "strace.c"
        "string_to_uint.c"
        "swapon.c"
        "sync_file_range.c"
        "sync_file_range2.c"
        "syscall.c"
        "sysctl.c"
        "sysinfo.c"
        "syslog.c"
        "sysmips.c"
        "term.c"
        "time.c"
        "times.c"
        "truncate.c"
        "ubi.c"
        "ucopy.c"
        "uid16.c"
        "uid.c"
        "umask.c"
        "umount.c"
        "uname.c"
        "upeek.c"
        "upoke.c"
        "userfaultfd.c"
        "ustat.c"
        "util.c"
        "utime.c"
        "utimes.c"
        "v4l2.c"
        "wait.c"
        "xattr.c"
        "xlat.c"
        "xmalloc.c"
    ];

    #  We have "config.h", but since we're using one file for both LP32 and LP64,
    #  we need to set the hard-coded size #defines here instead.
    cflags = ["-DHAVE_CONFIG_H"] ++ [
        "-DSIZEOF_KERNEL_LONG_T=SIZEOF_LONG"
        "-DSIZEOF_OFF_T=SIZEOF_LONG"
    ] ++ [
        "-Wall"
        "-Werror"
        "-Wno-initializer-overrides"
        "-Wno-missing-field-initializers"
        "-Wno-pointer-arith"
        "-Wno-unused-parameter"
        "-Wno-sign-compare"
        "-fno-strict-aliasing"
    ];
    multilib = {
        lib32 = {
            cflags = [
                "-DSIZEOF_LONG_LONG=8"
                "-DSIZEOF_LONG=4"
                "-DSIZEOF_RLIM_T=4"
                "-DHAVE_STRUCT_STAT64=1"
            ];
        };
        lib64 = {
            cflags = [
                "-DSIZEOF_LONG_LONG=8"
                "-DSIZEOF_LONG=8"
                "-DSIZEOF_RLIM_T=8"
            ];
        };
    };

    arch = {
        arm = {
            cflags = ["-DARM=1"] ++ ["-DHAVE_STRUCT___OLD_KERNEL_STAT=1"];

            local_include_dirs = [
                "linux/arm"
                "linux"
            ];
        };
        arm64 = {
            cflags = ["-DAARCH64=1"];

            local_include_dirs = [
                "linux/aarch64"
                "linux"
            ];
        };
        mips = {
            enabled = false;
        };
        mips64 = {
            enabled = false;
        };
        x86 = {
            cflags = ["-DI386=1"] ++ ["-DHAVE_STRUCT___OLD_KERNEL_STAT=1"];

            local_include_dirs = [
                "linux/i386"
                "linux"
            ];
        };
        x86_64 = {
            cflags = ["-DX86_64=1"];

            local_include_dirs = [
                "linux/x86_64"
                "linux"
            ];
        };
    };

    name = "strace";

};

in { inherit strace; }
