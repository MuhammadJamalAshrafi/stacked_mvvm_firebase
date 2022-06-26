import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_mvvm_firebase/base/app_setup.locator.dart';
import 'package:stacked_mvvm_firebase/base/app_setup.router.dart';
import 'package:stacked_mvvm_firebase/services/auth_service.dart';
import 'package:stacked_mvvm_firebase/views/home/home_view.dart';
import 'package:stacked_mvvm_firebase/views/login/login_view.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  final BuildContext context;

  SplashViewModel(this.context);

  void init() async {
    await Future.delayed(const Duration(seconds: 2));
    if (locator<AuthService>().email != null) {
      locator<NavigationService>().pushNamedAndRemoveUntil(Routes.homeView);
      return;
    }
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (_) => const LoginView()), (route) => false);
  }
}
