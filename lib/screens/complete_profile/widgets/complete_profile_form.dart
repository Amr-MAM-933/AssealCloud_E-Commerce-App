import 'package:flutter/material.dart';

import '/constants.dart';
import '/screen_size.dart';
import '/screens/login_success_screen.dart';
import '/widgets/custom_suffix_icon.dart';
import '/widgets/main_button.dart';

class CompleteProfileForm extends StatelessWidget {
  CompleteProfileForm({Key? key, required this.appBar}) : super(key: key);

  final AppBar appBar;
  final _formKey = GlobalKey<FormState>();

  String firstName = '', lastName = '', phone = '', address = '';

  bool firstSubmit = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SizedBox(
        height: ScreenSize.cleanHeight(appBar: appBar) * 0.8,
        child: Column(
          children: <Widget>[
            Spacer(flex: 4),
            buildFirstNameTextField(),
            SizedBox(height: 20),
            buildLastNameTextField(),
            SizedBox(height: 20),
            buildPhoneTextField(),
            SizedBox(height: 20),
            buildAddressTextField(),
            Spacer(flex: 2), //(height: 50),
            MainButton(
                child: Text('Continue'),
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.pushNamed(context, LoginSuccessScreen.screenId);
                  }
                  firstSubmit = false;
                }),
            Spacer(flex: 4),

            Text(
              "By continuing you confirm that you agree\nwith our terms and conditions",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildFirstNameTextField() {
    return TextFormField(
      onSaved: (str) => firstName = str ?? '',
      onChanged: (str) {
        if (!firstSubmit) {
          _formKey.currentState!.validate();
        }
      },
      validator: (val) {
        final str = val ?? '';
        if (str.isEmpty) {
          return FormErrors.kFirstNamelNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        suffixIcon: customSuffixIcon(iconPath: "assets/icons/User Icon.svg"),
      ),
      keyboardType: TextInputType.name,
    );
  }

  TextFormField buildLastNameTextField() {
    return TextFormField(
      onSaved: (str) => lastName = str ?? '',
      onChanged: (str) {
        if (!firstSubmit) {
          _formKey.currentState!.validate();
        }
      },
      validator: (val) {
        final str = val ?? '';
        if (str.isEmpty) {
          return FormErrors.kLastNamelNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        suffixIcon: customSuffixIcon(iconPath: "assets/icons/User Icon.svg"),
      ),
      keyboardType: TextInputType.name,
    );
  }

  TextFormField buildPhoneTextField() {
    return TextFormField(
      onSaved: (str) => phone = str ?? '',
      onChanged: (val) {
        if (!firstSubmit) {
          _formKey.currentState!.validate();
        }
      },
      validator: (val) {
        final str = val ?? '';
        if (str.isEmpty) {
          return FormErrors.kPhoneNumberNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        suffixIcon: customSuffixIcon(iconPath: "assets/icons/Phone.svg"),
      ),
      keyboardType: TextInputType.phone,
    );
  }

  TextFormField buildAddressTextField() {
    return TextFormField(
      onSaved: (str) => address = str ?? '',
      onChanged: (address) {
        if (!firstSubmit) _formKey.currentState!.validate();
      },
      validator: (val) {
        final address = val ?? '';
        if (address.isEmpty) {
          return FormErrors.kAddressNullError;
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Enter your address",
        suffixIcon:
            customSuffixIcon(iconPath: "assets/icons/Location point.svg"),
      ),
      keyboardType: TextInputType.streetAddress,
    );
  }
}
