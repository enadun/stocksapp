import 'package:flutter/material.dart';
import 'package:flutter_module/chart/chart_model.dart';
import 'package:flutter_module/chart/chart_view_model.dart';
import 'package:flutter_module/state/app_data_state.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartView extends StatelessWidget {
  final ChartViewModel viewModel;
  const ChartView({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    final chartData = Provider.of<AppData>(context).chartData;
    return chartData == null || chartData.results.isEmpty
        ? const Center(
            child: Text('Something went wrong'),
          )
        : Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                viewModel.appData.chartData!.ticker,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 8,
              ),
              SfCartesianChart(
                series: <ChartSeries>[
                  LineSeries<Result, int>(
                    dataSource: chartData.results,
                    xValueMapper: (_, x) => x,
                    yValueMapper: (result, _) => result.h,
                  )
                ],
                primaryXAxis: NumericAxis(isVisible: false),
              ),
              Row(
                children: [
                  MaterialButton(
                    child: const Text('1D'),
                    onPressed: () => viewModel.getGraphData('day'),
                  ),
                  MaterialButton(
                    child: const Text('1W'),
                    onPressed: () => viewModel.getGraphData('week'),
                  ),
                  MaterialButton(
                    child: const Text('1M'),
                    onPressed: () => viewModel.getGraphData('month'),
                  ),
                  MaterialButton(
                    child: const Text('1Y'),
                    onPressed: () => viewModel.getGraphData('year'),
                  ),
                ],
              )
            ],
          );
  }
}
