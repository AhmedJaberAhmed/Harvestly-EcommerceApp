import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';
import 'Notification_widget.dart';

AppBar BuildAppBar() {
  return AppBar(centerTitle: true,
    actions: [
      Padding(padding: EdgeInsets.symmetric(horizontal: 16),
          child:
          Favourites_widget()

      ),
    ],
    backgroundColor:  Colors.transparent,
    elevation: 0,
    title: Text("الأكثر مبيعا",style: TextStyles.bold19,
    textAlign: TextAlign.center,),
  );
}