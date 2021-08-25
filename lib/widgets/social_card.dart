import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({Key? key, required this.onTap, required this.svgIcon})
      : super(key: key);

  final void Function() onTap;
  final String svgIcon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(12),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFFAEDFA),
        ),
        child: SvgPicture.asset(svgIcon),
      ),
    );
  }
}
