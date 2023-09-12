import 'package:flutter/material.dart';

class BasicScaffold extends StatefulWidget {
  const BasicScaffold({
    required this.child,
    super.key,
    this.appBar,
    this.floatingActionButtonLocation,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.resizeToAvoidBottomInset = false,
    this.backgroundColor,
  });
  final Widget child;
  final Widget? floatingActionButton;
  final Widget? bottomSheet;
  final Widget? bottomNavigationBar;
  final PreferredSizeWidget? appBar;
  final bool? resizeToAvoidBottomInset;
  final Color? backgroundColor;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  @override
  _BasicScaffoldState createState() => _BasicScaffoldState();
}

class _BasicScaffoldState extends State<BasicScaffold> with StateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      appBar: widget.appBar,
      backgroundColor: widget.backgroundColor ?? Colors.white,
      body: Container(
        constraints: BoxConstraints.expand(
          height: MediaQuery.sizeOf(context).height,
        ),
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        child: widget.child,
      ),
      bottomSheet: widget.bottomSheet,
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      bottomNavigationBar: widget.bottomNavigationBar,
    );
  }
}

mixin StateMixin<T extends StatefulWidget> on State<T> {
  void waitForScreen(VoidCallback onComplete) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onComplete.call();
    });
  }
}
