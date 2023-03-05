class StockData {
  List<Stock> stocks;

  StockData(this.stocks);

  factory StockData.fromJson(Map<String, dynamic> json) {
    final stocksJson = json['stocks'] as List;
    List<Stock> stocks = stocksJson.map((j) => Stock.fromJson(j)).toList();
    return StockData(stocks);
  }
}

class Stock {
  String symbol;
  String companyName;
  double avgPrice;
  double quantity;
  double ltp;

  Stock(this.symbol, this.companyName, this.avgPrice, this.quantity, this.ltp);

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      json['symbol'] as String,
      json['companyName'] as String,
      double.parse(json['avgPrice'].toString()),
      double.parse(json['quantity'].toString()),
      double.parse(json['ltp'].toString()),
    );
  }
}
