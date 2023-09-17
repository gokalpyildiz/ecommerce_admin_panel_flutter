import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

import '../../../core/utils/theme/admin_theme.dart';
import '../../../core/utils/theme/app_theme.dart';
import '../../../core/utils/widgets/my_container.dart';
import '../../../core/utils/widgets/my_flex.dart';
import '../../../core/utils/widgets/my_flex_item.dart';
import '../../../core/utils/widgets/my_spacing.dart';
import 'my_responsive.dart';

class AuthLayout extends StatelessWidget {
  final Widget? child;

  //final AuthLayoutController controller = AuthLayoutController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final scrollKey = GlobalKey();

  AuthLayout({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return MyResponsive(builder: (BuildContext context, _, screenMT) {
      // return GetBuilder(
      //     init: controller,
      //     builder: (controller) {
      return screenMT.isMobile ? mobileScreen(context) : largeScreen(context);
      //});
    });
  }

  Widget mobileScreen(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        padding: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
        height: MediaQuery.of(context).size.height,
        color: theme.cardTheme.color,
        child: SingleChildScrollView(
          key: scrollKey,
          child: child,
        ),
      ),
    );
  }

  Widget largeScreen(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.blue,
        body: Stack(
          children: [
            const Center(
              child: Opacity(
                  opacity: 0.8,
                  child: BlurHash(hash: "LDLz?TMI00%N00I=M{%M00Rj~qRP")),
            ),
            Container(
              margin: MySpacing.top(100),
              width: MediaQuery.of(context).size.width,
              child: MyFlex(
                wrapAlignment: WrapAlignment.center,
                wrapCrossAlignment: WrapCrossAlignment.start,
                runAlignment: WrapAlignment.center,
                spacing: 0,
                runSpacing: 0,
                children: [
                  MyFlexItem(
                    sizes: "xxl-8 lg-8 md-9 sm-10",
                    // sizes: "xxl-3 lg-4 md-6 sm-8",
                    child: MyContainer(
                      paddingAll: 0,
                      color: AdminTheme.theme.contentTheme.background
                          .withAlpha(230),
                      child: child ?? Container(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
