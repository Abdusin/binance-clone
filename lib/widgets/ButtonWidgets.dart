import 'package:binance_clone/Models/OfferModel.dart';
import 'package:flutter/material.dart';

import 'package:binance_clone/utils/Colors.dart';

class TabButton extends StatelessWidget {
  const TabButton({Key? key, required this.text, this.isSelected = false}) : super(key: key);
  final String text;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        '$text',
        style: TextStyle(color: Colors.white),
      ),
      style: ButtonStyle(
        backgroundColor: isSelected ? MaterialStateProperty.all(AppColors.darkColor) : null,
      ),
    );
  }
}

class OfferBarButton extends StatelessWidget {
  const OfferBarButton({
    Key? key,
    required this.percent,
    required this.color,
    required this.offer,
  })  : assert(percent > 0 && percent < 100),
        super(key: key);
  final int percent;
  final Color color;
  final OfferModel offer;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(children: [
            Spacer(flex: 100 - percent),
            Expanded(
              flex: percent,
              child: Container(
                decoration: BoxDecoration(
                  color: color.withOpacity(0.25),
                ),
              ),
            ),
          ]),
          Row(
            children: [
              Text(
                offer.price,
                style: TextStyle(color: color, fontSize: 12),
              ),
              Spacer(),
              Text(
                offer.amount,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
