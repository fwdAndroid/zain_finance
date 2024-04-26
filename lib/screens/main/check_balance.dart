import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zain_finance/screens/western_union/western_money_transaction.dart';

class CheckBalance extends StatefulWidget {
  const CheckBalance({super.key});

  @override
  State<CheckBalance> createState() => _CheckBalanceState();
}

class _CheckBalanceState extends State<CheckBalance> {
  var totalAmount = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calculateTotalAmount();
  }

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
                    "Cash/Balance",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
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
                    child: Container(
                      width: 374,
                      height: 120,
                      decoration: ShapeDecoration(
                        color: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Current Balance',
                              style: GoogleFonts.plusJakartaSans(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 0,
                                letterSpacing: -0.32,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '\$$totalAmount',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 46,
                                fontWeight: FontWeight.w400,
                                height: 0,
                                letterSpacing: -1.50,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) =>
                                      WesternMoneyTransaction()));
                        },
                        child: Text("Transaction History")),
                  )
                ],
              ),
            );
          } else {
            return Center(
              child: Text(snapshot.data.toString()),
            );
          }
        });
  }

  Future<void> calculateTotalAmount() async {
    // Query Firestore to calculate total amount
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('westernunion') // Replace with your collection name

          .get();

      double total = 0.0;

      querySnapshot.docs.forEach((doc) {
        total +=
            (doc['amount'] ?? 0.0); // Replace 'amount' with your field name
      });

      setState(() {
        totalAmount = total.toInt();
      });
    } catch (e) {
      print('Error calculating total amount: $e');
    }
  }
}
