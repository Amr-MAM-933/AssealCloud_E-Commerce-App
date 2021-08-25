import 'package:flutter/material.dart';
import '../theme.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    required this.child,
    required this.onTap,
    this.backgroundColor,
  }) : super(key: key);

  final void Function() onTap;
  final Widget child;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
      width: double.infinity,
      height: 65,
      child: ElevatedButton(
        onPressed: onTap,
        child: child,
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(backgroundColor ?? theme.accentColor),
            elevation: MaterialStateProperty.all(5),
            textStyle: MaterialStateProperty.all(
                theme.textTheme.button!.copyWith(fontSize: 18)),
            shape: MaterialStateProperty.all((RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))))),
      ),
    );
  }
}
