import 'package:flutter/material.dart';

import 'layout.dart';

mixin LayoutMixin on State<Layout> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final GlobalKey<State<StatefulWidget>> scrollKey = GlobalKey();
}
