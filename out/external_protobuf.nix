{ android_test, cc_binary_host, cc_defaults, cc_library, cc_library_host_shared, cc_library_shared, cc_library_static, filegroup, java_defaults, java_library, java_library_host, java_library_static, java_test, python_library }:
let

#  Copyright (C) 2009 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#
#

IGNORED_WARNINGS = [
    "-Wno-sign-compare"
    "-Wno-unused-parameter"
    "-Wno-sign-promo"
    "-Wno-error=return-type"
    "-Wno-error=enum-compare-switch"
];

protobuf-cflags-defaults = cc_defaults {
    name = "protobuf-cflags-defaults";
    clang_cflags = [
        "-Wno-unused-const-variable"
        "-Wno-error=user-defined-warnings"
    ];
    cflags = [
        "-Wall"
        "-Wno-error=format"
        "-Wno-error=format-extra-args"
        "-Wno-error=ignored-qualifiers"
        "-Wno-error=sign-promo"
        "-Wno-unused-function"
    ];
    target = {
        windows = {
            cflags = ["-Wno-error"];
        };
        #  cannot suppress gcc warning on redefined macros
        not_windows = {
            cflags = ["-Werror"];
        };
        android = {
            cflags = ["-Werror"];
        };
    };
};

libprotobuf-cpp-lite-defaults = cc_defaults {
    name = "libprotobuf-cpp-lite-defaults";
    defaults = ["protobuf-cflags-defaults"];
    srcs = [
        "src/google/protobuf/stubs/atomicops_internals_x86_gcc.cc"
        "src/google/protobuf/stubs/atomicops_internals_x86_msvc.cc"
        "src/google/protobuf/stubs/bytestream.cc"
        "src/google/protobuf/stubs/common.cc"
        "src/google/protobuf/stubs/int128.cc"
        "src/google/protobuf/stubs/once.cc"
        "src/google/protobuf/stubs/status.cc"
        "src/google/protobuf/stubs/statusor.cc"
        "src/google/protobuf/stubs/stringpiece.cc"
        "src/google/protobuf/stubs/stringprintf.cc"
        "src/google/protobuf/stubs/structurally_valid.cc"
        "src/google/protobuf/stubs/strutil.cc"
        "src/google/protobuf/stubs/time.cc"
        "src/google/protobuf/arena.cc"
        "src/google/protobuf/arenastring.cc"
        "src/google/protobuf/extension_set.cc"
        "src/google/protobuf/generated_message_util.cc"
        "src/google/protobuf/message_lite.cc"
        "src/google/protobuf/repeated_field.cc"
        "src/google/protobuf/wire_format_lite.cc"
        "src/google/protobuf/io/coded_stream.cc"
        "src/google/protobuf/io/zero_copy_stream.cc"
        "src/google/protobuf/io/zero_copy_stream_impl.cc"
        "src/google/protobuf/io/zero_copy_stream_impl_lite.cc"
    ];

    local_include_dirs = [
        "android"
        "src"
    ];
    export_include_dirs = ["src"];

    cflags = IGNORED_WARNINGS;
};

#  C++ lite library for the NDK.
#  =======================================================
libprotobuf-cpp-lite-ndk = cc_library_static {
    name = "libprotobuf-cpp-lite-ndk";
    defaults = ["libprotobuf-cpp-lite-defaults"];

    cflags = ["-DGOOGLE_PROTOBUF_NO_RTTI"];

    sdk_version = "9";

    stl = "c++_static";
};

#  C++ lite library for the platform and host.
#  =======================================================
libprotobuf-cpp-lite = cc_library {
    name = "libprotobuf-cpp-lite";
    host_supported = true;
    recovery_available = true;
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    double_loadable = true;
    defaults = ["libprotobuf-cpp-lite-defaults"];

    cflags = ["-DGOOGLE_PROTOBUF_NO_RTTI"];

    target = {
        windows = {
            enabled = true;
        };
    };
};

#  C++ lite library for the platform and host.
#  =======================================================
libprotobuf-cpp-lite_static = cc_library_static {
    name = "libprotobuf-cpp-lite_static";
    host_supported = true;
    defaults = ["libprotobuf-cpp-lite-defaults"];
    cflags = ["-DGOOGLE_PROTOBUF_NO_RTTI"];
};

#  C++ lite library + rtti (libc++ flavored for the platform and host)
#  =======================================================
libprotobuf-cpp-lite-rtti = cc_library_shared {
    name = "libprotobuf-cpp-lite-rtti";
    host_supported = true;
    vendor_available = true;
    defaults = ["libprotobuf-cpp-lite-defaults"];

    rtti = true;
};

#  C++ full library
#  =======================================================
libprotobuf-cpp-full-defaults = cc_defaults {
    name = "libprotobuf-cpp-full-defaults";
    defaults = ["libprotobuf-cpp-lite-defaults"];

    srcs = [
        "src/google/protobuf/any.pb.cc"
        "src/google/protobuf/api.pb.cc"
        "src/google/protobuf/stubs/mathlimits.cc"
        "src/google/protobuf/any.cc"
        "src/google/protobuf/descriptor.cc"
        "src/google/protobuf/descriptor_database.cc"
        "src/google/protobuf/descriptor.pb.cc"
        "src/google/protobuf/duration.pb.cc"
        "src/google/protobuf/dynamic_message.cc"
        "src/google/protobuf/empty.pb.cc"
        "src/google/protobuf/extension_set_heavy.cc"
        "src/google/protobuf/field_mask.pb.cc"
        "src/google/protobuf/generated_message_reflection.cc"
        "src/google/protobuf/map_field.cc"
        "src/google/protobuf/message.cc"
        "src/google/protobuf/reflection_ops.cc"
        "src/google/protobuf/service.cc"
        "src/google/protobuf/source_context.pb.cc"
        "src/google/protobuf/struct.pb.cc"
        "src/google/protobuf/stubs/substitute.cc"
        "src/google/protobuf/text_format.cc"
        "src/google/protobuf/timestamp.pb.cc"
        "src/google/protobuf/type.pb.cc"
        "src/google/protobuf/unknown_field_set.cc"
        "src/google/protobuf/wire_format.cc"
        "src/google/protobuf/wrappers.pb.cc"
        "src/google/protobuf/io/gzip_stream.cc"
        "src/google/protobuf/io/printer.cc"
        "src/google/protobuf/io/strtod.cc"
        "src/google/protobuf/io/tokenizer.cc"
        "src/google/protobuf/compiler/importer.cc"
        "src/google/protobuf/compiler/parser.cc"
        "src/google/protobuf/util/field_comparator.cc"
        "src/google/protobuf/util/field_mask_util.cc"
        "src/google/protobuf/util/internal/datapiece.cc"
        "src/google/protobuf/util/internal/default_value_objectwriter.cc"
        "src/google/protobuf/util/internal/error_listener.cc"
        "src/google/protobuf/util/internal/field_mask_utility.cc"
        "src/google/protobuf/util/internal/json_escaping.cc"
        "src/google/protobuf/util/internal/json_objectwriter.cc"
        "src/google/protobuf/util/internal/json_stream_parser.cc"
        "src/google/protobuf/util/internal/object_writer.cc"
        "src/google/protobuf/util/internal/protostream_objectsource.cc"
        "src/google/protobuf/util/internal/protostream_objectwriter.cc"
        "src/google/protobuf/util/internal/proto_writer.cc"
        "src/google/protobuf/util/internal/type_info.cc"
        "src/google/protobuf/util/internal/type_info_test_helper.cc"
        "src/google/protobuf/util/internal/utility.cc"
        "src/google/protobuf/util/json_util.cc"
        "src/google/protobuf/util/message_differencer.cc"
        "src/google/protobuf/util/time_util.cc"
        "src/google/protobuf/util/type_resolver_util.cc"
    ];

    cflags = ["-DHAVE_ZLIB=1"];
    shared_libs = ["libz"];
};

#  C++ full library for the NDK.
#  =======================================================
libprotobuf-cpp-full-ndk = cc_library_static {
    name = "libprotobuf-cpp-full-ndk";
    defaults = ["libprotobuf-cpp-full-defaults"];

    cflags = ["-DGOOGLE_PROTOBUF_NO_RTTI"];

    sdk_version = "9";

    stl = "c++_static";
};

#  C++ full library for the platform and host
#  =======================================================
libprotobuf-cpp-full = cc_library_shared {
    name = "libprotobuf-cpp-full";
    defaults = ["libprotobuf-cpp-full-defaults"];
    host_supported = true;
    vendor_available = true;
    vndk = {
        enabled = true;
    };

    cflags = ["-DGOOGLE_PROTOBUF_NO_RTTI"];
    target = {
        android = {
            shared_libs = ["liblog"];
        };
    };
};

#  C++ full library + rtti for the platform and host
#  =======================================================
libprotobuf-cpp-full-rtti = cc_library_shared {
    name = "libprotobuf-cpp-full-rtti";
    defaults = ["libprotobuf-cpp-full-defaults"];
    vendor_available = true;

    rtti = true;
    target = {
        android = {
            shared_libs = ["liblog"];
        };
    };
};

#  Compiler library for the host
#  =======================================================
libprotoc = cc_library_host_shared {
    name = "libprotoc";
    defaults = ["libprotobuf-cpp-full-defaults"];

    srcs = [
        "src/google/protobuf/compiler/code_generator.cc"
        "src/google/protobuf/compiler/plugin.cc"
        "src/google/protobuf/compiler/plugin.pb.cc"
    ];

    local_include_dirs = [
        "config"
    ];
    export_include_dirs = [
        "src"
        "config"
    ];

    rtti = true;
};

#  Android Protocol buffer compiler, aprotoc (host executable)
#  used by the build systems as $(PROTOC) defined in
#  build/core/config.mk
#  =======================================================
aprotoc = cc_binary_host {
    name = "aprotoc";
    defaults = ["protobuf-cflags-defaults"];

    target = {
        windows = {
            enabled = true;
        };
    };

    #  Statically link libc++ because we copy aprotoc to unbundled projects where
    #  libc++.so may not be available.
    stl = "libc++_static";

    srcs = [
        "src/google/protobuf/any.cc"
        "src/google/protobuf/arena.cc"
        "src/google/protobuf/arenastring.cc"
        "src/google/protobuf/descriptor.cc"
        "src/google/protobuf/descriptor.pb.cc"
        "src/google/protobuf/descriptor_database.cc"
        "src/google/protobuf/dynamic_message.cc"
        "src/google/protobuf/extension_set.cc"
        "src/google/protobuf/extension_set_heavy.cc"
        "src/google/protobuf/generated_message_reflection.cc"
        "src/google/protobuf/generated_message_util.cc"
        "src/google/protobuf/map_field.cc"
        "src/google/protobuf/message.cc"
        "src/google/protobuf/message_lite.cc"
        "src/google/protobuf/reflection_ops.cc"
        "src/google/protobuf/repeated_field.cc"
        "src/google/protobuf/service.cc"
        "src/google/protobuf/text_format.cc"
        "src/google/protobuf/unknown_field_set.cc"
        "src/google/protobuf/wire_format.cc"
        "src/google/protobuf/wire_format_lite.cc"
        "src/google/protobuf/compiler/code_generator.cc"
        "src/google/protobuf/compiler/command_line_interface.cc"
        "src/google/protobuf/compiler/cpp/cpp_enum.cc"
        "src/google/protobuf/compiler/cpp/cpp_enum_field.cc"
        "src/google/protobuf/compiler/cpp/cpp_extension.cc"
        "src/google/protobuf/compiler/cpp/cpp_field.cc"
        "src/google/protobuf/compiler/cpp/cpp_file.cc"
        "src/google/protobuf/compiler/cpp/cpp_generator.cc"
        "src/google/protobuf/compiler/cpp/cpp_helpers.cc"
        "src/google/protobuf/compiler/cpp/cpp_map_field.cc"
        "src/google/protobuf/compiler/cpp/cpp_message.cc"
        "src/google/protobuf/compiler/cpp/cpp_message_field.cc"
        "src/google/protobuf/compiler/cpp/cpp_primitive_field.cc"
        "src/google/protobuf/compiler/cpp/cpp_service.cc"
        "src/google/protobuf/compiler/cpp/cpp_string_field.cc"
        "src/google/protobuf/compiler/csharp/csharp_doc_comment.cc"
        "src/google/protobuf/compiler/csharp/csharp_enum.cc"
        "src/google/protobuf/compiler/csharp/csharp_enum_field.cc"
        "src/google/protobuf/compiler/csharp/csharp_field_base.cc"
        "src/google/protobuf/compiler/csharp/csharp_generator.cc"
        "src/google/protobuf/compiler/csharp/csharp_helpers.cc"
        "src/google/protobuf/compiler/csharp/csharp_map_field.cc"
        "src/google/protobuf/compiler/csharp/csharp_message.cc"
        "src/google/protobuf/compiler/csharp/csharp_message_field.cc"
        "src/google/protobuf/compiler/csharp/csharp_primitive_field.cc"
        "src/google/protobuf/compiler/csharp/csharp_reflection_class.cc"
        "src/google/protobuf/compiler/csharp/csharp_repeated_enum_field.cc"
        "src/google/protobuf/compiler/csharp/csharp_repeated_message_field.cc"
        "src/google/protobuf/compiler/csharp/csharp_repeated_primitive_field.cc"
        "src/google/protobuf/compiler/csharp/csharp_source_generator_base.cc"
        "src/google/protobuf/compiler/csharp/csharp_wrapper_field.cc"
        "src/google/protobuf/compiler/importer.cc"
        "src/google/protobuf/compiler/java/java_context.cc"
        "src/google/protobuf/compiler/java/java_doc_comment.cc"
        "src/google/protobuf/compiler/java/java_enum.cc"
        "src/google/protobuf/compiler/java/java_enum_field.cc"
        "src/google/protobuf/compiler/java/java_enum_field_lite.cc"
        "src/google/protobuf/compiler/java/java_enum_lite.cc"
        "src/google/protobuf/compiler/java/java_extension.cc"
        "src/google/protobuf/compiler/java/java_extension_lite.cc"
        "src/google/protobuf/compiler/java/java_field.cc"
        "src/google/protobuf/compiler/java/java_file.cc"
        "src/google/protobuf/compiler/java/java_generator.cc"
        "src/google/protobuf/compiler/java/java_generator_factory.cc"
        "src/google/protobuf/compiler/java/java_helpers.cc"
        "src/google/protobuf/compiler/java/java_lazy_message_field.cc"
        "src/google/protobuf/compiler/java/java_lazy_message_field_lite.cc"
        "src/google/protobuf/compiler/java/java_map_field.cc"
        "src/google/protobuf/compiler/java/java_map_field_lite.cc"
        "src/google/protobuf/compiler/java/java_message_builder.cc"
        "src/google/protobuf/compiler/java/java_message_builder_lite.cc"
        "src/google/protobuf/compiler/java/java_message.cc"
        "src/google/protobuf/compiler/java/java_message_field.cc"
        "src/google/protobuf/compiler/java/java_message_field_lite.cc"
        "src/google/protobuf/compiler/java/java_message_lite.cc"
        "src/google/protobuf/compiler/java/java_name_resolver.cc"
        "src/google/protobuf/compiler/java/java_primitive_field.cc"
        "src/google/protobuf/compiler/java/java_primitive_field_lite.cc"
        "src/google/protobuf/compiler/java/java_service.cc"
        "src/google/protobuf/compiler/java/java_shared_code_generator.cc"
        "src/google/protobuf/compiler/java/java_string_field.cc"
        "src/google/protobuf/compiler/java/java_string_field_lite.cc"
        "src/google/protobuf/compiler/javamicro/javamicro_enum.cc"
        "src/google/protobuf/compiler/javamicro/javamicro_enum_field.cc"
        "src/google/protobuf/compiler/javamicro/javamicro_field.cc"
        "src/google/protobuf/compiler/javamicro/javamicro_file.cc"
        "src/google/protobuf/compiler/javamicro/javamicro_generator.cc"
        "src/google/protobuf/compiler/javamicro/javamicro_helpers.cc"
        "src/google/protobuf/compiler/javamicro/javamicro_message.cc"
        "src/google/protobuf/compiler/javamicro/javamicro_message_field.cc"
        "src/google/protobuf/compiler/javamicro/javamicro_primitive_field.cc"
        "src/google/protobuf/compiler/javanano/javanano_enum.cc"
        "src/google/protobuf/compiler/javanano/javanano_enum_field.cc"
        "src/google/protobuf/compiler/javanano/javanano_extension.cc"
        "src/google/protobuf/compiler/javanano/javanano_field.cc"
        "src/google/protobuf/compiler/javanano/javanano_file.cc"
        "src/google/protobuf/compiler/javanano/javanano_generator.cc"
        "src/google/protobuf/compiler/javanano/javanano_helpers.cc"
        "src/google/protobuf/compiler/javanano/javanano_map_field.cc"
        "src/google/protobuf/compiler/javanano/javanano_message.cc"
        "src/google/protobuf/compiler/javanano/javanano_message_field.cc"
        "src/google/protobuf/compiler/javanano/javanano_primitive_field.cc"
        "src/google/protobuf/compiler/js/js_generator.cc"
        "src/google/protobuf/compiler/main.cc"
        "src/google/protobuf/compiler/objectivec/objectivec_enum.cc"
        "src/google/protobuf/compiler/objectivec/objectivec_enum_field.cc"
        "src/google/protobuf/compiler/objectivec/objectivec_extension.cc"
        "src/google/protobuf/compiler/objectivec/objectivec_field.cc"
        "src/google/protobuf/compiler/objectivec/objectivec_file.cc"
        "src/google/protobuf/compiler/objectivec/objectivec_generator.cc"
        "src/google/protobuf/compiler/objectivec/objectivec_helpers.cc"
        "src/google/protobuf/compiler/objectivec/objectivec_map_field.cc"
        "src/google/protobuf/compiler/objectivec/objectivec_message.cc"
        "src/google/protobuf/compiler/objectivec/objectivec_message_field.cc"
        "src/google/protobuf/compiler/objectivec/objectivec_oneof.cc"
        "src/google/protobuf/compiler/objectivec/objectivec_primitive_field.cc"
        "src/google/protobuf/compiler/parser.cc"
        "src/google/protobuf/compiler/plugin.cc"
        "src/google/protobuf/compiler/plugin.pb.cc"
        "src/google/protobuf/compiler/python/python_generator.cc"
        "src/google/protobuf/compiler/ruby/ruby_generator.cc"
        "src/google/protobuf/compiler/subprocess.cc"
        "src/google/protobuf/compiler/zip_writer.cc"
        "src/google/protobuf/io/coded_stream.cc"
        "src/google/protobuf/io/gzip_stream.cc"
        "src/google/protobuf/io/printer.cc"
        "src/google/protobuf/io/strtod.cc"
        "src/google/protobuf/io/tokenizer.cc"
        "src/google/protobuf/io/zero_copy_stream.cc"
        "src/google/protobuf/io/zero_copy_stream_impl.cc"
        "src/google/protobuf/io/zero_copy_stream_impl_lite.cc"
        "src/google/protobuf/stubs/atomicops_internals_x86_gcc.cc"
        "src/google/protobuf/stubs/atomicops_internals_x86_msvc.cc"
        "src/google/protobuf/stubs/common.cc"
        "src/google/protobuf/stubs/int128.cc"
        "src/google/protobuf/stubs/once.cc"
        "src/google/protobuf/stubs/status.cc"
        "src/google/protobuf/stubs/stringpiece.cc"
        "src/google/protobuf/stubs/structurally_valid.cc"
        "src/google/protobuf/stubs/strutil.cc"
        "src/google/protobuf/stubs/substitute.cc"
        "src/google/protobuf/stubs/stringprintf.cc"
    ];

    local_include_dirs = [
        "android"
        "src"
    ];

    static_libs = ["libz"];

    cflags = IGNORED_WARNINGS ++ [
        "-DHAVE_ZLIB=1"
    ];

};

libprotobuf_errorprone_defaults = java_defaults {
    name = "libprotobuf_errorprone_defaults";
    errorprone = {
        javacflags = ["-Xep:MissingOverride:OFF"]; #  b/73499927
    };
};

#  Java nano library
#  =======================================================
libprotobuf-java-nano = java_library_static {
    name = "libprotobuf-java-nano";
    defaults = ["libprotobuf_errorprone_defaults"];
    host_supported = true;

    sdk_version = "9";

    srcs = [
        "javanano/src/main/java/com/google/protobuf/nano/CodedInputByteBufferNano.java"
        "javanano/src/main/java/com/google/protobuf/nano/CodedOutputByteBufferNano.java"
        "javanano/src/main/java/com/google/protobuf/nano/ExtendableMessageNano.java"
        "javanano/src/main/java/com/google/protobuf/nano/Extension.java"
        "javanano/src/main/java/com/google/protobuf/nano/FieldArray.java"
        "javanano/src/main/java/com/google/protobuf/nano/FieldData.java"
        "javanano/src/main/java/com/google/protobuf/nano/InternalNano.java"
        "javanano/src/main/java/com/google/protobuf/nano/InvalidProtocolBufferNanoException.java"
        "javanano/src/main/java/com/google/protobuf/nano/MapFactories.java"
        "javanano/src/main/java/com/google/protobuf/nano/MessageNano.java"
        "javanano/src/main/java/com/google/protobuf/nano/MessageNanoPrinter.java"
        "javanano/src/main/java/com/google/protobuf/nano/UnknownFieldData.java"
        "javanano/src/main/java/com/google/protobuf/nano/WireFormatNano.java"
    ];

    target = {
        android = {
            srcs = ["javanano/src/device/main/java/com/google/protobuf/nano/**/*.java"];
        };
    };

    java_version = "1.7";
};

#  Java nano library (compatibility for old host-side users)
#  =======================================================
host-libprotobuf-java-nano = java_library_host {
    name = "host-libprotobuf-java-nano";
    static_libs = ["libprotobuf-java-nano"];

    java_version = "1.7";
};

#  Java micro library
#  =======================================================
libprotobuf-java-micro = java_library_static {
    name = "libprotobuf-java-micro";
    defaults = ["libprotobuf_errorprone_defaults"];
    host_supported = true;

    sdk_version = "8";

    srcs = [
        "javamicro/src/main/java/com/google/protobuf/micro/ByteStringMicro.java"
        "javamicro/src/main/java/com/google/protobuf/micro/CodedInputStreamMicro.java"
        "javamicro/src/main/java/com/google/protobuf/micro/CodedOutputStreamMicro.java"
        "javamicro/src/main/java/com/google/protobuf/micro/InvalidProtocolBufferMicroException.java"
        "javamicro/src/main/java/com/google/protobuf/micro/MessageMicro.java"
        "javamicro/src/main/java/com/google/protobuf/micro/WireFormatMicro.java"
    ];
};

#  Java micro library (compatibility for old host-side users)
#  =======================================================
host-libprotobuf-java-micro = java_library_host {
    name = "host-libprotobuf-java-micro";
    static_libs = ["libprotobuf-java-micro"];
};

#  Java lite library
#  =======================================================
libprotobuf-java-lite = java_library_static {
    name = "libprotobuf-java-lite";
    host_supported = true;
    sdk_version = "core_current";

    srcs = [
        "java/core/src/main/java/com/google/protobuf/AbstractMessageLite.java"
        "java/core/src/main/java/com/google/protobuf/AbstractParser.java"
        "java/core/src/main/java/com/google/protobuf/AbstractProtobufList.java"
        "java/core/src/main/java/com/google/protobuf/ByteOutput.java"
        "java/core/src/main/java/com/google/protobuf/ByteString.java"
        "java/core/src/main/java/com/google/protobuf/BooleanArrayList.java"
        "java/core/src/main/java/com/google/protobuf/CodedInputStream.java"
        "java/core/src/main/java/com/google/protobuf/CodedOutputStream.java"
        "java/core/src/main/java/com/google/protobuf/DoubleArrayList.java"
        "java/core/src/main/java/com/google/protobuf/ExperimentalApi.java"
        "java/core/src/main/java/com/google/protobuf/ExtensionLite.java"
        "java/core/src/main/java/com/google/protobuf/ExtensionRegistryLite.java"
        "java/core/src/main/java/com/google/protobuf/FieldSet.java"
        "java/core/src/main/java/com/google/protobuf/FloatArrayList.java"
        "java/core/src/main/java/com/google/protobuf/GeneratedMessageLite.java"
        "java/core/src/main/java/com/google/protobuf/IntArrayList.java"
        "java/core/src/main/java/com/google/protobuf/Internal.java"
        "java/core/src/main/java/com/google/protobuf/InvalidProtocolBufferException.java"
        "java/core/src/main/java/com/google/protobuf/LazyField.java"
        "java/core/src/main/java/com/google/protobuf/LazyFieldLite.java"
        "java/core/src/main/java/com/google/protobuf/LazyStringArrayList.java"
        "java/core/src/main/java/com/google/protobuf/LazyStringList.java"
        "java/core/src/main/java/com/google/protobuf/LongArrayList.java"
        "java/core/src/main/java/com/google/protobuf/MapFieldLite.java"
        "java/core/src/main/java/com/google/protobuf/MessageLite.java"
        "java/core/src/main/java/com/google/protobuf/MessageLiteToString.java"
        "java/core/src/main/java/com/google/protobuf/MessageLiteOrBuilder.java"
        "java/core/src/main/java/com/google/protobuf/MutabilityOracle.java"
        "java/core/src/main/java/com/google/protobuf/Parser.java"
        "java/core/src/main/java/com/google/protobuf/ProtobufArrayList.java"
        "java/core/src/main/java/com/google/protobuf/ProtocolStringList.java"
        "java/core/src/main/java/com/google/protobuf/RopeByteString.java"
        "java/core/src/main/java/com/google/protobuf/SmallSortedMap.java"
        "java/core/src/main/java/com/google/protobuf/TextFormatEscaper.java"
        "java/core/src/main/java/com/google/protobuf/UninitializedMessageException.java"
        "java/core/src/main/java/com/google/protobuf/UnknownFieldSetLite.java"
        "java/core/src/main/java/com/google/protobuf/UnmodifiableLazyStringList.java"
        "java/core/src/main/java/com/google/protobuf/Utf8.java"
        "java/core/src/main/java/com/google/protobuf/WireFormat.java"
    ];

    target = {
        android = {
            libs = ["libcore_private.stubs"];
        };
    };

    java_version = "1.7";
};

#  Java lite library (compatibility for old host-side users)
#  =======================================================
host-libprotobuf-java-lite = java_library_host {
    name = "host-libprotobuf-java-lite";
    static_libs = ["libprotobuf-java-lite"];
};

#  Java full library (for host-side users)
#  =======================================================
libprotobuf-java-full = java_library_host {
    name = "libprotobuf-java-full";
    defaults = ["libprotobuf_errorprone_defaults"];

    srcs = [
        "java/core/src/main/java/com/google/protobuf/AbstractMessage.java"
        "java/core/src/main/java/com/google/protobuf/AbstractMessageLite.java"
        "java/core/src/main/java/com/google/protobuf/AbstractParser.java"
        "java/core/src/main/java/com/google/protobuf/AbstractProtobufList.java"
        "java/core/src/main/java/com/google/protobuf/BlockingRpcChannel.java"
        "java/core/src/main/java/com/google/protobuf/BlockingService.java"
        "java/core/src/main/java/com/google/protobuf/BooleanArrayList.java"
        "java/core/src/main/java/com/google/protobuf/ByteBufferWriter.java"
        "java/core/src/main/java/com/google/protobuf/ByteOutput.java"
        "java/core/src/main/java/com/google/protobuf/ByteString.java"
        "java/core/src/main/java/com/google/protobuf/CodedInputStream.java"
        "java/core/src/main/java/com/google/protobuf/CodedOutputStream.java"
        "java/core/src/main/java/com/google/protobuf/Descriptors.java"
        "java/core/src/main/java/com/google/protobuf/DoubleArrayList.java"
        "java/core/src/main/java/com/google/protobuf/DynamicMessage.java"
        "java/core/src/main/java/com/google/protobuf/ExperimentalApi.java"
        "java/core/src/main/java/com/google/protobuf/Extension.java"
        "java/core/src/main/java/com/google/protobuf/ExtensionLite.java"
        "java/core/src/main/java/com/google/protobuf/ExtensionRegistry.java"
        "java/core/src/main/java/com/google/protobuf/ExtensionRegistryLite.java"
        "java/core/src/main/java/com/google/protobuf/FieldSet.java"
        "java/core/src/main/java/com/google/protobuf/FloatArrayList.java"
        "java/core/src/main/java/com/google/protobuf/GeneratedMessage.java"
        "java/core/src/main/java/com/google/protobuf/GeneratedMessageLite.java"
        "java/core/src/main/java/com/google/protobuf/IntArrayList.java"
        "java/core/src/main/java/com/google/protobuf/Internal.java"
        "java/core/src/main/java/com/google/protobuf/InvalidProtocolBufferException.java"
        "java/core/src/main/java/com/google/protobuf/LazyField.java"
        "java/core/src/main/java/com/google/protobuf/LazyFieldLite.java"
        "java/core/src/main/java/com/google/protobuf/LazyStringArrayList.java"
        "java/core/src/main/java/com/google/protobuf/LazyStringList.java"
        "java/core/src/main/java/com/google/protobuf/LongArrayList.java"
        "java/core/src/main/java/com/google/protobuf/MapEntry.java"
        "java/core/src/main/java/com/google/protobuf/MapEntryLite.java"
        "java/core/src/main/java/com/google/protobuf/MapField.java"
        "java/core/src/main/java/com/google/protobuf/MapFieldLite.java"
        "java/core/src/main/java/com/google/protobuf/Message.java"
        "java/core/src/main/java/com/google/protobuf/MessageLite.java"
        "java/core/src/main/java/com/google/protobuf/MessageLiteOrBuilder.java"
        "java/core/src/main/java/com/google/protobuf/MessageLiteToString.java"
        "java/core/src/main/java/com/google/protobuf/MessageOrBuilder.java"
        "java/core/src/main/java/com/google/protobuf/MessageReflection.java"
        "java/core/src/main/java/com/google/protobuf/MutabilityOracle.java"
        "java/core/src/main/java/com/google/protobuf/NioByteString.java"
        "java/core/src/main/java/com/google/protobuf/Parser.java"
        "java/core/src/main/java/com/google/protobuf/ProtobufArrayList.java"
        "java/core/src/main/java/com/google/protobuf/ProtocolMessageEnum.java"
        "java/core/src/main/java/com/google/protobuf/ProtocolStringList.java"
        "java/core/src/main/java/com/google/protobuf/RepeatedFieldBuilder.java"
        "java/core/src/main/java/com/google/protobuf/RopeByteString.java"
        "java/core/src/main/java/com/google/protobuf/RpcCallback.java"
        "java/core/src/main/java/com/google/protobuf/RpcChannel.java"
        "java/core/src/main/java/com/google/protobuf/RpcController.java"
        "java/core/src/main/java/com/google/protobuf/RpcUtil.java"
        "java/core/src/main/java/com/google/protobuf/Service.java"
        "java/core/src/main/java/com/google/protobuf/ServiceException.java"
        "java/core/src/main/java/com/google/protobuf/SingleFieldBuilder.java"
        "java/core/src/main/java/com/google/protobuf/SmallSortedMap.java"
        "java/core/src/main/java/com/google/protobuf/TextFormat.java"
        "java/core/src/main/java/com/google/protobuf/TextFormatEscaper.java"
        "java/core/src/main/java/com/google/protobuf/TextFormatParseInfoTree.java"
        "java/core/src/main/java/com/google/protobuf/TextFormatParseLocation.java"
        "java/core/src/main/java/com/google/protobuf/UninitializedMessageException.java"
        "java/core/src/main/java/com/google/protobuf/UnknownFieldSet.java"
        "java/core/src/main/java/com/google/protobuf/UnknownFieldSetLite.java"
        "java/core/src/main/java/com/google/protobuf/UnmodifiableLazyStringList.java"
        "java/core/src/main/java/com/google/protobuf/UnsafeByteOperations.java"
        "java/core/src/main/java/com/google/protobuf/Utf8.java"
        "java/core/src/main/java/com/google/protobuf/WireFormat.java"
        ":libprotobuf-internal-protos"
    ];

    proto = {
        local_include_dirs = [
            "src"
        ];
        canonical_path_from_root = false;
    };

    java_version = "1.7";
};

#  Java full library (compatibility for old host-side users)
#  =======================================================
host-libprotobuf-java-full = java_library_host {
    name = "host-libprotobuf-java-full";
    static_libs = ["libprotobuf-java-full"];
};

#  Stubs library for using hidden APIs in core-oj and core-libart
#  =======================================================
"libcore_private.stubs" = java_library {
    name = "libcore_private.stubs";
    srcs = ["java/core/src/stubs/sun/misc/Unsafe.java"];
    sdk_version = "core_current";
    installable = false;
};

#  Python library
#  =======================================================
libprotobuf-python = python_library {
    name = "libprotobuf-python";
    srcs = [
        ":libprotobuf-internal-python-srcs"
        ":libprotobuf-internal-protos"
    ];
    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = true;
        };
    };
    libs = [
        "py-six"
    ];
    proto = {
        local_include_dirs = [
            "src"
        ];
        canonical_path_from_root = false;
    };
    host_supported = true;
};

libprotobuf-internal-python-srcs = filegroup {
    name = "libprotobuf-internal-python-srcs";
    srcs = [
        "python/google/__init__.py"
        "python/google/protobuf/__init__.py"
        "python/google/protobuf/descriptor.py"
        "python/google/protobuf/descriptor_database.py"
        "python/google/protobuf/descriptor_pool.py"
        "python/google/protobuf/json_format.py"
        "python/google/protobuf/message.py"
        "python/google/protobuf/message_factory.py"
        "python/google/protobuf/proto_builder.py"
        "python/google/protobuf/reflection.py"
        "python/google/protobuf/service.py"
        "python/google/protobuf/service_reflection.py"
        "python/google/protobuf/symbol_database.py"
        "python/google/protobuf/text_encoding.py"
        "python/google/protobuf/text_format.py"
        "python/google/protobuf/internal/__init__.py"
        "python/google/protobuf/internal/_parameterized.py"
        "python/google/protobuf/internal/api_implementation.py"
        "python/google/protobuf/internal/containers.py"
        "python/google/protobuf/internal/decoder.py"
        "python/google/protobuf/internal/descriptor_database_test.py"
        "python/google/protobuf/internal/descriptor_pool_test.py"
        "python/google/protobuf/internal/descriptor_test.py"
        "python/google/protobuf/internal/encoder.py"
        "python/google/protobuf/internal/enum_type_wrapper.py"
        "python/google/protobuf/internal/generator_test.py"
        "python/google/protobuf/internal/json_format_test.py"
        "python/google/protobuf/internal/message_factory_test.py"
        "python/google/protobuf/internal/message_listener.py"
        "python/google/protobuf/internal/message_test.py"
        "python/google/protobuf/internal/proto_builder_test.py"
        "python/google/protobuf/internal/python_message.py"
        "python/google/protobuf/internal/reflection_test.py"
        "python/google/protobuf/internal/service_reflection_test.py"
        "python/google/protobuf/internal/symbol_database_test.py"
        "python/google/protobuf/internal/test_util.py"
        "python/google/protobuf/internal/text_encoding_test.py"
        "python/google/protobuf/internal/text_format_test.py"
        "python/google/protobuf/internal/type_checkers.py"
        "python/google/protobuf/internal/unknown_fields_test.py"
        "python/google/protobuf/internal/well_known_types.py"
        "python/google/protobuf/internal/well_known_types_test.py"
        "python/google/protobuf/internal/wire_format.py"
        "python/google/protobuf/internal/wire_format_test.py"
        "python/google/protobuf/internal/import_test_package/__init__.py"
        "python/google/protobuf/pyext/__init__.py"
        "python/google/protobuf/pyext/cpp_message.py"
    ];
    path = "python";
};

libprotobuf-internal-protos = filegroup {
    name = "libprotobuf-internal-protos";
    srcs = [
        "src/google/protobuf/descriptor.proto"
        "src/google/protobuf/any.proto"
        "src/google/protobuf/source_context.proto"
        "src/google/protobuf/type.proto"
        "src/google/protobuf/compiler/plugin.proto"
        "src/google/protobuf/api.proto"
        "src/google/protobuf/duration.proto"
        "src/google/protobuf/empty.proto"
        "src/google/protobuf/field_mask.proto"
        "src/google/protobuf/struct.proto"
        "src/google/protobuf/timestamp.proto"
        "src/google/protobuf/wrappers.proto"
    ];
    path = "src";
};

#  To test java proto params build rules.
#  =======================================================
aprotoc-test-nano-params = java_test {
    name = "aprotoc-test-nano-params";
    sdk_version = "current";
    proto = {
        type = "nano";
        local_include_dirs = ["src"];
        output_params = [
            "java_package=javanano/src/test/java/com/google/protobuf/nano/unittest_import_nano.proto\\|com.google.protobuf.nano"
            "java_outer_classname=javanano/src/test/java/com/google/protobuf/nano/unittest_import_nano.proto\\|UnittestImportNano"
        ];
    };
    srcs = [
        "javanano/src/test/java/com/google/protobuf/nano/unittest_import_nano.proto"
        "javanano/src/test/java/com/google/protobuf/nano/unittest_simple_nano.proto"
        "javanano/src/test/java/com/google/protobuf/nano/unittest_stringutf8_nano.proto"
        "javanano/src/test/java/com/google/protobuf/nano/unittest_recursive_nano.proto"
    ];
    java_version = "1.7";
};

#  To test Android-specific nanoproto features.
#  =======================================================
android-nano-test-parcelable = java_test {
    #  Parcelable messages
    name = "android-nano-test-parcelable";
    sdk_version = "current";
    #  Only needed at compile-time.
    libs = ["android-support-annotations"];
    proto = {
        type = "nano";
        local_include_dirs = ["src"];
        output_params = [
            "parcelable_messages=true"
            "generate_intdefs=true"
        ];
    };
    srcs = ["javanano/src/test/java/com/google/protobuf/nano/unittest_simple_nano.proto"];
};

android-nano-test-parcelable-extendable = java_test {
    #  Parcelable and extendable messages
    name = "android-nano-test-parcelable-extendable";
    sdk_version = "current";
    #  Only needed at compile-time.
    libs = ["android-support-annotations"];
    proto = {
        type = "nano";
        local_include_dirs = ["src"];
        output_params = [
            "parcelable_messages=true"
            "generate_intdefs=true"
            "store_unknown_fields=true"
        ];
    };
    srcs = ["javanano/src/test/java/com/google/protobuf/nano/unittest_extension_nano.proto"];
    java_version = "1.7";
};

NanoAndroidTest = android_test {
    #  Test APK
    name = "NanoAndroidTest";
    sdk_version = "8";
    srcs = ["javanano/src/device/test/java/com/google/protobuf/nano/NanoAndroidTest.java"];
    manifest = "javanano/src/device/test/AndroidManifest.xml";
    static_libs = [
        "libprotobuf-java-nano"
        "android-nano-test-parcelable"
        "android-nano-test-parcelable-extendable"
    ];
    dex_preopt = {
        enabled = false;
    };
};

in { inherit "libcore_private.stubs" NanoAndroidTest android-nano-test-parcelable android-nano-test-parcelable-extendable aprotoc aprotoc-test-nano-params host-libprotobuf-java-full host-libprotobuf-java-lite host-libprotobuf-java-micro host-libprotobuf-java-nano libprotobuf-cpp-full libprotobuf-cpp-full-defaults libprotobuf-cpp-full-ndk libprotobuf-cpp-full-rtti libprotobuf-cpp-lite libprotobuf-cpp-lite-defaults libprotobuf-cpp-lite-ndk libprotobuf-cpp-lite-rtti libprotobuf-cpp-lite_static libprotobuf-internal-protos libprotobuf-internal-python-srcs libprotobuf-java-full libprotobuf-java-lite libprotobuf-java-micro libprotobuf-java-nano libprotobuf-python libprotobuf_errorprone_defaults libprotoc protobuf-cflags-defaults; }
