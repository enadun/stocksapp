import 'package:flutter/material.dart';
import 'package:flutter_module/portfolio/portfolio_view_model.dart';
import 'package:flutter_module/widgets/text_widgets.dart';

class SummeryView extends StatelessWidget {
  final ProtfolioViewModel viewModel;
  const SummeryView(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Row(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SubHeaderText('Total preformance'),
                  NormalText('*Till last trading day')
                ],
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SubHeaderText(viewModel.getTotalPreformance()),
                  NormalText(viewModel.getTotalPerformancePresentage()),
                ],
              )
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SubHeaderText('Today\'s preformance'),
                ],
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SubHeaderText(viewModel.getTodaysPreformance()),
                  NormalText(viewModel.getTodaysPreformancePresentage()),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
