import 'package:ecommerce_yildiz_flutter/core/utils/widgets/ui_mixin.dart';
import 'package:ecommerce_yildiz_flutter/view/auth/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/theme/app_theme.dart';
import '../../../../core/utils/widgets/my_button.dart';
import '../../../../core/utils/widgets/my_spacing.dart';
import '../../../../core/utils/widgets/my_text.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({super.key});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> with UIMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        var cubit = context.read<LoginCubit>();
        return Center(
          child: MyButton.rounded(
            onPressed: cubit.onLogin,
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            backgroundColor: contentTheme.primary,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                state.loading
                    ? SizedBox(
                        height: 14,
                        width: 14,
                        child: CircularProgressIndicator(
                          color: theme.colorScheme.onPrimary,
                          strokeWidth: 1.2,
                        ),
                      )
                    : Container(),
                if (state.loading) MySpacing.width(16),
                MyText.bodySmall(
                  'Login',
                  color: contentTheme.onPrimary,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
