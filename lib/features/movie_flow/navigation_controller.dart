import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_recommandation_app/features/movie_flow/movie_flow_controller.dart';
import 'package:movie_recommandation_app/features/movie_flow/movie_flow_state.dart';
import 'package:movie_recommandation_app/features/movie_flow/navigation_state.dart';

final navigationControllerProvider =
    StateNotifierProvider.autoDispose<NavigationController, NavigationState>(
  (ref) {
    final movieFlow = ref.watch(movieFlowControllerProvider);
    return NavigationController(
      NavigationState(
        pageController: PageController(),
      ),
      movieFlow,
    );
  },
);

class NavigationController extends StateNotifier<NavigationState> {
  late MovieFlowState movieFlow;

  NavigationController(NavigationState state, MovieFlowState movieFlow)
      : super(state);

  void nextPage() {
    if (state.pageController.page! >= 1) {
      if (!movieFlow.genres.any((element) => element.isSelected)) {
        return;
      }
    }

    state.pageController.nextPage(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,
    );
  }

  void previousPage() {
    state.pageController.previousPage(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    state.pageController.dispose();
    super.dispose();
  }
}
