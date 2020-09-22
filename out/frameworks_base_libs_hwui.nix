{ cc_benchmark, cc_defaults, cc_library, cc_library_headers, cc_library_static, cc_test, phony }:
let

hwui_defaults = cc_defaults {
    name = "hwui_defaults";
    defaults = [
        "hwui_static_deps"
        "skia_deps"
        # "hwui_bugreport_font_cache_usage",
        # "hwui_compile_for_perf",
        "hwui_pgo"
        "hwui_lto"
    ];

    cpp_std = "experimental";

    cflags = [
        "-DEGL_EGLEXT_PROTOTYPES"
        "-DGL_GLEXT_PROTOTYPES"
        "-DATRACE_TAG=ATRACE_TAG_VIEW"
        "-DLOG_TAG=\"OpenGLRenderer\""
        "-Wall"
        "-Wno-unused-parameter"
        "-Wunreachable-code"
        "-Werror"
        "-fvisibility=hidden"

        #  GCC false-positives on this warning, and since we -Werror that's
        #  a problem
        "-Wno-free-nonheap-object"
    ];

    include_dirs = [
        "external/skia/include/private"
        "external/skia/src/core"
    ];

    product_variables = {
        eng = {
            lto = {
                never = true;
            };
        };
    };

    target = {
        android = {
            include_dirs = [
                "external/skia/src/effects"
                "external/skia/src/image"
                "external/skia/src/utils"
                "external/skia/src/gpu"
                "external/skia/src/shaders"
            ];
        };
        host = {
            include_dirs = [
                "external/vulkan-headers/include"
                "frameworks/native/libs/math/include"
                "frameworks/native/libs/ui/include"
            ];
            cflags = [
                "-Wno-unused-variable"
            ];
        };
    };
};

hwui_static_deps = cc_defaults {
    name = "hwui_static_deps";
    shared_libs = [
        "libbase"
        "libharfbuzz_ng"
        "libminikin"
    ];

    target = {
        android = {
            shared_libs = [
                "liblog"
                "libcutils"
                "libstatslog"
                "libutils"
                "libEGL"
                "libGLESv1_CM"
                "libGLESv2"
                "libGLESv3"
                "libvulkan"
                "libui"
                "libnativedisplay"
                "libnativewindow"
                "libprotobuf-cpp-lite"
                "libft2"
                "libandroidfw"
                "libcrypto"
                "libsync"
                "libstatspull"
                "libstatssocket"
            ];
            static_libs = [
                "libEGL_blobCache"
                "libprotoutil"
            ];
        };
        host = {
            static_libs = [
                "libandroidfw"
                "libutils"
            ];
        };
    };
};

hwui_bugreport_font_cache_usage = cc_defaults {
    name = "hwui_bugreport_font_cache_usage";
    cflags = ["-DBUGREPORT_FONT_CACHE_USAGE"];
};

hwui_compile_for_perf = cc_defaults {
    name = "hwui_compile_for_perf";
    #  TODO: Non-arm?
    cflags = [
        "-fno-omit-frame-pointer"
        "-marm"
        "-mapcs"
    ];
};

#  Build libhwui with PGO by default.
#  Location of PGO profile data is defined in build/soong/cc/pgo.go
#  and is separate from hwui.
#  To turn it off, set ANDROID_PGO_NO_PROFILE_USE environment variable
#  or set enable_profile_use property to false.
hwui_pgo = cc_defaults {
    name = "hwui_pgo";

    pgo = {
        instrumentation = true;
        profile_file = "hwui/hwui.profdata";
        benchmarks = ["hwui"];
        enable_profile_use = true;
    };
};

#  Build hwui library with ThinLTO by default.
hwui_lto = cc_defaults {
    name = "hwui_lto";
    target = {
        android = {
            lto = {
                thin = true;
            };
        };
    };
};

#  ------------------------
#  APEX
#  ------------------------

android_graphics_apex_headers = cc_library_headers {
    name = "android_graphics_apex_headers";

    host_supported = true;
    export_include_dirs = [
        "apex/include"
    ];
    target = {
        windows = {
            enabled = true;
        };
    };
};

android_graphics_apex = cc_defaults {
    name = "android_graphics_apex";
    cflags = [
        "-Wno-unused-parameter"
        "-Wno-non-virtual-dtor"
        "-Wno-maybe-uninitialized"
        "-Wno-parentheses"
        "-Wall"
        "-Werror"
        "-Wno-error=deprecated-declarations"
        "-Wunused"
        "-Wunreachable-code"
    ];

    cppflags = ["-Wno-conversion-null"];

    srcs = [
        "apex/android_matrix.cpp"
        "apex/android_paint.cpp"
        "apex/android_region.cpp"
    ];

    header_libs = ["android_graphics_apex_headers"];

    target = {
        android = {
            srcs = [ #  sources that depend on android only libraries
                "apex/android_bitmap.cpp"
                "apex/android_canvas.cpp"
                "apex/jni_runtime.cpp"
                "apex/renderthread.cpp"
            ];
        };
        host = {
            srcs = [
                "apex/LayoutlibLoader.cpp"
            ];
        };
    };
};

#  ------------------------
#  Android Graphics JNI
#  ------------------------

android_graphics_jni_headers = cc_library_headers {
    name = "android_graphics_jni_headers";

    host_supported = true;
    export_include_dirs = [
        "jni"
    ];
    target = {
        windows = {
            enabled = true;
        };
    };
};

android_graphics_jni = cc_defaults {
    name = "android_graphics_jni";
    cflags = [
        "-Wno-unused-parameter"
        "-Wno-non-virtual-dtor"
        "-Wno-maybe-uninitialized"
        "-Wno-parentheses"

        "-DGL_GLEXT_PROTOTYPES"
        "-DEGL_EGLEXT_PROTOTYPES"

        "-DU_USING_ICU_NAMESPACE=0"

        "-Wall"
        "-Werror"
        "-Wno-error=deprecated-declarations"
        "-Wunused"
        "-Wunreachable-code"
    ];

    cppflags = ["-Wno-conversion-null"];

    srcs = [
        "jni/android_graphics_animation_NativeInterpolatorFactory.cpp"
        "jni/android_graphics_animation_RenderNodeAnimator.cpp"
        "jni/android_graphics_Canvas.cpp"
        "jni/android_graphics_ColorSpace.cpp"
        "jni/android_graphics_drawable_AnimatedVectorDrawable.cpp"
        "jni/android_graphics_drawable_VectorDrawable.cpp"
        "jni/android_graphics_HardwareRendererObserver.cpp"
        "jni/android_graphics_Matrix.cpp"
        "jni/android_graphics_Picture.cpp"
        "jni/android_graphics_DisplayListCanvas.cpp"
        "jni/android_graphics_RenderNode.cpp"
        "jni/android_nio_utils.cpp"
        "jni/android_util_PathParser.cpp"

        "jni/Bitmap.cpp"
        "jni/BitmapFactory.cpp"
        "jni/ByteBufferStreamAdaptor.cpp"
        "jni/Camera.cpp"
        "jni/CanvasProperty.cpp"
        "jni/ColorFilter.cpp"
        "jni/CreateJavaOutputStreamAdaptor.cpp"
        "jni/FontFamily.cpp"
        "jni/FontUtils.cpp"
        "jni/Graphics.cpp"
        "jni/ImageDecoder.cpp"
        "jni/Interpolator.cpp"
        "jni/MaskFilter.cpp"
        "jni/NinePatch.cpp"
        "jni/NinePatchPeeker.cpp"
        "jni/Paint.cpp"
        "jni/PaintFilter.cpp"
        "jni/Path.cpp"
        "jni/PathEffect.cpp"
        "jni/PathMeasure.cpp"
        "jni/Picture.cpp"
        "jni/Shader.cpp"
        "jni/Typeface.cpp"
        "jni/Utils.cpp"
        "jni/YuvToJpegEncoder.cpp"
        "jni/fonts/Font.cpp"
        "jni/fonts/FontFamily.cpp"
        "jni/text/LineBreaker.cpp"
        "jni/text/MeasuredText.cpp"
    ];

    header_libs = ["android_graphics_jni_headers"];

    include_dirs = [
        "external/skia/include/private"
        "external/skia/src/codec"
        "external/skia/src/core"
        "external/skia/src/effects"
        "external/skia/src/image"
        "external/skia/src/images"
    ];

    shared_libs = [
        "libbase"
        "libcutils"
        "libharfbuzz_ng"
        "liblog"
        "libminikin"
        "libnativehelper"
        "libz"
        "libziparchive"
        "libjpeg"
    ];

    target = {
        android = {
            srcs = [ #  sources that depend on android only libraries
                "jni/AnimatedImageDrawable.cpp"
                "jni/android_graphics_TextureLayer.cpp"
                "jni/android_graphics_HardwareRenderer.cpp"
                "jni/BitmapRegionDecoder.cpp"
                "jni/GIFMovie.cpp"
                "jni/GraphicsStatsService.cpp"
                "jni/Movie.cpp"
                "jni/MovieImpl.cpp"
                "jni/Region.cpp" #  requires libbinder_ndk
                "jni/pdf/PdfDocument.cpp"
                "jni/pdf/PdfEditor.cpp"
                "jni/pdf/PdfRenderer.cpp"
                "jni/pdf/PdfUtils.cpp"
            ];
            shared_libs = [
                "libandroidfw"
                "libbinder"
                "libbinder_ndk"
                "libmediandk"
                "libnativedisplay"
                "libnativewindow"
                "libstatspull"
                "libstatssocket"
                "libpdfium"
            ];
            static_libs = [
                "libgif"
                "libstatslog"
            ];
        };
        host = {
            cflags = [
                "-Wno-unused-const-variable"
                "-Wno-unused-function"
            ];
            static_libs = [
                "libandroidfw"
            ];
        };
    };
};

#  ------------------------
#  library
#  ------------------------

libhwui_internal_headers = cc_library_headers {
    name = "libhwui_internal_headers";

    host_supported = true;
    export_include_dirs = [
        "."
    ];
    header_libs = ["android_graphics_jni_headers"];
    export_header_lib_headers = ["android_graphics_jni_headers"];
};

libhwui_defaults = cc_defaults {
    name = "libhwui_defaults";
    defaults = ["hwui_defaults"];

    whole_static_libs = ["libskia"];

    srcs = [
        "pipeline/skia/SkiaDisplayList.cpp"
        "pipeline/skia/SkiaRecordingCanvas.cpp"
        "pipeline/skia/RenderNodeDrawable.cpp"
        "pipeline/skia/ReorderBarrierDrawables.cpp"
        "renderthread/Frame.cpp"
        "renderthread/RenderTask.cpp"
        "renderthread/TimeLord.cpp"
        "hwui/AnimatedImageDrawable.cpp"
        "hwui/Bitmap.cpp"
        "hwui/Canvas.cpp"
        "hwui/ImageDecoder.cpp"
        "hwui/MinikinSkia.cpp"
        "hwui/MinikinUtils.cpp"
        "hwui/PaintImpl.cpp"
        "hwui/Typeface.cpp"
        "utils/Blur.cpp"
        "utils/Color.cpp"
        "utils/LinearAllocator.cpp"
        "utils/VectorDrawableUtils.cpp"
        "AnimationContext.cpp"
        "Animator.cpp"
        "AnimatorManager.cpp"
        "CanvasTransform.cpp"
        "DamageAccumulator.cpp"
        "Interpolator.cpp"
        "LightingInfo.cpp"
        "Matrix.cpp"
        "PathParser.cpp"
        "Properties.cpp"
        "PropertyValuesAnimatorSet.cpp"
        "PropertyValuesHolder.cpp"
        "RecordingCanvas.cpp"
        "RenderNode.cpp"
        "RenderProperties.cpp"
        "RootRenderNode.cpp"
        "SkiaCanvas.cpp"
        "VectorDrawable.cpp"
    ];

    proto = {
        export_proto_headers = true;
    };

    target = {
        android = {
            srcs = [
                "hwui/AnimatedImageThread.cpp"
                "pipeline/skia/ATraceMemoryDump.cpp"
                "pipeline/skia/GLFunctorDrawable.cpp"
                "pipeline/skia/LayerDrawable.cpp"
                "pipeline/skia/ShaderCache.cpp"
                "pipeline/skia/SkiaMemoryTracer.cpp"
                "pipeline/skia/SkiaOpenGLPipeline.cpp"
                "pipeline/skia/SkiaPipeline.cpp"
                "pipeline/skia/SkiaProfileRenderer.cpp"
                "pipeline/skia/SkiaVulkanPipeline.cpp"
                "pipeline/skia/VkFunctorDrawable.cpp"
                "pipeline/skia/VkInteropFunctorDrawable.cpp"
                "renderstate/RenderState.cpp"
                "renderthread/CacheManager.cpp"
                "renderthread/CanvasContext.cpp"
                "renderthread/DrawFrameTask.cpp"
                "renderthread/EglManager.cpp"
                "renderthread/ReliableSurface.cpp"
                "renderthread/VulkanManager.cpp"
                "renderthread/VulkanSurface.cpp"
                "renderthread/RenderProxy.cpp"
                "renderthread/RenderThread.cpp"
                "service/GraphicsStatsService.cpp"
                "thread/CommonPool.cpp"
                "utils/GLUtils.cpp"
                "utils/StringUtils.cpp"
                "AutoBackendTextureRelease.cpp"
                "DeferredLayerUpdater.cpp"
                "DeviceInfo.cpp"
                "FrameInfo.cpp"
                "FrameInfoVisualizer.cpp"
                "HardwareBitmapUploader.cpp"
                "HWUIProperties.sysprop"
                "JankTracker.cpp"
                "Layer.cpp"
                "LayerUpdateQueue.cpp"
                "ProfileData.cpp"
                "ProfileDataContainer.cpp"
                "Readback.cpp"
                "TreeInfo.cpp"
                "WebViewFunctorManager.cpp"
                "protos/graphicsstats.proto"
            ];

            #  Allow implicit fallthroughs in HardwareBitmapUploader.cpp until they are fixed.
            cflags = ["-Wno-implicit-fallthrough"];
        };
        host = {
            srcs = [
                "utils/HostColorSpace.cpp"
            ];
            export_static_lib_headers = [
                "libarect"
            ];
        };
    };
};

libhwui = cc_library {
    name = "libhwui";
    host_supported = true;
    defaults = [
        "libhwui_defaults"
        "android_graphics_apex"
        "android_graphics_jni"
    ];
    export_header_lib_headers = ["android_graphics_apex_headers"];
};

libhwui_static = cc_library_static {
    name = "libhwui_static";
    defaults = [
        "libhwui_defaults"
    ];
};

hwui_test_defaults = cc_defaults {
    name = "hwui_test_defaults";
    defaults = ["hwui_defaults"];
    test_suites = ["device-tests"];
    target = {
        android = {
            shared_libs = [
                "libgui"
            ];
        };
    };
    srcs = [
        "tests/common/scenes/BitmapFillrate.cpp"
        "tests/common/scenes/BitmapShaders.cpp"
        "tests/common/scenes/ClippingAnimation.cpp"
        "tests/common/scenes/GlyphStressAnimation.cpp"
        "tests/common/scenes/HwBitmap565.cpp"
        "tests/common/scenes/HwBitmapInCompositeShader.cpp"
        "tests/common/scenes/HwLayerAnimation.cpp"
        "tests/common/scenes/HwLayerSizeAnimation.cpp"
        "tests/common/scenes/JankyScene.cpp"
        "tests/common/scenes/ListOfFadedTextAnimation.cpp"
        "tests/common/scenes/ListViewAnimation.cpp"
        "tests/common/scenes/MagnifierAnimation.cpp"
        "tests/common/scenes/OpPropAnimation.cpp"
        "tests/common/scenes/OvalAnimation.cpp"
        "tests/common/scenes/PartialDamageAnimation.cpp"
        "tests/common/scenes/ReadbackFromHardwareBitmap.cpp"
        "tests/common/scenes/RecentsAnimation.cpp"
        "tests/common/scenes/RectGridAnimation.cpp"
        "tests/common/scenes/RoundRectClippingAnimation.cpp"
        "tests/common/scenes/SaveLayer2Animation.cpp"
        "tests/common/scenes/SaveLayerAnimation.cpp"
        "tests/common/scenes/ShadowGrid2Animation.cpp"
        "tests/common/scenes/ShadowGridAnimation.cpp"
        "tests/common/scenes/ShadowShaderAnimation.cpp"
        "tests/common/scenes/ShapeAnimation.cpp"
        "tests/common/scenes/SimpleColorMatrixAnimation.cpp"
        "tests/common/scenes/SimpleGradientAnimation.cpp"
        "tests/common/scenes/TextAnimation.cpp"
        "tests/common/scenes/TvApp.cpp"
        "tests/common/LeakChecker.cpp"
        "tests/common/TestListViewSceneBase.cpp"
        "tests/common/TestContext.cpp"
        "tests/common/TestScene.cpp"
        "tests/common/TestUtils.cpp"
    ];
};

#  ------------------------
#  unit tests
#  ------------------------

hwui_unit_tests = cc_test {
    name = "hwui_unit_tests";
    defaults = [
        "hwui_test_defaults"
        "android_graphics_apex"
        "android_graphics_jni"
    ];

    static_libs = [
        "libgmock"
        "libhwui_static"
    ];
    shared_libs = [
        "libmemunreachable"
    ];

    srcs = [
        "tests/unit/main.cpp"
        "tests/unit/ABitmapTests.cpp"
        "tests/unit/CacheManagerTests.cpp"
        "tests/unit/CanvasContextTests.cpp"
        "tests/unit/CommonPoolTests.cpp"
        "tests/unit/DamageAccumulatorTests.cpp"
        "tests/unit/DeferredLayerUpdaterTests.cpp"
        "tests/unit/FatVectorTests.cpp"
        "tests/unit/GraphicsStatsServiceTests.cpp"
        "tests/unit/LayerUpdateQueueTests.cpp"
        "tests/unit/LinearAllocatorTests.cpp"
        "tests/unit/MatrixTests.cpp"
        "tests/unit/PathInterpolatorTests.cpp"
        "tests/unit/RenderNodeDrawableTests.cpp"
        "tests/unit/RenderNodeTests.cpp"
        "tests/unit/RenderPropertiesTests.cpp"
        "tests/unit/RenderThreadTests.cpp"
        "tests/unit/ShaderCacheTests.cpp"
        "tests/unit/SkiaBehaviorTests.cpp"
        "tests/unit/SkiaDisplayListTests.cpp"
        "tests/unit/SkiaPipelineTests.cpp"
        "tests/unit/SkiaRenderPropertiesTests.cpp"
        "tests/unit/SkiaCanvasTests.cpp"
        "tests/unit/StringUtilsTests.cpp"
        "tests/unit/TestUtilsTests.cpp"
        "tests/unit/ThreadBaseTests.cpp"
        "tests/unit/TypefaceTests.cpp"
        "tests/unit/VectorDrawableTests.cpp"
        "tests/unit/WebViewFunctorManagerTests.cpp"
    ];
};

#  ------------------------
#  Macro-bench app
#  ------------------------

hwuimacro = cc_benchmark {
    name = "hwuimacro";
    defaults = ["hwui_test_defaults"];

    static_libs = ["libhwui"];
    shared_libs = [
        "libmemunreachable"
    ];

    srcs = [
        "tests/macrobench/TestSceneRunner.cpp"
        "tests/macrobench/main.cpp"
    ];
};

#  ------------------------
#  Micro-bench app
#  ---------------------

hwuimicro = cc_benchmark {
    name = "hwuimicro";
    defaults = ["hwui_test_defaults"];

    static_libs = ["libhwui_static"];
    shared_libs = [
        "libmemunreachable"
    ];

    srcs = [
        "tests/microbench/main.cpp"
        "tests/microbench/DisplayListCanvasBench.cpp"
        "tests/microbench/LinearAllocatorBench.cpp"
        "tests/microbench/PathParserBench.cpp"
        "tests/microbench/RenderNodeBench.cpp"
    ];
};

#  ----------------------------------------
#  Phony target to build benchmarks for PGO
#  ----------------------------------------

pgo-targets-hwui = phony {
    name = "pgo-targets-hwui";
    required = [
        "hwuimicro"
        "hwuimacro"
    ];
};

in { inherit android_graphics_apex android_graphics_apex_headers android_graphics_jni android_graphics_jni_headers hwui_bugreport_font_cache_usage hwui_compile_for_perf hwui_defaults hwui_lto hwui_pgo hwui_static_deps hwui_test_defaults hwui_unit_tests hwuimacro hwuimicro libhwui libhwui_defaults libhwui_internal_headers libhwui_static pgo-targets-hwui; }
