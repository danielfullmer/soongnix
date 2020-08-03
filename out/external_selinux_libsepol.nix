{ cc_binary_host, cc_library }:
let

common_CFLAGS = [
    "-D_GNU_SOURCE"
    "-Wall"
    "-Werror"
    "-W"
    "-Wundef"
    "-Wshadow"
    "-Wno-error=missing-noreturn"
    "-Wmissing-format-attribute"
];

libsepol = cc_library {
    name = "libsepol";
    host_supported = true;
    cflags = common_CFLAGS;
    srcs = [
        "src/assertion.c"
        "src/avrule_block.c"
        "src/avtab.c"
        "src/boolean_record.c"
        "src/booleans.c"
        "src/conditional.c"
        "src/constraint.c"
        "src/context.c"
        "src/context_record.c"
        "src/debug.c"
        "src/ebitmap.c"
        "src/expand.c"
        "src/genbools.c"
        "src/genusers.c"
        "src/handle.c"
        "src/hashtab.c"
        "src/hierarchy.c"
        "src/iface_record.c"
        "src/interfaces.c"
        "src/kernel_to_cil.c"
        "src/kernel_to_common.c"
        "src/kernel_to_conf.c"
        "src/link.c"
        "src/mls.c"
        "src/module.c"
        "src/module_to_cil.c"
        "src/node_record.c"
        "src/nodes.c"
        "src/polcaps.c"
        "src/policydb.c"
        "src/policydb_convert.c"
        "src/policydb_public.c"
        "src/port_record.c"
        "src/ports.c"
        "src/roles.c"
        "src/services.c"
        "src/sidtab.c"
        "src/symtab.c"
        "src/user_record.c"
        "src/users.c"
        "src/util.c"
        "src/write.c"
        "cil/src/android.c"
        "cil/src/cil_binary.c"
        "cil/src/cil_build_ast.c"
        "cil/src/cil.c"
        "cil/src/cil_copy_ast.c"
        "cil/src/cil_find.c"
        "cil/src/cil_fqn.c"
        "cil/src/cil_lexer.l"
        "cil/src/cil_list.c"
        "cil/src/cil_log.c"
        "cil/src/cil_mem.c"
        "cil/src/cil_parser.c"
        "cil/src/cil_policy.c"
        "cil/src/cil_post.c"
        "cil/src/cil_reset_ast.c"
        "cil/src/cil_resolve_ast.c"
        "cil/src/cil_stack.c"
        "cil/src/cil_strpool.c"
        "cil/src/cil_symtab.c"
        "cil/src/cil_tree.c"
        "cil/src/cil_verify.c"
        "cil/src/cil_write_ast.c"
    ];
    local_include_dirs = [
        "cil/src"
        "src"
    ];
    export_include_dirs = [
        "cil/include"
        "include"
    ];
    stl = "none";
    #  The host version of libsepol is loaded by the system python, which does
    #  not have the sanitizer runtimes.
    target = {
        host = {
            sanitize = {
                never = true;
            };
        };
    };
};

chkcon = cc_binary_host {
    name = "chkcon";
    srcs = ["utils/chkcon.c"];
    shared_libs = ["libsepol"];
    cflags = common_CFLAGS;
};

in { inherit chkcon libsepol; }
