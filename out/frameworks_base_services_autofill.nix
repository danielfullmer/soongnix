{ filegroup, java_library_static }:
let

"services.autofill-sources" = filegroup {
    name = "services.autofill-sources";
    srcs = [
        "java/com/android/server/autofill/AutofillCompatAccessibilityService.java"
        "java/com/android/server/autofill/AutofillInlineSessionController.java"
        "java/com/android/server/autofill/AutofillInlineSuggestionsRequestSession.java"
        "java/com/android/server/autofill/AutofillManagerService.java"
        "java/com/android/server/autofill/AutofillManagerServiceImpl.java"
        "java/com/android/server/autofill/AutofillManagerServiceShellCommand.java"
        "java/com/android/server/autofill/FieldClassificationStrategy.java"
        "java/com/android/server/autofill/Helper.java"
        "java/com/android/server/autofill/RemoteAugmentedAutofillService.java"
        "java/com/android/server/autofill/RemoteFillService.java"
        "java/com/android/server/autofill/RemoteInlineSuggestionRenderService.java"
        "java/com/android/server/autofill/Session.java"
        "java/com/android/server/autofill/ViewState.java"
        "java/com/android/server/autofill/ui/AutoFillUI.java"
        "java/com/android/server/autofill/ui/CustomScrollView.java"
        "java/com/android/server/autofill/ui/FillUi.java"
        "java/com/android/server/autofill/ui/InlineContentProviderImpl.java"
        "java/com/android/server/autofill/ui/InlineFillUi.java"
        "java/com/android/server/autofill/ui/InlineSuggestionFactory.java"
        "java/com/android/server/autofill/ui/OverlayControl.java"
        "java/com/android/server/autofill/ui/PendingUi.java"
        "java/com/android/server/autofill/ui/RemoteInlineSuggestionUi.java"
        "java/com/android/server/autofill/ui/RemoteInlineSuggestionViewConnector.java"
        "java/com/android/server/autofill/ui/SaveUi.java"
    ];
    path = "java";
    visibility = ["//frameworks/base/services"];
};

"services.autofill" = java_library_static {
    name = "services.autofill";
    defaults = ["services_defaults"];
    srcs = [":services.autofill-sources"];
    libs = ["services.core"];
};

in { inherit "services.autofill" "services.autofill-sources"; }
