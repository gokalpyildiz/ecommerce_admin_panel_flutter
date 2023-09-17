import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_yildiz_flutter/view/auth/cubit/login_cubit.dart';
import 'package:ecommerce_yildiz_flutter/view/auth/view/login_mixin.dart';
import 'package:ecommerce_yildiz_flutter/view/auth/view/subwidgets.dart/login_button.dart';
import 'package:ecommerce_yildiz_flutter/view/auth/view/subwidgets.dart/remember_me.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../core/enums/myscreen_media_type.dart';
import '../../../core/utils/widgets/my_button.dart';
import '../../../core/utils/widgets/my_flex.dart';
import '../../../core/utils/widgets/my_flex_item.dart';
import '../../../core/utils/widgets/my_spacing.dart';
import '../../../core/utils/widgets/my_text.dart';
import '../../../core/utils/widgets/my_text_style.dart';
import '../../../core/utils/widgets/ui_mixin.dart';
import '../../../product/constants/image_constants.dart';
import '../../../product/utility/layouts/auth_layout.dart';
import '../../../product/utility/layouts/my_responsive.dart';
import '../../../product/utility/widgets/images.dart';

@RoutePage<String>()
class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    with SingleTickerProviderStateMixin, UIMixin, LoginMixin {
  //late LoginController controller;

  @override
  void initState() {
    super.initState();
    //controller = Get.put(LoginController());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginCubit(context)..onInit(),
        child: AuthLayout(
            child: Padding(
          padding: MySpacing.all(16),
          child: MyFlex(
            contentPadding: false,
            children: [
              MyFlexItem(
                sizes: "lg-6",
                child: MyResponsive(
                  builder: (_, __, type) {
                    return type == MyScreenMediaType.xxl
                        ? Image.asset(
                            Images.login[3],
                            fit: BoxFit.cover,
                            height: 500,
                          )
                        : type == MyScreenMediaType.xl
                            ? Image.asset(
                                ImagePath.instance.loginImage,
                                fit: BoxFit.cover,
                                height: 500,
                              )
                            // ? Center(
                            //     child: Image.asset(
                            //       ImageConstants.appIcon.toPng,
                            //       fit: BoxFit.cover,
                            //       height: 100,
                            //     ),
                            //   )
                            : type == MyScreenMediaType.lg
                                ? Image.asset(
                                    Images.login[3],
                                    fit: BoxFit.cover,
                                    height: 500,
                                  )
                                : const SizedBox();
                  },
                ),
              ),
              MyFlexItem(
                sizes: "lg-6",
                child: Padding(
                  padding: MySpacing.y(28),
                  child: Form(
                    key: basicValidator.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: MyText.titleLarge(
                            "Welcome",
                            fontWeight: 600,
                            fontSize: 24,
                          ),
                        ),
                        Center(
                          child: MyText.bodyMedium(
                            "Login your account",
                            fontSize: 16,
                          ),
                        ),
                        MySpacing.height(40),
                        MyText.bodyMedium(
                          "Your Email",
                        ),
                        MySpacing.height(8),
                        _email(),
                        MySpacing.height(16),
                        MyText.labelMedium(
                          "password".tr(),
                        ),
                        MySpacing.height(8),
                        _password(context),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RememberMe(),
                            MyButton.text(
                              onPressed: () {
                                goToForgotPassword(context);
                              },
                              elevation: 0,
                              padding: MySpacing.xy(8, 0),
                              splashColor:
                                  contentTheme.secondary.withOpacity(0.1),
                              child: MyText.labelSmall(
                                'Forgot Password?',
                                color: contentTheme.secondary,
                              ),
                            ),
                          ],
                        ),
                        MySpacing.height(40),
                        LoginButton(),
                        Center(
                          child: MyButton.text(
                            onPressed: gotoRegister,
                            elevation: 0,
                            padding: MySpacing.x(16),
                            splashColor:
                                contentTheme.secondary.withOpacity(0.1),
                            child: MyText.labelMedium(
                              'I havent Account',
                              color: contentTheme.secondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )));
  }

  Widget _password(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        var cubit = context.read<LoginCubit>();
        return TextFormField(
          validator: basicValidator.getValidation('password'),
          controller: basicValidator.getController('password'),
          initialValue: cubit.dummyPassword,
          keyboardType: TextInputType.visiblePassword,
          obscureText: !showPassword,
          decoration: InputDecoration(
              labelText: "Password",
              labelStyle: MyTextStyle.bodySmall(xMuted: true),
              border: outlineInputBorder,
              prefixIcon: const Icon(
                LucideIcons.lock,
                size: 20,
              ),
              suffixIcon: InkWell(
                onTap: onChangeShowPassword,
                child: Icon(
                  showPassword ? LucideIcons.eye : LucideIcons.eyeOff,
                  size: 20,
                ),
              ),
              contentPadding: MySpacing.all(16),
              isCollapsed: true,
              floatingLabelBehavior: FloatingLabelBehavior.never),
        );
      },
    );
  }

  Widget _email() {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        var cubit = context.read<LoginCubit>();
        return TextFormField(
          validator: basicValidator.getValidation('email'),
          controller: basicValidator.getController('email'),
          initialValue: cubit.dummyEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              labelText: "Email Address",
              labelStyle: MyTextStyle.bodySmall(xMuted: true),
              border: outlineInputBorder,
              prefixIcon: const Icon(
                LucideIcons.mail,
                size: 20,
              ),
              contentPadding: MySpacing.all(16),
              isCollapsed: true,
              floatingLabelBehavior: FloatingLabelBehavior.never),
        );
      },
    );
  }
}
