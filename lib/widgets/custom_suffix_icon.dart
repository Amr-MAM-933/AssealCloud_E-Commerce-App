import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget customSuffixIcon({required String iconPath}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
    child: SvgPicture.asset(
      iconPath,
      height: 18,
    ),
  );
}
