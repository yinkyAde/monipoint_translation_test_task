import 'package:flutter/material.dart';
import 'package:monipoint_translation_test_task/constants.dart';

import '../utils/number_util.dart';


class BuyOffersUi extends StatelessWidget {
  const BuyOffersUi({
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
        bottom: defaultPadding * 3,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: primaryColor,
        shape: BoxShape.circle,
      ),
      child: Column(
        children: [
          Text(
            "BUY",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: whiteColor,
              fontSize: defaultPadding,
            ),
          ),
          const SizedBox(
            height: defaultPadding + 8.0,
          ),
          Text(
            NumberUtil.numberFormatter(value.toInt()),
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: whiteColor,
              fontSize: 40,
            ),
          ),
          const SizedBox(
            height: (defaultPadding/4.0) - 2.0,
          ),
          Text(
            "offers",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: whiteColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
