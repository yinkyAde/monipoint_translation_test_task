import 'package:flutter/material.dart';
import 'package:monipoint_translation_test_task/enumerations/navigation_menu.dart';

import '../constants.dart';
import '../widgets/map_bubble.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> with TickerProviderStateMixin {
  late final AnimationController animationController;

  late final Animation<double> scaleAnimation;
  late final Animation<double> scaleMapBubbleAnimation;
  late final Animation<double> mapBubbleTextOpacity;

  late final AnimationController mapBubbleController;

  late final Animation<double> mapBubbleWidthAnimation;
  late final Animation<double> mapBubbleIconOpacityAnimation;

  double mapBubbleInitialWith = 96.0;
  bool _isWithoutAnyLayer = false;

  NavigationMenu _selectedPopup = NavigationMenu.price;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 0.40, curve: Curves.easeIn),
      ),
    );

    scaleMapBubbleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.50, 0.80, curve: Curves.easeIn),
      ),
    );

    mapBubbleTextOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.80, 1.0, curve: Curves.easeIn),
      ),
    );

    mapBubbleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    mapBubbleWidthAnimation = Tween<double>(begin: mapBubbleInitialWith, end: 48).animate(
      CurvedAnimation(
        parent: mapBubbleController,
        curve: const Interval(0.0, 1.0, curve: Curves.easeIn),
      ),
    );

    mapBubbleIconOpacityAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0, end: 0.5),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.5, end: 1),
        weight: 50,
      ),
    ]).animate(
      CurvedAnimation(
        parent: mapBubbleController,
        curve: const Interval(0.6, 0.8, curve: Curves.easeIn),
      ),
    );

    // Start animation
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    mapBubbleController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: Listenable.merge([
        animationController,
        mapBubbleController,
      ]),
      builder: (context, child) => Stack(
        children: [
          Image.asset(
            'assets/images/map.png',
            fit: BoxFit.cover,
            width: size.width,
            height: size.height,
            color: blackColor.withOpacity(0.5),
            colorBlendMode: BlendMode.darken,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                top: defaultPadding * 5.0,
                left: defaultPadding * 2.0,
                right: defaultPadding * 2.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Transform.scale(
                      scale: scaleAnimation.value,
                      alignment: Alignment.center,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: defaultPadding - 6.0,
                          horizontal: defaultPadding,
                        ),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(32),
                          ),
                        ),
                        height: defaultPadding * 3.5,
                        width: defaultPadding * 12.25,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.search_rounded,
                              color: greyColor,
                            ),
                            const SizedBox(
                              width: defaultPadding - 6.0,
                            ),
                            Text(
                              "Saint Petersburg",
                              style: TextStyle(
                                color: greyColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: defaultPadding - 6.0,
                  ),
                  Transform.scale(
                    scale: scaleAnimation.value,
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: (defaultPadding * 2.0) - 4.0,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.tune_rounded,
                        color: greyColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              width: double.infinity,
              height: size.height * 0.40,
              color: Colors.transparent,
              child: Stack(
                children: [
                  Positioned(
                    left: defaultPadding * 4.5,
                    child: Transform.scale(
                      scale: scaleMapBubbleAnimation.value,
                      alignment: Alignment.bottomLeft,
                      child: MapBubble(
                        mapValue: "10,3 mn P",
                        textOpacity: mapBubbleTextOpacity.value,
                        bubbleWidth: mapBubbleWidthAnimation.value,
                        showWithoutAnyLayer: _isWithoutAnyLayer,
                        iconOpacity: mapBubbleIconOpacityAnimation.value,
                      ),
                    ),
                  ),

                  Positioned(
                    left: defaultPadding * 5.5,
                    top: defaultPadding * 3.6,
                    child: Transform.scale(
                      scale: scaleMapBubbleAnimation.value,
                      alignment: Alignment.bottomLeft,
                      child: MapBubble(
                        mapValue: "11 mn P",
                        textOpacity: mapBubbleTextOpacity.value,
                        bubbleWidth: mapBubbleWidthAnimation.value,
                        showWithoutAnyLayer: _isWithoutAnyLayer,
                        iconOpacity: mapBubbleIconOpacityAnimation.value,
                      ),
                    ),
                  ),

                  Positioned(
                    right: defaultPadding * 2.0,
                    top: defaultPadding * 5.0,
                    child: Transform.scale(
                      scale: scaleMapBubbleAnimation.value,
                      alignment: Alignment.bottomLeft,
                      child: MapBubble(
                        mapValue: "7,8 mn P",
                        textOpacity: mapBubbleTextOpacity.value,
                        bubbleWidth: mapBubbleWidthAnimation.value,
                        showWithoutAnyLayer: _isWithoutAnyLayer,
                        iconOpacity: mapBubbleIconOpacityAnimation.value,
                      ),
                    ),
                  ),

                  // Bottom 3 map bubbles
                  Positioned(
                    right: defaultPadding * 3.5,
                    bottom: 0,
                    child: Transform.scale(
                      scale: scaleMapBubbleAnimation.value,
                      alignment: Alignment.bottomLeft,
                      child: MapBubble(
                        mapValue: "6,95 mn P",
                        textOpacity: mapBubbleTextOpacity.value,
                        bubbleWidth: mapBubbleWidthAnimation.value,
                        showWithoutAnyLayer: _isWithoutAnyLayer,
                        iconOpacity: mapBubbleIconOpacityAnimation.value,
                      ),
                    ),
                  ),

                  Positioned(
                    left: defaultPadding * 4.0,
                    bottom: defaultPadding * 5.0,
                    child: Transform.scale(
                      scale: scaleMapBubbleAnimation.value,
                      alignment: Alignment.bottomLeft,
                      child: MapBubble(
                        mapValue: "7,8 mn P",
                        textOpacity: mapBubbleTextOpacity.value,
                        bubbleWidth: mapBubbleWidthAnimation.value,
                        showWithoutAnyLayer: _isWithoutAnyLayer,
                        iconOpacity: mapBubbleIconOpacityAnimation.value,
                      ),
                    ),
                  ),

                  Positioned(
                    right: defaultPadding * 4.0,
                    bottom: defaultPadding * 6.0,
                    child: Transform.scale(
                      scale: scaleMapBubbleAnimation.value,
                      alignment: Alignment.bottomLeft,
                      child: MapBubble(
                        mapValue: "7,8 mn P",
                        textOpacity: mapBubbleTextOpacity.value,
                        bubbleWidth: mapBubbleWidthAnimation.value,
                        showWithoutAnyLayer: _isWithoutAnyLayer,
                        iconOpacity: mapBubbleIconOpacityAnimation.value,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                left: defaultPadding * 2.0,
                right: defaultPadding * 2.0,
                bottom: defaultPadding * 6.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Transform.scale(
                        scale: scaleAnimation.value,
                        alignment: Alignment.center,
                        child: PopupMenuButton(
                          initialValue: NavigationMenu.price,
                          offset: const Offset(0, -152),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(defaultPadding),
                            ),
                          ),
                          color: navMenuColor,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(
                            maxWidth: defaultPadding * 12.0,
                          ),
                          itemBuilder: (BuildContext context) {
                            return <PopupMenuEntry>[
                              ...NavigationMenu.values.map(
                                (menu) => PopupMenuItem(
                                  onTap: () {
                                    if (menu.isWithoutAnyLayer) {
                                      mapBubbleController.forward();
                                      setState(() {
                                        _selectedPopup = menu;
                                        _isWithoutAnyLayer = true;
                                        mapBubbleInitialWith = defaultPadding * 3.0;
                                      });
                                    }

                                    if (menu.isPrice) {
                                      mapBubbleController.reverse();
                                      setState(() {
                                        _selectedPopup = menu;
                                        _isWithoutAnyLayer = false;
                                        mapBubbleInitialWith = defaultPadding * 6.0;
                                      });
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(defaultPadding/2.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          menu.icon,
                                          size: defaultPadding + 4.0,
                                          color: _selectedPopup == menu
                                              ? primaryColor
                                              : greyColor,
                                        ),
                                        const SizedBox(
                                          width: defaultPadding / 4.0,
                                        ),
                                        Text(
                                          menu.value,
                                          style: TextStyle(
                                            color: _selectedPopup == menu
                                                ? primaryColor
                                                : greyColor,
                                            fontSize: 14.0,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ];
                          },
                          child: CircleAvatar(
                            radius: (defaultPadding * 2.0) - 4.0,
                            backgroundColor: greyColor.withAlpha(128),
                            child: Icon(
                              _selectedPopup.icon,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Transform.scale(
                        scale: scaleAnimation.value,
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 28,
                          backgroundColor: greyColor.withAlpha(128),
                          child: const Icon(
                            Icons.near_me_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Transform.scale(
                    scale: scaleAnimation.value,
                    alignment: Alignment.center,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding - 6.0,
                        horizontal: defaultPadding,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xff737373).withAlpha(128),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(defaultPadding * 2.0),
                        ),
                      ),
                      height: defaultPadding * 3.5,
                      width: defaultPadding * 10.5,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.sort_rounded,
                            color: Colors.white,
                          ),
                          Text(
                            "List of variants",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
