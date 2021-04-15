import 'package:ComicMania/screens/creator_upload/upload.dart';
import 'package:ComicMania/screens/login_success/login_success_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ComicMania/components/custom_surfix_icon.dart';
import 'package:ComicMania/components/default_button.dart';
import 'package:ComicMania/components/form_error.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:ComicMania/models/authentication.dart';
import 'package:ComicMania/screens/home/home_screen.dart';
class CreatorSignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}
final _formKey = GlobalKey<FormState>();
class _SignUpFormState extends State<CreatorSignUpForm> {
  TextEditingController _rPasswordController = new TextEditingController();
  static final RegExp nameRegExp = RegExp('[a-zA-Z]');
  String email;
  String password;
  String name;
  // ignore: non_constant_identifier_names
  String conform_password;
  bool remember = false;
  Map<String, String> _authData = {
    'email': '',
    'password':'',
    };
  final List<String> errors = [];
  void _showErrorDialog(String msg)
  {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('An Error Occured'),
          content: Text(msg),
          actions: <Widget>[
            FlatButton(
              child: Text('Okay'),
              onPressed: (){
                Navigator.of(ctx).pop();
              },
            )
          ],
        )
    );
  }
  Future<void> _submit() async
  {

    if(!_formKey.currentState.validate())
    {
      return;
    }
    _formKey.currentState.save();

    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _authData['email'],password: _authData['password']).then((value) {
        FirebaseFirestore.instance.collection('Creator').doc().set(
            {
              "name": name,
              "email": _authData['email'],
              "password":_authData['password'],
            }
        );
        UserCredential user;
        user.user.updateProfile(displayName: name);
        print("data sent");
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> UserVibe()));
      });

    } catch(error)
    {
      var errorMessage = 'Authentication Failed. Please try again later.';
      _showErrorDialog(errorMessage);
    }

  }
  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value:Authentication(),)
        ],
        child: Column(
          children: [
            buildNameFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            FlutterPwValidator(
              controller: _rPasswordController,
              minLength: 8,
              uppercaseCharCount: 1,
              numericCharCount: 2,
              specialCharCount: 1,
              successColor: kPrimaryColor,
              width: 400,
              height: 150,
              onSuccess: (){
                print("matched");
                Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("Password is ok")));
              },
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildConformPassFormField(),
            FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(40)),
            DefaultButton(
              text: "Sign Up",
              press: () async {
                _submit();
              }
    ),
  ],
            ),
      ),
      );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) =>conform_password = newValue,
      onChanged: (newValue) {
        if (newValue.isNotEmpty) {
          removeError(error: kPassNullError);
        }  if (newValue.isNotEmpty &&_authData['password'] ==  conform_password) {
          removeError(error: kMatchPassError);
          print(_authData['password']);
        }
        conform_password = newValue;
      },
      validator: (newValue) {
        if (newValue.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((_authData['password'] != newValue)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      controller: _rPasswordController,
      onSaved: (newValue) => _authData['password'] = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        _authData['password'] = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => _authData['email'] = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        _authData['email']=value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );

  }
  TextFormField buildNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => name = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]').hasMatch(value)) {
          //removeError(error: kInvalidEmailError);
        }
        name = value;
      },

      validator: (value) {
        if (value.isEmpty) {
          return "Please enter name";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Name",
        hintText: "Enter your name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}

