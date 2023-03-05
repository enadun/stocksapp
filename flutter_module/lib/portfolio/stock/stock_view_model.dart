import 'package:flutter_module/portfolio/portfolio_model.dart';

class StockViewModel {
  final Stock stock;
  StockViewModel(this.stock);

  get companyName => stock.companyName.toUpperCase();

  String getTotalInvestedAmount() {
    final value = stock.quantity * stock.avgPrice;
    return '\$${value.toStringAsFixed(2)}';
  }

  get preformancePresentage => (stock.avgPrice / stock.ltp - 1) * 100;

  String getTotalInvested() {
    final value = stock.quantity * stock.ltp;
    return '\$${value.toStringAsFixed(2)}';
  }

  get avaragePrice => stock.avgPrice.toStringAsFixed(2);

  get quantity => stock.quantity.toStringAsFixed(2);

  get ltp => stock.ltp.toStringAsFixed(2);
}

// 1. Company name - use `companyName` from API
// 2. Total invested amount - use formula => quantity * avgPrice quantity
// 3. Total quantity - use `quantity` from API
// 4. Current value - use formula => quantity * ltp
// 5. P&L - use formula => Current value - Invested amount
// 6. P&L % - use formula => (P&L / Invested amount) * 100
 
// 7. Average price - use `avgPrice` from API
// 8. Last traded price - use `ltp` from API
