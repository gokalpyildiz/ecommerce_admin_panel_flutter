import 'package:ecommerce_yildiz_flutter/core/utils/widgets/ui_mixin.dart';
import 'package:ecommerce_yildiz_flutter/view/auth/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/theme/app_theme.dart';
import '../../../../core/utils/widgets/my_spacing.dart';
import '../../../../core/utils/widgets/my_text.dart';

class RememberMe extends StatefulWidget {
  const RememberMe({super.key});

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> with UIMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        var cubit = context.read<LoginCubit>();
        var state = context.watch<LoginCubit>().state;
        return InkWell(
          onTap: () => cubit.onChangeCheckBox(!state.isChecked),
          child: Row(
            children: [
              Checkbox(
                onChanged: cubit.onChangeCheckBox,
                value: state.isChecked,
                activeColor: theme.colorScheme.primary,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: getCompactDensity,
              ),
              MySpacing.width(16),
              MyText.bodyMedium(
                "Remember Me",
              ),
            ],
          ),
        );
      },
    );
  }
}
