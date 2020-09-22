{ cc_defaults, cc_library_static }:
let

deqp_amber_defaults = cc_defaults {
    cpp_std = "c++11";
    cppflags = [
        "-DAMBER_ENGINE_VULKAN=1"
        "-Wall"
        "-Werror"
    ];
    export_include_dirs = [
        "."
    ];
    name = "deqp_amber_defaults";
    rtti = false;
    sdk_version = "27";
    stl = "libc++_static";
    shared_libs = ["libvulkan"];
    export_shared_lib_headers = ["libvulkan"];
};

deqp_amber = cc_library_static {
    defaults = [
        "deqp_amber_defaults"
    ];
    export_include_dirs = [
        "include"
    ];
    name = "deqp_amber";
    srcs = [
        "src/amber.cc"
        "src/buffer.cc"
        "src/command.cc"
        "src/command_data.cc"
        "src/descriptor_set_and_binding_parser.cc"
        "src/engine.cc"
        "src/executor.cc"
        "src/format.cc"
        "src/parser.cc"
        "src/pipeline.cc"
        "src/pipeline_data.cc"
        "src/recipe.cc"
        "src/result.cc"
        "src/script.cc"
        "src/shader.cc"
        "src/shader_compiler.cc"
        "src/tokenizer.cc"
        "src/type_parser.cc"
        "src/type.cc"
        "src/value.cc"
        "src/verifier.cc"
        "src/vulkan_engine_config.cc"

        "src/amberscript/parser.cc"
        "src/vkscript/command_parser.cc"
        "src/vkscript/datum_type_parser.cc"
        "src/vkscript/parser.cc"
        "src/vkscript/section_parser.cc"

        "src/vulkan/buffer_descriptor.cc"
        "src/vulkan/command_buffer.cc"
        "src/vulkan/command_pool.cc"
        "src/vulkan/compute_pipeline.cc"
        "src/vulkan/device.cc"
        "src/vulkan/engine_vulkan.cc"
        "src/vulkan/frame_buffer.cc"
        "src/vulkan/graphics_pipeline.cc"
        "src/vulkan/index_buffer.cc"
        "src/vulkan/pipeline.cc"
        "src/vulkan/push_constant.cc"
        "src/vulkan/resource.cc"
        "src/vulkan/transfer_buffer.cc"
        "src/vulkan/transfer_image.cc"
        "src/vulkan/vertex_buffer.cc"

    ];
};

in { inherit deqp_amber deqp_amber_defaults; }
