{ android_app }:
let

SecureElement = android_app {
    name = "SecureElement";
    srcs = [
        "src/com/android/se/Channel.java"
        "src/com/android/se/CommandApduValidator.java"
        "src/com/android/se/SEApplication.java"
        "src/com/android/se/SecureElementService.java"
        "src/com/android/se/Terminal.java"
        "src/com/android/se/internal/ByteArrayConverter.java"
        "src/com/android/se/internal/Util.java"
        "src/com/android/se/security/AccessControlEnforcer.java"
        "src/com/android/se/security/AccessRuleCache.java"
        "src/com/android/se/security/ApduFilter.java"
        "src/com/android/se/security/ChannelAccess.java"
        "src/com/android/se/security/CommandApdu.java"
        "src/com/android/se/security/ResponseApdu.java"
        "src/com/android/se/security/ara/AccessRuleApplet.java"
        "src/com/android/se/security/ara/AraController.java"
        "src/com/android/se/security/arf/ASN1.java"
        "src/com/android/se/security/arf/ArfController.java"
        "src/com/android/se/security/arf/DERParser.java"
        "src/com/android/se/security/arf/SecureElement.java"
        "src/com/android/se/security/arf/SecureElementException.java"
        "src/com/android/se/security/arf/PKCS15/EF.java"
        "src/com/android/se/security/arf/PKCS15/EFACConditions.java"
        "src/com/android/se/security/arf/PKCS15/EFACMain.java"
        "src/com/android/se/security/arf/PKCS15/EFACRules.java"
        "src/com/android/se/security/arf/PKCS15/EFDIR.java"
        "src/com/android/se/security/arf/PKCS15/EFDODF.java"
        "src/com/android/se/security/arf/PKCS15/EFODF.java"
        "src/com/android/se/security/arf/PKCS15/PKCS15Exception.java"
        "src/com/android/se/security/arf/PKCS15/PKCS15Handler.java"
        "src/com/android/se/security/gpac/AID_REF_DO.java"
        "src/com/android/se/security/gpac/APDU_AR_DO.java"
        "src/com/android/se/security/gpac/AR_DO.java"
        "src/com/android/se/security/gpac/BerTlv.java"
        "src/com/android/se/security/gpac/DO_Exception.java"
        "src/com/android/se/security/gpac/Hash_REF_DO.java"
        "src/com/android/se/security/gpac/NFC_AR_DO.java"
        "src/com/android/se/security/gpac/ParserException.java"
        "src/com/android/se/security/gpac/REF_AR_DO.java"
        "src/com/android/se/security/gpac/REF_DO.java"
        "src/com/android/se/security/gpac/Response_ALL_AR_DO.java"
        "src/com/android/se/security/gpac/Response_ARAC_AID_DO.java"
        "src/com/android/se/security/gpac/Response_AR_DO.java"
        "src/com/android/se/security/gpac/Response_DO_Factory.java"
        "src/com/android/se/security/gpac/Response_RefreshTag_DO.java"
    ];
    platform_apis = true;
    certificate = "platform";
    static_libs = [
        "android.hardware.secure_element-V1.0-java"
        "android.hardware.secure_element-V1.1-java"
    ];
    optimize = {
        enabled = false;
    };
};

in { inherit SecureElement; }
