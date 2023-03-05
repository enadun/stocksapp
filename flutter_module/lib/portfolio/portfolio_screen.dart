import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_module/main.dart';
import 'package:flutter_module/portfolio/portfolio_view.dart';
import 'package:flutter_module/portfolio/portfolio_view_model.dart';
import 'package:flutter_module/state/app_data_state.dart';
import 'package:provider/provider.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  late ProtfolioViewModel viewModel;

  @override
  void initState() {
    super.initState();
    final appData = Provider.of<AppData>(context, listen: false);
    viewModel = ProtfolioViewModel(appData);
    viewModel.getPortfolioData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Stocks'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => SystemNavigator.pop(),
        ),
      ),
      body: Provider.of<AppData>(context).isLoading
          ? const Center(
              child: Text('Loading...'),
            )
          : PortfolioView(
              viewModel: viewModel,
            ),
    );
  }
}
