import 'package:cafe/admin/otpDialoge.dart';
import 'package:cafe/admin/provider/adminprovider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class Datacollection extends StatefulWidget {
  Datacollection({super.key, this.data});
  final String? data;

  @override
  State<Datacollection> createState() => _DatacollectionState();
}

class _DatacollectionState extends State<Datacollection> {
  final user = FirebaseAuth.instance.currentUser!;

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 192, 180),
      body: ListView(
        children: [
          // Text(
          //   "Hello ${user.displayName}!!",
          //   style: TextStyle(
          //     color: const Color.fromARGB(255, 0, 57, 104),
          //   ),
          // ),
          const Text("Complete the following Steps for cafe registration"),
          Consumer<AdminProvider>(builder: (context, myData, child) {
            return Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      var val = PlatformDispatcher.instance.locale.countryCode;
                      print(val);
                    },
                    child: const Text("button")),
                Row(
                  children: [
                    SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: TextFormField(
                            controller: contrycodeController,
                            decoration: InputDecoration(
                                suffix: GestureDetector(
                                    onTap: () {},
                                    child: Icon(Icons.arrow_drop_down)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: Color.fromARGB(
                                            255, 134, 96, 80)))))),
                    SizedBox(
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: myData.mobileController,
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Color.fromARGB(255, 134, 96, 80)))),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      myData.mobVerified
                          ? Icon(
                              Icons.check_circle_outline,
                              color: Colors.green,
                            )
                          : Icon(
                              Icons.unpublished_outlined,
                              color: Colors.red,
                            ),
                      myData.mobVerified
                          ? Text(
                              "Verified",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 0, 115, 209),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Otpverify(
                                      userEmail: user.email!,
                                      isMobile: true,
                                    );
                                  },
                                );
                              },
                              child: Text(
                                "Verify",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromARGB(255, 0, 115, 209),
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      myData.emailVerified
                          ? Icon(
                              Icons.check_circle_outline,
                              color: Colors.green,
                            )
                          : Icon(
                              Icons.unpublished_outlined,
                              color: Colors.red,
                            ),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Otpverify(
                                userEmail: user.email!,
                                isMobile: false,
                              );
                            },
                          );
                        },
                        child: Text(
                          user.email!,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
        ],
      ),
    );
  }
}

TextEditingController contrycodeController = TextEditingController();
