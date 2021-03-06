{ cc_binary, cc_defaults, cc_library }:
let

curl_common_defaults = cc_defaults {
    name = "curl_common_defaults";
    cflags = [
        "-Wpointer-arith"
        "-Wwrite-strings"
        "-Wunused"
        "-Winline"
        "-Wnested-externs"
        "-Wmissing-declarations"
        "-Wmissing-prototypes"
        "-Wno-long-long"
        "-Wfloat-equal"
        "-Wno-multichar"
        "-Wno-sign-compare"
        "-Wno-format-nonliteral"
        "-Wendif-labels"
        "-Wstrict-prototypes"
        "-Wdeclaration-after-statement"
        "-Wno-system-headers"
        "-DHAVE_CONFIG_H"
        #  TODO(avakulenko): Android.mk had this for OS version string:
        #  "Android $(PLATFORM_VERSION) $(TARGET_ARCH_VARIANT)"
        #  but Soong doesn't have access to those config variables yet.
        "-DOS=\"Android\""
        "-Werror"
        #  Bug: http://b/29823425 Disable -Wvarargs for Clang update to r271374
        "-Wno-varargs"
    ];
    local_include_dirs = [
        "include"
        "lib"
    ];
    multilib = {
        lib32 = {
            cflags = [
                "-DSIZEOF_LONG=4"
                "-DSIZEOF_LONG_LONG=8"
                "-DSIZEOF_SIZE_T=4"
                "-DSIZEOF_TIME_T=4"
            ];
        };
        lib64 = {
            cflags = [
                "-DSIZEOF_LONG=8"
                "-DSIZEOF_LONG_LONG=8"
                "-DSIZEOF_SIZE_T=8"
                "-DSIZEOF_TIME_T=8"
            ];
        };
    };
};

libcurl = cc_library {
    name = "libcurl";
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    defaults = ["curl_common_defaults"];
    export_include_dirs = ["include"];
    host_supported = true;
    cflags = [
        "-DBUILDING_LIBCURL"
    ];
    srcs = [
        "lib/altsvc.c"
        "lib/amigaos.c"
        "lib/asyn-ares.c"
        "lib/asyn-thread.c"
        "lib/base64.c"
        "lib/conncache.c"
        "lib/connect.c"
        "lib/content_encoding.c"
        "lib/cookie.c"
        "lib/curl_addrinfo.c"
        "lib/curl_ctype.c"
        "lib/curl_des.c"
        "lib/curl_endian.c"
        "lib/curl_fnmatch.c"
        "lib/curl_gethostname.c"
        "lib/curl_gssapi.c"
        "lib/curl_memrchr.c"
        "lib/curl_multibyte.c"
        "lib/curl_ntlm_core.c"
        "lib/curl_ntlm_wb.c"
        "lib/curl_path.c"
        "lib/curl_range.c"
        "lib/curl_rtmp.c"
        "lib/curl_sasl.c"
        "lib/curl_sspi.c"
        "lib/curl_threads.c"
        "lib/dict.c"
        "lib/doh.c"
        "lib/dotdot.c"
        "lib/easy.c"
        "lib/escape.c"
        "lib/file.c"
        "lib/fileinfo.c"
        "lib/formdata.c"
        "lib/ftp.c"
        "lib/ftplistparser.c"
        "lib/getenv.c"
        "lib/getinfo.c"
        "lib/gopher.c"
        "lib/hash.c"
        "lib/hmac.c"
        "lib/hostasyn.c"
        "lib/hostcheck.c"
        "lib/hostip.c"
        "lib/hostip4.c"
        "lib/hostip6.c"
        "lib/hostsyn.c"
        "lib/http.c"
        "lib/http2.c"
        "lib/http_chunks.c"
        "lib/http_digest.c"
        "lib/http_negotiate.c"
        "lib/http_ntlm.c"
        "lib/http_proxy.c"
        "lib/idn_win32.c"
        "lib/if2ip.c"
        "lib/imap.c"
        "lib/inet_ntop.c"
        "lib/inet_pton.c"
        "lib/krb5.c"
        "lib/ldap.c"
        "lib/llist.c"
        "lib/md4.c"
        "lib/md5.c"
        "lib/memdebug.c"
        "lib/mime.c"
        "lib/mprintf.c"
        "lib/multi.c"
        "lib/netrc.c"
        "lib/non-ascii.c"
        "lib/nonblock.c"
        "lib/nwlib.c"
        "lib/nwos.c"
        "lib/openldap.c"
        "lib/parsedate.c"
        "lib/pingpong.c"
        "lib/pipeline.c"
        "lib/pop3.c"
        "lib/progress.c"
        "lib/psl.c"
        "lib/rand.c"
        "lib/rtsp.c"
        "lib/security.c"
        "lib/select.c"
        "lib/sendf.c"
        "lib/setopt.c"
        "lib/sha256.c"
        "lib/share.c"
        "lib/slist.c"
        "lib/smb.c"
        "lib/smtp.c"
        "lib/socks.c"
        "lib/socks_gssapi.c"
        "lib/socks_sspi.c"
        "lib/speedcheck.c"
        "lib/splay.c"
        "lib/ssh-libssh.c"
        "lib/ssh.c"
        "lib/strcase.c"
        "lib/strdup.c"
        "lib/strerror.c"
        "lib/strtok.c"
        "lib/strtoofft.c"
        "lib/system_win32.c"
        "lib/telnet.c"
        "lib/tftp.c"
        "lib/timeval.c"
        "lib/transfer.c"
        "lib/url.c"
        "lib/urlapi.c"
        "lib/version.c"
        "lib/warnless.c"
        "lib/wildcard.c"
        "lib/x509asn1.c"
        "lib/vauth/cleartext.c"
        "lib/vauth/cram.c"
        "lib/vauth/digest.c"
        "lib/vauth/digest_sspi.c"
        "lib/vauth/krb5_gssapi.c"
        "lib/vauth/krb5_sspi.c"
        "lib/vauth/ntlm.c"
        "lib/vauth/ntlm_sspi.c"
        "lib/vauth/oauth2.c"
        "lib/vauth/spnego_gssapi.c"
        "lib/vauth/spnego_sspi.c"
        "lib/vauth/vauth.c"
        "lib/vtls/cyassl.c"
        "lib/vtls/gskit.c"
        "lib/vtls/gtls.c"
        "lib/vtls/mbedtls.c"
        "lib/vtls/mesalink.c"
        "lib/vtls/nss.c"
        "lib/vtls/openssl.c"
        "lib/vtls/polarssl.c"
        "lib/vtls/polarssl_threadlock.c"
        "lib/vtls/schannel.c"
        "lib/vtls/schannel_verify.c"
        "lib/vtls/sectransp.c"
        "lib/vtls/vtls.c"
    ];
    shared_libs = [
        "libcrypto"
        "libssl"
        "libz"
    ];
    target = {
        host = {
            cflags = ["-D_GNU_SOURCE=1"];
        };
        darwin = {
            enabled = false;
        };
    };
    unique_host_soname = true;
};

curl = cc_binary {
    name = "curl";
    defaults = ["curl_common_defaults"];
    srcs = [
        "src/slist_wc.c"
        "src/tool_binmode.c"
        "src/tool_bname.c"
        "src/tool_cb_dbg.c"
        "src/tool_cb_hdr.c"
        "src/tool_cb_prg.c"
        "src/tool_cb_rea.c"
        "src/tool_cb_see.c"
        "src/tool_cb_wrt.c"
        "src/tool_cfgable.c"
        "src/tool_convert.c"
        "src/tool_dirhie.c"
        "src/tool_doswin.c"
        "src/tool_easysrc.c"
        "src/tool_filetime.c"
        "src/tool_formparse.c"
        "src/tool_getparam.c"
        "src/tool_getpass.c"
        "src/tool_help.c"
        "src/tool_helpers.c"
        "src/tool_homedir.c"
        "src/tool_hugehelp.c"
        "src/tool_libinfo.c"
        "src/tool_main.c"
        "src/tool_metalink.c"
        "src/tool_msgs.c"
        "src/tool_operate.c"
        "src/tool_operhlp.c"
        "src/tool_panykey.c"
        "src/tool_paramhlp.c"
        "src/tool_parsecfg.c"
        "src/tool_setopt.c"
        "src/tool_sleep.c"
        "src/tool_strdup.c"
        "src/tool_urlglob.c"
        "src/tool_util.c"
        "src/tool_vms.c"
        "src/tool_writeout.c"
        "src/tool_xattr.c"
    ];
    shared_libs = [
        "libcrypto"
        "libssl"
        "libz"
    ];
    static_libs = ["libcurl"];
};

in { inherit curl curl_common_defaults libcurl; }
