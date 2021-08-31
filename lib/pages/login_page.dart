import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:practiceapp2/components/different_texts.dart';
import 'package:practiceapp2/components/drawer.dart';
import 'package:practiceapp2/components/reusable_button.dart';
import 'package:practiceapp2/components/reusable_textbox.dart';
import 'package:practiceapp2/constants.dart';
import 'package:practiceapp2/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var valueChoose;
  List listItem = ["Admin", "User"];
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset(
                  "assets/images/logo.png",
                  height: 100,
                ),
                ReusableTextBox(
                    controller: myController,
                    label: "Email",
                    inputType: TextInputType.emailAddress,
                    validator: EmailValidator(
                        errorText: "Enter a valid e-mail address.")),
                ReusableTextBox(
                    label: "Password",
                    isObscured: true,
                    validator: RequiredValidator(
                        errorText: "Password field cannot be empty.")),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Material(
                    elevation: 20,
                    shadowColor: Colors.white60,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          labelText: "SELECT USER TYPE",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: InputBorder.none,
                        ),
                        value: valueChoose,
                        onChanged: (newValue) {
                          setState(() {
                            valueChoose = newValue;
                          });
                        },
                        items: listItem.map((valueItem) {
                          return DropdownMenuItem(
                              value: valueItem, child: Text(valueItem));
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                FormSmallText(label: "FORGOT PASSWORD?"),
                ReusableButton(
                  label: "SIGN IN",
                  buttonColor: kButtonColor,
                  onPress: () {
                    if (myController.text != "anuzsubedi@hotmail.com") {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("The email does not match our database"),
                        duration: const Duration(seconds: 1),
                      ));
                      return;
                    }
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't Have an Account Yet?",
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, MyRoutes.signupRoute);
                        },
                        child: Text("Sign Up"))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
