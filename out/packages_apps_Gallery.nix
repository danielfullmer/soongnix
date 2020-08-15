{ android_app }:
let

Gallery = android_app {
    name = "Gallery";
    srcs = [
        "src/com/android/camera/ActionMenuButton.java"
        "src/com/android/camera/BitmapManager.java"
        "src/com/android/camera/CropImage.java"
        "src/com/android/camera/DeleteImage.java"
        "src/com/android/camera/EvenlySpacedLayout.java"
        "src/com/android/camera/GalleryPicker.java"
        "src/com/android/camera/GalleryPickerItem.java"
        "src/com/android/camera/GallerySettings.java"
        "src/com/android/camera/GridViewSpecial.java"
        "src/com/android/camera/HighlightView.java"
        "src/com/android/camera/ImageGallery.java"
        "src/com/android/camera/ImageGetter.java"
        "src/com/android/camera/ImageLoader.java"
        "src/com/android/camera/ImageManager.java"
        "src/com/android/camera/ImageViewTouchBase.java"
        "src/com/android/camera/MenuHelper.java"
        "src/com/android/camera/MonitoredActivity.java"
        "src/com/android/camera/MovieView.java"
        "src/com/android/camera/MovieViewControl.java"
        "src/com/android/camera/NoSearchActivity.java"
        "src/com/android/camera/PhotoAppWidgetBind.java"
        "src/com/android/camera/PhotoAppWidgetConfigure.java"
        "src/com/android/camera/PhotoAppWidgetProvider.java"
        "src/com/android/camera/PickWallpaper.java"
        "src/com/android/camera/ReverseGeocoderTask.java"
        "src/com/android/camera/RotateBitmap.java"
        "src/com/android/camera/Util.java"
        "src/com/android/camera/ViewImage.java"
        "src/com/android/camera/Wallpaper.java"
        "src/com/android/camera/gallery/BaseImage.java"
        "src/com/android/camera/gallery/BaseImageList.java"
        "src/com/android/camera/gallery/IImage.java"
        "src/com/android/camera/gallery/IImageList.java"
        "src/com/android/camera/gallery/Image.java"
        "src/com/android/camera/gallery/ImageList.java"
        "src/com/android/camera/gallery/ImageListUber.java"
        "src/com/android/camera/gallery/LruCache.java"
        "src/com/android/camera/gallery/SingleImageList.java"
        "src/com/android/camera/gallery/UriImage.java"
        "src/com/android/camera/gallery/VideoList.java"
        "src/com/android/camera/gallery/VideoObject.java"
    ];
    platform_apis = true;
    certificate = "media";
};

in { inherit Gallery; }
