import 'package:flutter/material.dart';

import '/constants.dart';
import '/screen_size.dart';
import '/widgets/custom_suffix_icon.dart';
import '/widgets/main_button.dart';
import '/widgets/no_account_widget.dart';

class ForgotPasswordForm extends StatelessWidget {
  ForgotPasswordForm({Key? key, required this.appBar}) : super(key: key);

  final AppBar appBar;
  final _formKey = GlobalKey<FormState>();

  String email = '';
  bool firstSubmit = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SizedBox(
        height: ScreenSize.cleanHeight(appBar: appBar) * 0.6,
        child: Column(
          children: <Widget>[
            Spacer(flex: 1),
            buildEmailFormField(),
            Spacer(flex: 1),
            MainButton(
                child: Text('Continue'),
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // send email ya prenss
                  }
                  firstSubmit = false;
                }),
            Spacer(flex: 4),
            NoAccountWidget(),
            Spacer(),
          ],
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      onSaved: (newEmail) => email = newEmail ?? '',
      controller: TextEditingController(text: email),
      onChanged: (email) {
        if (!firstSubmit) {
          _formKey.currentState!.save();
          _formKey.currentState!.validate();
        }
      },
      validator: (val) {
        final email = val ?? '';
        if (email.isEmpty) {
          return FormErrors.kEmailNullError;
        } else if (email.isNotEmpty &&
            !FormErrors.emailValidatorRegExp.hasMatch(email)) {
          return FormErrors.kInvalidEmailError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        suffixIcon: customSuffixIcon(iconPath: "assets/icons/Mail.svg"),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
