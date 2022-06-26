import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_mvvm_firebase/views/login/login_view_model.dart';

class LoginView extends ViewModelBuilderWidget<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, LoginViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Form(
        child: Builder(builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextFormField(
                  validator: viewModel.validateEmail,
                  controller: viewModel.emailFieldController,
                  decoration: const InputDecoration(hintText: "Email Address"),
                ),
                TextFormField(
                  validator: viewModel.validatePassword,
                  controller: viewModel.passwordFieldController,
                  obscureText: true,
                  decoration: const InputDecoration(hintText: "Password"),
                ),
                ElevatedButton(
                    onPressed: () => viewModel.onLogin(context),
                    child: const Text("Login"))
              ],
            ),
          );
        }),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
}
