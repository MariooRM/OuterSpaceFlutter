import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outerspace2/components/my_textfield.dart';
import 'package:outerspace2/components/sign_button.dart';
import 'package:outerspace2/pages/loading_page.dart';
import 'package:outerspace2/pages/start_menu.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final Key _formKey = GlobalKey<FormState>();

  // Method to sign users in the application
  void signUserIn() {
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      showErrorMessage('All fields must be filled');
    } else if (!confirmData()) {
      showErrorMessage('Incorrect username or password ');
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoadingPage()),
      );
    }
  }

  bool confirmData() {
    if (_usernameController.text != "marieteerm" ||
        _passwordController.text != "mario123") {
      return false;
    } else {
      return true;
    }
  }

  // Error message to the user

  void showErrorMessage(String errorMessage) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.red,
            title: Center(
              child: Text(
                errorMessage,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/R.jpeg'), fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logoLogin.png',
                    width: 300,
                  ),
                  Container(
                    width: 350,
                    height: 330,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: Colors.black, width: 2.0)),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Login',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 40,
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
                                height: 10,
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(10, 0, 30, 20),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    "Forgot password?",
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('Not a member?'),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  GestureDetector(
                                    onTap: widget.onTap,
                                    child: const Text(
                                      'Register now',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SignButton(
                    onTap: signUserIn,
                    message: 'Sign in',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
