import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:zain_finance/screens/auth/phone_status.dart';
import 'package:zain_finance/screens/utils/colors.dart';

class VerifyPhone extends StatefulWidget {
  final String phone;
  final String codeDigits;
  const VerifyPhone({Key? key, required this.codeDigits, required this.phone})
      : super(key: key);

  @override
  State<VerifyPhone> createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  final TextEditingController controllerpin = TextEditingController();
  final FocusNode pinVerifyPhonePFocusNode = FocusNode();

  String? verificationCode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verificationPhone();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );
    return Scaffold(
      backgroundColor: Color(0xff006f76),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/unnamed.png",
            width: 150,
            height: 200,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "OTP Verification",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SizedBox(
            height: 6,
          ),
          InkWell(
            child: Text("verification: ${widget.codeDigits}-${widget.phone}"),
          ),
          SizedBox(height: 50),
          Container(
            margin:
                const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
            child: Pinput(
              length: 6,
              focusNode: pinVerifyPhonePFocusNode,
              controller: controllerpin,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              onCompleted: (pin) async {
                try {
                  await FirebaseAuth.instance
                      .signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: verificationCode!, smsCode: pin))
                      .then((value) {
                    if (value.user != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => CheckPhoneStatus()));
                    }
                  });
                } catch (e) {
                  FocusScope.of(context).unfocus();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Invalid Code"),
                    duration: Duration(seconds: 12),
                  ));
                }
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 20),
            child: const Text(
              'Please enter the 6-digit code \n  sent to your number',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff800000),
                  fixedSize: Size(300, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              child: Text(
                "Submit",
                style: TextStyle(color: white),
              ),
              onPressed: () {}),
        ],
      ),
    );
  }

  void verificationPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "${widget.codeDigits + widget.phone}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) {
            if (value.user != null) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (builder) => CheckPhoneStatus(),
                ),
              );
              // Customdialog.closeDialog(context);
            } else {}
          });
        },
        verificationFailed: (FirebaseException e) {
          FocusScope.of(context).unfocus();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(e.message.toString()),
            duration: const Duration(seconds: 12),
          ));
        },
        codeSent: (String VID, int? resentToken) {
          setState(() {
            verificationCode = VID;
          });
        },
        codeAutoRetrievalTimeout: (String VID) {
          setState(() {
            verificationCode = VID;
          });
        },
        timeout: const Duration(seconds: 50));
  }

  // void addPhone() async {
  //   await DatabaseMethods().numberAdd();
  //   // .then((value) => Customdialog.closeDialog(context));
  // }
}
