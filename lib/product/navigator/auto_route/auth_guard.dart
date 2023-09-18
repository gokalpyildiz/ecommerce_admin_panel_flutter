// // ignore_for_file: dead_code, avoid_redundant_argument_values

// class AuthGuard extends AutoRouteGuard {
//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) {
//     // the navigation is paused until resolver.next() is called with either
//     // true to resume/continue navigation or false to abort navigation
//     const isResult = false;
//     if (isResult) {
//       // if user is authenticated we continue
//       resolver.next(true);
//     } else {
//       // we redirect the user to our login page
//       //router.pushWidget(const SettingView());
//     }
//   }
// }
