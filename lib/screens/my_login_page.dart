import 'dart:developer';

import 'package:basic_login_ui/sized_config.dart';
import 'package:flutter/material.dart';

class MyLoginPage extends StatefulWidget {
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Just need to be called only once time
    SizedConfig().init(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(16),
            vertical: getProportionateScreenHeight(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: getProportionateScreenHeight(50)),
              Text(
                'Please login',
                style: TextStyle(
                    fontSize: getProportionateFontSize(20),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              Text(
                'username',
                style: TextStyle(fontSize: getProportionateFontSize(16)),
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              MyInputField(
                hintText: 'username hint',
                controller: _usernameController,
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              Text(
                'password',
                style: TextStyle(fontSize: getProportionateFontSize(16)),
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              MyInputField(
                controller: _passwordController,
                hintText: 'password hint',
                obscureText: true,
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              InkWell(
                onTap: _doResetPassword,
                child: Text(
                  'reset password',
                  style: TextStyle(
                    fontSize: getProportionateFontSize(16),
                    color: Colors.green,
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(25)),
              Row(
                children: <Widget>[
                  InkWell(
                    onTap: _doCreateAccount,
                    child: Text(
                      'create account',
                      style: TextStyle(
                        fontSize: getProportionateFontSize(16),
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: getProportionateScreenWidth(100),
                    height: getProportionateScreenHeight(45),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder()),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                          textStyle: MaterialStateProperty.all(TextStyle(
                              fontSize: getProportionateFontSize(16)))),
                      onPressed: _doLogin,
                      child: Text('Login'),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _doLogin() {
    String username = _usernameController.value.text;
    String password = _usernameController.value.text;
    log('Do login with username = $username and password = $password');
  }

  void _doResetPassword() {}

  void _doCreateAccount() {}
}

class MyInputField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController controller;

  const MyInputField({
    Key key,
    @required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintStyle: TextStyle(fontSize: getProportionateFontSize(16)),
        focusColor: Colors.green,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        border: OutlineInputBorder(),
        hintText: hintText,
      ),
    );
  }
}
