import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_module/chart/chart_screen.dart';
import 'package:flutter_module/portfolio/portfolio_screen.dart';
import 'package:flutter_module/state/app_data_state.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const platformChannel = MethodChannel('main_channel');
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppData>(
      create: (context) => AppData(),
      child: MaterialApp(
        routes: {
          '/stockcharts': (context) => const ChartScreen(),
          '/portfolio': (context) => const PortfolioScreen(),
        },
      ),
    );
  }
}
