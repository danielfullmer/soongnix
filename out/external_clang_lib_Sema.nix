{ cc_library_static }:
let

libclangSema = cc_library_static {
    name = "libclangSema";
    defaults = ["clang-defaults"];
    srcs = [
        "AnalysisBasedWarnings.cpp"
        "AttributeList.cpp"
        "CodeCompleteConsumer.cpp"
        "DeclSpec.cpp"
        "DelayedDiagnostic.cpp"
        "IdentifierResolver.cpp"
        "JumpDiagnostics.cpp"
        "MultiplexExternalSemaSource.cpp"
        "Scope.cpp"
        "ScopeInfo.cpp"
        "Sema.cpp"
        "SemaAccess.cpp"
        "SemaAttr.cpp"
        "SemaCUDA.cpp"
        "SemaCXXScopeSpec.cpp"
        "SemaCast.cpp"
        "SemaChecking.cpp"
        "SemaCodeComplete.cpp"
        "SemaConsumer.cpp"
        "SemaCoroutine.cpp"
        "SemaDecl.cpp"
        "SemaDeclAttr.cpp"
        "SemaDeclCXX.cpp"
        "SemaDeclObjC.cpp"
        "SemaExceptionSpec.cpp"
        "SemaExpr.cpp"
        "SemaExprCXX.cpp"
        "SemaExprMember.cpp"
        "SemaExprObjC.cpp"
        "SemaFixItUtils.cpp"
        "SemaInit.cpp"
        "SemaLambda.cpp"
        "SemaLookup.cpp"
        "SemaObjCProperty.cpp"
        "SemaOpenMP.cpp"
        "SemaOverload.cpp"
        "SemaPseudoObject.cpp"
        "SemaStmt.cpp"
        "SemaStmtAsm.cpp"
        "SemaStmtAttr.cpp"
        "SemaTemplate.cpp"
        "SemaTemplateDeduction.cpp"
        "SemaTemplateInstantiate.cpp"
        "SemaTemplateInstantiateDecl.cpp"
        "SemaTemplateVariadic.cpp"
        "SemaType.cpp"
        "TypeLocBuilder.cpp"
    ];
};

in { inherit libclangSema; }
