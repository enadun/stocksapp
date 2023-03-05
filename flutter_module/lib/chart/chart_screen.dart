import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_module/chart/chart_view.dart';
import 'package:flutter_module/chart/chart_view_model.dart';
import 'package:flutter_module/state/app_data_state.dart';
import 'package:provider/provider.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  late ChartViewModel viewModel;

  @override
  void initState() {
    super.initState();
    final appData = Provider.of<AppData>(context, listen: false);
    viewModel = ChartViewModel(appData);
    viewModel.getGraphData('day');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Charts'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => SystemNavigator.pop(),
        ),
      ),
      body: Provider.of<AppData>(context).isLoading
          ? const Center(
              child: Text('Loading...'),
            )
          : ChartView(
              viewModel: viewModel,
            ),
    );
  }
}
