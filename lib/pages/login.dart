import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/pages/home.dart';
import 'package:fooddeliveryapp/pages/signup.dart';
import 'package:fooddeliveryapp/widget/widget_support.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = '', password = '';
  bool isLoading = false;
  final _formkey = GlobalKey<FormState>();

  TextEditingController useremailcontroller = TextEditingController();
  TextEditingController userpasswordcontroller = TextEditingController();

  void userLogin() async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        isLoading = true;
        email = useremailcontroller.text;
        password = userpasswordcontroller.text;
      });

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        setState(() {
          isLoading = false;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ), // Replace with your home screen
        );
      } on FirebaseAuthException catch (e) {
        setState(() {
          isLoading = false;
        });
        String errorMessage = "An error occurred. Please try again.";
        if (e.code == "user-not-found") {
          errorMessage = "No user found for that email.";
        } else if (e.code == 'wrong-password') {
          errorMessage = "Wrong password provided.";
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              errorMessage,
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "An unexpected error occurred.",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
      }
    }
  }

  InputDecoration inputDecoration(String hintText, IconData icon) {
    return InputDecoration(
      hintText: hintText,

      prefixIcon: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white70, width: 3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle loginStyle = Appwidget.loginTextFeildStyle();
    final TextStyle semiLoginStyle = Appwidget.loginsemiTextFeildStyle();
    final TextStyle accountStyle = Appwidget.accountTextFeildStyle();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFFA500), Color(0xFFFF1493)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 5,
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Text(" "),
          ),
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width / 1,
                child: Image.asset("images/logo.png"),
              ),
              Container(
                padding: EdgeInsets.all(30),
                height: MediaQuery.of(context).size.height / 1.5,
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Text("Login", style: loginStyle),
                      SizedBox(height: 30),
                      TextFormField(
                        controller: useremailcontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email';
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: inputDecoration("Email", Icons.email),
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        controller: userpasswordcontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        decoration: inputDecoration("Password", Icons.password),
                      ),
                      SizedBox(height: 20),
                      Container(
                        alignment: Alignment.topRight,
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 18.0,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      isLoading
                          ? CircularProgressIndicator()
                          : GestureDetector(
                            onTap: userLogin,
                            child: Material(
                              elevation: 10.0,
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: Colors.pink.shade800,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  "LOGIN",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontFamily: "Poppins1",
                                  ),
                                ),
                              ),
                            ),
                          ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Signup()),
                          );
                        },
                        child: Text(
                          "Don't Have an Account? Sign Up",
                          style: accountStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
