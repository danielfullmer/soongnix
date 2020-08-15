{ cc_defaults, cc_library_static, genrule, gensrcs }:
let

libext_defaults = cc_defaults {
    name = "libext_defaults";
    defaults = ["iptables_defaults"];

    header_libs = ["iptables_config_header"];

    cflags = [
        "-DNO_SHARED_LIBS=1"
        "-DXTABLES_INTERNAL"

        "-Wno-format"
        "-Wno-missing-field-initializers"
        #  libxt_recent.c:202:11: error: address of array 'info->name' will always evaluate to 'true' [-Werror,-Wpointer-bool-conversion]
        "-Wno-pointer-bool-conversion"
        "-Wno-tautological-pointer-compare"
    ];
};

#  All of the extension source files have the same function name (_init). Since we don't support
#  per-file cflags that upstream uses, instead:
#
#   1. Rewrite the source files with filter_init to have per-file function names. (libext*_srcs)
#   2. Create a new source file that defines a function (init_extensions*) with gen_init that calls
#      all of the renamed _init functions (libext*_init)
#
#  This all happens three times -- once each for libext, libext4, libext6

libext_init = genrule {
    name = "libext_init";
    cmd = "$(location gen_init) '' $(locations libxt_*.c) > $(out)";
    srcs = [
        "gen_init"
        "libxt_AUDIT.c"
        "libxt_CHECKSUM.c"
        "libxt_CLASSIFY.c"
        "libxt_CONNMARK.c"
        "libxt_CONNSECMARK.c"
        "libxt_CT.c"
        "libxt_DSCP.c"
        "libxt_HMARK.c"
        "libxt_IDLETIMER.c"
        "libxt_LED.c"
        "libxt_MARK.c"
        "libxt_NFLOG.c"
        "libxt_NFQUEUE.c"
        "libxt_RATEEST.c"
        "libxt_SECMARK.c"
        "libxt_SET.c"
        "libxt_SYNPROXY.c"
        "libxt_TCPMSS.c"
        "libxt_TCPOPTSTRIP.c"
        "libxt_TEE.c"
        "libxt_TOS.c"
        "libxt_TPROXY.c"
        "libxt_TRACE.c"
        "libxt_addrtype.c"
        "libxt_bpf.c"
        "libxt_cgroup.c"
        "libxt_cluster.c"
        "libxt_comment.c"
        "libxt_connbytes.c"
        "libxt_connlabel.c"
        "libxt_connlimit.c"
        "libxt_connmark.c"
        "libxt_conntrack.c"
        "libxt_cpu.c"
        "libxt_dccp.c"
        "libxt_devgroup.c"
        "libxt_dscp.c"
        "libxt_ecn.c"
        "libxt_esp.c"
        "libxt_hashlimit.c"
        "libxt_helper.c"
        "libxt_ipcomp.c"
        "libxt_iprange.c"
        "libxt_ipvs.c"
        "libxt_length.c"
        "libxt_limit.c"
        "libxt_mac.c"
        "libxt_mangle.c"
        "libxt_mark.c"
        "libxt_multiport.c"
        "libxt_nfacct.c"
        "libxt_osf.c"
        "libxt_owner.c"
        "libxt_physdev.c"
        "libxt_pkttype.c"
        "libxt_policy.c"
        "libxt_quota.c"
        "libxt_quota2.c"
        "libxt_rateest.c"
        "libxt_recent.c"
        "libxt_rpfilter.c"
        "libxt_sctp.c"
        "libxt_set.c"
        "libxt_socket.c"
        "libxt_standard.c"
        "libxt_statistic.c"
        "libxt_string.c"
        "libxt_tcp.c"
        "libxt_tcpmss.c"
        "libxt_time.c"
        "libxt_tos.c"
        "libxt_u32.c"
        "libxt_udp.c"
    ];
    out = ["initext.c"];
    exclude_srcs = [
        #  Exclude some modules that are problematic to compile (types/headers)
        "libxt_TCPOPTSTRIP.c"
        "libxt_connlabel.c"
        "libxt_cgroup.c"

        "libxt_dccp.c"
        "libxt_ipvs.c"
    ];
};

libext_srcs = gensrcs {
    name = "libext_srcs";
    tool_files = ["filter_init"];
    cmd = "$(location filter_init) $(in) > $(out)";
    output_extension = "c";
    srcs = [
        "libxt_AUDIT.c"
        "libxt_CHECKSUM.c"
        "libxt_CLASSIFY.c"
        "libxt_CONNMARK.c"
        "libxt_CONNSECMARK.c"
        "libxt_CT.c"
        "libxt_DSCP.c"
        "libxt_HMARK.c"
        "libxt_IDLETIMER.c"
        "libxt_LED.c"
        "libxt_MARK.c"
        "libxt_NFLOG.c"
        "libxt_NFQUEUE.c"
        "libxt_RATEEST.c"
        "libxt_SECMARK.c"
        "libxt_SET.c"
        "libxt_SYNPROXY.c"
        "libxt_TCPMSS.c"
        "libxt_TCPOPTSTRIP.c"
        "libxt_TEE.c"
        "libxt_TOS.c"
        "libxt_TPROXY.c"
        "libxt_TRACE.c"
        "libxt_addrtype.c"
        "libxt_bpf.c"
        "libxt_cgroup.c"
        "libxt_cluster.c"
        "libxt_comment.c"
        "libxt_connbytes.c"
        "libxt_connlabel.c"
        "libxt_connlimit.c"
        "libxt_connmark.c"
        "libxt_conntrack.c"
        "libxt_cpu.c"
        "libxt_dccp.c"
        "libxt_devgroup.c"
        "libxt_dscp.c"
        "libxt_ecn.c"
        "libxt_esp.c"
        "libxt_hashlimit.c"
        "libxt_helper.c"
        "libxt_ipcomp.c"
        "libxt_iprange.c"
        "libxt_ipvs.c"
        "libxt_length.c"
        "libxt_limit.c"
        "libxt_mac.c"
        "libxt_mangle.c"
        "libxt_mark.c"
        "libxt_multiport.c"
        "libxt_nfacct.c"
        "libxt_osf.c"
        "libxt_owner.c"
        "libxt_physdev.c"
        "libxt_pkttype.c"
        "libxt_policy.c"
        "libxt_quota.c"
        "libxt_quota2.c"
        "libxt_rateest.c"
        "libxt_recent.c"
        "libxt_rpfilter.c"
        "libxt_sctp.c"
        "libxt_set.c"
        "libxt_socket.c"
        "libxt_standard.c"
        "libxt_statistic.c"
        "libxt_string.c"
        "libxt_tcp.c"
        "libxt_tcpmss.c"
        "libxt_time.c"
        "libxt_tos.c"
        "libxt_u32.c"
        "libxt_udp.c"
    ];
    exclude_srcs = [
        #  Exclude some modules that are problematic to compile (types/headers)
        "libxt_TCPOPTSTRIP.c"
        "libxt_connlabel.c"
        "libxt_cgroup.c"

        "libxt_dccp.c"
        "libxt_ipvs.c"
    ];
};

libext = cc_library_static {
    name = "libext";
    defaults = ["libext_defaults"];
    srcs = [
        ":libext_init"
        ":libext_srcs"
    ];
};

# //////////////////////////////////////////////////////////////////////////////////////////////////

libext4_init = genrule {
    name = "libext4_init";
    cmd = "$(location gen_init) '4' $(locations libipt_*.c) > $(out)";
    srcs = [
        "gen_init"
        "libipt_CLUSTERIP.c"
        "libipt_DNAT.c"
        "libipt_ECN.c"
        "libipt_LOG.c"
        "libipt_MASQUERADE.c"
        "libipt_NETMAP.c"
        "libipt_REDIRECT.c"
        "libipt_REJECT.c"
        "libipt_SNAT.c"
        "libipt_TTL.c"
        "libipt_ULOG.c"
        "libipt_ah.c"
        "libipt_icmp.c"
        "libipt_realm.c"
        "libipt_ttl.c"
    ];
    out = ["initext.c"];
};

libext4_srcs = gensrcs {
    name = "libext4_srcs";
    tool_files = ["filter_init"];
    cmd = "$(location filter_init) $(in) > $(out)";
    output_extension = "c";
    srcs = [
        "libipt_CLUSTERIP.c"
        "libipt_DNAT.c"
        "libipt_ECN.c"
        "libipt_LOG.c"
        "libipt_MASQUERADE.c"
        "libipt_NETMAP.c"
        "libipt_REDIRECT.c"
        "libipt_REJECT.c"
        "libipt_SNAT.c"
        "libipt_TTL.c"
        "libipt_ULOG.c"
        "libipt_ah.c"
        "libipt_icmp.c"
        "libipt_realm.c"
        "libipt_ttl.c"
    ];
};

libext4 = cc_library_static {
    name = "libext4";
    defaults = ["libext_defaults"];
    srcs = [
        ":libext4_init"
        ":libext4_srcs"
    ];
};

# //////////////////////////////////////////////////////////////////////////////////////////////////

libext6_init = genrule {
    name = "libext6_init";
    cmd = "$(location gen_init) '6' $(locations libip6t_*.c) > $(out)";
    srcs = [
        "gen_init"
        "libip6t_DNAT.c"
        "libip6t_DNPT.c"
        "libip6t_HL.c"
        "libip6t_LOG.c"
        "libip6t_MASQUERADE.c"
        "libip6t_NETMAP.c"
        "libip6t_REDIRECT.c"
        "libip6t_REJECT.c"
        "libip6t_SNAT.c"
        "libip6t_SNPT.c"
        "libip6t_ah.c"
        "libip6t_dst.c"
        "libip6t_eui64.c"
        "libip6t_frag.c"
        "libip6t_hbh.c"
        "libip6t_hl.c"
        "libip6t_icmp6.c"
        "libip6t_ipv6header.c"
        "libip6t_mh.c"
        "libip6t_rt.c"
    ];
    out = ["initext.c"];
};

libext6_srcs = gensrcs {
    name = "libext6_srcs";
    tool_files = ["filter_init"];
    cmd = "$(location filter_init) $(in) > $(out)";
    output_extension = "c";
    srcs = [
        "libip6t_DNAT.c"
        "libip6t_DNPT.c"
        "libip6t_HL.c"
        "libip6t_LOG.c"
        "libip6t_MASQUERADE.c"
        "libip6t_NETMAP.c"
        "libip6t_REDIRECT.c"
        "libip6t_REJECT.c"
        "libip6t_SNAT.c"
        "libip6t_SNPT.c"
        "libip6t_ah.c"
        "libip6t_dst.c"
        "libip6t_eui64.c"
        "libip6t_frag.c"
        "libip6t_hbh.c"
        "libip6t_hl.c"
        "libip6t_icmp6.c"
        "libip6t_ipv6header.c"
        "libip6t_mh.c"
        "libip6t_rt.c"
    ];
};

libext6 = cc_library_static {
    name = "libext6";
    defaults = ["libext_defaults"];
    srcs = [
        ":libext6_init"
        ":libext6_srcs"
    ];
};

in { inherit libext libext4 libext4_init libext4_srcs libext6 libext6_init libext6_srcs libext_defaults libext_init libext_srcs; }
