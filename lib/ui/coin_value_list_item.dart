import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utilities/coin_api.dart';

CoinDataApi coinDataApi = CoinDataApi();

class CoinValueListItem extends StatefulWidget {
  final List<Color> gradient;
  final SvgPicture svg;
  final String coin;
  final String currency;
  const CoinValueListItem({this.gradient, this.svg, this.coin, this.currency});

  @override
  _CoinValueListItemState createState() => _CoinValueListItemState();
}

class _CoinValueListItemState extends State<CoinValueListItem> {
  String tileText;

  void buildTileText(coin, currency) async {
    String exchangeRate = await coinDataApi.getExchange(coin, currency);

    setState(() {
      tileText = '1 ${widget.coin} = $exchangeRate ${widget.currency}';
    });
  }

  @override
  void initState() {
    buildTileText(widget.coin, widget.currency);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.0),
          bottomLeft: Radius.circular(50.0),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment
              .bottomRight, // 10% of the width, so there are ten blinds.
          colors: widget.gradient, // red to yellow
          // tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 9,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: widget.svg,
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            tileText != null
                ? tileText
                : '1 ${widget.coin} = loading.. ${widget.currency}',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
