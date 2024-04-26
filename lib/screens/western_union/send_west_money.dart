import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:zain_finance/screens/main/main_dashboard.dart';

class SendWesternMoney extends StatefulWidget {
  const SendWesternMoney({super.key});

  @override
  State<SendWesternMoney> createState() => _SendWesternMoneyState();
}

class _SendWesternMoneyState extends State<SendWesternMoney> {
  TextEditingController _reciverNameController = TextEditingController();
  TextEditingController _countryNameController = TextEditingController();
  TextEditingController _currencyNameController = TextEditingController();
  TextEditingController amountCountroller = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isLoading = false;
  var uuid = Uuid().v4();

  Future<String> loadData() async {
    // Simulate data loading delay
    await Future.delayed(Duration(seconds: 2));
    return 'Loaded Data';
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
                appBar: AppBar(
                  actions: [Icon(Icons.refresh)],
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
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Recive Details",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _reciverNameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Reciver Name",
                              hintText: "Receiver Name"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _countryNameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Country Name",
                              hintText: "Country Name"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _currencyNameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Currency Name",
                              hintText: "Currency Name"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: amountCountroller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: "Amount", hintText: "Amount"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: dateController,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                              labelText: "Transaction Date", hintText: "Date"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          maxLines: 4,
                          controller: descriptionController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Description",
                              hintText: "description"),
                        ),
                      ),
                      isLoading
                          ? CircularProgressIndicator()
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (_reciverNameController.text.isEmpty ||
                                      _countryNameController.text.isEmpty ||
                                      _currencyNameController.text.isEmpty ||
                                      amountCountroller.text.isEmpty ||
                                      dateController.text.isEmpty ||
                                      descriptionController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content:
                                                Text("All Fields Required")));
                                  } else {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    await FirebaseFirestore.instance
                                        .collection("westernunion")
                                        .doc(uuid)
                                        .set({
                                      "name": _reciverNameController.text,
                                      "amount":
                                          int.parse(amountCountroller.text),
                                      "date": dateController.text,
                                      "description:":
                                          descriptionController.text,
                                      "currency": _currencyNameController.text,
                                      "country": _countryNameController.text,
                                      "uuid": uuid,
                                    });
                                    setState(() {
                                      isLoading = false;
                                    });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) =>
                                                MainDashBoard()));
                                  }
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
                ));
          } else {
            return Center(
              child: Text(snapshot.data.toString()),
            );
          }
        });
  }
}
