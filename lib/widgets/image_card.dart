import 'package:flutter/material.dart';
import 'package:monipoint_translation_test_task/constants.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    required this.assetPath,
    required this.sliderWidth,
    this.sliderHeight = 40.0,
    required this.sliderText,
    required this.textOpacity,
    this.sliderTextAlignment = Alignment.centerLeft,
    this.height,
    super.key,
  });

  final String assetPath;
  final double sliderWidth;
  final double sliderHeight;
  final String sliderText;
  final double textOpacity;
  final Alignment sliderTextAlignment;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      width: double.infinity,
      height: height,
      padding: const EdgeInsets.only(
        left: defaultPadding - 6.0,
        bottom: defaultPadding - 6.0,
        right: defaultPadding - 6.0,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(32.0),
        ),
        image: DecorationImage(
          image: AssetImage(
            assetPath,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 10.0, top: 2.0, bottom: 2.0, right: 2.0),
        width: sliderWidth + sliderHeight,
        height: sliderHeight,
        decoration: BoxDecoration(
          color: backgroundColor.withAlpha(240),
          borderRadius: const BorderRadius.all(
            Radius.circular(32.0),
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: sliderTextAlignment,
              child: Opacity(
                opacity: textOpacity,
                child: Text(
                  sliderText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xff232220),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: CircleAvatar(
                radius: sliderHeight / 2.0,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.chevron_right,
                  color: backgroundColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
