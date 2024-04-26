import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:zain_finance/screens/main/main_dashboard.dart';
import 'package:zain_finance/screens/utils/textfield.dart';

class SetupUserProfile extends StatefulWidget {
  const SetupUserProfile({Key? key}) : super(key: key);

  @override
  _SetupUserProfileState createState() => _SetupUserProfileState();
}

class _SetupUserProfileState extends State<SetupUserProfile> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<String> loadData() async {
    // Simulate data loading delay
    await Future.delayed(Duration(seconds: 2));
    return 'Loaded Data';
  }

  bool _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.clear();

    _emailController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Image.asset("assets/unnamed.png"));
          } else if (snapshot.hasData) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          "User Profile",
                          style: TextStyle(
                              color: Color(0xff1D1E20),
                              fontWeight: FontWeight.w800,
                              fontSize: 22),
                        )),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: TextFormInputField(
                      hintText: 'Enter Name',
                      textInputType: TextInputType.text,
                      controller: _nameController,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: TextFormInputField(
                      hintText: 'Enter Email',
                      textInputType: TextInputType.text,
                      controller: _emailController,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.withOpacity(.6),
                        fixedSize: const Size(350, 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      onPressed: () {
                        if (_nameController.text.isEmpty ||
                            _emailController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("All Fields are required")));
                        } else {
                          setState(() {
                            _isLoading = true;
                          });
                          FirebaseFirestore.instance
                              .collection("users")
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .set({
                            "name": _nameController.text,
                            "email": _emailController.text,
                            "phoneNumber": FirebaseAuth
                                .instance.currentUser!.phoneNumber!
                                .toString(),
                            "uid": FirebaseAuth.instance.currentUser!.uid,
                          });
                          setState(() {
                            _isLoading = false;
                          });
                        }
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Profile Completed"),
                        ));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => MainDashBoard()));
                      },
                      child: _isLoading == true
                          ? const Center(
                              child: CircularProgressIndicator.adaptive(),
                            )
                          : Text(
                              'Create Profile',
                              style: GoogleFonts.getFont('Montserrat',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal),
                            ),
                    ),
                  ),
                ]),
              ),
            );
          } else {
            return Text("data");
          }
        });
  }
}
