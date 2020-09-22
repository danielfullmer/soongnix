{ android_library }:
let

#
#  Build the setup compat library.
#

setupcompat = android_library {
    name = "setupcompat";
    manifest = "AndroidManifest.xml";
    resource_dirs = [
        "main/res"
    ];
    srcs = [
        "main/java/com/google/android/setupcompat/PartnerCustomizationLayout.java"
        "main/java/com/google/android/setupcompat/internal/ClockProvider.java"
        "main/java/com/google/android/setupcompat/internal/ExecutorProvider.java"
        "main/java/com/google/android/setupcompat/internal/FallbackThemeWrapper.java"
        "main/java/com/google/android/setupcompat/internal/FooterButtonPartnerConfig.java"
        "main/java/com/google/android/setupcompat/internal/LayoutBindBackHelper.java"
        "main/java/com/google/android/setupcompat/internal/LifecycleFragment.java"
        "main/java/com/google/android/setupcompat/internal/PersistableBundles.java"
        "main/java/com/google/android/setupcompat/internal/Preconditions.java"
        "main/java/com/google/android/setupcompat/internal/SetupCompatServiceInvoker.java"
        "main/java/com/google/android/setupcompat/internal/SetupCompatServiceProvider.java"
        "main/java/com/google/android/setupcompat/internal/TemplateLayout.java"
        "main/java/com/google/android/setupcompat/internal/Ticker.java"
        "main/java/com/google/android/setupcompat/internal/Validations.java"
        "main/java/com/google/android/setupcompat/logging/CustomEvent.java"
        "main/java/com/google/android/setupcompat/logging/MetricKey.java"
        "main/java/com/google/android/setupcompat/logging/SetupMetricsLogger.java"
        "main/java/com/google/android/setupcompat/logging/Timer.java"
        "main/java/com/google/android/setupcompat/logging/internal/FooterBarMixinMetrics.java"
        "main/java/com/google/android/setupcompat/logging/internal/MetricBundleConverter.java"
        "main/java/com/google/android/setupcompat/logging/internal/PartnerCustomizedResourceListMetric.java"
        "main/java/com/google/android/setupcompat/logging/internal/SetupMetricsLoggingConstants.java"
        "main/java/com/google/android/setupcompat/template/FooterActionButton.java"
        "main/java/com/google/android/setupcompat/template/FooterBarMixin.java"
        "main/java/com/google/android/setupcompat/template/FooterButton.java"
        "main/java/com/google/android/setupcompat/template/FooterButtonInflater.java"
        "main/java/com/google/android/setupcompat/template/Mixin.java"
        "main/java/com/google/android/setupcompat/template/StatusBarMixin.java"
        "main/java/com/google/android/setupcompat/template/SystemNavBarMixin.java"
        "main/java/com/google/android/setupcompat/util/ObjectUtils.java"
        "main/java/com/google/android/setupcompat/util/ResultCodes.java"
        "main/java/com/google/android/setupcompat/util/SystemBarHelper.java"
        "main/java/com/google/android/setupcompat/util/WizardManagerHelper.java"
        "main/java/com/google/android/setupcompat/view/ButtonBarLayout.java"
        "main/java/com/google/android/setupcompat/view/StatusBarBackgroundLayout.java"
        "partnerconfig/java/com/google/android/setupcompat/partnerconfig/PartnerConfig.java"
        "partnerconfig/java/com/google/android/setupcompat/partnerconfig/PartnerConfigHelper.java"
        "partnerconfig/java/com/google/android/setupcompat/partnerconfig/PartnerConfigKey.java"
        "partnerconfig/java/com/google/android/setupcompat/partnerconfig/ResourceEntry.java"
        "main/aidl/com/google/android/setupcompat/ISetupCompatService.aidl"
    ];
    static_libs = [
        "androidx.annotation_annotation"
    ];
    min_sdk_version = "14";
    sdk_version = "current";
};

in { inherit setupcompat; }
