import 'package:flutter/material.dart';

import 'CustomTexts.dart';

AppBar appBar(
    {String? title,
    Color appBarColor = Colors.transparent,
    Color titleColor = Colors.black,
    bool implyLeading = true,
    required BuildContext context,
    List<Widget>? actions}) {
  return AppBar(
    toolbarHeight: 70,
    automaticallyImplyLeading: false,
    backgroundColor: appBarColor,
    elevation: 0,
    title: title == null
        ? null
        : AppBarHeadingText(
            text: title,
            color: titleColor,
            fontSize: 18,
          ),
    leading: implyLeading
        ? IconButton(
            icon: Icon(
              Icons.chevron_left_outlined,
              color: Colors.black,
              size: 25,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        : null,
    actions: actions,
  );
}
