{ cc_benchmark, cc_defaults, cc_library, cc_library_static, cc_test, phony }:
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

        #  clang's warning is broken, see: https://llvm.org/bugs/show_bug.cgi?id=21629
        "-Wno-missing-braces"
    ];

    include_dirs = [
        "external/skia/include/private"
        "external/skia/src/core"
        "external/skia/src/effects"
        "external/skia/src/image"
        "external/skia/src/utils"
        "external/skia/src/gpu"
        "external/skia/src/shaders"
    ];

    product_variables = {
        eng = {
            lto = {
                never = true;
            };
        };
    };
};

hwui_static_deps = cc_defaults {
    name = "hwui_static_deps";
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
        "libgui"
        "libprotobuf-cpp-lite"
        "libharfbuzz_ng"
        "libft2"
        "libminikin"
        "libandroidfw"
        "libcrypto"
        "libsync"
    ];
    static_libs = [
        "libEGL_blobCache"
    ];
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

hwui_debug = cc_defaults {
    name = "hwui_debug";
    cflags = ["-include debug/wrap_gles.h"];
    srcs = [
        "debug/wrap_gles.cpp"
        "debug/DefaultGlesDriver.cpp"
        "debug/GlesErrorCheckWrapper.cpp"
        "debug/GlesDriver.cpp"
        "debug/FatalBaseDriver.cpp"
        "debug/NullGlesDriver.cpp"
    ];
    include_dirs = ["frameworks/native/opengl/libs/GLES2"];
};

hwui_enable_opengl_validation = cc_defaults {
    name = "hwui_enable_opengl_validation";
    defaults = ["hwui_debug"];
    cflags = ["-DDEBUG_OPENGL=3"];
    include_dirs = ["frameworks/native/opengl/libs/GLES2"];
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
#  library
#  ------------------------

libhwui_defaults = cc_defaults {
    name = "libhwui_defaults";
    defaults = ["hwui_defaults"];

    whole_static_libs = ["libskia"];

    srcs = [
        "hwui/AnimatedImageDrawable.cpp"
        "hwui/AnimatedImageThread.cpp"
        "hwui/Bitmap.cpp"
        "hwui/Canvas.cpp"
        "hwui/MinikinSkia.cpp"
        "hwui/MinikinUtils.cpp"
        "hwui/PaintImpl.cpp"
        "hwui/Typeface.cpp"
        "pipeline/skia/GLFunctorDrawable.cpp"
        "pipeline/skia/LayerDrawable.cpp"
        "pipeline/skia/RenderNodeDrawable.cpp"
        "pipeline/skia/ReorderBarrierDrawables.cpp"
        "pipeline/skia/ShaderCache.cpp"
        "pipeline/skia/SkiaDisplayList.cpp"
        "pipeline/skia/SkiaMemoryTracer.cpp"
        "pipeline/skia/SkiaOpenGLPipeline.cpp"
        "pipeline/skia/SkiaPipeline.cpp"
        "pipeline/skia/SkiaProfileRenderer.cpp"
        "pipeline/skia/SkiaRecordingCanvas.cpp"
        "pipeline/skia/SkiaVulkanPipeline.cpp"
        "pipeline/skia/VectorDrawableAtlas.cpp"
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
        "renderthread/RenderTask.cpp"
        "renderthread/RenderThread.cpp"
        "renderthread/TimeLord.cpp"
        "renderthread/Frame.cpp"
        "service/GraphicsStatsService.cpp"
        "surfacetexture/EGLConsumer.cpp"
        "surfacetexture/ImageConsumer.cpp"
        "surfacetexture/SurfaceTexture.cpp"
        "thread/CommonPool.cpp"
        "utils/Blur.cpp"
        "utils/Color.cpp"
        "utils/GLUtils.cpp"
        "utils/LinearAllocator.cpp"
        "utils/StringUtils.cpp"
        "utils/VectorDrawableUtils.cpp"
        "AnimationContext.cpp"
        "Animator.cpp"
        "AnimatorManager.cpp"
        "CanvasTransform.cpp"
        "DamageAccumulator.cpp"
        "DeferredLayerUpdater.cpp"
        "DeviceInfo.cpp"
        "FrameInfo.cpp"
        "FrameInfoVisualizer.cpp"
        "GpuMemoryTracker.cpp"
        "HardwareBitmapUploader.cpp"
        "HWUIProperties.sysprop"
        "Interpolator.cpp"
        "JankTracker.cpp"
        "Layer.cpp"
        "LayerUpdateQueue.cpp"
        "Matrix.cpp"
        "PathParser.cpp"
        "ProfileData.cpp"
        "ProfileDataContainer.cpp"
        "Properties.cpp"
        "PropertyValuesAnimatorSet.cpp"
        "PropertyValuesHolder.cpp"
        "Readback.cpp"
        "RecordingCanvas.cpp"
        "RenderNode.cpp"
        "RenderProperties.cpp"
        "SkiaCanvas.cpp"
        "TreeInfo.cpp"
        "WebViewFunctorManager.cpp"
        "VectorDrawable.cpp"
        "protos/graphicsstats.proto"
    ];

    #  Allow implicit fallthroughs in HardwareBitmapUploader.cpp until they are fixed.
    cflags = ["-Wno-implicit-fallthrough"];

    proto = {
        export_proto_headers = true;
    };

    export_include_dirs = ["."];
};

libhwui = cc_library {
    name = "libhwui";
    defaults = [
        "libhwui_defaults"

        #  Enables fine-grained GLES error checking
        #  If enabled, every GLES call is wrapped & error checked
        #  Has moderate overhead
        # "hwui_enable_opengl_validation",
    ];
};

#  ------------------------
#  static library null gpu
#  ------------------------

libhwui_static_debug = cc_library_static {
    name = "libhwui_static_debug";
    defaults = [
        "libhwui_defaults"
        "hwui_debug"
    ];
    cflags = ["-DHWUI_NULL_GPU"];
    srcs = [
        "debug/nullegl.cpp"
    ];
};

hwui_test_defaults = cc_defaults {
    name = "hwui_test_defaults";
    defaults = ["hwui_defaults"];
    test_suites = ["device-tests"];
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
    defaults = ["hwui_test_defaults"];

    static_libs = [
        "libgmock"
        "libhwui_static_debug"
    ];
    shared_libs = [
        "libmemunreachable"
    ];
    cflags = [
        "-include debug/wrap_gles.h"
        "-DHWUI_NULL_GPU"
    ];

    srcs = [
        "tests/unit/main.cpp"
        "tests/unit/CacheManagerTests.cpp"
        "tests/unit/CanvasContextTests.cpp"
        "tests/unit/CommonPoolTests.cpp"
        "tests/unit/DamageAccumulatorTests.cpp"
        "tests/unit/DeferredLayerUpdaterTests.cpp"
        "tests/unit/FatVectorTests.cpp"
        "tests/unit/GpuMemoryTrackerTests.cpp"
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
        "tests/unit/VectorDrawableAtlasTests.cpp"
        "tests/unit/WebViewFunctorManagerTests.cpp"
    ];
};

#  ------------------------
#  Macro-bench app
#  ------------------------

hwuimacro = cc_benchmark {
    name = "hwuimacro";
    defaults = ["hwui_test_defaults"];

    #  set to libhwui_static_debug to skip actual GL commands
    whole_static_libs = ["libhwui"];
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

    cflags = [
        "-include debug/wrap_gles.h"
        "-DHWUI_NULL_GPU"
    ];

    whole_static_libs = ["libhwui_static_debug"];
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

in { inherit hwui_bugreport_font_cache_usage hwui_compile_for_perf hwui_debug hwui_defaults hwui_enable_opengl_validation hwui_lto hwui_pgo hwui_static_deps hwui_test_defaults hwui_unit_tests hwuimacro hwuimicro libhwui libhwui_defaults libhwui_static_debug pgo-targets-hwui; }
