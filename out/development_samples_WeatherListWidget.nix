{ android_test }:
let

WeatherListWidget = android_test {
    name = "WeatherListWidget";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/example/android/weatherlistwidget/WeatherDataProvider.java"
        "src/com/example/android/weatherlistwidget/WeatherWidgetProvider.java"
        "src/com/example/android/weatherlistwidget/WeatherWidgetService.java"
    ];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit WeatherListWidget; }
