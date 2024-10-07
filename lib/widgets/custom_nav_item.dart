import 'package:flutter/material.dart';
import 'package:monipoint_translation_test_task/constants.dart';

class CustomNavItem extends StatefulWidget {
  const CustomNavItem({
    required this.icon,
    required this.isActive,
    required this.onTap,
    super.key,
  });

  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  @override
  State<CustomNavItem> createState() => CustomNavItemState();
}

class CustomNavItemState extends State<CustomNavItem> with TickerProviderStateMixin {

  late final AnimationController animationController;

  late final Animation<double> initialContainerSize;
  late final Animation<double> initialBorderSize;

  late final Animation<double> secondContainerSize;
  late final Animation<double> secondBorderSize;

  bool showColor = false;
  bool showOuterCircle = false;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..addStatusListener((status) {
        if (status == AnimationStatus.forward) {
          setState(() {
            showColor = true;

            Future.delayed(const Duration(milliseconds: 375), () {
              showOuterCircle = true;
            });

            Future.delayed(const Duration(milliseconds: 900), () {
              showOuterCircle = false;
            });

            Future.delayed(const Duration(milliseconds: 1125), () {
              showColor = false;
            });
          });
        }
      });

    initialContainerSize = Tween<double>(begin: 58, end: 40).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.0,
          0.25,
          curve: Curves.easeIn,
        ),
      ),
    );

    initialBorderSize = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1, end: 8),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 8, end: 1),
        weight: 50,
      ),
    ]).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 0.75, curve: Curves.easeIn),
      ),
    );

    secondContainerSize = Tween<double>(begin: 40, end: 58).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.25,
          0.50,
          curve: Curves.easeIn,
        ),
      ),
    );

    secondBorderSize = Tween<double>(begin: 8, end: 0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.25,
          0.50,
          curve: Curves.easeIn,
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        widget.onTap();
        animationController
          ..reset()
          ..forward();
      },
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) => Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 375),
              curve: Curves.decelerate,
              alignment: Alignment.center,
              height: showColor
                  ? 40.0
                  : widget.isActive
                      ? 52.0
                      : 40.0,
              width: showColor
                  ? 40.0
                  : widget.isActive
                      ? 52.0
                      : 40.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: showColor
                    ? Colors.transparent
                    : widget.isActive
                        ? primaryColor
                        : greyColor,
              ),
              child: Icon(
                widget.icon,
                color: whiteColor,
              ),
            ),
            widget.isActive
                ? Container(
                    padding: const EdgeInsets.all(2.0),
                    height: initialContainerSize.value,
                    width: initialContainerSize.value,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: showColor ? whiteColor : Colors.transparent,
                        width: initialBorderSize.value,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            widget.isActive
                ? Container(
                    padding: const EdgeInsets.all(2.0),
                    height: secondContainerSize.value,
                    width: secondContainerSize.value,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: showOuterCircle
                            ? whiteColor
                            : Colors.transparent,
                        width: secondBorderSize.value,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
