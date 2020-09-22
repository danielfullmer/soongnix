{ cc_binary_host }:
let

bluetooth_packetgen = cc_binary_host {
    name = "bluetooth_packetgen";
    srcs = [
        "fields/array_field.cc"
        "fields/vector_field.cc"
        "fields/body_field.cc"
        "fields/checksum_field.cc"
        "fields/checksum_start_field.cc"
        "fields/count_field.cc"
        "fields/custom_field.cc"
        "fields/custom_field_fixed_size.cc"
        "fields/enum_field.cc"
        "fields/fixed_enum_field.cc"
        "fields/fixed_field.cc"
        "fields/fixed_scalar_field.cc"
        "fields/group_field.cc"
        "fields/packet_field.cc"
        "fields/padding_field.cc"
        "fields/payload_field.cc"
        "fields/reserved_field.cc"
        "fields/scalar_field.cc"
        "fields/size_field.cc"
        "fields/struct_field.cc"
        "fields/variable_length_struct_field.cc"
        "checksum_def.cc"
        "custom_field_def.cc"
        "enum_def.cc"
        "enum_gen.cc"
        "packet_def.cc"
        "parent_def.cc"
        "struct_def.cc"
        "struct_parser_generator.cc"
        "main.cc"
        "language_y.yy"
        "language_l.ll"
    ];
    static_libs = [
        "libc++fs"
    ];
    cppflags = [
        "-fno-exceptions"
        "-O0"
    ];
    ldflags = [
        "-fuse-ld=ld"
        "-O0"
    ];
    yacc = {
        gen_location_hh = true;
        gen_position_hh = true;
    };
};

in { inherit bluetooth_packetgen; }
