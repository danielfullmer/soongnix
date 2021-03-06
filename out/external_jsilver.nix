{ java_library_host }:
let

#  Copyright (C) 2010 The Android Open Source Project
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

jsilver = java_library_host {
    name = "jsilver";
    srcs = [
        "src/com/google/clearsilver/jsilver/DataLoader.java"
        "src/com/google/clearsilver/jsilver/JSilver.java"
        "src/com/google/clearsilver/jsilver/JSilverOptions.java"
        "src/com/google/clearsilver/jsilver/TemplateRenderer.java"
        "src/com/google/clearsilver/jsilver/adaptor/JCs.java"
        "src/com/google/clearsilver/jsilver/adaptor/JHdf.java"
        "src/com/google/clearsilver/jsilver/adaptor/JSilverFactory.java"
        "src/com/google/clearsilver/jsilver/adaptor/LoadPathToFileCache.java"
        "src/com/google/clearsilver/jsilver/adaptor/ResourceLoaderAdaptor.java"
        "src/com/google/clearsilver/jsilver/autoescape/AutoEscapeContext.java"
        "src/com/google/clearsilver/jsilver/autoescape/AutoEscapeOptions.java"
        "src/com/google/clearsilver/jsilver/autoescape/EscapeMode.java"
        "src/com/google/clearsilver/jsilver/compatibility/ClearsilverRenderer.java"
        "src/com/google/clearsilver/jsilver/compiler/BaseCompiledTemplate.java"
        "src/com/google/clearsilver/jsilver/compiler/CompilingClassLoader.java"
        "src/com/google/clearsilver/jsilver/compiler/EscapingEvaluator.java"
        "src/com/google/clearsilver/jsilver/compiler/ExpressionTranslator.java"
        "src/com/google/clearsilver/jsilver/compiler/JSilverCompilationException.java"
        "src/com/google/clearsilver/jsilver/compiler/JavaExpression.java"
        "src/com/google/clearsilver/jsilver/compiler/JavaSourceWriter.java"
        "src/com/google/clearsilver/jsilver/compiler/TemplateCompiler.java"
        "src/com/google/clearsilver/jsilver/compiler/TemplateTranslator.java"
        "src/com/google/clearsilver/jsilver/compiler/VariableTranslator.java"
        "src/com/google/clearsilver/jsilver/data/AbstractData.java"
        "src/com/google/clearsilver/jsilver/data/ChainedData.java"
        "src/com/google/clearsilver/jsilver/data/Data.java"
        "src/com/google/clearsilver/jsilver/data/DataContext.java"
        "src/com/google/clearsilver/jsilver/data/DataFactory.java"
        "src/com/google/clearsilver/jsilver/data/DefaultData.java"
        "src/com/google/clearsilver/jsilver/data/DefaultDataContext.java"
        "src/com/google/clearsilver/jsilver/data/DefaultHdfParser.java"
        "src/com/google/clearsilver/jsilver/data/DelegatedData.java"
        "src/com/google/clearsilver/jsilver/data/HDFDataFactory.java"
        "src/com/google/clearsilver/jsilver/data/LocalAndGlobalData.java"
        "src/com/google/clearsilver/jsilver/data/NativeStringInternStrategy.java"
        "src/com/google/clearsilver/jsilver/data/NestedMapData.java"
        "src/com/google/clearsilver/jsilver/data/NewHdfParser.java"
        "src/com/google/clearsilver/jsilver/data/NoOpStringInternStrategy.java"
        "src/com/google/clearsilver/jsilver/data/Parser.java"
        "src/com/google/clearsilver/jsilver/data/ParserFactory.java"
        "src/com/google/clearsilver/jsilver/data/StringInternStrategy.java"
        "src/com/google/clearsilver/jsilver/data/TypeConverter.java"
        "src/com/google/clearsilver/jsilver/data/UniqueStack.java"
        "src/com/google/clearsilver/jsilver/data/UnmodifiableData.java"
        "src/com/google/clearsilver/jsilver/examples/basic/HelloWorld.java"
        "src/com/google/clearsilver/jsilver/examples/basic/Iterate.java"
        "src/com/google/clearsilver/jsilver/examples/basic/JSilverTest.java"
        "src/com/google/clearsilver/jsilver/exceptions/ExceptionUtil.java"
        "src/com/google/clearsilver/jsilver/exceptions/JSilverAutoEscapingException.java"
        "src/com/google/clearsilver/jsilver/exceptions/JSilverBadSyntaxException.java"
        "src/com/google/clearsilver/jsilver/exceptions/JSilverException.java"
        "src/com/google/clearsilver/jsilver/exceptions/JSilverIOException.java"
        "src/com/google/clearsilver/jsilver/exceptions/JSilverInterpreterException.java"
        "src/com/google/clearsilver/jsilver/exceptions/JSilverTemplateNotFoundException.java"
        "src/com/google/clearsilver/jsilver/functions/EscapingFunction.java"
        "src/com/google/clearsilver/jsilver/functions/Function.java"
        "src/com/google/clearsilver/jsilver/functions/FunctionExecutor.java"
        "src/com/google/clearsilver/jsilver/functions/FunctionRegistry.java"
        "src/com/google/clearsilver/jsilver/functions/NonEscapingFunction.java"
        "src/com/google/clearsilver/jsilver/functions/TextFilter.java"
        "src/com/google/clearsilver/jsilver/functions/bundles/ClearSilverCompatibleFunctions.java"
        "src/com/google/clearsilver/jsilver/functions/bundles/CoreOperators.java"
        "src/com/google/clearsilver/jsilver/functions/escape/HtmlEscapeFunction.java"
        "src/com/google/clearsilver/jsilver/functions/escape/JsEscapeFunction.java"
        "src/com/google/clearsilver/jsilver/functions/escape/JsValidateUnquotedLiteral.java"
        "src/com/google/clearsilver/jsilver/functions/escape/NullEscapeFunction.java"
        "src/com/google/clearsilver/jsilver/functions/escape/SimpleEscapingFunction.java"
        "src/com/google/clearsilver/jsilver/functions/escape/StyleEscapeFunction.java"
        "src/com/google/clearsilver/jsilver/functions/escape/UrlEscapeFunction.java"
        "src/com/google/clearsilver/jsilver/functions/html/BaseUrlValidateFunction.java"
        "src/com/google/clearsilver/jsilver/functions/html/CssUrlValidateFunction.java"
        "src/com/google/clearsilver/jsilver/functions/html/HtmlStripFunction.java"
        "src/com/google/clearsilver/jsilver/functions/html/HtmlUrlValidateFunction.java"
        "src/com/google/clearsilver/jsilver/functions/html/TextHtmlFunction.java"
        "src/com/google/clearsilver/jsilver/functions/numeric/AbsFunction.java"
        "src/com/google/clearsilver/jsilver/functions/numeric/MaxFunction.java"
        "src/com/google/clearsilver/jsilver/functions/numeric/MinFunction.java"
        "src/com/google/clearsilver/jsilver/functions/operators/AddFunction.java"
        "src/com/google/clearsilver/jsilver/functions/operators/AndFunction.java"
        "src/com/google/clearsilver/jsilver/functions/operators/DivideFunction.java"
        "src/com/google/clearsilver/jsilver/functions/operators/EqualFunction.java"
        "src/com/google/clearsilver/jsilver/functions/operators/ExistsFunction.java"
        "src/com/google/clearsilver/jsilver/functions/operators/GreaterFunction.java"
        "src/com/google/clearsilver/jsilver/functions/operators/GreaterOrEqualFunction.java"
        "src/com/google/clearsilver/jsilver/functions/operators/LessFunction.java"
        "src/com/google/clearsilver/jsilver/functions/operators/LessOrEqualFunction.java"
        "src/com/google/clearsilver/jsilver/functions/operators/ModuloFunction.java"
        "src/com/google/clearsilver/jsilver/functions/operators/MultiplyFunction.java"
        "src/com/google/clearsilver/jsilver/functions/operators/NotEqualFunction.java"
        "src/com/google/clearsilver/jsilver/functions/operators/NotFunction.java"
        "src/com/google/clearsilver/jsilver/functions/operators/NumericAddFunction.java"
        "src/com/google/clearsilver/jsilver/functions/operators/NumericEqualFunction.java"
        "src/com/google/clearsilver/jsilver/functions/operators/NumericFunction.java"
        "src/com/google/clearsilver/jsilver/functions/operators/NumericNotEqualFunction.java"
        "src/com/google/clearsilver/jsilver/functions/operators/OrFunction.java"
        "src/com/google/clearsilver/jsilver/functions/operators/SubtractFunction.java"
        "src/com/google/clearsilver/jsilver/functions/string/CrcFunction.java"
        "src/com/google/clearsilver/jsilver/functions/string/FindFunction.java"
        "src/com/google/clearsilver/jsilver/functions/string/LengthFunction.java"
        "src/com/google/clearsilver/jsilver/functions/string/SliceFunction.java"
        "src/com/google/clearsilver/jsilver/functions/structure/FirstFunction.java"
        "src/com/google/clearsilver/jsilver/functions/structure/LastFunction.java"
        "src/com/google/clearsilver/jsilver/functions/structure/NameFunction.java"
        "src/com/google/clearsilver/jsilver/functions/structure/SubcountFunction.java"
        "src/com/google/clearsilver/jsilver/interpreter/ExpressionEvaluator.java"
        "src/com/google/clearsilver/jsilver/interpreter/InterpretedMacro.java"
        "src/com/google/clearsilver/jsilver/interpreter/InterpretedTemplate.java"
        "src/com/google/clearsilver/jsilver/interpreter/InterpretedTemplateLoader.java"
        "src/com/google/clearsilver/jsilver/interpreter/LoadingTemplateFactory.java"
        "src/com/google/clearsilver/jsilver/interpreter/OptimizerProvider.java"
        "src/com/google/clearsilver/jsilver/interpreter/OptimizingTemplateFactory.java"
        "src/com/google/clearsilver/jsilver/interpreter/TemplateFactory.java"
        "src/com/google/clearsilver/jsilver/interpreter/TemplateInterpreter.java"
        "src/com/google/clearsilver/jsilver/interpreter/VariableLocator.java"
        "src/com/google/clearsilver/jsilver/output/InstanceOutputBufferProvider.java"
        "src/com/google/clearsilver/jsilver/output/OutputBufferProvider.java"
        "src/com/google/clearsilver/jsilver/output/ThreadLocalOutputBufferProvider.java"
        "src/com/google/clearsilver/jsilver/precompiler/PrecompiledTemplateLoader.java"
        "src/com/google/clearsilver/jsilver/precompiler/PrecompiledTemplateMapFileReader.java"
        "src/com/google/clearsilver/jsilver/precompiler/PrecompiledTemplateMapKey.java"
        "src/com/google/clearsilver/jsilver/resourceloader/BaseResourceLoader.java"
        "src/com/google/clearsilver/jsilver/resourceloader/BufferedResourceLoader.java"
        "src/com/google/clearsilver/jsilver/resourceloader/ClassLoaderResourceLoader.java"
        "src/com/google/clearsilver/jsilver/resourceloader/ClassResourceLoader.java"
        "src/com/google/clearsilver/jsilver/resourceloader/CompositeResourceLoader.java"
        "src/com/google/clearsilver/jsilver/resourceloader/FileSystemResourceLoader.java"
        "src/com/google/clearsilver/jsilver/resourceloader/InMemoryResourceLoader.java"
        "src/com/google/clearsilver/jsilver/resourceloader/ResourceLoader.java"
        "src/com/google/clearsilver/jsilver/syntax/AutoEscaper.java"
        "src/com/google/clearsilver/jsilver/syntax/DataCommandConsolidator.java"
        "src/com/google/clearsilver/jsilver/syntax/InlineRewriter.java"
        "src/com/google/clearsilver/jsilver/syntax/SequenceOptimizer.java"
        "src/com/google/clearsilver/jsilver/syntax/StructuralWhitespaceStripper.java"
        "src/com/google/clearsilver/jsilver/syntax/SyntaxTreeBuilder.java"
        "src/com/google/clearsilver/jsilver/syntax/SyntaxTreeDumper.java"
        "src/com/google/clearsilver/jsilver/syntax/SyntaxTreeOptimizer.java"
        "src/com/google/clearsilver/jsilver/syntax/TemplateSyntaxTree.java"
        "src/com/google/clearsilver/jsilver/syntax/TypeResolver.java"
        "src/com/google/clearsilver/jsilver/syntax/VarOptimizer.java"
        "src/com/google/clearsilver/jsilver/syntax/analysis/Analysis.java"
        "src/com/google/clearsilver/jsilver/syntax/analysis/AnalysisAdapter.java"
        "src/com/google/clearsilver/jsilver/syntax/analysis/DepthFirstAdapter.java"
        "src/com/google/clearsilver/jsilver/syntax/analysis/ReversedDepthFirstAdapter.java"
        "src/com/google/clearsilver/jsilver/syntax/lexer/Lexer.java"
        "src/com/google/clearsilver/jsilver/syntax/lexer/LexerException.java"
        "src/com/google/clearsilver/jsilver/syntax/node/AAddExpression.java"
        "src/com/google/clearsilver/jsilver/syntax/node/AAltCommand.java"
        "src/com/google/clearsilver/jsilver/syntax/node/AAndExpression.java"
        "src/com/google/clearsilver/jsilver/syntax/node/AAutoescapeCommand.java"
        "src/com/google/clearsilver/jsilver/syntax/node/ACallCommand.java"
        "src/com/google/clearsilver/jsilver/syntax/node/ACommaExpression.java"
        "src/com/google/clearsilver/jsilver/syntax/node/ACommentCommand.java"
        "src/com/google/clearsilver/jsilver/syntax/node/AContentTypeCommand.java"
        "src/com/google/clearsilver/jsilver/syntax/node/ACsOpenPosition.java"
        "src/com/google/clearsilver/jsilver/syntax/node/ADataCommand.java"
        "src/com/google/clearsilver/jsilver/syntax/node/ADecNumberVariable.java"
        "src/com/google/clearsilver/jsilver/syntax/node/ADecimalExpression.java"
        "src/com/google/clearsilver/jsilver/syntax/node/ADefCommand.java"
        "src/com/google/clearsilver/jsilver/syntax/node/ADescendVariable.java"
        "src/com/google/clearsilver/jsilver/syntax/node/ADivideExpression.java"
        "src/com/google/clearsilver/jsilver/syntax/node/AEachCommand.java"
        "src/com/google/clearsilver/jsilver/syntax/node/AEqExpression.java"
        "src/com/google/clearsilver/jsilver/syntax/node/AEscapeCommand.java"
        "src/com/google/clearsilver/jsilver/syntax/node/AEvarCommand.java"
        "src/com/google/clearsilver/jsilver/syntax/node/AExistsExpression.java"
        "src/com/google/clearsilver/jsilver/syntax/node/AExpandVariable.java"
        "src/com/google/clearsilver/jsilver/syntax/node/AFunctionExpression.java"
        "src/com/google/clearsilver/jsilver/syntax/node/AGtExpression.java"
        "src/com/google/clearsilver/jsilver/syntax/node/AGteExpression.java"
        "src/com/google/clearsilver/jsilver/syntax/node/AHardIncludeCommand.java"
        "src/com/google/clearsilver/jsilver/syntax/node/AHardLincludeCommand.java"
        "src/com/google/clearsilver/jsilver/syntax/node/AHexExpression.java"
        "src/com/google/clearsilver/jsilver/syntax/node/AHexNumberVariable.java"
        "src/com/google/clearsilver/jsilver/syntax/node/AIfCommand.java"
        "src/com/google/clearsilver/jsilver/syntax/node/AIncludeCommand.java"
        "src/com/google/clearsilver/jsilver/syntax/node/AInlineCommand.java"
        "src/com/google/clearsilver/jsilver/syntax/node/ALincludeCommand.java"
        "src/com/google/clearsilver/jsilver/syntax/node/ALoopCommand.java"
        "src/com/google/clearsilver/jsilver/syntax/node/ALoopIncCommand.java"
        "src/com/google/clearsilver/jsilver/syntax/node/ALoopToCommand.java"
        "src/com/google/clearsilver/jsilver/syntax/node/ALtExpression.java"
        "src/com/google/clearsilver/jsilver/syntax/node/ALteExpression.java"
        "src/com/google/clearsilver/jsilver/syntax/node/ALvarCommand.java"
        "src/com/google/clearsilver/jsilver/syntax/node/AModuloExpression.java"
        "src/com/google/clearsilver/jsilver/syntax/node/AMultipleCommand.java"
        "src/com/google/clearsilver/jsilver/syntax/node/AMultiplyExpression.java"
        "src/com/google/clearsilver/jsilver/syntax/node/ANameCommand.java"
        "src/com/google/clearsilver/jsilver/syntax/node/ANameVariable.java"
        "src/com/google/clearsilver/jsilver/syntax/node/ANeExpression.java"
        "src/com/google/clearsilver/jsilver/syntax/node/ANegativeExpression.java"
        "src/com/google/clearsilver/jsilver/syntax/node/ANoopCommand.java"
        "src/com/google/clearsilver/jsilver/syntax/node/ANoopExpression.java"
        "src/com/google/clearsilver/jsilver/syntax/node/ANotExpression.java"
        "src/com/google/clearsilver/jsilver/syntax/node/ANumericAddExpression.java"
        "src/com/google/clearsilver/jsilver/syntax/node/ANumericEqExpression.java"
        "src/com/google/clearsilver/jsilver/syntax/node/ANumericExpression.java"
        "src/com/google/clearsilver/jsilver/syntax/node/ANumericNeExpression.java"
        "src/com/google/clearsilver/jsilver/syntax/node/AOptimizedMultipleCommand.java"
        "src/com/google/clearsilver/jsilver/syntax/node/AOrExpression.java"
        "src/com/google/clearsilver/jsilver/syntax/node/ASequenceExpression.java"
        "src/com/google/clearsilver/jsilver/syntax/node/ASetCommand.java"
        "src/com/google/clearsilver/jsilver/syntax/node/AStringExpression.java"
        "src/com/google/clearsilver/jsilver/syntax/node/ASubtractExpression.java"
        "src/com/google/clearsilver/jsilver/syntax/node/AUvarCommand.java"
        "src/com/google/clearsilver/jsilver/syntax/node/AVarCommand.java"
        "src/com/google/clearsilver/jsilver/syntax/node/AVariableExpression.java"
        "src/com/google/clearsilver/jsilver/syntax/node/AWithCommand.java"
        "src/com/google/clearsilver/jsilver/syntax/node/EOF.java"
        "src/com/google/clearsilver/jsilver/syntax/node/Node.java"
        "src/com/google/clearsilver/jsilver/syntax/node/PCommand.java"
        "src/com/google/clearsilver/jsilver/syntax/node/PExpression.java"
        "src/com/google/clearsilver/jsilver/syntax/node/PPosition.java"
        "src/com/google/clearsilver/jsilver/syntax/node/PVariable.java"
        "src/com/google/clearsilver/jsilver/syntax/node/Start.java"
        "src/com/google/clearsilver/jsilver/syntax/node/Switch.java"
        "src/com/google/clearsilver/jsilver/syntax/node/Switchable.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TAlt.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TAnd.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TArgWhitespace.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TAssignment.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TAutoescape.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TBang.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TBracketClose.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TBracketOpen.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TCall.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TComma.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TCommandDelimiter.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TComment.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TCommentStart.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TContentType.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TCsClose.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TCsOpen.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TData.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TDecNumber.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TDef.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TDollar.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TDot.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TEach.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TElse.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TElseIf.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TEq.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TEscape.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TEvar.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TGt.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TGte.java"
        "src/com/google/clearsilver/jsilver/syntax/node/THardDelimiter.java"
        "src/com/google/clearsilver/jsilver/syntax/node/THash.java"
        "src/com/google/clearsilver/jsilver/syntax/node/THexNumber.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TIf.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TInclude.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TInline.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TLinclude.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TLoop.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TLt.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TLte.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TLvar.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TMinus.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TName.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TNe.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TOr.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TParenClose.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TParenOpen.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TPercent.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TPlus.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TQuestion.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TSet.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TSlash.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TStar.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TString.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TUvar.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TVar.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TWith.java"
        "src/com/google/clearsilver/jsilver/syntax/node/TWord.java"
        "src/com/google/clearsilver/jsilver/syntax/node/Token.java"
        "src/com/google/clearsilver/jsilver/syntax/parser/Parser.java"
        "src/com/google/clearsilver/jsilver/syntax/parser/ParserException.java"
        "src/com/google/clearsilver/jsilver/syntax/parser/State.java"
        "src/com/google/clearsilver/jsilver/syntax/parser/TokenIndex.java"
        "src/com/google/clearsilver/jsilver/template/DefaultRenderingContext.java"
        "src/com/google/clearsilver/jsilver/template/DelegatingTemplateLoader.java"
        "src/com/google/clearsilver/jsilver/template/HtmlWhiteSpaceStripper.java"
        "src/com/google/clearsilver/jsilver/template/Macro.java"
        "src/com/google/clearsilver/jsilver/template/RenderingContext.java"
        "src/com/google/clearsilver/jsilver/template/Template.java"
        "src/com/google/clearsilver/jsilver/template/TemplateLoader.java"
        "src/com/google/clearsilver/jsilver/values/NumberValue.java"
        "src/com/google/clearsilver/jsilver/values/StringValue.java"
        "src/com/google/clearsilver/jsilver/values/Value.java"
        "src/com/google/clearsilver/jsilver/values/VariableValue.java"
        "src/com/google/clearsilver/jsilver/values/VariantValue.java"
        "src/com/google/streamhtmlparser/ExternalState.java"
        "src/com/google/streamhtmlparser/HtmlParser.java"
        "src/com/google/streamhtmlparser/HtmlParserFactory.java"
        "src/com/google/streamhtmlparser/JavascriptParser.java"
        "src/com/google/streamhtmlparser/JavascriptParserFactory.java"
        "src/com/google/streamhtmlparser/ParseException.java"
        "src/com/google/streamhtmlparser/Parser.java"
        "src/com/google/streamhtmlparser/impl/GenericParser.java"
        "src/com/google/streamhtmlparser/impl/HtmlParserImpl.java"
        "src/com/google/streamhtmlparser/impl/InternalState.java"
        "src/com/google/streamhtmlparser/impl/JavascriptParserImpl.java"
        "src/com/google/streamhtmlparser/impl/ParserStateTable.java"
        "src/com/google/streamhtmlparser/impl/StateTableTransition.java"
        "src/com/google/streamhtmlparser/util/CharacterRecorder.java"
        "src/com/google/streamhtmlparser/util/EntityResolver.java"
        "src/com/google/streamhtmlparser/util/HtmlUtils.java"
        "src/com/google/streamhtmlparser/util/JavascriptTokenBuffer.java"
        "src/org/clearsilver/CS.java"
        "src/org/clearsilver/CSFileLoader.java"
        "src/org/clearsilver/CSUtil.java"
        "src/org/clearsilver/ClearsilverFactory.java"
        "src/org/clearsilver/DelegatedCs.java"
        "src/org/clearsilver/DelegatedHdf.java"
        "src/org/clearsilver/FactoryLoader.java"
        "src/org/clearsilver/HDF.java"
        "src/org/clearsilver/jni/JNI.java"
        "src/org/clearsilver/jni/JniClearsilverFactory.java"
        "src/org/clearsilver/jni/JniCs.java"
        "src/org/clearsilver/jni/JniHdf.java"
    ];
    libs = ["guava"];
    java_resource_dirs = ["src"];
};

in { inherit jsilver; }
