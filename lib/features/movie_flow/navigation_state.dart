import 'package:flutter/material.dart';

@immutable
class NavigationState {
  final PageController pageController;

  const NavigationState({
    required this.pageController,
  });

  NavigationState copyWith({
    PageController? pageController,
  }) {
    return NavigationState(
      pageController: pageController ?? this.pageController,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NavigationState && other.pageController == pageController;
  }

  @override
  int get hashCode {
    return pageController.hashCode;
  }
}
