import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:zain_finance/screens/main/main_dashboard.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({super.key});

  @override
  State<SendMoney> createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  TextEditingController _amountController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  bool isLoading = false;
  Future<String> loadData() async {
    // Simulate data loading delay
    await Future.delayed(Duration(seconds: 2));
    return 'Loaded Data';
  }

  var uuid = Uuid().v4();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Image.asset("assets/unnamed.png"));
          } else if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Send Money",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                iconTheme: IconThemeData(color: Colors.white),
                backgroundColor: Color(0xff006f76),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.headphones,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.abc),
                          labelText: "Value*",
                          hintText: "Amount Value"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _numberController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.contact_emergency),
                          labelText: "Phone*",
                          hintText: "Phone Number"),
                    ),
                  ),
                  isLoading
                      ? CircularProgressIndicator()
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              await FirebaseFirestore.instance
                                  .collection("sendmoney")
                                  .doc(uuid)
                                  .set({
                                "amount": int.parse(_amountController.text),
                                "phone": _numberController.text,
                                "uuid": uuid,
                              });
                              setState(() {
                                isLoading = true;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => MainDashBoard()));
                            },
                            child: Text(
                              "Transfer",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(350, 54),
                              backgroundColor: Color(0xff800000),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                            ),
                          ),
                        )
                ],
              ),
            );
          } else {
            return Text("Loading");
          }
        });
  }
}
