{ android_app }:
let

WallpaperCropper = android_app {
    name = "WallpaperCropper";
    srcs = [
        "src/com/android/gallery3d/common/BitmapUtils.java"
        "src/com/android/gallery3d/common/Utils.java"
        "src/com/android/gallery3d/exif/ByteBufferInputStream.java"
        "src/com/android/gallery3d/exif/CountedDataInputStream.java"
        "src/com/android/gallery3d/exif/ExifData.java"
        "src/com/android/gallery3d/exif/ExifInterface.java"
        "src/com/android/gallery3d/exif/ExifInvalidFormatException.java"
        "src/com/android/gallery3d/exif/ExifModifier.java"
        "src/com/android/gallery3d/exif/ExifOutputStream.java"
        "src/com/android/gallery3d/exif/ExifParser.java"
        "src/com/android/gallery3d/exif/ExifReader.java"
        "src/com/android/gallery3d/exif/ExifTag.java"
        "src/com/android/gallery3d/exif/IfdData.java"
        "src/com/android/gallery3d/exif/IfdId.java"
        "src/com/android/gallery3d/exif/JpegHeader.java"
        "src/com/android/gallery3d/exif/OrderedDataOutputStream.java"
        "src/com/android/gallery3d/exif/Rational.java"
        "src/com/android/gallery3d/glrenderer/BasicTexture.java"
        "src/com/android/gallery3d/glrenderer/BitmapTexture.java"
        "src/com/android/gallery3d/glrenderer/GLCanvas.java"
        "src/com/android/gallery3d/glrenderer/GLES20Canvas.java"
        "src/com/android/gallery3d/glrenderer/GLES20IdImpl.java"
        "src/com/android/gallery3d/glrenderer/GLId.java"
        "src/com/android/gallery3d/glrenderer/GLPaint.java"
        "src/com/android/gallery3d/glrenderer/RawTexture.java"
        "src/com/android/gallery3d/glrenderer/Texture.java"
        "src/com/android/gallery3d/glrenderer/UploadedTexture.java"
        "src/com/android/gallery3d/util/IntArray.java"
        "src/com/android/photos/BitmapRegionTileSource.java"
        "src/com/android/photos/views/BlockingGLTextureView.java"
        "src/com/android/photos/views/TiledImageRenderer.java"
        "src/com/android/photos/views/TiledImageView.java"
        "src/com/android/wallpapercropper/CropView.java"
        "src/com/android/wallpapercropper/WallpaperCropActivity.java"
    ];
    platform_apis = true;
    certificate = "platform";
    system_ext_specific = true;
    privileged = true;
    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };
};

in { inherit WallpaperCropper; }
