{ python_test }:
let

kernel_net_tests = python_test {
    name = "kernel_net_tests";
    main = "all_tests.py";
    srcs = [
        "all_tests.py"
        "anycast_test.py"
        "bpf.py"
        "bpf_test.py"
        "csocket.py"
        "csocket_test.py"
        "cstruct.py"
        "cstruct_test.py"
        "forwarding_test.py"
        "genetlink.py"
        "iproute.py"
        "leak_test.py"
        "multinetwork_base.py"
        "multinetwork_test.py"
        "neighbour_test.py"
        "net_test.py"
        "netlink.py"
        "nf_test.py"
        "packets.py"
        "parameterization_test.py"
        "pf_key.py"
        "pf_key_test.py"
        "ping6_test.py"
        "policy_crash_test.py"
        "qtaguid_test.py"
        "removed_feature_test.py"
        "resilient_rs_test.py"
        "sock_diag.py"
        "sock_diag_test.py"
        "srcaddr_selection_test.py"
        "tcp_fastopen_test.py"
        "tcp_metrics.py"
        "tcp_nuke_addr_test.py"
        "tcp_repair_test.py"
        "tcp_test.py"
        "tun_twister.py"
        "util.py"
        "xfrm.py"
        "xfrm_algorithm_test.py"
        "xfrm_base.py"
        "xfrm_test.py"
        "xfrm_tunnel_test.py"
    ];
    libs = [
        "scapy"
    ];
    defaults = [
        "kernel_tests_defaults"
    ];
};

in { inherit kernel_net_tests; }
