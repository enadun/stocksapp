import 'dart:convert';
import 'dart:ffi';

import 'package:flutter_module/main.dart';
import 'package:flutter_module/portfolio/portfolio_model.dart';
import 'package:flutter_module/state/app_data_state.dart';

class ProtfolioViewModel {
  AppData appData;

  ProtfolioViewModel(this.appData);

  get isLoading => appData.isLoading;

  Future<Void?> getPortfolioData() async {
    appData.setIsLoading(true);
    try {
      final data =
          await MyApp.platformChannel.invokeMethod('get_portfolio') as String;
      Map<String, dynamic> json = jsonDecode(data);
      final stockData = StockData.fromJson(json);
      appData.setStockData(stockData.stocks);
    } catch (e) {
      appData.setStockData([]);
      // print('Failed $e');
    }
    appData.setIsLoading(false);
    return null;
  }

  String getTotalPreformance() {
    final value = _getTotalCurrentValue() - _getTotalInvestAmount();
    return '\$ ${value.toStringAsFixed(2)}';
  }

  String getTotalPerformancePresentage() {
    final value = (_getTotalCurrentValue() / _getTotalInvestAmount() - 1) * 100;
    return '\$${value.toStringAsFixed(2)}';
  }

  String getTodaysPreformance() {
    final value = _getTotalCurrentValue();
    return '\$${value.toStringAsFixed(2)}';
  }

  String getTodaysPreformancePresentage() {
    final value = _getTotalCurrentValue() / _getTotalInvestAmount() * 100;
    return '${value.toStringAsFixed(2)}%';
  }

  double _getTotalInvestAmount() {
    double total = 0;
    for (var element in appData.stockData) {
      total += element.ltp * element.quantity;
    }
    return total;
  }

  double _getTotalCurrentValue() {
    double total = 0;
    for (var element in appData.stockData) {
      total += element.avgPrice * element.quantity;
    }
    return total;
  }
}
