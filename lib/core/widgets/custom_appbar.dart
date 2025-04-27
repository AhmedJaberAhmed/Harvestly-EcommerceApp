import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

AppBar buildAppBar(context, {required String title,bool showBackButton=true}) {
  return AppBar(backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyles.bold19,
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Visibility(
          visible: showBackButton,
          child: GestureDetector(onTap: () {
            Navigator.of(context).pop();
          }, child: Icon(Icons.arrow_forward_ios)),
        ),
      ),
    ],
  );
}
