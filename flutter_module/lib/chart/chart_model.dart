class ChartData {
  String ticker;
  List<Result> results;

  ChartData(this.ticker, this.results);

  factory ChartData.fromJson(Map<String, dynamic> json) {
    final resultsJson = json['results'] as List;
    List<Result> results = resultsJson.map((j) => Result.fromJson(j)).toList();
    return ChartData(json['ticker'] as String, results);
  }
}

class Result {
  double h;
  int t;

  Result(this.h, this.t);

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(double.parse(json['h'].toString()), json['t'] as int);
  }
}
