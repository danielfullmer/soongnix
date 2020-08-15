{ java_library_static }:
let

"services.autofill" = java_library_static {
    name = "services.autofill";
    srcs = [
        "java/com/android/server/autofill/AutofillCompatAccessibilityService.java"
        "java/com/android/server/autofill/AutofillManagerService.java"
        "java/com/android/server/autofill/AutofillManagerServiceImpl.java"
        "java/com/android/server/autofill/AutofillManagerServiceShellCommand.java"
        "java/com/android/server/autofill/FieldClassificationStrategy.java"
        "java/com/android/server/autofill/Helper.java"
        "java/com/android/server/autofill/RemoteAugmentedAutofillService.java"
        "java/com/android/server/autofill/RemoteFillService.java"
        "java/com/android/server/autofill/Session.java"
        "java/com/android/server/autofill/ViewState.java"
        "java/com/android/server/autofill/ui/AutoFillUI.java"
        "java/com/android/server/autofill/ui/CustomScrollView.java"
        "java/com/android/server/autofill/ui/FillUi.java"
        "java/com/android/server/autofill/ui/OverlayControl.java"
        "java/com/android/server/autofill/ui/PendingUi.java"
        "java/com/android/server/autofill/ui/SaveUi.java"
    ];
    libs = ["services.core"];
};

in { inherit "services.autofill"; }
