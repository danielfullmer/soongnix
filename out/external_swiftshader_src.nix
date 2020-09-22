{ cc_defaults, cc_library_shared, cc_library_static, genrule }:
let

#
#  Copyright (C) 2018 The Android Open Source Project
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

libswiftshader = cc_defaults {
    name = "libswiftshader";
    vendor = true;
    host_supported = true;

    defaults = ["swiftshader_common"];

    cflags = [
        "-D_GNU_SOURCE"
        "-D__STDC_LIMIT_MACROS"
        "-D__STDC_CONSTANT_MACROS"
        "-D__STDC_FORMAT_MACROS"
        "-DNO_SANITIZE_FUNCTION="
        #  FIXME: Use <android/api-level.h> instead?
        "-DANDROID_PLATFORM_SDK_VERSION=10000"
        "-Wno-implicit-fallthrough"
        "-Wno-unused-parameter"
        "-Wno-unused-local-typedef"
    ];

    cppflags = [
        "-Wno-sign-promo"
        "-Wno-non-virtual-dtor"
    ];

    local_include_dirs = ["OpenGL"];

    target = {
        android = {
            cflags = [
                "-DHAVE_GRALLOC1"
                "-DHAVE_GRALLOC4"
            ];
            relative_install_path = "egl";
            header_libs = [
                "swiftshader_platform_headers"
                "libnativebase_headers"
            ];
            shared_libs = [
                "android.hardware.graphics.mapper@4.0"
                "libnativewindow"
                "libhardware"
                "libhidlbase"
                "libcutils"
                "libsync"
                "liblog"
                "libutils"
            ];
            static_libs = [
                "libarect"
            ];
        };

        host = {
            header_libs = [
                "swiftshader_host_headers"
                "swiftshader_platform_headers"
                "libnativebase_headers"
            ];

            #  Pretend to build for Android
            cflags = [
                "-D__ANDROID__"
                "-DANDROID_HOST_BUILD"
            ];

            allow_undefined_symbols = true;
            host_ldlibs = ["-ldl"];
        };
    };
};

libswiftshader_release = cc_defaults {
    name = "libswiftshader_release";

    defaults = ["libswiftshader"];

    cflags = [
        "-fomit-frame-pointer"
        "-ffunction-sections"
        "-fdata-sections"
        "-DANGLE_DISABLE_TRACE"
    ];
};

libswiftshader_debug = cc_defaults {
    name = "libswiftshader_debug";

    defaults = ["libswiftshader"];

    cflags = [
        "-UNDEBUG"
        "-g"
        "-O0"
        "-DDEFAULT_THREAD_COUNT=1"
    ];
};

#  Common libraries

libswiftshader_common_defaults = cc_defaults {
    name = "libswiftshader_common_defaults";

    cflags = [
        "-DLOG_TAG=\"swiftshader\""
    ];

    srcs = [
        "Common/Configurator.cpp"
        "Common/CPUID.cpp"
        "Common/DebugAndroid.cpp"
        "Common/GrallocAndroid.cpp"
        "Common/Half.cpp"
        "Common/Math.cpp"
        "Common/Memory.cpp"
        "Common/Resource.cpp"
        "Common/SharedLibrary.cpp"
        "Common/Socket.cpp"
        "Common/Thread.cpp"
        "Common/Timer.cpp"
        "Main/Config.cpp"
        "Main/FrameBuffer.cpp"
        "Main/FrameBufferAndroid.cpp"
        "Main/SwiftConfig.cpp"
        "Renderer/Blitter.cpp"
        "Renderer/Clipper.cpp"
        "Renderer/Color.cpp"
        "Renderer/Context.cpp"
        "Renderer/ETC_Decoder.cpp"
        "Renderer/Matrix.cpp"
        "Renderer/PixelProcessor.cpp"
        "Renderer/Plane.cpp"
        "Renderer/Point.cpp"
        "Renderer/QuadRasterizer.cpp"
        "Renderer/Renderer.cpp"
        "Renderer/Sampler.cpp"
        "Renderer/SetupProcessor.cpp"
        "Renderer/Surface.cpp"
        "Renderer/TextureStage.cpp"
        "Renderer/Vector.cpp"
        "Renderer/VertexProcessor.cpp"
        "Shader/Constants.cpp"
        "Shader/PixelPipeline.cpp"
        "Shader/PixelProgram.cpp"
        "Shader/PixelRoutine.cpp"
        "Shader/PixelShader.cpp"
        "Shader/SamplerCore.cpp"
        "Shader/SetupRoutine.cpp"
        "Shader/Shader.cpp"
        "Shader/ShaderCore.cpp"
        "Shader/VertexPipeline.cpp"
        "Shader/VertexProgram.cpp"
        "Shader/VertexRoutine.cpp"
        "Shader/VertexShader.cpp"
        "OpenGL/common/Image.cpp"
        "OpenGL/common/Object.cpp"
        "OpenGL/common/MatrixStack.cpp"
    ];

    target = {
        host = {
            exclude_srcs = ["Common/DebugAndroid.cpp"];
            srcs = ["Common/Debug.cpp"];
        };
    };
};

libswiftshader_llvm_defaults = cc_defaults {
    name = "libswiftshader_llvm_defaults";

    defaults = ["libswiftshader_common_defaults"];

    header_libs = [
        "swiftshader_platform_headers"
    ];

    srcs = [
        "Reactor/CPUID.cpp"
        "Reactor/Debug.cpp"
        "Reactor/EmulatedReactor.cpp"
        "Reactor/ExecutableMemory.cpp"
        "Reactor/LLVMJIT.cpp"
        "Reactor/LLVMReactor.cpp"
        "Reactor/Reactor.cpp"
    ];

    cflags = [
        "-Wno-unused-parameter"
        "-Wno-implicit-fallthrough"
    ];

    static_libs = [
        "libLLVM7_swiftshader"
    ];

    shared_libs = [
        "liblog"
    ];
};

libswiftshadervk_llvm_defaults = cc_defaults {
    name = "libswiftshadervk_llvm_defaults";

    header_libs = [
        "swiftshader_platform_headers"
    ];

    srcs = [
        "Reactor/CPUID.cpp"
        "Reactor/Debug.cpp"
        "Reactor/EmulatedReactor.cpp"
        "Reactor/ExecutableMemory.cpp"
        "Reactor/LLVMJIT.cpp"
        "Reactor/LLVMReactor.cpp"
        "Reactor/Reactor.cpp"
    ];

    cflags = [
        "-Wno-unused-parameter"
        "-Wno-implicit-fallthrough"
    ];

    static_libs = [
        "libLLVM7_swiftshader"
    ];

    shared_libs = [
        "libcutils"
        "liblog"
    ];
};

libswiftshader_common = cc_defaults {
    name = "libswiftshader_common";

    defaults = [
        "libswiftshader_release"
        "libswiftshader_common_defaults"
    ];
};

libswiftshader_common_debug = cc_defaults {
    name = "libswiftshader_common_debug";

    srcs = ["OpenGL/common/debug.cpp"];

    defaults = [
        "libswiftshader_debug"
        "libswiftshader_common_defaults"
    ];

    shared_libs = [
        "libutils"
    ];
};

libswiftshader_llvm = cc_library_static {
    name = "libswiftshader_llvm";
    defaults = [
        "libswiftshader_common"
        "libswiftshader_llvm_defaults"
    ];
};

libswiftshader_llvm_debug = cc_library_static {
    name = "libswiftshader_llvm_debug";
    defaults = [
        "libswiftshader_common_debug"
        "libswiftshader_llvm_defaults"
    ];
};

libswiftshadervk_llvm = cc_library_static {
    name = "libswiftshadervk_llvm";
    vendor = true;
    defaults = ["libswiftshadervk_llvm_defaults"];
};

libswiftshadervk_llvm_debug = cc_library_static {
    name = "libswiftshadervk_llvm_debug";
    vendor = true;
    defaults = ["libswiftshadervk_llvm_defaults"];
};

#  compiler libraries

libswiftshader_compiler_defaults = cc_defaults {
    name = "libswiftshader_compiler_defaults";

    defaults = ["libswiftshader"];

    cflags = [
        "-DLOG_TAG=\"swiftshader_compiler\""
    ];

    srcs = [
        "OpenGL/compiler/preprocessor/DiagnosticsBase.cpp"
        "OpenGL/compiler/preprocessor/DirectiveHandlerBase.cpp"
        "OpenGL/compiler/preprocessor/DirectiveParser.cpp"
        "OpenGL/compiler/preprocessor/ExpressionParser.cpp"
        "OpenGL/compiler/preprocessor/Input.cpp"
        "OpenGL/compiler/preprocessor/Lexer.cpp"
        "OpenGL/compiler/preprocessor/Macro.cpp"
        "OpenGL/compiler/preprocessor/MacroExpander.cpp"
        "OpenGL/compiler/preprocessor/Preprocessor.cpp"
        "OpenGL/compiler/preprocessor/Token.cpp"
        "OpenGL/compiler/preprocessor/Tokenizer.cpp"
        "OpenGL/compiler/AnalyzeCallDepth.cpp"
        "OpenGL/compiler/Compiler.cpp"
        "OpenGL/compiler/debug.cpp"
        "OpenGL/compiler/Diagnostics.cpp"
        "OpenGL/compiler/DirectiveHandler.cpp"
        "OpenGL/compiler/glslang_lex.cpp"
        "OpenGL/compiler/glslang_tab.cpp"
        "OpenGL/compiler/InfoSink.cpp"
        "OpenGL/compiler/Initialize.cpp"
        "OpenGL/compiler/InitializeParseContext.cpp"
        "OpenGL/compiler/IntermTraverse.cpp"
        "OpenGL/compiler/Intermediate.cpp"
        "OpenGL/compiler/intermOut.cpp"
        "OpenGL/compiler/ossource_posix.cpp"
        "OpenGL/compiler/OutputASM.cpp"
        "OpenGL/compiler/parseConst.cpp"
        "OpenGL/compiler/ParseHelper.cpp"
        "OpenGL/compiler/PoolAlloc.cpp"
        "OpenGL/compiler/SymbolTable.cpp"
        "OpenGL/compiler/TranslatorASM.cpp"
        "OpenGL/compiler/util.cpp"
        "OpenGL/compiler/ValidateLimitations.cpp"
        "OpenGL/compiler/ValidateSwitch.cpp"
    ];
};

libswiftshader_compiler = cc_library_static {
    name = "libswiftshader_compiler";

    defaults = [
        "libswiftshader_release"
        "libswiftshader_compiler_defaults"
    ];
};

libswiftshader_compiler_debug = cc_library_static {
    name = "libswiftshader_compiler_debug";

    defaults = [
        "libswiftshader_debug"
        "libswiftshader_compiler_defaults"
    ];
};

#  libEGL libraries

swiftshader_client_libraries = cc_defaults {
    name = "swiftshader_client_libraries";

    defaults = ["libswiftshader_release"];
    static_libs = [
        "libswiftshader_llvm"
        "libLLVM7_swiftshader"
    ];
};

swiftshader_client_libraries_debug = cc_defaults {
    name = "swiftshader_client_libraries_debug";

    defaults = ["libswiftshader_debug"];
    static_libs = [
        "libswiftshader_llvm_debug"
        "libLLVM7_swiftshader"
    ];
};

libEGL_swiftshader_defaults = cc_defaults {
    name = "libEGL_swiftshader_defaults";

    defaults = ["libswiftshader"];

    cflags = [
        "-DLOG_TAG=\"libEGL_swiftshader\""
        "-DEGLAPI="
        "-DEGL_EGLEXT_PROTOTYPES"
        "-Wno-format"
    ];

    srcs = [
        "OpenGL/libEGL/Config.cpp"
        "OpenGL/libEGL/Display.cpp"
        "OpenGL/libEGL/Surface.cpp"
        "OpenGL/libEGL/libEGL.cpp"
        "OpenGL/libEGL/main.cpp"
    ];

    version_script = "OpenGL/libEGL/libEGL.lds";
};

libEGL_swiftshader = cc_library_shared {
    name = "libEGL_swiftshader";

    defaults = [
        "libEGL_swiftshader_defaults"
        "swiftshader_client_libraries"
    ];
};

libEGL_swiftshader_debug = cc_library_shared {
    name = "libEGL_swiftshader_debug";

    defaults = [
        "libEGL_swiftshader_defaults"
        "swiftshader_client_libraries_debug"
    ];
};

#  libGLESv1_CM libraries

libGLESv1_CM_swiftshader_defaults = cc_defaults {
    name = "libGLESv1_CM_swiftshader_defaults";

    defaults = ["libswiftshader"];

    cflags = [
        "-DLOG_TAG=\"libGLES_CM_swiftshader\""
        "-DEGLAPI="
        "-DGL_API="
        "-DGL_APICALL="
        "-DGL_GLEXT_PROTOTYPES"
        "-Wno-format"
    ];

    srcs = [
        "OpenGL/libGLES_CM/Buffer.cpp"
        "OpenGL/libGLES_CM/Context.cpp"
        "OpenGL/libGLES_CM/Device.cpp"
        "OpenGL/libGLES_CM/Framebuffer.cpp"
        "OpenGL/libGLES_CM/IndexDataManager.cpp"
        "OpenGL/libGLES_CM/libGLES_CM.cpp"
        "OpenGL/libGLES_CM/main.cpp"
        "OpenGL/libGLES_CM/Renderbuffer.cpp"
        "OpenGL/libGLES_CM/ResourceManager.cpp"
        "OpenGL/libGLES_CM/Texture.cpp"
        "OpenGL/libGLES_CM/utilities.cpp"
        "OpenGL/libGLES_CM/VertexDataManager.cpp"
    ];

    version_script = "OpenGL/libGLES_CM/libGLES_CM.lds";
};

libGLESv1_CM_swiftshader = cc_library_shared {
    name = "libGLESv1_CM_swiftshader";

    defaults = [
        "libGLESv1_CM_swiftshader_defaults"
        "swiftshader_client_libraries"
    ];
};

libGLESv1_CM_swiftshader_debug = cc_library_shared {
    name = "libGLESv1_CM_swiftshader_debug";

    defaults = [
        "libGLESv1_CM_swiftshader_defaults"
        "swiftshader_client_libraries_debug"
    ];
};

#  libGLESv2 libraries

libGLESv2_swiftshader_defaults = cc_defaults {
    name = "libGLESv2_swiftshader_defaults";

    defaults = ["libswiftshader"];

    cflags = [
        "-DLOG_TAG=\"libGLESv2_swiftshader\""
        "-DEGLAPI="
        "-DGL_API="
        "-DGL_APICALL="
        "-DGL_GLEXT_PROTOTYPES"
        "-Wno-format"
    ];

    srcs = [
        "OpenGL/libGLESv2/Buffer.cpp"
        "OpenGL/libGLESv2/Context.cpp"
        "OpenGL/libGLESv2/Device.cpp"
        "OpenGL/libGLESv2/Fence.cpp"
        "OpenGL/libGLESv2/Framebuffer.cpp"
        "OpenGL/libGLESv2/IndexDataManager.cpp"
        "OpenGL/libGLESv2/libGLESv2.cpp"
        "OpenGL/libGLESv2/libGLESv3.cpp"
        "OpenGL/libGLESv2/main.cpp"
        "OpenGL/libGLESv2/entry_points.cpp"
        "OpenGL/libGLESv2/Program.cpp"
        "OpenGL/libGLESv2/Query.cpp"
        "OpenGL/libGLESv2/Renderbuffer.cpp"
        "OpenGL/libGLESv2/ResourceManager.cpp"
        "OpenGL/libGLESv2/Shader.cpp"
        "OpenGL/libGLESv2/Texture.cpp"
        "OpenGL/libGLESv2/TransformFeedback.cpp"
        "OpenGL/libGLESv2/utilities.cpp"
        "OpenGL/libGLESv2/VertexArray.cpp"
        "OpenGL/libGLESv2/VertexDataManager.cpp"
    ];

    version_script = "OpenGL/libGLESv2/libGLESv2.lds";
};

libGLESv2_swiftshader = cc_library_shared {
    name = "libGLESv2_swiftshader";

    defaults = [
        "libGLESv2_swiftshader_defaults"
        "swiftshader_client_libraries"
    ];

    static_libs = ["libswiftshader_compiler"];
};

libGLESv2_swiftshader_debug = cc_library_shared {
    name = "libGLESv2_swiftshader_debug";

    defaults = [
        "libGLESv2_swiftshader_defaults"
        "swiftshader_client_libraries_debug"
    ];

    static_libs = ["libswiftshader_compiler_debug"];
};

#  Vulkan

commit_header = genrule {
    name = "commit_header";
    out = ["commit.h"];
    tool_files = ["commit_id.py"];
    cmd = "$(location commit_id.py) gen $(genDir)/commit.h";
};

libvk_swiftshader_defaults = cc_defaults {
    name = "libvk_swiftshader_defaults";
    vendor = true;

    defaults = ["swiftshader_common"];

    cflags = [
        "-D_GNU_SOURCE"
        "-D__STDC_LIMIT_MACROS"
        "-D__STDC_CONSTANT_MACROS"
        "-D__STDC_FORMAT_MACROS"
        "-DHAVE_GRALLOC1"
        "-DHAVE_GRALLOC4"
        "-DNO_SANITIZE_FUNCTION="
        #  FIXME: Use <android/api-level.h> instead?
        "-DANDROID_PLATFORM_SDK_VERSION=10000"
        "-Wno-implicit-fallthrough"
        "-Wno-unused-parameter"
        "-Wno-unused-local-typedef"
        "-Wno-missing-field-initializers"
        #  Enable to output commit hash when SwiftShader is initialized
        # "-DENABLE_BUILD_VERSION_OUTPUT",
    ];

    cppflags = [
        "-Wno-sign-promo"
        "-Wno-non-virtual-dtor"
    ];

    ldflags = [
        #  -Bsymbolic binds symbol references to their global definitions within
        #  a shared object, thereby preventing symbol preemption.
        "-Wl,-Bsymbolic"
    ];

    local_include_dirs = ["Vulkan"];

    version_script = "Vulkan/android_vk_swiftshader.lds";

    generated_headers = ["commit_header"];

    target = {
        android = {
            relative_install_path = "hw";
            header_libs = [
                "swiftshader_platform_headers"
                "vulkan_headers"
                "hwvulkan_headers"
            ];
            shared_libs = [
                "android.hardware.graphics.mapper@4.0"
                "libnativewindow"
                "libhardware"
                "libhidlbase"
                "libcutils"
                "libsync"
                "liblog"
                "libutils"
            ];
            static_libs = [
                "libarect"
            ];
        };
    };
};

swiftshader_debug = cc_library_static {
    name = "swiftshader_debug";

    vendor_available = true;

    cflags = [
        "-DLOG_TAG=\"swiftshader\""
    ];

    srcs = [
        "System/Debug.cpp"
    ];

    export_include_dirs = [
        "."
    ];

    shared_libs = [
        "liblog"
    ];
};

libvk_swiftshader_common_defaults = cc_defaults {
    name = "libvk_swiftshader_common_defaults";

    cflags = [
        "-DLOG_TAG=\"swiftshader\""
        # "-DSWIFTSHADER_EXTERNAL_MEMORY_ANDROID_HARDWARE_BUFFER",
        "-DSWIFTSHADER_ENABLE_ASTC" #  TODO(b/150130101)
    ];

    srcs = [
        "System/Build.cpp"
        "System/Configurator.cpp"
        "System/CPUID.cpp"
        "System/GrallocAndroid.cpp"
        "System/Half.cpp"
        "System/Linux/MemFd.cpp"
        "System/Math.cpp"
        "System/Memory.cpp"
        "System/Socket.cpp"
        "System/Timer.cpp"
        "Device/ASTC_Decoder.cpp"
        "Device/BC_Decoder.cpp"
        "Device/Blitter.cpp"
        "Device/Clipper.cpp"
        "Device/Color.cpp"
        "Device/Config.cpp"
        "Device/Context.cpp"
        "Device/ETC_Decoder.cpp"
        "Device/PixelProcessor.cpp"
        "Device/Plane.cpp"
        "Device/QuadRasterizer.cpp"
        "Device/Renderer.cpp"
        "Device/SetupProcessor.cpp"
        "Device/VertexProcessor.cpp"
        "Pipeline/ComputeProgram.cpp"
        "Pipeline/Constants.cpp"
        "Pipeline/PixelProgram.cpp"
        "Pipeline/PixelRoutine.cpp"
        "Pipeline/SamplerCore.cpp"
        "Pipeline/SetupRoutine.cpp"
        "Pipeline/ShaderCore.cpp"
        "Pipeline/SpirvShader.cpp"
        "Pipeline/SpirvShaderArithmetic.cpp"
        "Pipeline/SpirvShaderControlFlow.cpp"
        "Pipeline/SpirvShaderDebugger.cpp"
        "Pipeline/SpirvShaderEnumNames.cpp"
        "Pipeline/SpirvShaderGLSLstd450.cpp"
        "Pipeline/SpirvShaderGroup.cpp"
        "Pipeline/SpirvShaderImage.cpp"
        "Pipeline/SpirvShaderInstructions.cpp"
        "Pipeline/SpirvShaderMemory.cpp"
        "Pipeline/SpirvShaderSampling.cpp"
        "Pipeline/SpirvShaderSpec.cpp"
        "Pipeline/VertexProgram.cpp"
        "Pipeline/VertexRoutine.cpp"
        "Vulkan/VkBuffer.cpp"
        "Vulkan/VkBufferView.cpp"
        "Vulkan/VkCommandBuffer.cpp"
        "Vulkan/VkCommandPool.cpp"
        "Vulkan/VkDescriptorPool.cpp"
        "Vulkan/VkDescriptorSetLayout.cpp"
        "Vulkan/VkDescriptorUpdateTemplate.cpp"
        "Vulkan/VkDevice.cpp"
        "Vulkan/VkDeviceMemory.cpp"
        "Vulkan/VkFormat.cpp"
        "Vulkan/VkFramebuffer.cpp"
        "Vulkan/VkGetProcAddress.cpp"
        "Vulkan/VkImage.cpp"
        "Vulkan/VkImageView.cpp"
        "Vulkan/VkInstance.cpp"
        "Vulkan/VkMemory.cpp"
        "Vulkan/VkPhysicalDevice.cpp"
        "Vulkan/VkPipeline.cpp"
        "Vulkan/VkPipelineCache.cpp"
        "Vulkan/VkPipelineLayout.cpp"
        "Vulkan/VkPromotedExtensions.cpp"
        "Vulkan/VkQueryPool.cpp"
        "Vulkan/VkQueue.cpp"
        "Vulkan/VkRenderPass.cpp"
        "Vulkan/VkSampler.cpp"
        "Vulkan/VkSemaphore.cpp"
        "Vulkan/VkShaderModule.cpp"
        "Vulkan/VkStringify.cpp"
        "Vulkan/libVulkan.cpp"
        "Vulkan/main.cpp"
    ];

    static_libs = [
        "swiftshader_astc"
        "swiftshader_debug"
        "swiftshader_marl"
        "swiftshader_spirv-tools"
    ];

    include_dirs = [
        "external/swiftshader/third_party/SPIRV-Headers/include"
        "external/swiftshader/include"
    ];
};

"vulkan.pastel" = cc_library_shared {
    name = "vulkan.pastel";

    static_libs = [
        "libswiftshadervk_llvm_debug"
        "libLLVM7_swiftshader"
    ];

    defaults = [
        "libvk_swiftshader_common_defaults"
        "libvk_swiftshader_defaults"
    ];
};

"vulkan.pastel.debug" = cc_library_shared {
    name = "vulkan.pastel.debug";

    static_libs = [
        "libswiftshadervk_llvm_debug"
        "libLLVM7_swiftshader"
    ];

    cflags = [
        "-UNDEBUG"
        "-g"
        "-O0"
        "-DDEFAULT_THREAD_COUNT=1"
    ];

    defaults = [
        "libvk_swiftshader_common_defaults"
        "libvk_swiftshader_defaults"
    ];
};

in { inherit "vulkan.pastel" "vulkan.pastel.debug" commit_header libEGL_swiftshader libEGL_swiftshader_debug libEGL_swiftshader_defaults libGLESv1_CM_swiftshader libGLESv1_CM_swiftshader_debug libGLESv1_CM_swiftshader_defaults libGLESv2_swiftshader libGLESv2_swiftshader_debug libGLESv2_swiftshader_defaults libswiftshader libswiftshader_common libswiftshader_common_debug libswiftshader_common_defaults libswiftshader_compiler libswiftshader_compiler_debug libswiftshader_compiler_defaults libswiftshader_debug libswiftshader_llvm libswiftshader_llvm_debug libswiftshader_llvm_defaults libswiftshader_release libswiftshadervk_llvm libswiftshadervk_llvm_debug libswiftshadervk_llvm_defaults libvk_swiftshader_common_defaults libvk_swiftshader_defaults swiftshader_client_libraries swiftshader_client_libraries_debug swiftshader_debug; }
