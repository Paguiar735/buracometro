import 'package:buracometro/modules/core/utils/themes.dart';
import 'package:flutter/material.dart';

class BaseAppStructure extends StatelessWidget {
  final AppBar? appBar;
  final Widget body;
  final BottomAppBar? bottomNavigationBar;

  const BaseAppStructure(
      {Key? key, this.appBar, required this.body, this.bottomNavigationBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBar ?? AppBar(
          leading: const Icon(Icons.account_circle),
          actions: const [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(Icons.more_vert_outlined),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: AppThemes.highLightColor,
          onPressed:  () {},
        ),
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: bottomNavigationBar,
        body: body,
      ),
    );
  }
}
