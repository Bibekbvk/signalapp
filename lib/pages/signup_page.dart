import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:practiceapp2/components/different_texts.dart';
import 'package:practiceapp2/components/drawer.dart';
import 'package:practiceapp2/components/reusable_button.dart';
import 'package:practiceapp2/components/reusable_textbox.dart';
import 'package:practiceapp2/constants.dart';
import 'package:practiceapp2/utils/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  var valueChoose;
  List listItem = ["Admin", "User"];
  final emailValidator = MultiValidator([
    RequiredValidator(errorText: "Required"),
    EmailValidator(errorText: "Not a valid e-mail.")
  ]);
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Required'),
    MinLengthValidator(8, errorText: 'Password must be at least 8 digits long.'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'Passwords must have at least one special character.')
  ]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(

      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  height: 100,
                ),
                ReusableTextBox(
                  label: "First Name",
                  validator: RequiredValidator(errorText:"Required."),
                ),
                ReusableTextBox(
                  label: "Last Name",
                  validator: RequiredValidator(errorText:"Required."),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                  child: Material(
                    elevation: 20,
                    shadowColor: Colors.white60,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                ReusableTextBox(
                  label: "E-mail Address",
                  inputType: TextInputType.emailAddress,
                  validator: emailValidator,
                ),
                ReusableTextBox(
                  label: "Password",
                  isObscured: true,
                  validator: passwordValidator,
                ),
                ReusableButton(
                  label: "SUBMIT",
                  buttonColor: kButtonColor,
                  onPress: (){
                    if(_formKey.currentState!.validate()){
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    }
                  },
                ),
                FormSmallText(label: "Sign in With"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.google,
                        color: kButtonColor,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        FontAwesomeIcons.facebook,
                        color: kButtonColor,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        FontAwesomeIcons.instagram,
                        color: kButtonColor,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
