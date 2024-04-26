import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zain_finance/screens/auth/verify_phone.dart';
import 'package:zain_finance/screens/utils/colors.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:country_code_picker/country_code_picker.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController _controller = TextEditingController();

  String dialCodeDigits = "+91";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff006f76),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.language, color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.headphones, color: Colors.white),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/unnamed.png",
                    width: 150,
                    height: 200,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Login with your Zain Cash Wallet",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Card(
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CountryCodePicker(
                                onChanged: (country) {
                                  setState(() {
                                    dialCodeDigits = country.dialCode!;
                                  });
                                },
                                initialSelection: "IN",
                                showCountryOnly: false,
                                showOnlyCountryWhenClosed: false,
                                favorite: const ["+91", "IN"]),
                            Expanded(
                              child: Container(
                                child: TextFormField(
                                  validator:
                                      RequiredValidator(errorText: "Required"),
                                  decoration: const InputDecoration(
                                    labelText: "Enter Phone Number",
                                    hintText: "12345678",
                                    //  prefix: Padding(padding: EdgeInsets.all(10),child: Text(dialCodeDigits,style: TextStyle(color: Colors.black),),),
                                  ),
                                  keyboardType: TextInputType.number,
                                  controller: _controller,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: RequiredValidator(errorText: "Required"),
                          decoration: const InputDecoration(
                            labelText: "Zain Cash Pin Code",
                            hintText: "Enter Pin Code",
                            //  prefix: Padding(padding: EdgeInsets.all(10),child: Text(dialCodeDigits,style: TextStyle(color: Colors.black),),),
                          ),
                          keyboardType: TextInputType.number,
                          controller: _controller,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff800000),
                                  fixedSize: Size(300, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              child: Text(
                                "Continue",
                                style: TextStyle(color: white),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) => VerifyPhone(
                                            codeDigits: dialCodeDigits,
                                            phone: _controller.text)));
                              }),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Zain Cash is licensed by the Central bank of Iraq",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w100),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
