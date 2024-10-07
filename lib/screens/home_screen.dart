import 'package:flutter/material.dart';
import 'package:monipoint_translation_test_task/constants.dart';

import '../widgets/buy_offers_ui.dart';
import '../widgets/image_card.dart';
import '../widgets/rent_offers_ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  late final AnimationController animationController;


  late final Animation<double> appbarAnimation;
  late final Animation<double> appbarOpacity;

  late final Animation<double> nameOpacityAnimation;

  late final Animation<double> firstTextAnimation;
  late final Animation<double> secondTextAnimation;

  late final Animation<double> buyAndRentAnimation;

  late final Animation<Offset> animationSlider;

  late final Animation<double> kitchenCardAnimation;
  late final Animation<double> windowCardAnimation;

  late final Animation<double> bottomImageAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    );

    appbarAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.0,
          0.15,
          curve: Curves.easeIn,
        ),
      ),
    );

    appbarOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.13,
          0.15,
          curve: Curves.easeIn,
        ),
      ),
    );

    nameOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.15,
          0.18,
          curve: Curves.easeIn,
        ),
      ),
    );

    firstTextAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.18,
          0.24,
          curve: Curves.easeIn,
        ),
      ),
    );

    secondTextAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.22,
          0.28,
          curve: Curves.easeIn,
        ),
      ),
    );

    buyAndRentAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.18,
          0.32,
          curve: Curves.easeOutCirc,
          // curve: Curves.easeOutQuint,
        ),
      ),
    );

    animationSlider =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.32,
          0.40,
          curve: Curves.decelerate,
        ),
      ),
    );

    kitchenCardAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.40,
          0.50,
          curve: Curves.decelerate,
        ),
      ),
    );

    windowCardAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.55,
          0.65,
          curve: Curves.easeIn,
        ),
      ),
    );

    bottomImageAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.55,
          0.75,
          curve: Curves.easeIn,
        ),
      ),
    );

    // Start the animation
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) => Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xffF8F7F6),
                Color(0xffFAD9B2),
              ],
            ),
          ),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: false,
                title: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding - 6.0,
                    horizontal: defaultPadding,
                  ),
                  height: defaultPadding * 3.5,
                  width: appbarAnimation.value * 196,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Opacity(
                    opacity: appbarOpacity.value,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: backgroundColor,
                          size: 18.0,
                        ),
                        const SizedBox(
                          width: 4.0,
                        ),
                        const Flexible(
                          child: Text(
                            "Saint Petersburg",
                            style: TextStyle(
                              color: Color(0xffA5957E),
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                actions: [
                  Transform.scale(
                    scale: appbarAnimation.value,
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 48.0,
                      backgroundColor: primaryColor,
                      child: ClipOval(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: Image.asset('assets/images/passport.png', fit: BoxFit.cover),
                        ),
                    ),
                  ),),
                ],
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 40.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Opacity(
                            opacity: nameOpacityAnimation.value,
                            child: Text(
                              'Hi, Marina',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.w500,
                                color: backgroundColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          height: 96,
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: firstTextAnimation.value * 48,
                                color: Colors.transparent,
                                child: const Text(
                                  "let's select your",
                                  style: TextStyle(
                                    fontSize: 40.0,
                                    color: Color(0xff232220),
                                    height: 1,
                                  ),
                                ),
                              ),
                              Container(
                                height: secondTextAnimation.value * 48,
                                color: Colors.transparent,
                                child: const Text(
                                  "perfect place",
                                  style: TextStyle(
                                    fontSize: 40.0,
                                    color: Color(0xff232220),
                                    height: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 32.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Transform.scale(
                                  scale: buyAndRentAnimation.value,
                                  child: BuyOffersUi(
                                    value: buyAndRentAnimation.value * 1034,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 1,
                                child: Transform.scale(
                                  scale: buyAndRentAnimation.value,
                                  child: RentOffersUi(
                                    value: buyAndRentAnimation.value * 2212,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: defaultPadding * 2.0,
                        ),
                      ],
                    ),
                    Positioned.fill(
                      left: 0.0,
                      right: 0.0,
                      top: 208.0,
                      child: SlideTransition(
                        position: animationSlider,
                        child: Container(
                          padding: const EdgeInsets.all(defaultPadding / 8.0),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(32),
                            ),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              // Top Container
                              ImageCard(
                                assetPath: 'assets/images/kitchen.jpg',
                                sliderText: "Gladkova St., 25",
                                textOpacity: kitchenCardAnimation.value == 1
                                    ? kitchenCardAnimation.value
                                    : 0,
                                sliderTextAlignment: Alignment.center,
                                sliderWidth: kitchenCardAnimation.value *
                                    MediaQuery.of(context).size.width,
                                sliderHeight: 56.0,
                                height: 208.0,
                              ),

                              const SizedBox(
                                height: 10,
                              ),
                              // Bottom Containers
                              Expanded(
                                child: Row(
                                  children: [
                                    // Left Container
                                    Expanded(
                                      child: ImageCard(
                                        assetPath:
                                            'assets/images/chair_on_rug.jpg',
                                        sliderText: "Gubina St., 11",
                                        textOpacity:
                                            bottomImageAnimation.value == 1
                                                ? bottomImageAnimation.value
                                                : 0,
                                        sliderWidth: bottomImageAnimation
                                                .value *
                                            MediaQuery.of(context).size.width,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    // Right Containers
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: ImageCard(
                                              assetPath:
                                                  'assets/images/window.jpg',
                                              sliderText: "Trefoleva St., 43",
                                              textOpacity:
                                                  windowCardAnimation.value == 1
                                                      ? windowCardAnimation.value
                                                      : 0,
                                              sliderWidth:
                                                  windowCardAnimation.value *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .width,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Expanded(
                                            child: ImageCard(
                                              assetPath:
                                                  'assets/images/living_room.jpg',
                                              sliderText: "Sedova St., 22",
                                              textOpacity: bottomImageAnimation
                                                          .value ==
                                                      1
                                                  ? bottomImageAnimation.value
                                                  : 0,
                                              sliderWidth:
                                                  bottomImageAnimation.value *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .width,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
