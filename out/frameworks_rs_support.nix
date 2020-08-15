{ java_library_static }:
let

subdirs = [
    "jni"
];

android-support-v8-renderscript = java_library_static {
    name = "android-support-v8-renderscript";
    sdk_version = "23";
    srcs = [
        "java/src/androidx/renderscript/Allocation.java"
        "java/src/androidx/renderscript/BaseObj.java"
        "java/src/androidx/renderscript/Byte2.java"
        "java/src/androidx/renderscript/Byte3.java"
        "java/src/androidx/renderscript/Byte4.java"
        "java/src/androidx/renderscript/Double2.java"
        "java/src/androidx/renderscript/Double3.java"
        "java/src/androidx/renderscript/Double4.java"
        "java/src/androidx/renderscript/Element.java"
        "java/src/androidx/renderscript/FieldPacker.java"
        "java/src/androidx/renderscript/Float2.java"
        "java/src/androidx/renderscript/Float3.java"
        "java/src/androidx/renderscript/Float4.java"
        "java/src/androidx/renderscript/Int2.java"
        "java/src/androidx/renderscript/Int3.java"
        "java/src/androidx/renderscript/Int4.java"
        "java/src/androidx/renderscript/Long2.java"
        "java/src/androidx/renderscript/Long3.java"
        "java/src/androidx/renderscript/Long4.java"
        "java/src/androidx/renderscript/Matrix2f.java"
        "java/src/androidx/renderscript/Matrix3f.java"
        "java/src/androidx/renderscript/Matrix4f.java"
        "java/src/androidx/renderscript/RSDriverException.java"
        "java/src/androidx/renderscript/RSIllegalArgumentException.java"
        "java/src/androidx/renderscript/RSInvalidStateException.java"
        "java/src/androidx/renderscript/RSRuntimeException.java"
        "java/src/androidx/renderscript/RenderScript.java"
        "java/src/androidx/renderscript/Sampler.java"
        "java/src/androidx/renderscript/Script.java"
        "java/src/androidx/renderscript/ScriptC.java"
        "java/src/androidx/renderscript/ScriptGroup.java"
        "java/src/androidx/renderscript/ScriptIntrinsic.java"
        "java/src/androidx/renderscript/ScriptIntrinsic3DLUT.java"
        "java/src/androidx/renderscript/ScriptIntrinsicBLAS.java"
        "java/src/androidx/renderscript/ScriptIntrinsicBlend.java"
        "java/src/androidx/renderscript/ScriptIntrinsicBlur.java"
        "java/src/androidx/renderscript/ScriptIntrinsicColorMatrix.java"
        "java/src/androidx/renderscript/ScriptIntrinsicConvolve3x3.java"
        "java/src/androidx/renderscript/ScriptIntrinsicConvolve5x5.java"
        "java/src/androidx/renderscript/ScriptIntrinsicHistogram.java"
        "java/src/androidx/renderscript/ScriptIntrinsicLUT.java"
        "java/src/androidx/renderscript/ScriptIntrinsicResize.java"
        "java/src/androidx/renderscript/ScriptIntrinsicYuvToRGB.java"
        "java/src/androidx/renderscript/Short2.java"
        "java/src/androidx/renderscript/Short3.java"
        "java/src/androidx/renderscript/Short4.java"
        "java/src/androidx/renderscript/Type.java"
    ];
    libs = [
        "android-support-annotations"
    ];
    product_variables = {
        unbundled_build = {
            enabled = false;
        };
    };
    java_version = "1.7";
};

in { inherit android-support-v8-renderscript; }
