import 'package:app/screens/signin_page/signin_screen.dart';
import 'package:app/screens/signup_page/signup_screen2.dart';
import 'package:app/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(167, 218, 255, 1), // Top color
              Color.fromRGBO(240, 247, 247, 1), // Bottom color
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: SvgPicture.asset("assets/internupSVG.svg",
                    height: 35, width: 35),
              ),
              SizedBox(height: 15),
              Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Join InternUp",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            "or",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 5,
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignInScreen(),
                                    ));
                              },
                              child: Text(
                                "Sign in",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Email or Phone",
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "By clicking Agree & Join or Continue, you agree to the InternUp User Agreement, Privacy Policy, and Cookie Policy. For phone number signups we will send you a verification code via SMS",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: 
                            (context) => SignUpScreen2(),
                            ));
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all(kPrimaryColor),
                              shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                                side: BorderSide(color: kPrimaryColor),
                              ))),
                          child: Text(
                            "Agree & Join",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 0.3,
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Text(
                            "or",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 0.3,
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => SignUpScren2,
                            //     ));
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all(Colors.white),
                              shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                                side: BorderSide(color: Colors.black),
                              ))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons-google.svg",
                                width: 23,
                                height: 23,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Continue with Google",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 19,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {
                            /* Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen2(),
                              )); */
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all(Colors.white),
                              shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                                side: BorderSide(color: Colors.black),
                              ))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/facebook-logo.svg",
                                width: 23,
                                height: 23,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Continue with Facebook",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 19,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}
