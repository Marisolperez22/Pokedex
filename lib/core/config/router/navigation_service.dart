import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationService {
  static void goTo(BuildContext context, String path) {
    context.go(path);
  }

  static void push(BuildContext context, String path) {
    context.push(path);
  }

  static void goNamed(BuildContext context, String name) {
    context.goNamed(name);
  }

  static void pop(BuildContext context) {
    context.pop();
  }

}