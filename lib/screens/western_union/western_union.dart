import 'package:flutter/material.dart';
import 'package:zain_finance/screens/western_union/send_west_money.dart';
import 'package:zain_finance/screens/western_union/western_money_transaction.dart';
import 'package:shimmer/shimmer.dart';

class WesternUnion extends StatefulWidget {
  const WesternUnion({super.key});

  @override
  State<WesternUnion> createState() => _WesternUnionState();
}

class _WesternUnionState extends State<WesternUnion> {
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
                    "Western Union",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                iconTheme: IconThemeData(color: Colors.white),
                backgroundColor: Color(0xff006f76),
              ),
              body: Column(
                children: [
                  Container(
                    color: Colors.black,
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Center(
                      child: Text(
                        "Western Union",
                        style: TextStyle(color: Colors.yellow),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/union.png",
                      height: 150,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Transfer money internationally accorss 2000+  \n  countries instansly",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(fixedSize: Size(340, 50)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => SendWesternMoney()));
                      },
                      child: Text("Send Money"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(fixedSize: Size(340, 50)),
                      onPressed: () {},
                      child: Text("Recieve Money"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(fixedSize: Size(340, 50)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) =>
                                    WesternMoneyTransaction()));
                      },
                      child: Text("Transaction History"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(fixedSize: Size(340, 50)),
                      onPressed: () {},
                      child: Text("Saved Recivers List"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(fixedSize: Size(340, 50)),
                      onPressed: () {},
                      child: Text("Fee Calculator"),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            // If there's an error, display it
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            // Once data is loaded, display it
            return Center(
              child: Text(snapshot.data.toString()),
            );
          }
        });
  }
}
