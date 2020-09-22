{ java_library_host }:
let

#
#  Copyright (C) 2017 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#

turbine = java_library_host {
    name = "turbine";

    srcs = [
        "java/com/google/common/escape/SourceCodeEscapers.java"
        "java/com/google/turbine/binder/Binder.java"
        "java/com/google/turbine/binder/CanonicalTypeBinder.java"
        "java/com/google/turbine/binder/ClassPath.java"
        "java/com/google/turbine/binder/ClassPathBinder.java"
        "java/com/google/turbine/binder/CompUnitPreprocessor.java"
        "java/com/google/turbine/binder/ConstBinder.java"
        "java/com/google/turbine/binder/ConstEvaluator.java"
        "java/com/google/turbine/binder/CtSymClassBinder.java"
        "java/com/google/turbine/binder/DisambiguateTypeAnnotations.java"
        "java/com/google/turbine/binder/HierarchyBinder.java"
        "java/com/google/turbine/binder/JimageClassBinder.java"
        "java/com/google/turbine/binder/ModuleBinder.java"
        "java/com/google/turbine/binder/Resolve.java"
        "java/com/google/turbine/binder/TypeBinder.java"
        "java/com/google/turbine/binder/bound/AnnotationMetadata.java"
        "java/com/google/turbine/binder/bound/AnnotationValue.java"
        "java/com/google/turbine/binder/bound/BoundClass.java"
        "java/com/google/turbine/binder/bound/EnumConstantValue.java"
        "java/com/google/turbine/binder/bound/HeaderBoundClass.java"
        "java/com/google/turbine/binder/bound/ModuleInfo.java"
        "java/com/google/turbine/binder/bound/PackageSourceBoundClass.java"
        "java/com/google/turbine/binder/bound/PackageSourceBoundModule.java"
        "java/com/google/turbine/binder/bound/SourceBoundClass.java"
        "java/com/google/turbine/binder/bound/SourceHeaderBoundClass.java"
        "java/com/google/turbine/binder/bound/SourceModuleInfo.java"
        "java/com/google/turbine/binder/bound/SourceTypeBoundClass.java"
        "java/com/google/turbine/binder/bound/TurbineClassValue.java"
        "java/com/google/turbine/binder/bound/TypeBoundClass.java"
        "java/com/google/turbine/binder/bytecode/BytecodeBinder.java"
        "java/com/google/turbine/binder/bytecode/BytecodeBoundClass.java"
        "java/com/google/turbine/binder/env/CompoundEnv.java"
        "java/com/google/turbine/binder/env/Env.java"
        "java/com/google/turbine/binder/env/LazyEnv.java"
        "java/com/google/turbine/binder/env/SimpleEnv.java"
        "java/com/google/turbine/binder/lookup/CanonicalSymbolResolver.java"
        "java/com/google/turbine/binder/lookup/CompoundScope.java"
        "java/com/google/turbine/binder/lookup/CompoundTopLevelIndex.java"
        "java/com/google/turbine/binder/lookup/ImportIndex.java"
        "java/com/google/turbine/binder/lookup/ImportScope.java"
        "java/com/google/turbine/binder/lookup/LookupKey.java"
        "java/com/google/turbine/binder/lookup/LookupResult.java"
        "java/com/google/turbine/binder/lookup/MemberImportIndex.java"
        "java/com/google/turbine/binder/lookup/Scope.java"
        "java/com/google/turbine/binder/lookup/SimpleTopLevelIndex.java"
        "java/com/google/turbine/binder/lookup/TopLevelIndex.java"
        "java/com/google/turbine/binder/lookup/WildImportIndex.java"
        "java/com/google/turbine/binder/sym/ClassSymbol.java"
        "java/com/google/turbine/binder/sym/FieldSymbol.java"
        "java/com/google/turbine/binder/sym/MethodSymbol.java"
        "java/com/google/turbine/binder/sym/ModuleSymbol.java"
        "java/com/google/turbine/binder/sym/Symbol.java"
        "java/com/google/turbine/binder/sym/TyVarSymbol.java"
        "java/com/google/turbine/bytecode/AnnotationWriter.java"
        "java/com/google/turbine/bytecode/Attribute.java"
        "java/com/google/turbine/bytecode/AttributeWriter.java"
        "java/com/google/turbine/bytecode/ByteReader.java"
        "java/com/google/turbine/bytecode/ClassFile.java"
        "java/com/google/turbine/bytecode/ClassReader.java"
        "java/com/google/turbine/bytecode/ClassWriter.java"
        "java/com/google/turbine/bytecode/ConstantPool.java"
        "java/com/google/turbine/bytecode/ConstantPoolReader.java"
        "java/com/google/turbine/bytecode/LowerAttributes.java"
        "java/com/google/turbine/bytecode/sig/Sig.java"
        "java/com/google/turbine/bytecode/sig/SigParser.java"
        "java/com/google/turbine/bytecode/sig/SigWriter.java"
        "java/com/google/turbine/deps/Dependencies.java"
        "java/com/google/turbine/deps/Transitive.java"
        "java/com/google/turbine/diag/LineMap.java"
        "java/com/google/turbine/diag/SourceFile.java"
        "java/com/google/turbine/diag/TurbineDiagnostic.java"
        "java/com/google/turbine/diag/TurbineError.java"
        "java/com/google/turbine/diag/TurbineLog.java"
        "java/com/google/turbine/lower/Lower.java"
        "java/com/google/turbine/lower/LowerSignature.java"
        "java/com/google/turbine/main/Main.java"
        "java/com/google/turbine/main/UsageException.java"
        "java/com/google/turbine/model/Const.java"
        "java/com/google/turbine/model/TurbineConstantTypeKind.java"
        "java/com/google/turbine/model/TurbineElementType.java"
        "java/com/google/turbine/model/TurbineFlag.java"
        "java/com/google/turbine/model/TurbineTyKind.java"
        "java/com/google/turbine/model/TurbineVisibility.java"
        "java/com/google/turbine/options/TurbineOptions.java"
        "java/com/google/turbine/options/TurbineOptionsParser.java"
        "java/com/google/turbine/parse/ConstExpressionParser.java"
        "java/com/google/turbine/parse/IteratorLexer.java"
        "java/com/google/turbine/parse/Lexer.java"
        "java/com/google/turbine/parse/Parser.java"
        "java/com/google/turbine/parse/SavedToken.java"
        "java/com/google/turbine/parse/StreamLexer.java"
        "java/com/google/turbine/parse/Token.java"
        "java/com/google/turbine/parse/UnicodeEscapePreprocessor.java"
        "java/com/google/turbine/parse/VariableInitializerParser.java"
        "java/com/google/turbine/tree/Pretty.java"
        "java/com/google/turbine/tree/Tree.java"
        "java/com/google/turbine/tree/TurbineModifier.java"
        "java/com/google/turbine/tree/TurbineOperatorKind.java"
        "java/com/google/turbine/type/AnnoInfo.java"
        "java/com/google/turbine/type/Type.java"
        "java/com/google/turbine/types/Canonicalize.java"
        "java/com/google/turbine/types/Erasure.java"
        "java/com/google/turbine/zip/Zip.java"
        "proto/deps.proto"
    ];

    manifest = "manifest.txt";
    static_libs = [
        "error_prone_annotations"
        "guava"
    ];

    plugins = ["dagger2-auto-value"];
    libs = ["dagger2-auto-value"];

    proto = {
        type = "full";
    };
};

in { inherit turbine; }
