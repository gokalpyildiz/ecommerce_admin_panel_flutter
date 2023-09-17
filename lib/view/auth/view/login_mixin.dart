import 'package:ecommerce_yildiz_flutter/view/auth/view/login_view.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/widgets/validator/my_form_validator.dart';

mixin LoginMixin on State<LoginView> {
  GlobalKey<FormState> formKey = GlobalKey();
  MyFormValidator basicValidator = MyFormValidator();

  bool showPassword = false;

  void onChangeShowPassword() {
    showPassword = !showPassword;
    //update();
    setState(() {});
  }

  // void onChangeCheckBox(bool? value) {
  //   isChecked = value ?? isChecked;
  //   //update();
  //   //setState(() {});
  // }

  // Future<void> onLogin() async {
  //   if (basicValidator.validateForm()) {
  //     loading = true;
  //     //update();
  //     setState(() {});
  //     //var errors = await AuthService.loginUser(basicValidator.getData());
  //     var errors = null;
  //     if (errors != null) {
  //       //basicValidator.addErrors(errors);
  //       basicValidator.validateForm();
  //       basicValidator.clearErrors();
  //     } else {
  //       // String nextUrl =
  //       //     Uri.parse(ModalRoute.of(Get.context!)?.settings.name ?? "")
  //       //             .queryParameters['next'] ??
  //       //         "/dashboard";
  //       // Get.toNamed(
  //       //   nextUrl,
  //       // );
  //       //todo navigate to dashboard
  //     }
  //     loading = false;
  //     //update();
  //     setState(() {});
  //   }
  // }

  void goToForgotPassword(BuildContext context) {
    //Get.toNamed('/auth/forgot_password');
    //todo navigate to forgot password
  }
  void gotoRegister() {
    //Get.offAndToNamed('/auth/register');
    //todo navigate to register
  }
}
