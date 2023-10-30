import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:boycott/constants.dart';

class CustomLoader extends StatelessWidget {
  final Color? color;
  const CustomLoader({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: CircularProgressIndicator(
    //     color:color?? appPrimaryColor,
    //   ),
    // );
    return Center(
        child: cupertino.CupertinoActivityIndicator(
      color: color ?? appPrimaryColor,
    ));
    // return cupertino.CupertinoActivityIndicator
  }
}
