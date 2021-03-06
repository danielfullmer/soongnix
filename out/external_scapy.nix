{ python_library }:
let

scapy = python_library {
    name = "scapy";
    srcs = [
        "scapy/__init__.py"
        "scapy/all.py"
        "scapy/ansmachine.py"
        "scapy/as_resolvers.py"
        "scapy/asn1fields.py"
        "scapy/asn1packet.py"
        "scapy/automaton.py"
        "scapy/autorun.py"
        "scapy/base_classes.py"
        "scapy/compat.py"
        "scapy/config.py"
        "scapy/consts.py"
        "scapy/dadict.py"
        "scapy/data.py"
        "scapy/error.py"
        "scapy/fields.py"
        "scapy/main.py"
        "scapy/packet.py"
        "scapy/pipetool.py"
        "scapy/plist.py"
        "scapy/pton_ntop.py"
        "scapy/route.py"
        "scapy/route6.py"
        "scapy/scapypipes.py"
        "scapy/sendrecv.py"
        "scapy/supersocket.py"
        "scapy/themes.py"
        "scapy/utils.py"
        "scapy/utils6.py"
        "scapy/volatile.py"
        "scapy/arch/__init__.py"
        "scapy/arch/common.py"
        "scapy/arch/linux.py"
        "scapy/arch/pcapdnet.py"
        "scapy/arch/solaris.py"
        "scapy/arch/unix.py"
        "scapy/arch/bpf/__init__.py"
        "scapy/arch/bpf/consts.py"
        "scapy/arch/bpf/core.py"
        "scapy/arch/bpf/supersocket.py"
        "scapy/arch/windows/__init__.py"
        "scapy/asn1/__init__.py"
        "scapy/asn1/asn1.py"
        "scapy/asn1/ber.py"
        "scapy/asn1/mib.py"
        "scapy/contrib/__init__.py"
        "scapy/contrib/avs.py"
        "scapy/contrib/bgp.py"
        "scapy/contrib/carp.py"
        "scapy/contrib/cdp.py"
        "scapy/contrib/chdlc.py"
        "scapy/contrib/coap.py"
        "scapy/contrib/diameter.py"
        "scapy/contrib/dtp.py"
        "scapy/contrib/eigrp.py"
        "scapy/contrib/etherip.py"
        "scapy/contrib/gsm_um.py"
        "scapy/contrib/gtp.py"
        "scapy/contrib/gtp_v2.py"
        "scapy/contrib/homeplugav.py"
        "scapy/contrib/http2.py"
        "scapy/contrib/icmp_extensions.py"
        "scapy/contrib/igmp.py"
        "scapy/contrib/igmpv3.py"
        "scapy/contrib/ikev2.py"
        "scapy/contrib/isis.py"
        "scapy/contrib/ldp.py"
        "scapy/contrib/lldp.py"
        "scapy/contrib/macsec.py"
        "scapy/contrib/modbus.py"
        "scapy/contrib/mpls.py"
        "scapy/contrib/mqtt.py"
        "scapy/contrib/nsh.py"
        "scapy/contrib/openflow.py"
        "scapy/contrib/openflow3.py"
        "scapy/contrib/ospf.py"
        "scapy/contrib/pnio.py"
        "scapy/contrib/pnio_rtc.py"
        "scapy/contrib/ppi.py"
        "scapy/contrib/ppi_cace.py"
        "scapy/contrib/ppi_geotag.py"
        "scapy/contrib/ripng.py"
        "scapy/contrib/rsvp.py"
        "scapy/contrib/sebek.py"
        "scapy/contrib/send.py"
        "scapy/contrib/skinny.py"
        "scapy/contrib/spbm.py"
        "scapy/contrib/tacacs.py"
        "scapy/contrib/ubberlogger.py"
        "scapy/contrib/vqp.py"
        "scapy/contrib/vtp.py"
        "scapy/contrib/wpa_eapol.py"
        "scapy/layers/__init__.py"
        "scapy/layers/all.py"
        "scapy/layers/bluetooth.py"
        "scapy/layers/can.py"
        "scapy/layers/clns.py"
        "scapy/layers/dhcp.py"
        "scapy/layers/dhcp6.py"
        "scapy/layers/dns.py"
        "scapy/layers/dot11.py"
        "scapy/layers/eap.py"
        "scapy/layers/gprs.py"
        "scapy/layers/hsrp.py"
        "scapy/layers/inet.py"
        "scapy/layers/inet6.py"
        "scapy/layers/ipsec.py"
        "scapy/layers/ir.py"
        "scapy/layers/isakmp.py"
        "scapy/layers/l2.py"
        "scapy/layers/l2tp.py"
        "scapy/layers/llmnr.py"
        "scapy/layers/lltd.py"
        "scapy/layers/mgcp.py"
        "scapy/layers/mobileip.py"
        "scapy/layers/netbios.py"
        "scapy/layers/netflow.py"
        "scapy/layers/ntp.py"
        "scapy/layers/pflog.py"
        "scapy/layers/ppp.py"
        "scapy/layers/pptp.py"
        "scapy/layers/radius.py"
        "scapy/layers/rip.py"
        "scapy/layers/rtp.py"
        "scapy/layers/sctp.py"
        "scapy/layers/skinny.py"
        "scapy/layers/smb.py"
        "scapy/layers/snmp.py"
        "scapy/layers/tftp.py"
        "scapy/layers/vrrp.py"
        "scapy/layers/vxlan.py"
        "scapy/layers/x509.py"
        "scapy/layers/tls/__init__.py"
        "scapy/layers/tls/all.py"
        "scapy/layers/tls/automaton.py"
        "scapy/layers/tls/automaton_cli.py"
        "scapy/layers/tls/automaton_srv.py"
        "scapy/layers/tls/basefields.py"
        "scapy/layers/tls/cert.py"
        "scapy/layers/tls/extensions.py"
        "scapy/layers/tls/handshake.py"
        "scapy/layers/tls/handshake_sslv2.py"
        "scapy/layers/tls/keyexchange.py"
        "scapy/layers/tls/keyexchange_tls13.py"
        "scapy/layers/tls/record.py"
        "scapy/layers/tls/record_sslv2.py"
        "scapy/layers/tls/record_tls13.py"
        "scapy/layers/tls/session.py"
        "scapy/layers/tls/tools.py"
        "scapy/layers/tls/crypto/__init__.py"
        "scapy/layers/tls/crypto/all.py"
        "scapy/layers/tls/crypto/cipher_aead.py"
        "scapy/layers/tls/crypto/cipher_block.py"
        "scapy/layers/tls/crypto/cipher_stream.py"
        "scapy/layers/tls/crypto/ciphers.py"
        "scapy/layers/tls/crypto/compression.py"
        "scapy/layers/tls/crypto/groups.py"
        "scapy/layers/tls/crypto/h_mac.py"
        "scapy/layers/tls/crypto/hash.py"
        "scapy/layers/tls/crypto/hkdf.py"
        "scapy/layers/tls/crypto/kx_algs.py"
        "scapy/layers/tls/crypto/pkcs1.py"
        "scapy/layers/tls/crypto/prf.py"
        "scapy/layers/tls/crypto/suites.py"
        "scapy/modules/__init__.py"
        "scapy/modules/nmap.py"
        "scapy/modules/p0f.py"
        "scapy/modules/queso.py"
        "scapy/modules/six.py"
        "scapy/modules/voip.py"
        "scapy/modules/winpcapy.py"
        "scapy/modules/krack/__init__.py"
        "scapy/modules/krack/automaton.py"
        "scapy/modules/krack/crypto.py"
        "scapy/tools/UTscapy.py"
        "scapy/tools/__init__.py"
        "scapy/tools/check_asdis.py"
    ];
    version = {
        py2 = {
            enabled = true;
        };
    };
};

in { inherit scapy; }
