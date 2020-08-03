{ cc_library }:
let

#  Copyright 2017 The Android Open Source Project

libext2fs = cc_library {
    name = "libext2fs";
    host_supported = true;
    recovery_available = true;
    unique_host_soname = true;
    defaults = ["e2fsprogs-defaults"];
    srcs = [
        "ext2_err.c"
        "alloc.c"
        "alloc_sb.c"
        "alloc_stats.c"
        "alloc_tables.c"
        "atexit.c"
        "badblocks.c"
        "bb_inode.c"
        "bitmaps.c"
        "bitops.c"
        "blkmap64_ba.c"
        "blkmap64_rb.c"
        "blknum.c"
        "block.c"
        "bmap.c"
        "check_desc.c"
        "crc16.c"
        "crc32c.c"
        "csum.c"
        "closefs.c"
        "dblist.c"
        "dblist_dir.c"
        "digest_encode.c"
        "dirblock.c"
        "dirhash.c"
        "dir_iterate.c"
        "dupfs.c"
        "expanddir.c"
        "ext_attr.c"
        "extent.c"
        "fallocate.c"
        "fileio.c"
        "finddev.c"
        "flushb.c"
        "freefs.c"
        "gen_bitmap.c"
        "gen_bitmap64.c"
        "get_num_dirs.c"
        "get_pathname.c"
        "getsize.c"
        "getsectsize.c"
        "hashmap.c"
        "i_block.c"
        "icount.c"
        "imager.c"
        "ind_block.c"
        "initialize.c"
        "inline.c"
        "inline_data.c"
        "inode.c"
        "io_manager.c"
        "ismounted.c"
        "link.c"
        "llseek.c"
        "lookup.c"
        "mmp.c"
        "mkdir.c"
        "mkjournal.c"
        "namei.c"
        "native.c"
        "newdir.c"
        "openfs.c"
        "progress.c"
        "punch.c"
        "qcow2.c"
        "rbtree.c"
        "read_bb.c"
        "read_bb_file.c"
        "res_gdt.c"
        "rw_bitmaps.c"
        "sha256.c"
        "sha512.c"
        "swapfs.c"
        "symlink.c"
        "undo_io.c"
        "unix_io.c"
        "sparse_io.c"
        "unlink.c"
        "valid_blk.c"
        "version.c"
        #  get rid of this?!
        "test_io.c"
    ];
    shared_libs = [
        "libext2_com_err"
        "libsparse"
        "libz"
    ];
    cflags = ["-Wno-unused-parameter"];
    target = {
        android = {
            shared_libs = ["libext2_uuid"];
        };
        windows = {
            enabled = true;
            include_dirs = ["external/e2fsprogs/include/mingw"];
            cflags = [
                "-Wno-error=cpp"
                "-Wno-format"
                "-Wno-unused-variable"
            ];
            clang_cflags = [
                "-Wno-error=typedef-redefinition"
            ];
            host_ldlibs = ["-lws2_32"];
        };
    };

    header_libs = ["libext2-headers"];
    export_include_dirs = ["."];
    export_header_lib_headers = ["libext2-headers"];
};

in { inherit libext2fs; }
