import 'package:app/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen4 extends StatefulWidget {
  const SignUpScreen4({super.key});

  @override
  State<SignUpScreen4> createState() => _SignUpScreen4State();
}

class _SignUpScreen4State extends State<SignUpScreen4> {
  bool remember = false;
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
                Color.fromRGBO(240, 247, 247, 1),
              ])),
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: SvgPicture.asset("assets/internupSVG.svg",
                        width: 35, height: 35),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Set your password",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: "Email or Phone*"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: "Password*"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                                value: remember,
                                activeColor: Colors.green[900],
                                onChanged: (value) {
                                  setState(() {
                                    remember = value!;
                                  });
                                }),
                            Text(
                              "Remember me.",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[800]),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Learn more",
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUpScreen4(),
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
                              "Continue",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
