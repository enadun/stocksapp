import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import 'package:flutter_module/chart/chart_model.dart';
import 'package:flutter_module/main.dart';
import 'package:flutter_module/state/app_data_state.dart';

class ChartViewModel {
  AppData appData;

  ChartViewModel(this.appData);

  get isLoading => appData.isLoading;
  set json(String json) {
    // _json = json;
  }

  List<dynamic>? parceJson(String json) {
    return null;
  }

  Future<Void?> getGraphData(String duration) async {
    appData.setIsLoading(true);
    try {
      final data = await MyApp.platformChannel
          .invokeMethod('get_chart_data', duration) as String;
      Map<String, dynamic> json = jsonDecode(data);
      ChartData chartData = ChartData.fromJson(json);
      appData.setChartData(chartData);
    } catch (e) {
      appData.setChartData(null);
      print('Failed $e');
    }

    appData.setIsLoading(false);
    return null;
  }
}
