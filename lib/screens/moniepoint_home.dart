import 'package:flutter/material.dart';
import 'package:monipoint_translation_test_task/enumerations/navigation_enumeration.dart';

import '../constants.dart';
import '../widgets/custom_nav_item.dart';
import 'home_screen.dart';
import 'map_screen.dart';

class MoniepointHome extends StatefulWidget {
  const MoniepointHome({super.key});

  @override
  State<MoniepointHome> createState() => MoniepointHomeState();
}

class MoniepointHomeState extends State<MoniepointHome> with SingleTickerProviderStateMixin {

  late final AnimationController animationController;

  late final Animation<Offset> animationSlider;

  NavigationEnumeration selectedNavigation = NavigationEnumeration.home;

  Widget showSelectedScreen(NavigationEnumeration value) {
    if (value.isHome) {
      return const HomeScreen();
    }

    if (value.isSearch) {
      return const MapScreen();
    }

    return Container(
      color: backgroundColor,
    );
  }

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    animationSlider =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.88,
          1.0,
          curve: Curves.easeInSine,
        ),
      ),
    );

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
      extendBody: true,
      body: showSelectedScreen(selectedNavigation),
      bottomNavigationBar: SlideTransition(
        position: animationSlider,
        child: Container(
          margin: const EdgeInsets.only(
            left: defaultPadding * 3.5,
            bottom: defaultPadding + 2.0,
            right: defaultPadding * 2.0,
          ),
          padding: const EdgeInsets.symmetric(vertical: defaultPadding / 8.0, horizontal: defaultPadding / 2.0),
          height: defaultPadding * 4.0,
          decoration: const BoxDecoration(
            color: Color(0xff2B2B2B),
            borderRadius: BorderRadius.all(
              Radius.circular(50.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...NavigationEnumeration.values.map(
                (item) => SizedBox(
                  width: defaultPadding * 3.25,
                  height: defaultPadding * 3.25,
                  child: CustomNavItem(
                    icon: item.icon,
                    isActive: item == selectedNavigation,
                    onTap: () {
                      setState(() => selectedNavigation = item);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
