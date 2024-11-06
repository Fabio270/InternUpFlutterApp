import 'package:app/main_page.dart';
import 'package:app/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MainPage(),
                ));
          },
          child: Icon(
            Icons.close,
            size: 30,
          ),
        ),
        leadingWidth: 45,
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                "assets/profile6.jpg",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Text(
              "Anyone",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Color(0xFF666666),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5, left: 5),
              child: Icon(
                FontAwesomeIcons.caretDown,
                size: 17,
                color: Color(0xFF666666),
              ),
            )
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Icon(
                  FontAwesomeIcons.clock,
                  color: Color(0xFF666666),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kPrimaryColor,
                  ),
                  child: Text(
                    "Post",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "What do you want to talk about?",
                    ),
                    scrollPadding: EdgeInsets.all(20),
                    keyboardType: TextInputType.multiline,
                    maxLines: 99999,
                    autofocus: true,
                  ),
                )
              ],
            ),
        )
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 25),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.image,
              color: Color(0xFF666666),
              size: 28,
            ),
            SizedBox(width: 10),
            Icon(
              Icons.add,
              color: Color(0xFF666666),
              size: 35,
            ),
          ],
        ),
      ),
    );
  }
}
