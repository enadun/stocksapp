import 'package:flutter/material.dart';
import 'package:flutter_module/chart/chart_model.dart';

class AppData extends ChangeNotifier {
  bool isLoading = true;
  ChartData? chartData;
  List<dynamic> portfolioData = [];

  void setIsLoading(bool isLoading) {
    this.isLoading = isLoading;
    notifyListeners();
  }

  void setChartData(ChartData? chartData) {
    this.chartData = chartData;
    notifyListeners();
  }

  void setPortfolioData(List<dynamic> portfolioData) {
    this.portfolioData = portfolioData;
    notifyListeners();
  }
}
