import 'package:flutter/material.dart';

class FormErrors {
  static final RegExp emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static const String kEmailNullError = "Please Enter your email";
  static const String kInvalidEmailError = "Please Enter Valid Email";
  static const String kPassNullError = "Please Enter your password";
  static const String kShortPassError =
      "Password is too short, at least 8 chars";
  static const String kMatchPassError = "Passwords don't match";
  static const String kFirstNamelNullError = "Please Enter your first name";
  static const String kLastNamelNullError = "Please Enter your last name";
  static const String kPhoneNumberNullError = "Please Enter your phone number";
  static const String kAddressNullError = "Please Enter your address";
}

const kTextColor = Color(0xFF757575);
