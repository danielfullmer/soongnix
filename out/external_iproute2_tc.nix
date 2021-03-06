{ cc_binary }:
let

tc = cc_binary {
    name = "tc";
    defaults = ["iproute2_defaults"];

    #  ordering affects link order, so cannot be quite fully sorted
    srcs = [
        "emp_ematch.lex.c"
        "emp_ematch.yacc.c"
        "m_action.c"
        "m_bpf.c"
        "m_connmark.c"
        "m_csum.c"
        "m_ematch.c"
        "m_estimator.c"
        "m_gact.c"
        "m_ife.c"
        "m_mirred.c"
        "m_pedit.c"
        "m_police.c"
        "m_sample.c"
        "m_simple.c"
        "m_skbedit.c"
        "m_skbmod.c"
        "m_tunnel_key.c"
        "m_vlan.c"
        "f_basic.c"
        "f_bpf.c"
        "f_cgroup.c"
        "f_flow.c"
        "f_flower.c"
        "f_fw.c"
        "f_matchall.c"
        "f_route.c"
        "f_rsvp.c"
        "f_tcindex.c"
        "f_u32.c"
        "q_cbq.c"
        "q_clsact.c"
        "q_codel.c"
        "q_drr.c"
        "q_dsmark.c"
        "q_fifo.c"
        "q_fq.c"
        "q_fq_codel.c"
        "q_hfsc.c"
        "q_hhf.c"
        "q_htb.c"
        "q_ingress.c"
        "q_mqprio.c"
        "q_multiq.c"
        "q_netem.c"
        "q_pie.c"
        "q_prio.c"
        "q_qfq.c"
        "q_rr.c"
        "q_sfb.c"
        "q_tbf.c"
        "static-syms.c"
        "tc.c"
        "tc_cbq.c"
        "tc_class.c"
        "tc_core.c"
        "tc_estimator.c"
        "tc_exec.c"
        "tc_filter.c"
        "tc_monitor.c"
        "tc_qdisc.c"
        "tc_red.c"
        "tc_stab.c"
        "tc_util.c"
        "q_choke.c"
        "q_gred.c"
        "q_red.c"
        "q_sfq.c"
    ];

    shared_libs = [
        "libiprouteutil"
        "libnetlink"
    ];

    cflags = [
        "-Wno-missing-field-initializers"
        "-Wno-unneeded-internal-declaration"
    ];

    #  This is a work around for b/18403920
    ldflags = ["-Wl,--no-gc-sections"];
};

in { inherit tc; }
