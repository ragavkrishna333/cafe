import 'package:cafe/admin/auth_service.dart';
import 'package:cafe/admin/my_button.dart';
import 'package:cafe/admin/my_textfield.dart';
import 'package:cafe/admin/square_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _LoginPageState();
}

class _LoginPageState extends State<Signup> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  signUpuser(context) async {
    // show loading circle

    try {
      // await FirebaseAuth.instance.verifyPhoneNumber(
      //   phoneNumber: emailController.text,
      //   verificationCompleted: (phoneAuthCredential) {},
      //   verificationFailed: (error) {},
      //   codeSent: (verificationId, forceResendingToken) {},
      //   codeAutoRetrievalTimeout: (verificationId) {},
      // );
      var si = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      print("signin${si}");
      // var value = await FirebaseFirestore.instance
      //     .collection("user")
      //     .doc("ragav")
      //     .get();
      // print("kkkkkkkkkk${value.data()}");

      // // await FirebaseFirestore.instance.collection("user1").add({"value": 1});
      // await FirebaseAuth.instance.signInWithEmailAndPassword(
      //   email: emailController.text,
      //   password: passwordController.text,
      // );
      // pop the loading circle
      Navigator.pop(context);
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
      } else if (e.code == "email-already-in-use") {
        snakbar(
            color: const Color.fromARGB(255, 161, 45, 37),
            text: "Account already Exist");
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
            text: "Incorrect Email or password");
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
                    'SignUp here!!',
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

                  const SizedBox(height: 25),
                  MyButton(
                    name: "Sign Up",
                    onTap: () => signUpuser(context),
                  ),

                  const SizedBox(height: 50),
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
                          String email = googleSignInAccount!.email;

                          emailController.text = email;
                        },
                      ),
                      SizedBox(width: 25),
                    ],
                  ),

                  const SizedBox(height: 50),
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
