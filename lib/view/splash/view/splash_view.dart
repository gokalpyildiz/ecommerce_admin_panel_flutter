import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_yildiz_flutter/core/components/basic_widgets/basic_scaffold.dart';
import 'package:ecommerce_yildiz_flutter/view/splash/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../../product/constants/image_constants.dart';

@RoutePage<String>()
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(),
      child: BasicScaffold(
        child: SafeArea(
          child: Stack(
            children: [
              buildCenterTextWelcome(context),
              buildAnimatedAlignIcon(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCenterTextWelcome(
    BuildContext context,
  ) {
    return BlocBuilder<SplashCubit, SplashState>(
      builder: (context, state) {
        return Center(
            child: AnimatedOpacity(
          duration: context.duration.durationLow,
          opacity: state.isFirstInit ? 0 : 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Welcome',
                style: context.general.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: context.general.colorScheme.primaryContainer,
                ),
                textAlign: TextAlign.center,
              ),
              const CircularProgressIndicator.adaptive(),
            ],
          ),
        ));
      },
    );
  }

  Widget buildAnimatedAlignIcon(
    BuildContext context,
  ) {
    return BlocBuilder<SplashCubit, SplashState>(
      builder: (context, state) {
        return AnimatedAlign(
          alignment:
              state.isFirstInit ? Alignment.center : Alignment.bottomCenter,
          duration: context.duration.durationLow,
          child: Image.asset(ImageConstants.appIcon.toPng,
              width: 100, height: 100),
        );
      },
    );
  }
}
