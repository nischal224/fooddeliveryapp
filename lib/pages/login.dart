import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/pages/signup.dart';
import 'package:fooddeliveryapp/widget/widget_support.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
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
                // color: Colors.red,
                padding: EdgeInsets.all(30),
                // color: Colors.red,
                height: MediaQuery.of(context).size.height / 1.5,
                child: Column(
                  children: [
                    Text("login", style: Appwidget.loginTextFeildStyle()),
                    SizedBox(height: 30),

                    TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: Appwidget.loginsemiTextFeildStyle(),
                        prefixIcon: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white70, width: 3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.email, color: Colors.white),
                        ),
                      ),
                    ),

                    SizedBox(height: 30),
                    TextField(
                      obscureText: true,

                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: Appwidget.loginsemiTextFeildStyle(),
                        prefixIcon: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white70, width: 3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.password, color: Colors.white),
                        ),
                      ),
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
                    Material(
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
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signup()),
                        );
                      },

                      child: Text(
                        "Dont Have an Account? Sign Up",
                        style: Appwidget.accountTextFeildStyle(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
