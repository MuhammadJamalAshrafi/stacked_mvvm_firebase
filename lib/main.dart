import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stacked_mvvm_firebase/base/app_setup.locator.dart';
import 'package:stacked_mvvm_firebase/base/app_view.dart';
import 'package:stacked_mvvm_firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupLocator();
  runApp(const AppView());
}
