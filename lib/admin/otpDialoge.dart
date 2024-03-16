import 'package:cafe/admin/provider/adminprovider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Otpverify extends StatefulWidget {
  const Otpverify({super.key});

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
          onPressed: () {
            FirebaseAuth.instance.verifyPhoneNumber(
                verificationCompleted: (phoneAuthCredential) {},
                verificationFailed: (error) {},
                codeSent: (verificationId, forceResendingToken) {
                  setState(() {
                    vId = verificationId;
                  });
                },
                codeAutoRetrievalTimeout: (verificationId) {},
                phoneNumber: myData.mobileController.text);
          },
          child: Text(
            "Send OTP",
            style: TextStyle(color: Colors.white),
          ),
        ),
        MaterialButton(
          color: const Color.fromARGB(255, 40, 90, 41),
          onPressed: () {
            try {
              PhoneAuthCredential mobcredential = PhoneAuthProvider.credential(
                  verificationId: vId!, smsCode: otpController.text);
              FirebaseAuth.instance
                  .signInWithCredential(mobcredential)
                  .then((value) {
                Navigator.of(context).pop();

                myData.mobverify(true);
              });
            } catch (e) {
              myData.mobverify(false);
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

String? vId;
TextEditingController otpController = TextEditingController();
