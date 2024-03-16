import 'package:cafe/admin/auth_service.dart';
import 'package:cafe/admin/my_button.dart';
import 'package:cafe/admin/my_textfield.dart';
import 'package:cafe/admin/signup.dart';
import 'package:cafe/admin/square_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  Future signUserIn(context) async {
    // show loading circle

    // try sign in
    try {
      // var value = await FirebaseFirestore.instance
      //     .collection("user")
      //     .doc("ragav")
      //     .get();
      // print("kkkkkkkkkk${value.data()}");
      var val = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      print(val);
      // pop the loading circle
      // Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      print("exceptionnn:${e.code}");
      // pop the loading circle
      // Navigator.pop(context);
      // WRONG EMAIL
      if (e.code == 'user-not-found') {
        // show error to user
        snakbar(
            color: const Color.fromARGB(255, 161, 45, 37),
            text: "Incorrect Email");
      } else if (e.code == "invalid-email") {
        snakbar(
            color: const Color.fromARGB(255, 161, 45, 37),
            text: "Incorrect Email");
      }
      // WRONG PASSWORD
      else if (e.code == 'wrong-password') {
        // show error to user
        snakbar(
            color: const Color.fromARGB(255, 161, 45, 37),
            text: "Incorrect password");
      } else if (e.code == "invalid-credential") {
        snakbar(
            color: const Color.fromARGB(255, 161, 45, 37),
            text: "Incorrect password");
      }
    }
  }

  snakbar({required String text, required Color color}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: color,
      content: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),

                  // logo
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),

                  const SizedBox(height: 50),

                  // welcome back, you've been missed!
                  Text(
                    'Welcome back you\'ve been missed!',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // email textfield
                  MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),

                  // password textfield
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),

                  const SizedBox(height: 10),

                  // forgot password?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // sign in button
                  MyButton(
                    name: "Sign In",
                    onTap: () => signUserIn(context),
                  ),

                  const SizedBox(height: 50),

                  // or continue with
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Or continue with',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 50),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SquareTile(
                        imagePath: 'assets/images/google_logo.png',
                        onTap: () async {
                          GoogleSignInAccount? googleSignInAccount =
                              await GoogleSignIn().signIn();

                          // Get email from GoogleSignInAccount
                          String email = googleSignInAccount!.email;

                          emailController.text = email;
                        },
                      ),

                      SizedBox(width: 25),

                      // apple button
                      // SquareTile(imagePath: 'assets/images/apple.png')
                    ],
                  ),

                  const SizedBox(height: 50),

                  // not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Signup(),
                          ));
                        },
                        child: Text(
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
            ],
          ),
        ),
      ),
    );
  }
}

var val;
