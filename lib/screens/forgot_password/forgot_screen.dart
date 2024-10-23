import 'package:app/screens/signin_page/signin_screen.dart';
import 'package:app/screens/signup_page/signup_screen2.dart';
import 'package:app/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
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
                        "Forgot Screen",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 40),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Email or Phone",
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "We'll send a verification code to this email or phone number if it matches an existing InternUp account",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all(kPrimaryColor),
                              shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                                side: BorderSide(color: kPrimaryColor),
                              ))),
                          child: Text(
                            "Reset Password",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}
