import 'dart:ui';

import 'coin_model.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<CoinModel> staticCryptoList = [
  CoinModel(
    coin: 'BTC',
    svg: 'images/bitcoin.svg',
    gradient: [Color(0xff170ADD), Color(0xff5A0C7D)],
  ),
  CoinModel(
    coin: 'DOGE',
    svg: 'images/doge.svg',
    gradient: [Color(0xffFF193A), Color(0xffFF7F11)],
  ),
  CoinModel(
    coin: 'LTC',
    svg: 'images/litecoin.svg',
    gradient: [Color(0xff170ADD), Color(0xff5A0C7D)],
  ),
  CoinModel(
    coin: 'SHIBA',
    svg: 'images/shiba.svg',
    gradient: [Color(0xffFF193A), Color(0xffFF7F11)],
  ),
  CoinModel(
    coin: 'FLUX',
    svg: 'images/flux.svg',
    gradient: [Color(0xff170ADD), Color(0xff5A0C7D)],
  ),
  CoinModel(
    coin: 'BTC',
    svg: 'images/bitcoin.svg',
    gradient: [Color(0xffFF193A), Color(0xffFF7F11)],
  ),
  CoinModel(
    coin: 'DOGE',
    svg: 'images/doge.svg',
    gradient: [Color(0xff170ADD), Color(0xff5A0C7D)],
  ),
  CoinModel(
    coin: 'PIRATE',
    svg: 'images/pirate.svg',
    gradient: [Color(0xffFF193A), Color(0xffFF7F11)],
  ),
  CoinModel(
    coin: 'LTC',
    svg: 'images/litecoin.svg',
    gradient: [Color(0xff170ADD), Color(0xff5A0C7D)],
  ),
  CoinModel(
    coin: 'FLUX',
    svg: 'images/flux.svg',
    gradient: [Color(0xffFF193A), Color(0xffFF7F11)],
  ),
  CoinModel(
    coin: 'SHIBA',
    svg: 'images/shiba.svg',
    gradient: [Color(0xff170ADD), Color(0xff5A0C7D)],
  ),
];
