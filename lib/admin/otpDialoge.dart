import 'package:cafe/admin/provider/adminprovider.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Otpverify extends StatefulWidget {
  final bool isMobile;
  final String userEmail;
  const Otpverify({super.key, required this.isMobile, required this.userEmail});

  @override
  State<Otpverify> createState() => _OtpverifyState();
}

class _OtpverifyState extends State<Otpverify> {
  late AdminProvider myData =
      Provider.of<AdminProvider>(context, listen: false);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Enter the OTP!!"),
      content: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width * 0.6,
        child: TextFormField(
          keyboardType: TextInputType.number,
          controller: otpController,
          decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.brown)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 2, color: Color.fromARGB(255, 134, 96, 80)))),
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        MaterialButton(
          color: const Color.fromARGB(255, 40, 90, 41),
          onPressed: () async {
            if (widget.isMobile) {
              FirebaseAuth.instance.verifyPhoneNumber(
                  verificationCompleted: (phoneAuthCredential) {},
                  verificationFailed: (error) {},
                  codeSent: (verificationId, forceResendingToken) {
                    setState(() {
                      mobvId = verificationId;
                    });
                  },
                  codeAutoRetrievalTimeout: (verificationId) {},
                  phoneNumber: myData.mobileController.text);
            } else {
              var emailAuth = 'r1997@gmail.com';
              FirebaseAuth.instance
                  .sendSignInLinkToEmail(
                      email: emailAuth, actionCodeSettings: acs)
                  .catchError((onError) =>
                      print('Error sending email verification $onError'))
                  .then(
                      (value) => print('Successfully sent email verification'));

              // if (FirebaseAuth.instance.isSignInWithEmailLink(
              //     "https://cafeproject-2ccba.firebaseapp.com/__/auth/action?mode=action&oobCode=code")) {
              //   try {
              //     // The client SDK will parse the code from the link for you.
              //     final userCredential = await FirebaseAuth.instance
              //         .signInWithEmailLink(
              //             email: "ragavkrishna1997@gmail.com",
              //             emailLink:
              //                 "https://cafeproject-2ccba.firebaseapp.com/__/auth/action?mode=action&oobCode=code");

              //     // You can access the new user via userCredential.user.
              //     final emailAddress = userCredential.user?.email;

              //     print('Successfully signed in with email link!');
              //   } catch (error) {
              //     print('Error signing in with email link.');
              //   }
              // }
            }
          },
          child: Text(
            "Send OTP",
            style: TextStyle(color: Colors.white),
          ),
        ),
        MaterialButton(
          color: const Color.fromARGB(255, 40, 90, 41),
          onPressed: () {
            if (widget.isMobile) {
              try {
                PhoneAuthCredential mobcredential =
                    PhoneAuthProvider.credential(
                        verificationId: mobvId!, smsCode: otpController.text);
                FirebaseAuth.instance
                    .signInWithCredential(mobcredential)
                    .then((value) {
                  Navigator.of(context).pop();

                  myData.mobverify(true);
                });
              } catch (e) {
                myData.mobverify(false);
              }
            } else {
              try {
                PhoneAuthCredential emailcredential =
                    PhoneAuthProvider.credential(
                        verificationId: emailvId!, smsCode: otpController.text);
                FirebaseAuth.instance
                    .signInWithCredential(emailcredential)
                    .then((value) {
                  Navigator.of(context).pop();

                  myData.emailverify(true);
                });
              } catch (e) {
                myData.emailverify(false);
              }
            }
          },
          child: Text(
            "Enter OTP",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}

String? mobvId;
String? emailvId;
TextEditingController otpController = TextEditingController();
var acs = ActionCodeSettings(
    // URL you want to redirect back to. The domain (www.example.com) for this
    // URL must be whitelisted in the Firebase Console.
    url:
        'https://cafeproject-2ccba.firebaseapp.com/__/auth/action?mode=action&oobCode=code',
    // This must be true
    handleCodeInApp: true,
    iOSBundleId: 'com.example.cafe',
    androidPackageName: 'com.example.cafe',
    // installIfNotAvailable
    androidInstallApp: true,
    // minimumVersion
    androidMinimumVersion: '12');
