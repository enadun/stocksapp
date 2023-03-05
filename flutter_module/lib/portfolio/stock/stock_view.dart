import 'package:flutter/material.dart';
import 'package:flutter_module/portfolio/stock/stock_view_model.dart';
import 'package:flutter_module/widgets/text_widgets.dart';

class StockView extends StatelessWidget {
  final StockViewModel viewModel;
  const StockView(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeaderText(viewModel.companyName),
            Row(
              children: [
                CurrencyText(viewModel.getTotalInvestedAmount()),
                PresentageText(viewModel.preformancePresentage),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SubHeaderText('Invested ${viewModel.getTotalInvested()}'),
            SubHeaderText('\$${viewModel.avaragePrice} Avg'),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SubHeaderText('Quantity ${viewModel.quantity}'),
            SubHeaderText('\$${viewModel.ltp} LTP'),
          ],
        ),
      ]),
    );
  }
}
