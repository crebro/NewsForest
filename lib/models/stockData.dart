class StockData {
  String name;
  double numberOfTransactions;
  double maxPrice;
  double minPrice;
  double closingPrice;
  double tradedShares;
  double amount;
  double difference;
  double previousClosing;

  StockData(
      {this.name,
      this.numberOfTransactions,
      this.maxPrice,
      this.minPrice,
      this.closingPrice,
      this.amount,
      this.difference,
      this.tradedShares,
      this.previousClosing});
}
