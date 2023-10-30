import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:boycott/widgets/loader.dart';
import '../../Apis/Webservices.dart';
import '../../Models/LoginResponse.dart';
import '../../constants.dart';
//import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  Login createState() => Login();
}

class Login extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  final _text = TextEditingController();
  bool _validate = false;
  String code = "+1";

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  var IsLoding = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: appPrimaryBackgroundCardColor,
      body: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(color: appPrimaryColor),
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: appPrimaryColor,
                          ),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.zero,
                              bottomRight: Radius.zero),
                          color: appPrimaryColor),
                      child: Column(children: [
                        const SizedBox(
                          height: 65,
                        ),
                        Center(
                          child: SizedBox(
                            height: 65,
                            width: 120,
                            child: Image.asset(
                              'assets/images/Logo_white.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                      ]),
                    ),
                    Container(
                      height: height,
                      width: width,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: appPrimaryBackgroundColor,
                          ),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.zero,
                              bottomRight: Radius.zero,
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: appPrimaryBackgroundColor),
                      child: SingleChildScrollView(
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 20, top: 30, bottom: 5),
                                child: Text(
                                  'Welcome Back !',
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.poppins(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                      color: appPrimaryWelcomeColor),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 20, bottom: 5, left: 15, top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Log In',
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: appPrimaryTextColor),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        /*  Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.80,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: appPrimaryBackgroundCardColor,
                                borderRadius: BorderRadius.circular(30)),
                            child: IntlPhoneField(
                              controller: _text,
                              initialCountryCode: "us",
                              onCountryChanged: (value) {
                                String data  = value.code;
                                String data2  = value.name;
                                String data3  = value.dialCode.toString();
                                print('------------$data');
                                print('------------$data2');
                                print('------------  $data3');
                                code="+$data3";
                              },
                              // controller: MobileController,
                              // countries: ['IN'],
                              showCountryFlag: true,
                              disableLengthCheck: true,
                              flagsButtonMargin: EdgeInsets.only(left: 18),
                              dropdownIcon: Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xffFB9400),
                                size: 12,
                              ),
                              dropdownIconPosition: IconPosition.trailing,

                              //maxLength: 12,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.singleLineFormatter
                              ],

                              decoration: InputDecoration(
                                hintText: "Mobile Number",
                                counterText: '',
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 15),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xFFF7F8F8), width: 1.0),
                                    borderRadius: BorderRadius.circular(30)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xFFF7F8F8), width: 1.0),
                                    borderRadius: BorderRadius.circular(30)),
                                hintStyle: GoogleFonts.poppins(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                              cursorColor: Colors.grey,
                            ),
                          ),*/
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(35.0),
                            child: InkWell(
                              onTap: () async {
                                setState(() {
                                  _text.text.isEmpty ? _validate = true : _validate = false;
                                });
                                print('_validate_validate' + _validate.toString());
                                print('_validate_validate' + _text.value.selection.toString());
                                print('_validate_validate' + _text.value.selection.toString());
                                if (_validate) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Please enter a valid mobile Number')),
                                  );
                                } else {
                                  loadingShow(context);
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  String? fcmId = prefs.getString(REGISTER_ID);
                                  Map<String, dynamic> data = {
                                    'phone': _text.text.toString(),
                                    'ragister_id': "fcmId",
                                    'country_code': code,
                                    /*'password': '123'*/
                                  };
                                  print('data from login ------------$data');
                                  setState(() {
                                    //  loader = true;
                                  });
                                  var res = await Webservices.postRAWData(
                                      apiUrl: ApiUrls.login,
                                      body: data,
                                      context: context);
                                  print('res from login ------------$res');
                                  loadingHide(context);

                                  if (res['status'] == "true") {
                                    // final Map parsed = json.decode(res as String);
                                    final signUp = LoginResponse.fromJson(res);
                                    print(
                                        "dgdng----------------${signUp.data?.id.toString()}");
                                    print(
                                        "dataaaaaaaaaaaaa----------------${res['data']}");
                                    // updateUserDetails(res['data']);
                                    // Obtain shared preferences.
                                    String? sry = signUp.data?.id.toString();
                                    final SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                    await prefs.setString('user_id', sry!);
                               //     Navigator.push(context, MaterialPageRoute(builder: (context) => otp_screen()));
                                  }
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: const LinearGradient(
                                        begin: Alignment.center,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          appPrimaryColor,
                                          appPrimaryColor,
                                        ])),
                                width: MediaQuery.of(context).size.width - 70,
                                height: 45,
                                alignment: Alignment.center,
                                child: Text(
                                  "Login",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
/*
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ForgotPassScreen()));
                            },
                            child: Text(
                              "Forgot password ?",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: appPrimaryTextColor),
                            ),
                          ),
*/
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Or continue with',
                              style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: appPrimaryTextColor),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Container(
                                height: 50,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xffffffff),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0xffF4F4F4),
                                      offset: Offset(
                                        5.0,
                                        5.0,
                                      ),
                                      blurRadius: 10.0,
                                      spreadRadius: 2.0,
                                    ), //BoxShadow
                                    BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(0.0, 0.0),
                                      blurRadius: 0.0,
                                      spreadRadius: 0.0,
                                    ), //BoxShadow
                                  ],
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/google.png",
                                      height: 20,
                                      width: 20,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Google",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff000000)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          /* Padding(

                            padding: const EdgeInsets.all(18.0),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    ' ',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: appPrimaryColor),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ForgotPassScreen()));
                                    },
                                    child: Text('SIGN UP',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: appPrimaryColor)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),*/
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
