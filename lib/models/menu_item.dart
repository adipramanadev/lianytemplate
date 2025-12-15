import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final String route;
  final List<MenuItem>? children;

  MenuItem({
    required this.title,
    required this.icon,
    required this.route,
    this.children,
  });
}
