import 'package:flutter/material.dart';
import 'package:monipoint_translation_test_task/constants.dart';

class MapBubble extends StatelessWidget {
  const MapBubble({
    required this.mapValue,
    required this.textOpacity,
    required this.iconOpacity,
    required this.bubbleWidth,
    required this.showWithoutAnyLayer,
    super.key,
  });

  final String mapValue;
  final double textOpacity;
  final double iconOpacity;
  final double bubbleWidth;
  final bool showWithoutAnyLayer;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10.0),
      width: bubbleWidth,
      height: 48.0,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(defaultPadding),
          topRight: Radius.circular(defaultPadding),
          bottomRight: Radius.circular(defaultPadding),
        ),
        color: primaryColor,
      ),
      child: showWithoutAnyLayer
          ? Opacity(
              opacity: iconOpacity,
              child: Icon(
                Icons.apartment_outlined,
                color: whiteColor,
              ),
            )
          : Opacity(
              opacity: textOpacity,
              child: Text(
                mapValue,
                style: TextStyle(
                  color: whiteColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
    );
  }
}
