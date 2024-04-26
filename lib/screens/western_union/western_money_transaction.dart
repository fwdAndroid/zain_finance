import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WesternMoneyTransaction extends StatefulWidget {
  const WesternMoneyTransaction({super.key});

  @override
  State<WesternMoneyTransaction> createState() =>
      _WesternMoneyTransactionState();
}

class _WesternMoneyTransactionState extends State<WesternMoneyTransaction> {
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
                centerTitle: true,
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Transaction\n History",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                iconTheme: IconThemeData(color: Colors.white),
                backgroundColor: Color(0xff006f76),
              ),
              body: StreamBuilder(
                stream: getContactsStream(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.data!.docs.isEmpty) {
                    return Center(
                      child: Text(
                        "No Transaction Details Available",
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      final List<DocumentSnapshot> documents =
                          snapshot.data!.docs;
                      final Map<String, dynamic> data =
                          documents[index].data() as Map<String, dynamic>;
                      return Card(
                        elevation: 1,
                        color: Colors.white,
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                'Send Money',
                                style: GoogleFonts.plusJakartaSans(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "MTCN",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                          data['uuid'].toString().substring(25))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Reciver Name",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(data['name'])
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Destination Country",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(data['country'])
                                    ],
                                  ),
                                ],
                              ),
                              // Add more fields as needed
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Claimed",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(data['amount'].toString())
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            );
          } else {
            return Text("data");
          }
        });
  }

  Stream<QuerySnapshot> getContactsStream() {
    return FirebaseFirestore.instance.collection("westernunion").snapshots();
  }
}
