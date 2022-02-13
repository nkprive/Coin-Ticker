import 'dart:ui';

class CoinModel {
  final String coin;
  final String svg;
  final List<Color> gradient;
  final double exchange;

  const CoinModel({this.coin, this.svg, this.gradient, this.exchange = 0.0});
}
