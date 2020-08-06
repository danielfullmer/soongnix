{ cc_binary }:
let

ip = cc_binary {
    name = "ip";
    defaults = ["iproute2_defaults"];

    #  ordering affects link order, so cannot be quite fully sorted
    srcs = [
        "ip6tunnel.c"
        "ipaddress.c"
        "ipaddrlabel.c"
        "ip.c"
        "ipfou.c"
        "ipila.c"
        "ipl2tp.c"
        "iplink_bridge.c"
        "iplink_bridge_slave.c"
        "iplink.c"
        "iplink_can.c"
        "iplink_dummy.c"
        "iplink_geneve.c"
        "iplink_hsr.c"
        "iplink_ifb.c"
        "iplink_ipoib.c"
        "iplink_ipvlan.c"
        "iplink_macvlan.c"
        "iplink_nlmon.c"
        "iplink_team.c"
        "iplink_vcan.c"
        "iplink_vlan.c"
        "iplink_vrf.c"
        "iplink_vxcan.c"
        "iplink_vxlan.c"
        "iplink_xdp.c"
        "iplink_xstats.c"
        "ipmacsec.c"
        "ipmaddr.c"
        "ipmonitor.c"
        "ipmroute.c"
        "ipneigh.c"
        "ipnetconf.c"
        "ipnetns.c"
        "ipntable.c"
        "ipprefix.c"
        "iproute.c"
        "iproute_lwtunnel.c"
        "iprule.c"
        "ipseg6.c"
        "iptoken.c"
        "iptunnel.c"
        "iptuntap.c"
        "ipvrf.c"
        "ipxfrm.c"
        "link_gre6.c"
        "link_gre.c"
        "link_ip6tnl.c"
        "link_iptnl.c"
        "link_veth.c"
        "link_vti6.c"
        "link_vti.c"
        "rtm_map.c"
        "static-syms.c"
        "tcp_metrics.c"
        "tunnel.c"
        "xfrm_monitor.c"
        "xfrm_policy.c"
        "xfrm_state.c"
    ];

    shared_libs = [
        "libiprouteutil"
        "libnetlink"
    ];

    cflags = [
        "-Wno-implicit-function-declaration"
        "-Wno-int-conversion"
        "-Wno-missing-field-initializers"
        "-D_GNU_SOURCE"
        ("-DNETNS_RUN_DIR=\"" + NETNS_RUN_DIR + "\"")
    ];

    ldflags = [
        "-Wl,-export-dynamic"
        "-Wl,--no-gc-sections"
    ];
};

in { inherit ip; }
