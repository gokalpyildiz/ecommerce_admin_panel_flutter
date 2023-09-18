import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/widgets/validator/my_form_validator.dart';
import '../../../core/utils/widgets/validator/my_validators.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.context) : super(LoginState()) {
    //onInit();
  }
  MyFormValidator basicValidator = MyFormValidator();
  BuildContext context;
  final String dummyEmail = "jaliri@gmail.com";
  final String dummyPassword = "1234567";
  void onChangeCheckBox(bool? value) {
    //isChecked = value ?? isChecked;
    //update();
    //setState(() {});
    emit(state.copyWith(isChecked: value ?? state.isChecked));
  }

  Future<void> onInit() async {
    emit(state.copyWith(loading: true));
    basicValidator.addField('email',
        required: true,
        label: "Email",
        validators: [MyEmailValidator()],
        controller: TextEditingController(text: dummyEmail));

    basicValidator.addField('password',
        required: true,
        label: "Password",
        validators: [MyLengthValidator(min: 6, max: 10)],
        controller: TextEditingController(text: dummyPassword));
    emit(state.copyWith(loading: false));
  }

  Future<void> onLogin() async {
    emit(state.copyWith(loading: true));
    Duration(seconds: 2);
    if (basicValidator.validateForm()) {
      emit(state.copyWith(loading: true));
      //loading = true;
      //update();
      //setState(() {});
      //var errors = await AuthService.loginUser(basicValidator.getData());
      var errors = null;
      if (errors != null) {
        //basicValidator.addErrors(errors);
        basicValidator.validateForm();
        basicValidator.clearErrors();
      } else {
        // String nextUrl =
        //     Uri.parse(ModalRoute.of(Get.context!)?.settings.name ?? "")
        //             .queryParameters['next'] ??
        //         "/dashboard";
        // Get.toNamed(
        //   nextUrl,
        // );
        //context.router.replaceNamed(AppRoute.dashboard);
        Get.toNamed('/dashboard');
      }
      emit(state.copyWith(loading: false));
      //loading = false;
      //update();
      //setState(() {});
    }
    emit(state.copyWith(loading: false));
    //context.router.replaceNamed(AppRoute.dashboard);
    Get.toNamed('/dashboard');
  }
}
