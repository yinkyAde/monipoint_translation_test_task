import 'package:flutter/material.dart';

enum NavigationEnumeration {
  search(Icons.search),
  chat(Icons.sms),
  home(Icons.pentagon_rounded),
  favorite(Icons.favorite_rounded),
  profile(Icons.person);

  final IconData icon;

  const NavigationEnumeration(this.icon);
}

extension NavigationEnumerationExtention on NavigationEnumeration {
  bool get isSearch => this == NavigationEnumeration.search;
  bool get isChat => this == NavigationEnumeration.chat;
  bool get isHome => this == NavigationEnumeration.home;
  bool get isFavorite => this == NavigationEnumeration.favorite;
  bool get isProfile => this == NavigationEnumeration.profile;
}
