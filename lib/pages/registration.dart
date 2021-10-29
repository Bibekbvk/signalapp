import 'package:flutter/material.dart';
import 'package:signalapp/database.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  DatabaseService db = DatabaseService();
  TextEditingController Registration_ID = new TextEditingController();
  TextEditingController Email = new TextEditingController();
  TextEditingController Username = new TextEditingController();
  TextEditingController Password = new TextEditingController();
  TextEditingController Confirm_Password = new TextEditingController();
  // Define a key to access the form
  final _formKey = GlobalKey<FormState>();

  String _userEmail = '';
  String _userName = '';
  String _password = '';
  String _confirmPassword = '';

  // This function is triggered when the user press the "Sign Up" button
  void _trySubmitForm() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      print('Everything looks good!');
      print(_userEmail);
      print(_userName);
      print(_password);
      print(_confirmPassword);

      /* 
      Continute proccessing the provided information with your own logic 
      such us sending HTTP requests, savaing to SQLite database, etc.
      */
    }
  }

  //Submit Button
  Widget buildSubmitButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: TextButton.icon(
          icon: Icon(Icons.send),
          label: Text("Submit"),
          onPressed: () async {
            if (_userEmail == '' || _password == '') {
              AlertDialog(
                title: Text("error"),
                content: Text("This ius errir"),
              );
              //_showDialogEmptyFeedback();
            } else {
              var res = await db.insertregistration(
                _userEmail,
                _userName,
                _password,
                _confirmPassword,
              );
              print("${res}ressss");

              if (res == 200) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                      title: Text("...Thank You for Your registration....")),
                );

                print("success");
              } else {
                print("failure");
              }
            }
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Center(
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 35),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /////////////////////////////////////////
                      /// Eamil
                      TextFormField(
                        controller: Email,
                        decoration: InputDecoration(labelText: 'Email'),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Please enter your email address';
                          }
                          // Check if the entered email has the right format
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          // Return null if the entered email is valid
                          return null;
                        },
                        onChanged: (value) => _userEmail = value,
                      ),

                      /////////////////////////////////////////
                      /// username
                      TextFormField(
                        controller: Username,
                        decoration: InputDecoration(labelText: 'Username'),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'This field is required';
                          }
                          if (value.trim().length < 4) {
                            return 'Username must be at least 4 characters in length';
                          }
                          // Return null if the entered username is valid
                          return null;
                        },
                        onChanged: (value) => _userName = value,
                      ),

                      ////////////////////////////////////
                      /// Password
                      TextFormField(
                        controller: Password,
                        decoration: InputDecoration(labelText: 'Password'),
                        obscureText: true,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'This field is required';
                          }
                          if (value.trim().length < 8) {
                            return 'Password must be at least 8 characters in length';
                          }
                          // Return null if the entered password is valid
                          return null;
                        },
                        onChanged: (value) => _password = value,
                      ),
                      //////////////////////////////////
                      /// Confirm Password
                      TextFormField(
                        controller: Confirm_Password,
                        decoration:
                            InputDecoration(labelText: 'Confirm Password'),
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This field is required';
                          }

                          if (value != _password) {
                            return 'Confimation password does not match the entered password';
                          }

                          return null;
                        },
                        onChanged: (value) => _confirmPassword = value,
                      ),
                      SizedBox(height: 20),
                      buildSubmitButton(),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
