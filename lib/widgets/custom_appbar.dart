import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final SizingInformation? sizingInformation;

  const CustomAppbar({super.key, this.sizingInformation});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: sizingInformation!.screenSize.height * 0.08,
      padding: EdgeInsets.only(top: 5, left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/profile1.jpg",
                        ),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            ],
          ),
          Container(
            height: 40,
            width: sizingInformation!.screenSize.width / 1.40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Color(0xFFEEF3F7),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xFF666666),
                ),
              ),
            ),
          ),
          Icon(
            FontAwesomeIcons.solidCommentDots,
            color: Color(0xFF666666),
            size: 25,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(sizingInformation!.screenSize.height * 0.08);
}
