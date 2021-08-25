import 'package:flutter/material.dart';

import '/theme.dart';

class DotBar extends StatelessWidget {
  const DotBar({
    Key? key,
    required this.count,
    required this.current,
  }) : super(key: key);

  final int count;
  final int current;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 15.0 * count,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(count, (index) {
            return AnimatedContainer(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: index == current
                    ? theme.primaryColor
                    : theme.accentColor.withOpacity(0.4),
              ),
              duration: Duration(milliseconds: 300),
              height: 10,
              width: index == current ? 19 : 10,
            );
          }),
        ),
      ),
    );
  }
}
