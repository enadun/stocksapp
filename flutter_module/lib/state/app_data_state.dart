import 'package:flutter/material.dart';
import 'package:flutter_module/chart/chart_model.dart';
import 'package:flutter_module/portfolio/portfolio_model.dart';

class AppData extends ChangeNotifier {
  bool isLoading = true;
  ChartData? chartData;
  List<Stock> stockData = [];

  void setIsLoading(bool isLoading) {
    this.isLoading = isLoading;
    notifyListeners();
  }

  void setChartData(ChartData? chartData) {
    this.chartData = chartData;
    notifyListeners();
  }

  void setStockData(List<Stock> stockData) {
    this.stockData = stockData;
    notifyListeners();
  }
}
