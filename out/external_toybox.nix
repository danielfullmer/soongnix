{ cc_binary, cc_defaults }:
let

#
#  Copyright (C) 2014 The Android Open Source Project
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

#
#  To sync with upstream:
#

#   # Update.
#   git remote add toybox https://github.com/landley/toybox.git
#   git fetch toybox
#   git merge toybox/master

#   # Regenerate generated files.
#   NOBUILD=1 scripts/make.sh

#   # Make any necessary Android.bp changes and rebuild.
#   mm -j32

#   # Run tests.
#   ./run-tests-on-android.sh
#   # Run a single test.
#   ./run-tests-on-android.sh wc

#   # Upload changes.
#   git commit -a --amend
#   git push aosp HEAD:refs/for/master  # Push to gerrit for review.
#   git push aosp HEAD:master  # Push directly, avoiding gerrit.

#
#  To add a toy:
#

#   Edit .config to enable the toy you want to add.
#   make clean && make  # Regenerate the generated files.
#   # Edit `srcs` below to add the toy.
#   # If you just want to use it as "toybox x" rather than "x", you can stop now.
#   # If you want this toy to have a symbolic link in /system/bin, add the toy to symlinks.

toybox-defaults = cc_defaults {
    name = "toybox-defaults";
    srcs = [
        "lib/args.c"
        "lib/commas.c"
        "lib/dirtree.c"
        "lib/help.c"
        "lib/lib.c"
        "lib/linestack.c"
        "lib/llist.c"
        "lib/net.c"
        "lib/portability.c"
        "lib/tty.c"
        "lib/xwrap.c"
        "main.c"
        "toys/android/getenforce.c"
        "toys/android/load_policy.c"
        "toys/android/log.c"
        "toys/android/restorecon.c"
        "toys/android/runcon.c"
        "toys/android/sendevent.c"
        "toys/android/setenforce.c"
        "toys/android/setprop.c"
        "toys/android/start.c"
        "toys/lsb/dmesg.c"
        "toys/lsb/hostname.c"
        "toys/lsb/killall.c"
        "toys/lsb/md5sum.c"
        "toys/lsb/mknod.c"
        "toys/lsb/mktemp.c"
        "toys/lsb/mount.c"
        "toys/lsb/pidof.c"
        "toys/lsb/seq.c"
        "toys/lsb/sync.c"
        "toys/lsb/umount.c"
        "toys/net/ifconfig.c"
        "toys/net/microcom.c"
        "toys/net/netcat.c"
        "toys/net/netstat.c"
        "toys/net/ping.c"
        "toys/net/rfkill.c"
        "toys/net/tunctl.c"
        "toys/other/acpi.c"
        "toys/other/base64.c"
        "toys/other/blkid.c"
        "toys/other/blockdev.c"
        "toys/other/chcon.c"
        "toys/other/chroot.c"
        "toys/other/chrt.c"
        "toys/other/clear.c"
        "toys/other/devmem.c"
        "toys/other/dos2unix.c"
        "toys/other/fallocate.c"
        "toys/other/flock.c"
        "toys/other/fmt.c"
        "toys/other/free.c"
        "toys/other/freeramdisk.c"
        "toys/other/fsfreeze.c"
        "toys/other/fsync.c"
        "toys/other/help.c"
        "toys/other/hwclock.c"
        "toys/other/i2ctools.c"
        "toys/other/inotifyd.c"
        "toys/other/insmod.c"
        "toys/other/ionice.c"
        "toys/other/losetup.c"
        "toys/other/lsattr.c"
        "toys/other/lsmod.c"
        "toys/other/lspci.c"
        "toys/other/lsusb.c"
        "toys/other/makedevs.c"
        "toys/other/mkswap.c"
        "toys/other/modinfo.c"
        "toys/other/mountpoint.c"
        "toys/other/nbd_client.c"
        "toys/other/nsenter.c"
        "toys/other/partprobe.c"
        "toys/other/pivot_root.c"
        "toys/other/pmap.c"
        "toys/other/printenv.c"
        "toys/other/pwdx.c"
        "toys/other/readlink.c"
        "toys/other/realpath.c"
        "toys/other/rev.c"
        "toys/other/rmmod.c"
        "toys/other/setfattr.c"
        "toys/other/setsid.c"
        "toys/other/stat.c"
        "toys/other/swapoff.c"
        "toys/other/swapon.c"
        "toys/other/sysctl.c"
        "toys/other/tac.c"
        "toys/other/taskset.c"
        "toys/other/timeout.c"
        "toys/other/truncate.c"
        "toys/other/uptime.c"
        "toys/other/usleep.c"
        "toys/other/uuidgen.c"
        "toys/other/vconfig.c"
        "toys/other/vmstat.c"
        "toys/other/watch.c"
        "toys/other/which.c"
        "toys/other/xxd.c"
        "toys/other/yes.c"
        "toys/pending/bc.c"
        "toys/pending/dd.c"
        "toys/pending/diff.c"
        "toys/pending/expr.c"
        "toys/pending/getfattr.c"
        "toys/pending/gzip.c"
        "toys/pending/lsof.c"
        "toys/pending/modprobe.c"
        "toys/pending/more.c"
        "toys/pending/stty.c"
        "toys/pending/tar.c"
        "toys/pending/tr.c"
        "toys/pending/traceroute.c"
        "toys/posix/basename.c"
        "toys/posix/cal.c"
        "toys/posix/cat.c"
        "toys/posix/chgrp.c"
        "toys/posix/chmod.c"
        "toys/posix/cksum.c"
        "toys/posix/cmp.c"
        "toys/posix/comm.c"
        "toys/posix/cp.c"
        "toys/posix/cpio.c"
        "toys/posix/cut.c"
        "toys/posix/date.c"
        "toys/posix/df.c"
        "toys/posix/dirname.c"
        "toys/posix/du.c"
        "toys/posix/echo.c"
        "toys/posix/env.c"
        "toys/posix/expand.c"
        "toys/posix/false.c"
        "toys/posix/file.c"
        "toys/posix/find.c"
        "toys/posix/getconf.c"
        "toys/posix/grep.c"
        "toys/posix/head.c"
        "toys/posix/iconv.c"
        "toys/posix/id.c"
        "toys/posix/kill.c"
        "toys/posix/ln.c"
        "toys/posix/ls.c"
        "toys/posix/mkdir.c"
        "toys/posix/mkfifo.c"
        "toys/posix/nice.c"
        "toys/posix/nl.c"
        "toys/posix/nohup.c"
        "toys/posix/od.c"
        "toys/posix/paste.c"
        "toys/posix/patch.c"
        "toys/posix/printf.c"
        "toys/posix/ps.c"
        "toys/posix/pwd.c"
        "toys/posix/renice.c"
        "toys/posix/rm.c"
        "toys/posix/rmdir.c"
        "toys/posix/sed.c"
        "toys/posix/sleep.c"
        "toys/posix/sort.c"
        "toys/posix/split.c"
        "toys/posix/strings.c"
        "toys/posix/tail.c"
        "toys/posix/tee.c"
        "toys/posix/time.c"
        "toys/posix/touch.c"
        "toys/posix/true.c"
        "toys/posix/tty.c"
        "toys/posix/ulimit.c"
        "toys/posix/uname.c"
        "toys/posix/uniq.c"
        "toys/posix/unlink.c"
        "toys/posix/uudecode.c"
        "toys/posix/uuencode.c"
        "toys/posix/wc.c"
        "toys/posix/xargs.c"
    ];

    cflags = [
        "-std=gnu11"
        "-Os"
        "-Wall"
        "-Werror"
        "-Wno-char-subscripts"
        "-Wno-deprecated-declarations"
        "-Wno-missing-field-initializers"
        "-Wno-pointer-arith"
        "-Wno-sign-compare"
        "-Wno-string-plus-int"
        "-Wno-unused-parameter"
        "-funsigned-char"
        "-ffunction-sections"
        "-fdata-sections"
        "-fno-asynchronous-unwind-tables"
        "-DTOYBOX_VENDOR=\"-android\""
    ];

    #  This doesn't actually prevent us from dragging in libc++ at runtime
    #  because libnetd_client.so is C++.
    stl = "none";

    #  not usable on Android?: freeramdisk fsfreeze makedevs nbd-client
    #                          partprobe pivot_root pwdx rev rfkill vconfig
    #  currently prefer external/efs2progs: blkid chattr lsattr
    #  currently prefer external/iputils: ping ping6
    target = {
        android = {
            symlinks = [
                "acpi"
                "base64"
                "basename"
                "bc"
                "blockdev"
                "cal"
                "cat"
                "chcon"
                "chgrp"
                "chmod"
                "chown"
                "chroot"
                "chrt"
                "cksum"
                "clear"
                "comm"
                "cmp"
                "cp"
                "cpio"
                "cut"
                "date"
                "dd"
                "devmem"
                "df"
                "diff"
                "dirname"
                "dmesg"
                "dos2unix"
                "du"
                "echo"
                "env"
                "expand"
                "expr"
                "fallocate"
                "false"
                "file"
                "find"
                "flock"
                "fmt"
                "free"
                "fsync"
                "getconf"
                "getenforce"
                "groups"
                "gunzip"
                "gzip"
                "head"
                "hostname"
                "hwclock"
                "i2cdetect"
                "i2cdump"
                "i2cget"
                "i2cset"
                "iconv"
                "id"
                "ifconfig"
                "inotifyd"
                "insmod"
                "install"
                "ionice"
                "iorenice"
                "kill"
                "killall"
                "load_policy"
                "ln"
                "log"
                "logname"
                "losetup"
                "ls"
                "lsmod"
                "lsof"
                "lspci"
                "lsusb"
                "md5sum"
                "mkdir"
                "mkfifo"
                "mknod"
                "mkswap"
                "mktemp"
                "microcom"
                "modinfo"
                "modprobe"
                "more"
                "mount"
                "mountpoint"
                "mv"
                "nc"
                "netcat"
                "netstat"
                "nice"
                "nl"
                "nohup"
                "nproc"
                "nsenter"
                "od"
                "paste"
                "patch"
                "pgrep"
                "pidof"
                "pkill"
                "pmap"
                "printenv"
                "printf"
                "ps"
                "pwd"
                "readlink"
                "realpath"
                "renice"
                "restorecon"
                "rm"
                "rmdir"
                "rmmod"
                "runcon"
                "sed"
                "sendevent"
                "seq"
                "setenforce"
                "setprop"
                "setsid"
                "sha1sum"
                "sha224sum"
                "sha256sum"
                "sha384sum"
                "sha512sum"
                "sleep"
                "sort"
                "split"
                "start"
                "stat"
                "stop"
                "strings"
                "stty"
                "swapoff"
                "swapon"
                "sync"
                "sysctl"
                "tac"
                "tail"
                "tar"
                "taskset"
                "tee"
                "time"
                "timeout"
                "top"
                "touch"
                "tr"
                "true"
                "truncate"
                "tty"
                "ulimit"
                "umount"
                "uname"
                "uniq"
                "unix2dos"
                "unlink"
                "unshare"
                "uptime"
                "usleep"
                "uudecode"
                "uuencode"
                "uuidgen"
                "vmstat"
                "watch"
                "wc"
                "which"
                "whoami"
                "xargs"
                "xxd"
                "yes"
                "zcat"
            ];
        };
    };
};

toybox_libraries = [
    "liblog"
    "libselinux"
    #  libcutils dependency is needed only for <cutils/sched_policy.h>
    #  inclusion from lib/portability.h. When it's changed to include
    #  <processgroup/sched_policy.h> this dependency should be dropped
    "libcutils"
    "libprocessgroup"
    "libcrypto"
    "libz"
];

# ###########################################
#  toybox for /system, /vendor, and /recovery
# ###########################################

toybox = cc_binary {
    name = "toybox";
    defaults = ["toybox-defaults"];
    host_supported = true;
    recovery_available = true;
    shared_libs = toybox_libraries;
    target = {
        darwin = {
            enabled = false;
        };
    };
};

toybox_vendor = cc_binary {
    name = "toybox_vendor";
    defaults = ["toybox-defaults"];
    shared_libs = toybox_libraries;
    vendor = true;
};

in { inherit toybox toybox-defaults toybox_vendor; }
