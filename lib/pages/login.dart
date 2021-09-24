import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signalapp/main.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isRememberMe = false;
   TextEditingController password =TextEditingController();

  final GlobalKey<FormState> _formKey =GlobalKey<FormState>();
  validator(){
    if(_formKey.currentState != null && _formKey.currentState!.validate()){
      print("Sucessfully validate");
    } else{
      print('Error found');
    }
      }
// Emaill Box
  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      
        Text(
          'Email',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2)),
              ]),
          height: 60,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            autofillHints: [AutofillHints.email],
            style: TextStyle(color: Colors.black87),
            validator: (email) => email !=null && !EmailValidator.validate(email)
            ? 'Enter a vaild Email'
            :null , 
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(Icons.email, color: Colors.black),
              hintText: 'Email',
              hintStyle: TextStyle(color: Colors.black38),
              
            ),
            
          ),
        ),
      ],
    );
  }

// Password Box
  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2)),
              ]),
          height: 60,
          child: TextField(
              obscureText: true,
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.lock, color: Colors.black),
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.black38),
              )),
        ),
      ],
    );
  }

// Forget Passsword Button
  Widget buildForgetPasswordButton() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => print("Forget Password Pressed"),
        child: Text(
          'Forget Password?',
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

// Remmember Password Button
  Widget buildRememberCB() {
    return Container(
      height: 20,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: isRememberMe,
              checkColor: Colors.black,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  isRememberMe = value!;
                });
              },
            ),
          ),
          Text(
            'Remember Me',
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

//Login Button
  Widget buildLoginButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      
      child: ElevatedButton(
        onPressed: () {
          // ignore: non_constant_identifier_names
          final Form = _formKey.currentState!;
          if (Form.validate()){ 
            final email = buildEmail;
            ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(SnackBar(
            content: Text('your email is$email'),
            ));
          }
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MyHomePage(
                    title: '',
                  )));
        },
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          padding: EdgeInsets.all(15),
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }

  //Signin bitton
  Widget buildSignupButton() {
    return GestureDetector(
      onTap: () => print("Sign UP Pressed"),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: 'Dont have an Account? ',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: 'Sign Up',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.blue.shade100,
                      Colors.blue.shade200,
                      Colors.blue.shade300,
                      Colors.blue.shade400,
                    ]),
              ),
              child: Form( key: _formKey,
                child:
               SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 120,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    
                    Container(
                        alignment: Alignment.center,
                        
                        child: Text(
                          'Apple Stock',
                          style: TextStyle(
                            
                            
                            fontSize: 25.0,
                          ),
                        )),
                    buildEmail(),
                    SizedBox(
                      height: 20,
                    ),
                    buildPassword(),
                    buildForgetPasswordButton(),
                    buildRememberCB(),
                    buildLoginButton(),
                    buildSignupButton(),
                  ],
                ),
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
