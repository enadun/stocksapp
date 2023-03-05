import 'package:flutter/material.dart';
import 'package:flutter_module/portfolio/portfolio_view_model.dart';
import 'package:flutter_module/portfolio/stock/stock_view.dart';
import 'package:flutter_module/portfolio/stock/stock_view_model.dart';
import 'package:flutter_module/portfolio/summery/summery_view.dart';
import 'package:flutter_module/state/app_data_state.dart';
import 'package:provider/provider.dart';

class PortfolioView extends StatelessWidget {
  final ProtfolioViewModel viewModel;
  const PortfolioView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final stockData = Provider.of<AppData>(context).stockData;
    return stockData.isEmpty
        ? const Center(
            child: Text('Something went wrong'),
          )
        : Column(
            children: [
              const SizedBox(height: 8),
              SummeryView(viewModel),
              const Divider(),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final stockVM = StockViewModel(stockData[index]);
                    return Card(
                      child: StockView(stockVM),
                    );
                  },
                  itemCount: stockData.length,
                ),
              ),
            ],
          );
  }
}
