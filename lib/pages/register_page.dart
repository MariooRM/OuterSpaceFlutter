import 'dart:math';
import 'package:flutter/material.dart';
import 'package:outerspace2/components/sign_button.dart';
import 'package:outerspace2/pages/loading_page.dart';
import 'package:outerspace2/pages/start_menu.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key, required this.onTap});

  final Function()? onTap;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final Key _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _repeatPasswordController = TextEditingController();
  final _ageController = TextEditingController();
  final _usernameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  void signUserUp() {
    if (passwordConfirmed()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoadingPage()),
      );
    }
  }

  // Error message to the user
  void showErrorMessage(String errorMessage, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.red,
            title: Center(
              child: Text(
                errorMessage,
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        });
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _repeatPasswordController.text.trim()) {
      return true;
    } else {
      showErrorMessage('Passwords are not the same', context);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/R.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
              child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      width: 350,
                      height: 630,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: Colors.black, width: 2.0)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Register',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Let\'s create an account for you!',
                          ),
                          Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  MyTextField(
                                      controller: _firstNameController,
                                      labelText: 'First name',
                                      hintText: 'Enter your first name',
                                      obscureText: false),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  MyTextField(
                                      controller: _lastNameController,
                                      labelText: 'Last name',
                                      hintText: 'Enter your last name',
                                      obscureText: false),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  MyTextField(
                                      controller: _emailController,
                                      labelText: 'Email',
                                      hintText: 'Enter your email',
                                      obscureText: false),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  MyTextField(
                                      controller: _usernameController,
                                      labelText: 'Username',
                                      hintText: 'Enter your username',
                                      obscureText: false),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  MyTextField(
                                      controller: _passwordController,
                                      labelText: 'Password',
                                      hintText: 'Enter your password',
                                      obscureText: true),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  MyTextField(
                                      controller: _repeatPasswordController,
                                      labelText: 'Confirm password',
                                      hintText: 'Confirm your password',
                                      obscureText: true),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  MyTextField(
                                      controller: _ageController,
                                      labelText: 'Age',
                                      hintText: 'Enter your age',
                                      obscureText: true),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('Already have an account?'),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      GestureDetector(
                                        onTap: widget.onTap,
                                        child: const Text(
                                          'Signed in',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ))
                        ],
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  SignButton(
                    onTap: () => signUserUp(),
                    message: 'Sign up',
                  )
                ],
              ),
            ),
          ))),
    );
  }
}
