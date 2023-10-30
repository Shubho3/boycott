import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:boycott/widgets/loader.dart';
import '../../Apis/Webservices.dart';
import '../../Models/LoginResponse.dart';
import '../../constants.dart';
import '../../widgets/CustomTextInputField.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  Login createState() => Login();
}

class Login extends State<SignupScreen> {

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
  var hide  = true;

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: appPrimaryBackgroundCardColor,
      body: Container(
          height: height-10,
          width: width-10,
          decoration: const BoxDecoration(color: appPrimaryBackgroundCardColor),
          child: SingleChildScrollView(
            child: Column(
              children: [
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

                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: appPrimaryBackgroundCardColor,
                            ),
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.zero,
                                bottomRight: Radius.zero),
                            color: appPrimaryBackgroundCardColor),
                        child: Column(children: [
                          const SizedBox(
                            height: 65,
                          ),
                          Center(
                            child: SizedBox(
                              height: 65,
                              width: 120,
                              child: Image.asset(
                                'assets/images/Logo.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                        ]),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Wrap(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 20, top: 30, bottom: 5),
                                child: Text(
                                  'SignUp for Free',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                      color: appPrimaryTextColor),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20,left:20 ),
                        child: CustomTextField(
                          controller: _text,
                          hintText: 'First Name',
                          label: 'First Name',
                          keyboardtype: TextInputType.name,

                        ),
                      ), const SizedBox(
                        height: 30,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20,left:20 ),
                        child: CustomTextField(
                          controller: _text,
                          hintText: 'Last Name',
                          label: 'Last Name',
                          keyboardtype: TextInputType.name,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20,left:20 ),
                        child: CustomTextField(
                          controller: _text,
                          hintText: 'Enter Email',
                          label: 'Email',
                          keyboardtype: TextInputType.emailAddress,

                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20,left:20 ),

                        child: CustomTextField(
                          controller: _text,
                          hintText: 'Enter Password',
                          label: 'Password',
                          keyboardtype: TextInputType.visiblePassword,

                          /* suffixIcon: hide?"assets/images/hide.png":"assets/images/show.png",
                          onTapsuffix: (){
                            setState(() {
                              hide=!hide;
                            });
                          },*/


                        ),
                      ),

                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
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
                            margin: EdgeInsets.only(right: 30,left:30 ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
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
*/
                      const SizedBox(
                        height: 30,
                      ),
                       Padding(

                        padding: const EdgeInsets.all(18.0),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Dont Have a Account? ',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: appPrimaryColor),
                              ),
                              InkWell(
                                onTap: () {
                               //   Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassScreen()));
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
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
