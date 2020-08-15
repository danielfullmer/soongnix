{ android_test, java_library }:
let

#  Copyright (C) 2014 The Android Open Source Project
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

#  Core androidplot library

androidplot = java_library {
    name = "androidplot";
    sdk_version = "current";
    srcs = [
        "AndroidPlot-Core/src/main/java/com/androidplot/LineRegion.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/Plot.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/PlotListener.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/Series.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/exception/PlotRenderException.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/pie/PieChart.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/pie/PieRenderer.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/pie/PieWidget.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/pie/Segment.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/pie/SegmentFormatter.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/ui/AnchorPosition.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/ui/BoxModel.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/ui/BoxModelable.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/ui/DynamicTableModel.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/ui/FixedTableModel.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/ui/Formatter.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/ui/LayoutManager.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/ui/LayoutMetric.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/ui/PositionMetric.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/ui/PositionMetrics.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/ui/RenderBundle.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/ui/Resizable.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/ui/SeriesAndFormatterList.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/ui/SeriesRenderer.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/ui/SizeLayoutType.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/ui/SizeMetric.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/ui/SizeMetrics.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/ui/TableModel.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/ui/TableOrder.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/ui/TableSizingMethod.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/ui/TextOrientationType.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/ui/XLayoutStyle.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/ui/XPositionMetric.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/ui/YLayoutStyle.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/ui/YPositionMetric.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/ui/widget/EmptyWidget.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/ui/widget/TextLabelWidget.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/ui/widget/Widget.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/util/Configurator.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/util/DisplayDimensions.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/util/FontUtils.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/util/ListOrganizer.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/util/MultiSynch.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/util/PaintUtils.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/util/PixelUtils.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/util/PlotStatistics.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/util/Redrawer.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/util/ValPixConverter.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/util/ZHash.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/util/ZIndexable.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/util/ZLinkedList.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/xy/AxisValueLabelFormatter.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/xy/BarFormatter.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/xy/BarRenderer.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/xy/BezierLineAndPointFormatter.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/xy/BezierLineAndPointRenderer.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/xy/BoundaryMode.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/xy/FillDirection.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/xy/LineAndPointFormatter.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/xy/LineAndPointRenderer.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/xy/PointLabelFormatter.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/xy/PointLabeler.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/xy/RectRegion.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/xy/SimpleXYSeries.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/xy/StepFormatter.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/xy/StepRenderer.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/xy/ValueMarker.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/xy/XValueMarker.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/xy/XYAxisType.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/xy/XYFramingModel.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/xy/XYGraphBounds.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/xy/XYGraphWidget.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/xy/XYLegendWidget.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/xy/XYPlot.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/xy/XYPlotZoomPan.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/xy/XYRegionFormatter.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/xy/XYSeries.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/xy/XYSeriesFormatter.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/xy/XYSeriesRenderer.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/xy/XYStep.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/xy/XYStepCalculator.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/xy/XYStepMode.java"
        "AndroidPlot-Core/src/main/java/com/androidplot/xy/YValueMarker.java"
    ];
    #  b/73499927
    errorprone = {
        javacflags = ["-Xep:MissingOverride:OFF"];
    };
};

#  Demo app
AndroidPlotDemos = android_test {
    name = "AndroidPlotDemos";
    sdk_version = "current";
    static_libs = ["androidplot"];
    resource_dirs = ["Examples/DemoApp/res"];
    manifest = "Examples/DemoApp/AndroidManifest.xml";
    srcs = [
        "Examples/DemoApp/src/com/androidplot/demos/BarPlotExampleActivity.java"
        "Examples/DemoApp/src/com/androidplot/demos/DualScaleXYPlotExampleActivity.java"
        "Examples/DemoApp/src/com/androidplot/demos/DynamicXYPlotActivity.java"
        "Examples/DemoApp/src/com/androidplot/demos/GlobalDefs.java"
        "Examples/DemoApp/src/com/androidplot/demos/ListViewActivity.java"
        "Examples/DemoApp/src/com/androidplot/demos/MainActivity.java"
        "Examples/DemoApp/src/com/androidplot/demos/OrientationSensorExampleActivity.java"
        "Examples/DemoApp/src/com/androidplot/demos/SimplePieChartActivity.java"
        "Examples/DemoApp/src/com/androidplot/demos/SimpleXYPlotActivity.java"
        "Examples/DemoApp/src/com/androidplot/demos/StepChartExampleActivity.java"
        "Examples/DemoApp/src/com/androidplot/demos/TimeSeriesActivity.java"
        "Examples/DemoApp/src/com/androidplot/demos/TouchZoomExampleActivity.java"
        "Examples/DemoApp/src/com/androidplot/demos/XYPlotWithBgImgActivity.java"
        "Examples/DemoApp/src/com/androidplot/demos/XYRegionExampleActivity.java"
        "Examples/DemoApp/src/com/androidplot/demos/widget/DemoAppWidgetProvider.java"
    ];

    #  b/73499927
    errorprone = {
        javacflags = ["-Xep:MissingOverride:OFF"];
    };

};

in { inherit AndroidPlotDemos androidplot; }
