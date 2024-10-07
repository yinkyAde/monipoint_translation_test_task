import 'package:flutter/material.dart';

import '../constants.dart';
import '../utils/number_util.dart';

class RentOffersUi extends StatelessWidget {
  const RentOffersUi({
    required this.value,
    super.key,
  });

  final double value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: defaultPadding,
        top: defaultPadding,
        right: defaultPadding,
        bottom: defaultPadding * 3.0,
      ),
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xffFDF8F2),
            Colors.white,
          ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          Text(
            "RENT",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: backgroundColor,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            NumberUtil.numberFormatter(value.toInt()),
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: backgroundColor,
              fontSize: 40.0,
            ),
          ),
          const SizedBox(
            height: 2.0,
          ),
          Text(
            "offers",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: backgroundColor,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
