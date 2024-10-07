import 'package:flutter/material.dart';

enum NavigationMenu {
  cosyAreas(
    Icons.beenhere_outlined,
    "Cosy areas",
  ),
  price(
    Icons.account_balance_wallet_outlined,
    "Price",
  ),
  infrastructure(
    Icons.shopping_basket_outlined,
    "Infrastructure",
  ),
  withoutAnyLayer(
    Icons.layers_outlined,
    "Without any layer",
  );

  final IconData icon;
  final String value;

  const NavigationMenu(
    this.icon,
    this.value,
  );
}

extension NavigationMenuExtension on NavigationMenu {
  bool get isCosyAreas => this == NavigationMenu.cosyAreas;
  bool get isPrice => this == NavigationMenu.price;
  bool get isInfrastructure => this == NavigationMenu.infrastructure;
  bool get isWithoutAnyLayer => this == NavigationMenu.withoutAnyLayer;
}
