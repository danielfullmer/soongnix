{ cc_binary_host, cc_defaults, cc_library_host_static, cc_library_shared, cc_library_static, python_library_host }:
let

grpc_defaults = cc_defaults {
    name = "grpc_defaults";
    cflags = [
        "-Wno-unused-parameter"
        "-Wno-implicit-fallthrough"
        "-Wno-unused-result"
    ];
    host_supported = true;
    vendor_available = true;
};

libgrpc_plugin_support = cc_library_host_static {
    name = "libgrpc_plugin_support";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/compiler/cpp_generator.cc"
        "src/compiler/python_generator.cc"
    ];
    local_include_dirs = [
        "include"
    ];
    shared_libs = [
        "libprotobuf-cpp-full"
    ];
};

protoc-gen-grpc-cpp-plugin = cc_binary_host {
    name = "protoc-gen-grpc-cpp-plugin";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/compiler/cpp_plugin.cc"
    ];
    local_include_dirs = [
        "include"
    ];
    static_libs = [
        "libgrpc_plugin_support"
    ];
    shared_libs = [
        "libprotoc"
    ];
};

protoc-gen-grpc-python-plugin = cc_binary_host {
    name = "protoc-gen-grpc-python-plugin";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/compiler/python_plugin.cc"
    ];
    local_include_dirs = [
        "include"
    ];
    static_libs = [
        "libgrpc_plugin_support"
    ];
    shared_libs = [
        "libprotoc"
    ];
};

libgrpc_resolver_fake = cc_library_static {
    name = "libgrpc_resolver_fake";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/ext/filters/client_channel/resolver/fake/fake_resolver.cc"
    ];
    local_include_dirs = [
        "include"
    ];
    static_libs = [
        "libgrpc_base"
        "libgrpc_client_channel"
    ];
};

libgrpc_resolver_sockaddr = cc_library_static {
    name = "libgrpc_resolver_sockaddr";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/ext/filters/client_channel/resolver/sockaddr/sockaddr_resolver.cc"
    ];
    local_include_dirs = [
        "include"
    ];
    static_libs = [
        "libgrpc_base"
        "libgrpc_client_channel"
    ];
};

libgrpc_deadline_filter = cc_library_static {
    name = "libgrpc_deadline_filter";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/ext/filters/deadline/deadline_filter.cc"
    ];
    local_include_dirs = [
        "include"
    ];
    static_libs = [
        "libgrpc_base"
    ];
};

libgrpc_server_backward_compatibility = cc_library_static {
    name = "libgrpc_server_backward_compatibility";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/ext/filters/workarounds/workaround_utils.cc"
    ];
    local_include_dirs = [
        "include"
    ];
    static_libs = [
        "libgrpc_base"
        "libprotobuf-c-nano"
    ];
};

libgrpc_workaround_cronet_compression_filter = cc_library_static {
    name = "libgrpc_workaround_cronet_compression_filter";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/ext/filters/workarounds/workaround_cronet_compression_filter.cc"
    ];
    local_include_dirs = [
        "include"
    ];
    static_libs = [
        "libgrpc_base"
        "libgrpc_server_backward_compatibility"
        "libprotobuf-c-nano"
    ];
};

libgrpc_client_authority_filter = cc_library_static {
    name = "libgrpc_client_authority_filter";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/ext/filters/http/client_authority_filter.cc"
    ];
    local_include_dirs = [
        "include"
    ];
    static_libs = [
        "libgrpc_base"
    ];
};

libgrpc_lb_policy_round_robin = cc_library_static {
    name = "libgrpc_lb_policy_round_robin";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/ext/filters/client_channel/lb_policy/round_robin/round_robin.cc"
    ];
    local_include_dirs = [
        "include"
    ];
    static_libs = [
        "libgrpc_base"
        "libgrpc_client_channel"
        "libgrpc_deadline_filter"
    ];
};

libgrpc_lb_policy_pick_first = cc_library_static {
    name = "libgrpc_lb_policy_pick_first";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/ext/filters/client_channel/lb_policy/pick_first/pick_first.cc"
    ];
    local_include_dirs = [
        "include"
    ];
    static_libs = [
        "libgrpc_base"
        "libgrpc_client_channel"
        "libgrpc_deadline_filter"
    ];
};

libgrpc_max_age_filter = cc_library_static {
    name = "libgrpc_max_age_filter";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/ext/filters/max_age/max_age_filter.cc"
    ];
    local_include_dirs = [
        "include"
    ];
    static_libs = [
        "libgrpc_base"
    ];
};

libgrpc_transport_chttp2_alpn = cc_library_static {
    name = "libgrpc_transport_chttp2_alpn";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/ext/transport/chttp2/alpn/alpn.cc"
    ];
    static_libs = [
        "gpr_base"
    ];
    shared_libs = [
        "liblog"
    ];
};

libgrpc_transport_chttp2_client_connector = cc_library_static {
    name = "libgrpc_transport_chttp2_client_connector";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/ext/transport/chttp2/client/authority.cc"
        "src/core/ext/transport/chttp2/client/chttp2_connector.cc"
    ];
    local_include_dirs = [
        "include"
    ];
    static_libs = [
        "libgrpc_base"
        "libgrpc_client_channel"
        "libgrpc_deadline_filter"
        "libgrpc_transport_chttp2"
        "libprotobuf-c-nano"
    ];
};

libgrpc_transport_chttp2_server_insecure = cc_library_static {
    name = "libgrpc_transport_chttp2_server_insecure";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/ext/transport/chttp2/server/chttp2_server.cc"
        "src/core/ext/transport/chttp2/server/insecure/server_chttp2.cc"
        "src/core/ext/transport/chttp2/server/insecure/server_chttp2_posix.cc"
    ];
    local_include_dirs = [
        "include"
    ];
    static_libs = [
        "libgrpc_base"
        "libgrpc_transport_chttp2"
        "libprotobuf-c-nano"
    ];
};

libgrpc_transport_chttp2_server_secure = cc_library_static {
    name = "libgrpc_transport_chttp2_server_secure";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/ext/transport/chttp2/server/chttp2_server.cc"
        "src/core/ext/transport/chttp2/server/secure/server_secure_chttp2.cc"
    ];
    local_include_dirs = [
        "include"
    ];
    static_libs = [
        "libgrpc_base"
        "libgrpc_transport_chttp2"
        "libprotobuf-c-nano"
    ];
};

libgrpc_transport_chttp2_client_insecure = cc_library_static {
    name = "libgrpc_transport_chttp2_client_insecure";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/ext/transport/chttp2/client/insecure/channel_create.cc"
        "src/core/ext/transport/chttp2/client/insecure/channel_create_posix.cc"
    ];
    local_include_dirs = [
        "include"
    ];
    static_libs = [
        "libgrpc_base"
        "libgrpc_client_channel"
        "libgrpc_deadline_filter"
        "libgrpc_transport_chttp2"
        "libgrpc_transport_chttp2_client_connector"
        "libprotobuf-c-nano"
    ];
};

libgrpc_transport_chttp2_client_secure = cc_library_static {
    name = "libgrpc_transport_chttp2_client_secure";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/ext/transport/chttp2/client/secure/secure_channel_create.cc"
    ];
    local_include_dirs = [
        "include"
    ];
    static_libs = [
        "libgrpc_base"
        "libgrpc_client_channel"
        "libgrpc_deadline_filter"
        "libgrpc_transport_chttp2"
        "libgrpc_transport_chttp2_client_connector"
        "libprotobuf-c-nano"
    ];
};

libgrpc_message_size_filter = cc_library_static {
    name = "libgrpc_message_size_filter";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/ext/filters/message_size/message_size_filter.cc"
    ];
    local_include_dirs = [
        "include"
    ];
    static_libs = [
        "libgrpc_base"
    ];
};

libgrpc_transport_inproc = cc_library_static {
    name = "libgrpc_transport_inproc";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/ext/transport/inproc/inproc_plugin.cc"
        "src/core/ext/transport/inproc/inproc_transport.cc"
    ];
    local_include_dirs = [
        "include"
    ];
    static_libs = [
        "libgrpc_base"
        "libprotobuf-c-nano"
    ];
};

libgrpc_resolver_dns_ares = cc_library_static {
    name = "libgrpc_resolver_dns_ares";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/ext/filters/client_channel/resolver/dns/c_ares/dns_resolver_ares.cc"
        "src/core/ext/filters/client_channel/resolver/dns/c_ares/grpc_ares_ev_driver.cc"
        "src/core/ext/filters/client_channel/resolver/dns/c_ares/grpc_ares_ev_driver_posix.cc"
        "src/core/ext/filters/client_channel/resolver/dns/c_ares/grpc_ares_ev_driver_windows.cc"
        "src/core/ext/filters/client_channel/resolver/dns/c_ares/grpc_ares_wrapper.cc"
        "src/core/ext/filters/client_channel/resolver/dns/c_ares/grpc_ares_wrapper_fallback.cc"
        "src/core/ext/filters/client_channel/resolver/dns/c_ares/grpc_ares_wrapper_posix.cc"
        "src/core/ext/filters/client_channel/resolver/dns/c_ares/grpc_ares_wrapper_windows.cc"
    ];
    local_include_dirs = [
        "include"
        "third_party/cares"
        "third_party/cares/config_android"
    ];
    static_libs = [
        "libaddress_sorting"
        "libgrpc_base"
        "libgrpc_client_channel"
        "libprotobuf-c-nano"
    ];
};

libgrpc_resolver_dns_native = cc_library_static {
    name = "libgrpc_resolver_dns_native";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/ext/filters/client_channel/resolver/dns/native/dns_resolver.cc"
    ];
    local_include_dirs = [
        "include"
    ];
    static_libs = [
        "libgrpc_base"
        "libgrpc_client_channel"
    ];
};

libgrpc_http_filters = cc_library_static {
    name = "libgrpc_http_filters";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/ext/filters/http/client/http_client_filter.cc"
        "src/core/ext/filters/http/http_filters_plugin.cc"
        "src/core/ext/filters/http/message_compress/message_compress_filter.cc"
        "src/core/ext/filters/http/server/http_server_filter.cc"
    ];
    local_include_dirs = [
        "include"
    ];
    static_libs = [
        "libgrpc_base"
        "libgrpc_client_channel"
        "libprotobuf-c-nano"
    ];
};

libgrpc_secure = cc_library_static {
    name = "libgrpc_secure";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/lib/http/httpcli_security_connector.cc"
        "src/core/lib/security/context/security_context.cc"
        "src/core/lib/security/credentials/alts/alts_credentials.cc"
        "src/core/lib/security/credentials/composite/composite_credentials.cc"
        "src/core/lib/security/credentials/credentials.cc"
        "src/core/lib/security/credentials/credentials_metadata.cc"
        "src/core/lib/security/credentials/fake/fake_credentials.cc"
        "src/core/lib/security/credentials/google_default/credentials_generic.cc"
        "src/core/lib/security/credentials/google_default/google_default_credentials.cc"
        "src/core/lib/security/credentials/iam/iam_credentials.cc"
        "src/core/lib/security/credentials/jwt/json_token.cc"
        "src/core/lib/security/credentials/jwt/jwt_credentials.cc"
        "src/core/lib/security/credentials/jwt/jwt_verifier.cc"
        "src/core/lib/security/credentials/local/local_credentials.cc"
        "src/core/lib/security/credentials/oauth2/oauth2_credentials.cc"
        "src/core/lib/security/credentials/plugin/plugin_credentials.cc"
        "src/core/lib/security/credentials/ssl/ssl_credentials.cc"
        "src/core/lib/security/security_connector/alts_security_connector.cc"
        "src/core/lib/security/security_connector/load_system_roots_fallback.cc"
        "src/core/lib/security/security_connector/load_system_roots_linux.cc"
        "src/core/lib/security/security_connector/local_security_connector.cc"
        "src/core/lib/security/security_connector/security_connector.cc"
        "src/core/lib/security/transport/client_auth_filter.cc"
        "src/core/lib/security/transport/secure_endpoint.cc"
        "src/core/lib/security/transport/security_handshaker.cc"
        "src/core/lib/security/transport/server_auth_filter.cc"
        "src/core/lib/security/transport/target_authority_table.cc"
        "src/core/lib/security/transport/tsi_error.cc"
        "src/core/lib/security/util/json_util.cc"
        "src/core/lib/surface/init_secure.cc"
    ];
    local_include_dirs = [
        "include"
        "third_party/nanopb"
    ];
    static_libs = [
        "libgrpc_base"
        "libgrpc_transport_chttp2_alpn"
    ];
    whole_static_libs = [
        "libalts_frame_protector"
        "libtsi"
    ];
    shared_libs = [
        "libcrypto"
        "libssl"
    ];
};

libalts_util = cc_library_static {
    name = "libalts_util";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/lib/security/credentials/alts/check_gcp_environment.cc"
        "src/core/lib/security/credentials/alts/check_gcp_environment_linux.cc"
        "src/core/lib/security/credentials/alts/check_gcp_environment_no_op.cc"
        "src/core/lib/security/credentials/alts/check_gcp_environment_windows.cc"
        "src/core/lib/security/credentials/alts/grpc_alts_credentials_client_options.cc"
        "src/core/lib/security/credentials/alts/grpc_alts_credentials_options.cc"
        "src/core/lib/security/credentials/alts/grpc_alts_credentials_server_options.cc"
        "src/core/tsi/alts/handshaker/alts_handshaker_service_api.cc"
        "src/core/tsi/alts/handshaker/altscontext.pb.c"
        "src/core/tsi/alts/handshaker/alts_handshaker_service_api_util.cc"
        "src/core/tsi/alts/handshaker/handshaker.pb.c"
        "src/core/tsi/alts/handshaker/transport_security_common_api.cc"
        "src/core/tsi/alts/handshaker/transport_security_common.pb.c"
    ];
    local_include_dirs = [
        "include"
    ];
    static_libs = [
        "libprotobuf-c-nano"
    ];
    cflags = [
        "-DPB_FIELD_16BIT"
    ];
};

libtsi = cc_library_static {
    name = "libtsi";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/tsi/alts/handshaker/alts_handshaker_client.cc"
        "src/core/tsi/alts/handshaker/alts_tsi_event.cc"
        "src/core/tsi/alts/handshaker/alts_tsi_handshaker.cc"
        "src/core/tsi/alts/handshaker/alts_tsi_utils.cc"
        "src/core/tsi/alts_transport_security.cc"
        "src/core/tsi/fake_transport_security.cc"
        "src/core/tsi/local_transport_security.cc"
        "src/core/tsi/ssl/session_cache/ssl_session_boringssl.cc"
        "src/core/tsi/ssl/session_cache/ssl_session_cache.cc"
        "src/core/tsi/ssl/session_cache/ssl_session_openssl.cc"
        "src/core/tsi/ssl_transport_security.cc"
        "src/core/tsi/transport_security_grpc.cc"
    ];
    local_include_dirs = [
        "include"
        "third_party/nanopb"
    ];
    static_libs = [
        "libalts_frame_protector"
        "gpr_base"
        "libgrpc_base"
        "libgrpc_transport_chttp2_client_insecure"
    ];
    whole_static_libs = [
        "libalts_util"
    ];
    shared_libs = [
        "libcrypto"
        "libssl"
    ];
};

libalts_frame_protector = cc_library_static {
    name = "libalts_frame_protector";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/tsi/alts/crypt/aes_gcm.cc"
        "src/core/tsi/alts/crypt/gsec.cc"
        "src/core/tsi/alts/frame_protector/alts_counter.cc"
        "src/core/tsi/alts/frame_protector/alts_crypter.cc"
        "src/core/tsi/alts/frame_protector/alts_frame_protector.cc"
        "src/core/tsi/alts/frame_protector/alts_record_protocol_crypter_common.cc"
        "src/core/tsi/alts/frame_protector/alts_seal_privacy_integrity_crypter.cc"
        "src/core/tsi/alts/frame_protector/alts_unseal_privacy_integrity_crypter.cc"
        "src/core/tsi/alts/frame_protector/frame_handler.cc"
        "src/core/tsi/alts/zero_copy_frame_protector/alts_grpc_integrity_only_record_protocol.cc"
        "src/core/tsi/alts/zero_copy_frame_protector/alts_grpc_privacy_integrity_record_protocol.cc"
        "src/core/tsi/alts/zero_copy_frame_protector/alts_grpc_record_protocol_common.cc"
        "src/core/tsi/alts/zero_copy_frame_protector/alts_iovec_record_protocol.cc"
        "src/core/tsi/alts/zero_copy_frame_protector/alts_zero_copy_grpc_protector.cc"
    ];
    local_include_dirs = [
        "include"
    ];
    static_libs = [
        "gpr_base"
        "libgrpc_base"
    ];
    whole_static_libs = [
        "libtsi_interface"
    ];
    shared_libs = [
        "libcrypto"
        "libssl"
    ];
};

libtsi_interface = cc_library_static {
    name = "libtsi_interface";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/tsi/transport_security.cc"
    ];
    static_libs = [
        "libgrpc_trace"
    ];
};

libgrpc_transport_chttp2 = cc_library_static {
    name = "libgrpc_transport_chttp2";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/ext/transport/chttp2/transport/bin_decoder.cc"
        "src/core/ext/transport/chttp2/transport/bin_encoder.cc"
        "src/core/ext/transport/chttp2/transport/chttp2_plugin.cc"
        "src/core/ext/transport/chttp2/transport/chttp2_transport.cc"
        "src/core/ext/transport/chttp2/transport/flow_control.cc"
        "src/core/ext/transport/chttp2/transport/frame_data.cc"
        "src/core/ext/transport/chttp2/transport/frame_goaway.cc"
        "src/core/ext/transport/chttp2/transport/frame_ping.cc"
        "src/core/ext/transport/chttp2/transport/frame_rst_stream.cc"
        "src/core/ext/transport/chttp2/transport/frame_settings.cc"
        "src/core/ext/transport/chttp2/transport/frame_window_update.cc"
        "src/core/ext/transport/chttp2/transport/hpack_encoder.cc"
        "src/core/ext/transport/chttp2/transport/hpack_parser.cc"
        "src/core/ext/transport/chttp2/transport/hpack_mapping.cc"
        "src/core/ext/transport/chttp2/transport/hpack_table.cc"
        "src/core/ext/transport/chttp2/transport/http2_settings.cc"
        "src/core/ext/transport/chttp2/transport/huffsyms.cc"
        "src/core/ext/transport/chttp2/transport/incoming_metadata.cc"
        "src/core/ext/transport/chttp2/transport/parsing.cc"
        "src/core/ext/transport/chttp2/transport/stream_lists.cc"
        "src/core/ext/transport/chttp2/transport/stream_map.cc"
        "src/core/ext/transport/chttp2/transport/varint.cc"
        "src/core/ext/transport/chttp2/transport/writing.cc"
    ];
    local_include_dirs = [
        "include"
    ];
    static_libs = [
        "libgrpc_base"
        "libgrpc_http_filters"
    ];
    whole_static_libs = [
        "libgrpc_transport_chttp2_alpn"
    ];
};

libgrpc_lb_policy_grpclb = cc_library_static {
    name = "libgrpc_lb_policy_grpclb";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/ext/filters/client_channel/lb_policy/grpclb/client_load_reporting_filter.cc"
        "src/core/ext/filters/client_channel/lb_policy/grpclb/grpclb.cc"
        "src/core/ext/filters/client_channel/lb_policy/grpclb/grpclb_channel.cc"
        "src/core/ext/filters/client_channel/lb_policy/grpclb/grpclb_client_stats.cc"
        "src/core/ext/filters/client_channel/lb_policy/grpclb/load_balancer_api.cc"
        "src/core/ext/filters/client_channel/lb_policy/grpclb/proto/grpc/lb/v1/google/protobuf/duration.pb.c"
        "src/core/ext/filters/client_channel/lb_policy/grpclb/proto/grpc/lb/v1/google/protobuf/timestamp.pb.c"
        "src/core/ext/filters/client_channel/lb_policy/grpclb/proto/grpc/lb/v1/load_balancer.pb.c"
    ];
    local_include_dirs = [
        "include"
        "src/core/ext/filters/client_channel/lb_policy/grpclb"
    ];
    static_libs = [
        "libgrpc_base"
        "libgrpc_client_channel"
        "libgrpc_deadline_filter"
        "libgrpc_resolver_fake"
        "libprotobuf-c-nano"
    ];
};

libgrpc_lb_policy_grpclb_secure = cc_library_static {
    name = "libgrpc_lb_policy_grpclb_secure";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/ext/filters/client_channel/lb_policy/grpclb/client_load_reporting_filter.cc"
        "src/core/ext/filters/client_channel/lb_policy/grpclb/grpclb.cc"
        "src/core/ext/filters/client_channel/lb_policy/grpclb/grpclb_channel_secure.cc"
        "src/core/ext/filters/client_channel/lb_policy/grpclb/grpclb_client_stats.cc"
        "src/core/ext/filters/client_channel/lb_policy/grpclb/load_balancer_api.cc"
        "src/core/ext/filters/client_channel/lb_policy/grpclb/proto/grpc/lb/v1/google/protobuf/duration.pb.c"
        "src/core/ext/filters/client_channel/lb_policy/grpclb/proto/grpc/lb/v1/google/protobuf/timestamp.pb.c"
        "src/core/ext/filters/client_channel/lb_policy/grpclb/proto/grpc/lb/v1/load_balancer.pb.c"
    ];
    local_include_dirs = [
        "include"
        "src/core/ext/filters/client_channel/lb_policy/grpclb"
    ];
    static_libs = [
        "libgrpc_base"
        "libgrpc_client_channel"
        "libgrpc_deadline_filter"
        "libgrpc_resolver_fake"
        "libprotobuf-c-nano"
    ];
};

"libgrpc++_codegen_base_src" = cc_library_static {
    name = "libgrpc++_codegen_base_src";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/cpp/codegen/codegen_init.cc"
    ];
    local_include_dirs = [
        "include"
    ];
};

gpr_base = cc_library_static {
    name = "gpr_base";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/lib/gpr/alloc.cc"
        "src/core/lib/gpr/arena.cc"
        "src/core/lib/gpr/atm.cc"
        "src/core/lib/gpr/cpu_iphone.cc"
        "src/core/lib/gpr/cpu_linux.cc"
        "src/core/lib/gpr/cpu_posix.cc"
        "src/core/lib/gpr/cpu_windows.cc"
        "src/core/lib/gpr/env_linux.cc"
        "src/core/lib/gpr/env_posix.cc"
        "src/core/lib/gpr/env_windows.cc"
        "src/core/lib/gpr/host_port.cc"
        "src/core/lib/gpr/log.cc"
        "src/core/lib/gpr/log_android.cc"
        "src/core/lib/gpr/log_linux.cc"
        "src/core/lib/gpr/log_posix.cc"
        "src/core/lib/gpr/log_windows.cc"
        "src/core/lib/gpr/mpscq.cc"
        "src/core/lib/gpr/murmur_hash.cc"
        "src/core/lib/gpr/string.cc"
        "src/core/lib/gpr/string_posix.cc"
        "src/core/lib/gpr/string_util_windows.cc"
        "src/core/lib/gpr/string_windows.cc"
        "src/core/lib/gpr/sync.cc"
        "src/core/lib/gpr/sync_posix.cc"
        "src/core/lib/gpr/sync_windows.cc"
        "src/core/lib/gpr/time.cc"
        "src/core/lib/gpr/time_posix.cc"
        "src/core/lib/gpr/time_precise.cc"
        "src/core/lib/gpr/time_windows.cc"
        "src/core/lib/gpr/tls_pthread.cc"
        "src/core/lib/gpr/tmpfile_msys.cc"
        "src/core/lib/gpr/tmpfile_posix.cc"
        "src/core/lib/gpr/tmpfile_windows.cc"
        "src/core/lib/gpr/wrap_memcpy.cc"
        "src/core/lib/gprpp/fork.cc"
        "src/core/lib/gprpp/thd_posix.cc"
        "src/core/lib/gprpp/thd_windows.cc"
        "src/core/lib/profiling/basic_timers.cc"
        "src/core/lib/profiling/stap_timers.cc"
    ];
    shared_libs = [
        "liblog"
    ];
    export_include_dirs = [
        "include"
        "."
    ];
};

libgrpc_client_channel = cc_library_static {
    name = "libgrpc_client_channel";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/ext/filters/client_channel/backup_poller.cc"
        "src/core/ext/filters/client_channel/channel_connectivity.cc"
        "src/core/ext/filters/client_channel/client_channel.cc"
        "src/core/ext/filters/client_channel/client_channel_channelz.cc"
        "src/core/ext/filters/client_channel/client_channel_factory.cc"
        "src/core/ext/filters/client_channel/client_channel_plugin.cc"
        "src/core/ext/filters/client_channel/connector.cc"
        "src/core/ext/filters/client_channel/http_connect_handshaker.cc"
        "src/core/ext/filters/client_channel/http_proxy.cc"
        "src/core/ext/filters/client_channel/lb_policy.cc"
        "src/core/ext/filters/client_channel/lb_policy_factory.cc"
        "src/core/ext/filters/client_channel/lb_policy_registry.cc"
        "src/core/ext/filters/client_channel/method_params.cc"
        "src/core/ext/filters/client_channel/parse_address.cc"
        "src/core/ext/filters/client_channel/proxy_mapper.cc"
        "src/core/ext/filters/client_channel/proxy_mapper_registry.cc"
        "src/core/ext/filters/client_channel/resolver.cc"
        "src/core/ext/filters/client_channel/resolver_registry.cc"
        "src/core/ext/filters/client_channel/retry_throttle.cc"
        "src/core/ext/filters/client_channel/subchannel.cc"
        "src/core/ext/filters/client_channel/subchannel_index.cc"
        "src/core/ext/filters/client_channel/uri_parser.cc"
    ];
    local_include_dirs = [
        "include"
        "src/core/ext/filters/client_channel"
    ];
    static_libs = [
        "libgrpc_base"
        "libgrpc_deadline_filter"
    ];
};

libgrpc_trace = cc_library_static {
    name = "libgrpc_trace";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/lib/debug/trace.cc"
    ];
    whole_static_libs = [
        "gpr_base"
    ];
    shared_libs = [
        "liblog"
    ];
};

libgrpc_base_c = cc_library_static {
    name = "libgrpc_base_c";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/lib/avl/avl.cc"
        "src/core/lib/backoff/backoff.cc"
        "src/core/lib/channel/channel_args.cc"
        "src/core/lib/channel/channel_stack.cc"
        "src/core/lib/channel/channel_stack_builder.cc"
        "src/core/lib/channel/channel_trace.cc"
        "src/core/lib/channel/channelz.cc"
        "src/core/lib/channel/channelz_registry.cc"
        "src/core/lib/channel/connected_channel.cc"
        "src/core/lib/channel/handshaker.cc"
        "src/core/lib/channel/handshaker_factory.cc"
        "src/core/lib/channel/handshaker_registry.cc"
        "src/core/lib/channel/status_util.cc"
        "src/core/lib/compression/compression.cc"
        "src/core/lib/compression/compression_internal.cc"
        "src/core/lib/compression/message_compress.cc"
        "src/core/lib/compression/stream_compression.cc"
        "src/core/lib/compression/stream_compression_gzip.cc"
        "src/core/lib/compression/stream_compression_identity.cc"
        "src/core/lib/debug/stats.cc"
        "src/core/lib/debug/stats_data.cc"
        "src/core/lib/http/format_request.cc"
        "src/core/lib/http/httpcli.cc"
        "src/core/lib/http/parser.cc"
        "src/core/lib/iomgr/buffer_list.cc"
        "src/core/lib/iomgr/call_combiner.cc"
        "src/core/lib/iomgr/combiner.cc"
        "src/core/lib/iomgr/endpoint.cc"
        "src/core/lib/iomgr/endpoint_pair_posix.cc"
        "src/core/lib/iomgr/endpoint_pair_uv.cc"
        "src/core/lib/iomgr/endpoint_pair_windows.cc"
        "src/core/lib/iomgr/error.cc"
        "src/core/lib/iomgr/ev_epoll1_linux.cc"
        "src/core/lib/iomgr/ev_epollex_linux.cc"
        "src/core/lib/iomgr/ev_epollsig_linux.cc"
        "src/core/lib/iomgr/ev_poll_posix.cc"
        "src/core/lib/iomgr/ev_posix.cc"
        "src/core/lib/iomgr/ev_windows.cc"
        "src/core/lib/iomgr/exec_ctx.cc"
        "src/core/lib/iomgr/executor.cc"
        "src/core/lib/iomgr/fork_posix.cc"
        "src/core/lib/iomgr/fork_windows.cc"
        "src/core/lib/iomgr/gethostname_fallback.cc"
        "src/core/lib/iomgr/gethostname_host_name_max.cc"
        "src/core/lib/iomgr/gethostname_sysconf.cc"
        "src/core/lib/iomgr/internal_errqueue.cc"
        "src/core/lib/iomgr/iocp_windows.cc"
        "src/core/lib/iomgr/iomgr.cc"
        "src/core/lib/iomgr/iomgr_custom.cc"
        "src/core/lib/iomgr/iomgr_internal.cc"
        "src/core/lib/iomgr/iomgr_posix.cc"
        "src/core/lib/iomgr/iomgr_windows.cc"
        "src/core/lib/iomgr/is_epollexclusive_available.cc"
        "src/core/lib/iomgr/load_file.cc"
        "src/core/lib/iomgr/lockfree_event.cc"
        "src/core/lib/iomgr/network_status_tracker.cc"
        "src/core/lib/iomgr/polling_entity.cc"
        "src/core/lib/iomgr/pollset.cc"
        "src/core/lib/iomgr/pollset_custom.cc"
        "src/core/lib/iomgr/pollset_set.cc"
        "src/core/lib/iomgr/pollset_set_custom.cc"
        "src/core/lib/iomgr/pollset_set_windows.cc"
        "src/core/lib/iomgr/pollset_uv.cc"
        "src/core/lib/iomgr/pollset_windows.cc"
        "src/core/lib/iomgr/resolve_address.cc"
        "src/core/lib/iomgr/resolve_address_custom.cc"
        "src/core/lib/iomgr/resolve_address_posix.cc"
        "src/core/lib/iomgr/resolve_address_windows.cc"
        "src/core/lib/iomgr/resource_quota.cc"
        "src/core/lib/iomgr/sockaddr_utils.cc"
        "src/core/lib/iomgr/socket_factory_posix.cc"
        "src/core/lib/iomgr/socket_mutator.cc"
        "src/core/lib/iomgr/socket_utils_common_posix.cc"
        "src/core/lib/iomgr/socket_utils_linux.cc"
        "src/core/lib/iomgr/socket_utils_posix.cc"
        "src/core/lib/iomgr/socket_utils_windows.cc"
        "src/core/lib/iomgr/socket_windows.cc"
        "src/core/lib/iomgr/tcp_client.cc"
        "src/core/lib/iomgr/tcp_client_custom.cc"
        "src/core/lib/iomgr/tcp_client_posix.cc"
        "src/core/lib/iomgr/tcp_client_windows.cc"
        "src/core/lib/iomgr/tcp_custom.cc"
        "src/core/lib/iomgr/tcp_posix.cc"
        "src/core/lib/iomgr/tcp_server.cc"
        "src/core/lib/iomgr/tcp_server_custom.cc"
        "src/core/lib/iomgr/tcp_server_posix.cc"
        "src/core/lib/iomgr/tcp_server_utils_posix_common.cc"
        "src/core/lib/iomgr/tcp_server_utils_posix_ifaddrs.cc"
        "src/core/lib/iomgr/tcp_server_utils_posix_noifaddrs.cc"
        "src/core/lib/iomgr/tcp_server_windows.cc"
        "src/core/lib/iomgr/tcp_uv.cc"
        "src/core/lib/iomgr/tcp_windows.cc"
        "src/core/lib/iomgr/time_averaged_stats.cc"
        "src/core/lib/iomgr/timer.cc"
        "src/core/lib/iomgr/timer_custom.cc"
        "src/core/lib/iomgr/timer_generic.cc"
        "src/core/lib/iomgr/timer_heap.cc"
        "src/core/lib/iomgr/timer_manager.cc"
        "src/core/lib/iomgr/timer_uv.cc"
        "src/core/lib/iomgr/udp_server.cc"
        "src/core/lib/iomgr/unix_sockets_posix.cc"
        "src/core/lib/iomgr/unix_sockets_posix_noop.cc"
        "src/core/lib/iomgr/wakeup_fd_cv.cc"
        "src/core/lib/iomgr/wakeup_fd_eventfd.cc"
        "src/core/lib/iomgr/wakeup_fd_nospecial.cc"
        "src/core/lib/iomgr/wakeup_fd_pipe.cc"
        "src/core/lib/iomgr/wakeup_fd_posix.cc"
        "src/core/lib/json/json.cc"
        "src/core/lib/json/json_reader.cc"
        "src/core/lib/json/json_string.cc"
        "src/core/lib/json/json_writer.cc"
        "src/core/lib/slice/b64.cc"
        "src/core/lib/slice/percent_encoding.cc"
        "src/core/lib/slice/slice.cc"
        "src/core/lib/slice/slice_buffer.cc"
        "src/core/lib/slice/slice_intern.cc"
        "src/core/lib/slice/slice_string_helpers.cc"
        "src/core/lib/surface/api_trace.cc"
        "src/core/lib/surface/byte_buffer.cc"
        "src/core/lib/surface/byte_buffer_reader.cc"
        "src/core/lib/surface/call.cc"
        "src/core/lib/surface/call_details.cc"
        "src/core/lib/surface/call_log_batch.cc"
        "src/core/lib/surface/channel.cc"
        "src/core/lib/surface/channel_init.cc"
        "src/core/lib/surface/channel_ping.cc"
        "src/core/lib/surface/channel_stack_type.cc"
        "src/core/lib/surface/completion_queue.cc"
        "src/core/lib/surface/completion_queue_factory.cc"
        "src/core/lib/surface/event_string.cc"
        "src/core/lib/surface/metadata_array.cc"
        "src/core/lib/surface/server.cc"
        "src/core/lib/surface/validate_metadata.cc"
        "src/core/lib/surface/version.cc"
        "src/core/lib/transport/bdp_estimator.cc"
        "src/core/lib/transport/byte_stream.cc"
        "src/core/lib/transport/connectivity_state.cc"
        "src/core/lib/transport/error_utils.cc"
        "src/core/lib/transport/metadata.cc"
        "src/core/lib/transport/metadata_batch.cc"
        "src/core/lib/transport/pid_controller.cc"
        "src/core/lib/transport/service_config.cc"
        "src/core/lib/transport/static_metadata.cc"
        "src/core/lib/transport/status_conversion.cc"
        "src/core/lib/transport/status_metadata.cc"
        "src/core/lib/transport/timeout_encoding.cc"
        "src/core/lib/transport/transport.cc"
        "src/core/lib/transport/transport_op_string.cc"
    ];
    whole_static_libs = [
        "libgrpc_trace"
        "libz"
    ];
    shared_libs = [
        "liblog"
    ];
};

census = cc_library_static {
    name = "census";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/ext/filters/census/grpc_context.cc"
    ];
    static_libs = [
        "libgrpc_base"
    ];
    local_include_dirs = [
        "include"
    ];
};

grpc_common_libs = [
    "libgrpc_base"
    "census"
    "libgrpc_base_c"
    "libgrpc_deadline_filter"
    "libgrpc_client_authority_filter"
    "libgrpc_client_channel"
    "libgrpc_lb_policy_pick_first"
    "libgrpc_lb_policy_round_robin"
    "libgrpc_max_age_filter"
    "libgrpc_message_size_filter"
    "libgrpc_resolver_dns_ares"
    "libgrpc_resolver_fake"
    "libgrpc_resolver_dns_native"
    "libgrpc_resolver_sockaddr"
    "libgrpc_transport_chttp2_server_insecure"
    "libgrpc_transport_chttp2_client_insecure"
    "libgrpc_http_filters"
    "libgrpc_transport_chttp2"
    "libgrpc_transport_chttp2_client_connector"
    "libgrpc_transport_inproc"
    "libgrpc_workaround_cronet_compression_filter"
    "libgrpc_server_backward_compatibility"
    "libprotobuf-c-nano"
];

libgrpc_unsecure = cc_library_static {
    name = "libgrpc_unsecure";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/lib/surface/init.cc"
        "src/core/lib/surface/init_unsecure.cc"
        "src/core/plugin_registry/grpc_unsecure_plugin_registry.cc"
    ];
    whole_static_libs = grpc_common_libs ++ [
        "libgrpc_lb_policy_grpclb"
    ];
    export_include_dirs = [
        "include"
        "."
    ];
    local_include_dirs = [
        "third_party/cares"
        "third_party/cares/config_android"
    ];
};

libgrpc = cc_library_static {
    name = "libgrpc";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/lib/surface/init.cc"
        "src/core/plugin_registry/grpc_plugin_registry.cc"
    ];
    whole_static_libs = grpc_common_libs ++ [
        "libgrpc_lb_policy_grpclb_secure"
        "libgrpc_secure"
        "libgrpc_transport_chttp2_client_secure"
        "libgrpc_transport_chttp2_server_secure"
    ];
    export_include_dirs = [
        "include"
        "."
    ];
    local_include_dirs = [
        "third_party/cares"
        "third_party/cares/config_android"
    ];
};

GRPCXX_SRCS = [
    "src/cpp/client/channel_cc.cc"
    "src/cpp/client/client_context.cc"
    "src/cpp/client/create_channel.cc"
    "src/cpp/client/create_channel_internal.cc"
    "src/cpp/client/create_channel_posix.cc"
    "src/cpp/client/credentials_cc.cc"
    "src/cpp/client/generic_stub.cc"
    "src/cpp/common/alarm.cc"
    "src/cpp/common/channel_arguments.cc"
    "src/cpp/common/channel_filter.cc"
    "src/cpp/common/completion_queue_cc.cc"
    "src/cpp/common/core_codegen.cc"
    "src/cpp/common/resource_quota_cc.cc"
    "src/cpp/common/rpc_method.cc"
    "src/cpp/common/version_cc.cc"
    "src/cpp/server/async_generic_service.cc"
    "src/cpp/server/channel_argument_option.cc"
    "src/cpp/server/create_default_thread_pool.cc"
    "src/cpp/server/dynamic_thread_pool.cc"
    "src/cpp/server/health/default_health_check_service.cc"
    "src/cpp/server/health/health.pb.c"
    "src/cpp/server/health/health_check_service.cc"
    "src/cpp/server/health/health_check_service_server_builder_option.cc"
    "src/cpp/server/server_builder.cc"
    "src/cpp/server/server_cc.cc"
    "src/cpp/server/server_context.cc"
    "src/cpp/server/server_credentials.cc"
    "src/cpp/server/server_posix.cc"
    "src/cpp/thread_manager/thread_manager.cc"
    "src/cpp/util/byte_buffer_cc.cc"
    "src/cpp/util/status.cc"
    "src/cpp/util/string_ref.cc"
    "src/cpp/util/time_cc.cc"
];

"libgrpc++_base" = cc_library_static {
    name = "libgrpc++_base";
    defaults = ["grpc_defaults"];
    srcs = GRPCXX_SRCS;
    local_include_dirs = [
        "include"
    ];
    static_libs = [
        "libgrpc"
    ];
    whole_static_libs = [
        "libgrpc++_codegen_base_src"
    ];
    cflags = [
        "-Wno-unused-parameter"
    ];
};

"libgrpc++_base_unsecure" = cc_library_static {
    name = "libgrpc++_base_unsecure";
    defaults = ["grpc_defaults"];
    srcs = GRPCXX_SRCS;
    local_include_dirs = [
        "include"
    ];
    static_libs = [
        "libgrpc_unsecure"
    ];
    whole_static_libs = [
        "libgrpc++_codegen_base_src"
    ];
    cflags = [
        "-Wno-unused-parameter"
    ];
};

libgrpc_base = cc_library_static {
    name = "libgrpc_base";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/core/lib/surface/lame_client.cc"
    ];
    whole_static_libs = [
        "libgrpc_base_c"
    ];
    shared_libs = [
        "liblog"
    ];
};

#  gRPC C++ library target with no encryption or authentication
"libgrpc++_unsecure" = cc_library_shared {
    name = "libgrpc++_unsecure";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/cpp/client/insecure_credentials.cc"
        "src/cpp/common/insecure_create_auth_context.cc"
        "src/cpp/server/insecure_server_credentials.cc"
    ];
    static_libs = [
        "libgrpc_unsecure"
    ];
    whole_static_libs = [
        "libgrpc++_base_unsecure"
    ];
    shared_libs = [
        "liblog"
    ];
    export_include_dirs = [
        "include"
        "."
    ];
};

#  Secured gRPC C++ library target
"libgrpc++" = cc_library_shared {
    name = "libgrpc++";
    defaults = ["grpc_defaults"];
    srcs = [
        "src/cpp/client/insecure_credentials.cc"
        "src/cpp/client/secure_credentials.cc"
        "src/cpp/common/auth_property_iterator.cc"
        "src/cpp/common/secure_auth_context.cc"
        "src/cpp/common/secure_channel_arguments.cc"
        "src/cpp/common/secure_create_auth_context.cc"
        "src/cpp/server/insecure_server_credentials.cc"
        "src/cpp/server/secure_server_credentials.cc"
    ];
    static_libs = [
        "libgrpc"
    ];
    whole_static_libs = [
        "libgrpc++_base"
    ];
    shared_libs = [
        "liblog"
        "libcrypto"
        "libssl"
    ];
    export_include_dirs = [
        "include"
        "."
    ];
};

#  gRPC python library target
py-grpc = python_library_host {
    name = "py-grpc";
    srcs = [
        "src/python/grpcio/_spawn_patch.py"
        "src/python/grpcio/commands.py"
        "src/python/grpcio/grpc_core_dependencies.py"
        "src/python/grpcio/grpc_version.py"
        "src/python/grpcio/support.py"
        "src/python/grpcio/grpc/__init__.py"
        "src/python/grpcio/grpc/_auth.py"
        "src/python/grpcio/grpc/_channel.py"
        "src/python/grpcio/grpc/_common.py"
        "src/python/grpcio/grpc/_grpcio_metadata.py"
        "src/python/grpcio/grpc/_interceptor.py"
        "src/python/grpcio/grpc/_plugin_wrapping.py"
        "src/python/grpcio/grpc/_server.py"
        "src/python/grpcio/grpc/_utilities.py"
        "src/python/grpcio/grpc/_cython/__init__.py"
        "src/python/grpcio/grpc/_cython/_cygrpc/__init__.py"
        "src/python/grpcio/grpc/beta/__init__.py"
        "src/python/grpcio/grpc/beta/_client_adaptations.py"
        "src/python/grpcio/grpc/beta/_metadata.py"
        "src/python/grpcio/grpc/beta/_server_adaptations.py"
        "src/python/grpcio/grpc/beta/implementations.py"
        "src/python/grpcio/grpc/beta/interfaces.py"
        "src/python/grpcio/grpc/beta/utilities.py"
        "src/python/grpcio/grpc/experimental/__init__.py"
        "src/python/grpcio/grpc/experimental/gevent.py"
        "src/python/grpcio/grpc/experimental/session_cache.py"
        "src/python/grpcio/grpc/framework/__init__.py"
        "src/python/grpcio/grpc/framework/common/__init__.py"
        "src/python/grpcio/grpc/framework/common/cardinality.py"
        "src/python/grpcio/grpc/framework/common/style.py"
        "src/python/grpcio/grpc/framework/foundation/__init__.py"
        "src/python/grpcio/grpc/framework/foundation/abandonment.py"
        "src/python/grpcio/grpc/framework/foundation/callable_util.py"
        "src/python/grpcio/grpc/framework/foundation/future.py"
        "src/python/grpcio/grpc/framework/foundation/logging_pool.py"
        "src/python/grpcio/grpc/framework/foundation/stream.py"
        "src/python/grpcio/grpc/framework/foundation/stream_util.py"
        "src/python/grpcio/grpc/framework/interfaces/__init__.py"
        "src/python/grpcio/grpc/framework/interfaces/base/__init__.py"
        "src/python/grpcio/grpc/framework/interfaces/base/base.py"
        "src/python/grpcio/grpc/framework/interfaces/base/utilities.py"
        "src/python/grpcio/grpc/framework/interfaces/face/__init__.py"
        "src/python/grpcio/grpc/framework/interfaces/face/face.py"
        "src/python/grpcio/grpc/framework/interfaces/face/utilities.py"
        "src/python/grpcio_health_checking/grpc_version.py"
        "src/python/grpcio_health_checking/health_commands.py"
        "src/python/grpcio_health_checking/setup.py"
        "src/python/grpcio_health_checking/grpc_health/__init__.py"
        "src/python/grpcio_health_checking/grpc_health/v1/__init__.py"
        "src/python/grpcio_health_checking/grpc_health/v1/health.py"
        "src/python/grpcio_reflection/grpc_version.py"
        "src/python/grpcio_reflection/reflection_commands.py"
        "src/python/grpcio_reflection/setup.py"
        "src/python/grpcio_reflection/grpc_reflection/__init__.py"
        "src/python/grpcio_reflection/grpc_reflection/v1alpha/__init__.py"
        "src/python/grpcio_reflection/grpc_reflection/v1alpha/reflection.py"
        "src/python/grpcio_testing/grpc_version.py"
        "src/python/grpcio_testing/setup.py"
        "src/python/grpcio_testing/grpc_testing/__init__.py"
        "src/python/grpcio_testing/grpc_testing/_common.py"
        "src/python/grpcio_testing/grpc_testing/_time.py"
        "src/python/grpcio_testing/grpc_testing/_channel/__init__.py"
        "src/python/grpcio_testing/grpc_testing/_channel/_channel.py"
        "src/python/grpcio_testing/grpc_testing/_channel/_channel_rpc.py"
        "src/python/grpcio_testing/grpc_testing/_channel/_channel_state.py"
        "src/python/grpcio_testing/grpc_testing/_channel/_invocation.py"
        "src/python/grpcio_testing/grpc_testing/_channel/_multi_callable.py"
        "src/python/grpcio_testing/grpc_testing/_channel/_rpc_state.py"
        "src/python/grpcio_testing/grpc_testing/_server/__init__.py"
        "src/python/grpcio_testing/grpc_testing/_server/_handler.py"
        "src/python/grpcio_testing/grpc_testing/_server/_rpc.py"
        "src/python/grpcio_testing/grpc_testing/_server/_server.py"
        "src/python/grpcio_testing/grpc_testing/_server/_server_rpc.py"
        "src/python/grpcio_testing/grpc_testing/_server/_service.py"
        "src/python/grpcio_testing/grpc_testing/_server/_servicer_context.py"
        "src/python/grpcio_tests/commands.py"
        "src/python/grpcio_tests/grpc_version.py"
        "src/python/grpcio_tests/setup.py"
        "src/python/grpcio_tests/tests/__init__.py"
        "src/python/grpcio_tests/tests/_loader.py"
        "src/python/grpcio_tests/tests/_result.py"
        "src/python/grpcio_tests/tests/_runner.py"
        "src/python/grpcio_tests/tests/_sanity/__init__.py"
        "src/python/grpcio_tests/tests/_sanity/_sanity_test.py"
        "src/python/grpcio_tests/tests/fork/__init__.py"
        "src/python/grpcio_tests/tests/fork/client.py"
        "src/python/grpcio_tests/tests/fork/methods.py"
        "src/python/grpcio_tests/tests/health_check/__init__.py"
        "src/python/grpcio_tests/tests/health_check/_health_servicer_test.py"
        "src/python/grpcio_tests/tests/http2/negative_http2_client.py"
        "src/python/grpcio_tests/tests/interop/__init__.py"
        "src/python/grpcio_tests/tests/interop/_insecure_intraop_test.py"
        "src/python/grpcio_tests/tests/interop/_intraop_test_case.py"
        "src/python/grpcio_tests/tests/interop/_secure_intraop_test.py"
        "src/python/grpcio_tests/tests/interop/client.py"
        "src/python/grpcio_tests/tests/interop/methods.py"
        "src/python/grpcio_tests/tests/interop/resources.py"
        "src/python/grpcio_tests/tests/interop/server.py"
        "src/python/grpcio_tests/tests/protoc_plugin/__init__.py"
        "src/python/grpcio_tests/tests/protoc_plugin/_python_plugin_test.py"
        "src/python/grpcio_tests/tests/protoc_plugin/_split_definitions_test.py"
        "src/python/grpcio_tests/tests/protoc_plugin/beta_python_plugin_test.py"
        "src/python/grpcio_tests/tests/protoc_plugin/protos/__init__.py"
        "src/python/grpcio_tests/tests/protoc_plugin/protos/invocation_testing/__init__.py"
        "src/python/grpcio_tests/tests/protoc_plugin/protos/payload/__init__.py"
        "src/python/grpcio_tests/tests/protoc_plugin/protos/requests/__init__.py"
        "src/python/grpcio_tests/tests/protoc_plugin/protos/requests/r/__init__.py"
        "src/python/grpcio_tests/tests/protoc_plugin/protos/responses/__init__.py"
        "src/python/grpcio_tests/tests/protoc_plugin/protos/service/__init__.py"
        "src/python/grpcio_tests/tests/qps/__init__.py"
        "src/python/grpcio_tests/tests/qps/benchmark_client.py"
        "src/python/grpcio_tests/tests/qps/benchmark_server.py"
        "src/python/grpcio_tests/tests/qps/client_runner.py"
        "src/python/grpcio_tests/tests/qps/histogram.py"
        "src/python/grpcio_tests/tests/qps/qps_worker.py"
        "src/python/grpcio_tests/tests/qps/worker_server.py"
        "src/python/grpcio_tests/tests/reflection/__init__.py"
        "src/python/grpcio_tests/tests/reflection/_reflection_servicer_test.py"
        "src/python/grpcio_tests/tests/stress/__init__.py"
        "src/python/grpcio_tests/tests/stress/client.py"
        "src/python/grpcio_tests/tests/stress/metrics_server.py"
        "src/python/grpcio_tests/tests/stress/test_runner.py"
        "src/python/grpcio_tests/tests/testing/__init__.py"
        "src/python/grpcio_tests/tests/testing/_application_common.py"
        "src/python/grpcio_tests/tests/testing/_application_testing_common.py"
        "src/python/grpcio_tests/tests/testing/_client_application.py"
        "src/python/grpcio_tests/tests/testing/_client_test.py"
        "src/python/grpcio_tests/tests/testing/_server_application.py"
        "src/python/grpcio_tests/tests/testing/_server_test.py"
        "src/python/grpcio_tests/tests/testing/_time_test.py"
        "src/python/grpcio_tests/tests/testing/proto/__init__.py"
        "src/python/grpcio_tests/tests/unit/__init__.py"
        "src/python/grpcio_tests/tests/unit/_api_test.py"
        "src/python/grpcio_tests/tests/unit/_auth_context_test.py"
        "src/python/grpcio_tests/tests/unit/_auth_test.py"
        "src/python/grpcio_tests/tests/unit/_channel_args_test.py"
        "src/python/grpcio_tests/tests/unit/_channel_close_test.py"
        "src/python/grpcio_tests/tests/unit/_channel_connectivity_test.py"
        "src/python/grpcio_tests/tests/unit/_channel_ready_future_test.py"
        "src/python/grpcio_tests/tests/unit/_compression_test.py"
        "src/python/grpcio_tests/tests/unit/_credentials_test.py"
        "src/python/grpcio_tests/tests/unit/_empty_message_test.py"
        "src/python/grpcio_tests/tests/unit/_exit_scenarios.py"
        "src/python/grpcio_tests/tests/unit/_exit_test.py"
        "src/python/grpcio_tests/tests/unit/_from_grpc_import_star.py"
        "src/python/grpcio_tests/tests/unit/_interceptor_test.py"
        "src/python/grpcio_tests/tests/unit/_invalid_metadata_test.py"
        "src/python/grpcio_tests/tests/unit/_invocation_defects_test.py"
        "src/python/grpcio_tests/tests/unit/_metadata_code_details_test.py"
        "src/python/grpcio_tests/tests/unit/_metadata_test.py"
        "src/python/grpcio_tests/tests/unit/_reconnect_test.py"
        "src/python/grpcio_tests/tests/unit/_resource_exhausted_test.py"
        "src/python/grpcio_tests/tests/unit/_rpc_test.py"
        "src/python/grpcio_tests/tests/unit/_server_ssl_cert_config_test.py"
        "src/python/grpcio_tests/tests/unit/_server_test.py"
        "src/python/grpcio_tests/tests/unit/_session_cache_test.py"
        "src/python/grpcio_tests/tests/unit/_thread_pool.py"
        "src/python/grpcio_tests/tests/unit/resources.py"
        "src/python/grpcio_tests/tests/unit/test_common.py"
        "src/python/grpcio_tests/tests/unit/_cython/__init__.py"
        "src/python/grpcio_tests/tests/unit/_cython/_cancel_many_calls_test.py"
        "src/python/grpcio_tests/tests/unit/_cython/_channel_test.py"
        "src/python/grpcio_tests/tests/unit/_cython/_common.py"
        "src/python/grpcio_tests/tests/unit/_cython/_fork_test.py"
        "src/python/grpcio_tests/tests/unit/_cython/_no_messages_server_completion_queue_per_call_test.py"
        "src/python/grpcio_tests/tests/unit/_cython/_no_messages_single_server_completion_queue_test.py"
        "src/python/grpcio_tests/tests/unit/_cython/_read_some_but_not_all_responses_test.py"
        "src/python/grpcio_tests/tests/unit/_cython/_server_test.py"
        "src/python/grpcio_tests/tests/unit/_cython/cygrpc_test.py"
        "src/python/grpcio_tests/tests/unit/_cython/test_utilities.py"
        "src/python/grpcio_tests/tests/unit/beta/__init__.py"
        "src/python/grpcio_tests/tests/unit/beta/_beta_features_test.py"
        "src/python/grpcio_tests/tests/unit/beta/_connectivity_channel_test.py"
        "src/python/grpcio_tests/tests/unit/beta/_implementations_test.py"
        "src/python/grpcio_tests/tests/unit/beta/_not_found_test.py"
        "src/python/grpcio_tests/tests/unit/beta/_utilities_test.py"
        "src/python/grpcio_tests/tests/unit/beta/test_utilities.py"
        "src/python/grpcio_tests/tests/unit/framework/__init__.py"
        "src/python/grpcio_tests/tests/unit/framework/common/__init__.py"
        "src/python/grpcio_tests/tests/unit/framework/common/test_constants.py"
        "src/python/grpcio_tests/tests/unit/framework/common/test_control.py"
        "src/python/grpcio_tests/tests/unit/framework/common/test_coverage.py"
        "src/python/grpcio_tests/tests/unit/framework/foundation/__init__.py"
        "src/python/grpcio_tests/tests/unit/framework/foundation/_logging_pool_test.py"
        "src/python/grpcio_tests/tests/unit/framework/foundation/stream_testing.py"
    ];
    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = true;
        };
    };
    pkg_path = "grpc";
};

in { inherit "libgrpc++" "libgrpc++_base" "libgrpc++_base_unsecure" "libgrpc++_codegen_base_src" "libgrpc++_unsecure" census gpr_base grpc_defaults libalts_frame_protector libalts_util libgrpc libgrpc_base libgrpc_base_c libgrpc_client_authority_filter libgrpc_client_channel libgrpc_deadline_filter libgrpc_http_filters libgrpc_lb_policy_grpclb libgrpc_lb_policy_grpclb_secure libgrpc_lb_policy_pick_first libgrpc_lb_policy_round_robin libgrpc_max_age_filter libgrpc_message_size_filter libgrpc_plugin_support libgrpc_resolver_dns_ares libgrpc_resolver_dns_native libgrpc_resolver_fake libgrpc_resolver_sockaddr libgrpc_secure libgrpc_server_backward_compatibility libgrpc_trace libgrpc_transport_chttp2 libgrpc_transport_chttp2_alpn libgrpc_transport_chttp2_client_connector libgrpc_transport_chttp2_client_insecure libgrpc_transport_chttp2_client_secure libgrpc_transport_chttp2_server_insecure libgrpc_transport_chttp2_server_secure libgrpc_transport_inproc libgrpc_unsecure libgrpc_workaround_cronet_compression_filter libtsi libtsi_interface protoc-gen-grpc-cpp-plugin protoc-gen-grpc-python-plugin py-grpc; }
