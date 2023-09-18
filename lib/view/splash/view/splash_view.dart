import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:ecommerce_yildiz_flutter/core/components/basic_widgets/basic_scaffold.dart';
import 'package:ecommerce_yildiz_flutter/product/navigator/auto_route/app_router.dart';
import 'package:ecommerce_yildiz_flutter/view/splash/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kartal/kartal.dart';

import '../../../product/constants/image_constants.dart';
import '../../../product/navigator/go_router/go_app_router.dart';

//@RoutePage<String>()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with AfterLayoutMixin<SplashView> {
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    _openloginOrHomePage(DateTime.now(), context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(),
      child: BasicScaffold(
        child: SafeArea(
          child: Stack(
            children: [
              buildAnimatedAlignIcon(context),
              buildCenterTextWelcome(context),
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
              SizedBox(height: 100),
              Text(
                'Hello World',
                style: context.general.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: context.general.colorScheme.primaryContainer,
                ),
                textAlign: TextAlign.center,
              ),
              //const CircularProgressIndicator.adaptive(),
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
          alignment: state.isFirstInit ? Alignment.topCenter : Alignment.center,
          duration: context.duration.durationNormal,
          child:
              Image.asset(ImagePath.instance.appIcon, width: 100, height: 100),
        );
      },
    );
  }

  Future<void> _openloginOrHomePage(DateTime from, BuildContext context) {
    return Future.delayed(
        Duration(seconds: delayThreeSeconds(from, DateTime.now())), () {
      //context.router.replaceNamed(AppRoute.login);
      //context.replaceNamed(GoAppRoute.login);
      context.replace(GoAppRoute.login);
    });
  }

  int delayThreeSeconds(DateTime from, DateTime to) =>
      (to.difference(from)).inSeconds < 3 ? 3 : 0;
}
