import 'dart:async';

import 'package:flutter/material.dart';
import '../../Apis/auth.dart';
import '../../SizeConfig.dart';
import '../../constants.dart';
import 'LoginScreen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getData() async {
      var userLoggedIn = await isUserLoggedIn();
      try {
        if (userLoggedIn) {
          var userId = await getUserDetails();
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => LoginScreen()));

        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => LoginScreen()));
        }
      } catch (err) {
        print('errr-------$err');
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen()));
      }
    }

    SizeConfig().init(context);
    Timer(const Duration(seconds: 3), () => getData());

    var assetsImage = const AssetImage(
        'assets/images/Logo.png'); //<- Creates an object that fetches an image.
    var image = Image(
        image: assetsImage,
        height: SizeConfig.screenHeight / 5,
        width: SizeConfig.screenHeight / 5);
    //<- Creates a widget that displays an image.

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: appPrimaryColor),
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: Center(child: image),
        ), //<- place where the image appears
      ),
    );
  }
}
