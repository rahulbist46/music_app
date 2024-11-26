import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/src/utilities/navigation.dart';
import 'package:music_app/src/utilities/pref_keys.dart';
import 'package:music_app/src/services/storage_service.dart';

class OnBoardingCubit extends Cubit<int> {
  OnBoardingCubit() : super(0);
  final PageController controller = PageController();
  // Note: we are checking for state >= 2 because at this time there are total 3 onboarding screens.
  // So to avoid any unnecessary increments we are checking only to 2;

  void forward() {
    if (state >= 2) return;
    _animateToPage(state + 1);
    emit(state + 1);
  }

  void backword() {
    if (state >= 0) return;
    _animateToPage(state - 1);
    emit(state - 1);
  }

  void changePage(page) {
    emit(page);
  }

  void _animateToPage(page) {
    controller.animateToPage(page,
        duration: const Duration(seconds: 2), curve: Curves.bounceIn);
  }

  void finishOnBoarding(BuildContext context) {
    StorageService.instance.saveBool(PrefKeys.onBoardingCompleted, true);
    Navigator.pushNamedAndRemoveUntil(
      context,
      Navigation.getInitialRoute(),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
