import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zain_finance/screens/main/check_balance.dart';
import 'package:zain_finance/screens/send/send_cash.dart';
import 'package:zain_finance/screens/send/send_money.dart';
import 'package:zain_finance/screens/utils/textfield.dart';
import 'package:zain_finance/screens/western_union/western_union.dart';
import 'package:zain_finance/screens/widget/drawer_widget.dart';

class MainDashBoard extends StatefulWidget {
  const MainDashBoard({super.key});

  @override
  State<MainDashBoard> createState() => _MainDashBoardState();
}

class _MainDashBoardState extends State<MainDashBoard> {
  TextEditingController _searchController = TextEditingController();
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
                  child: Image.asset(
                    "assets/unnamed.png",
                    height: 40,
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
              drawer: DrawerWidget(),
              body: Column(
                children: [
                  Container(
                    color: Color(0xff006f76),
                    height: 170,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormInputField(
                            controller: _searchController,
                            hintText: "Search",
                            textInputType: TextInputType.text,
                          ),
                        ),
                        Text(
                          "Basic",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => CheckBalance()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Icon(
                                      Icons.visibility,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "Check \n Balance",
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.location_pin,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "Nearest \n Agents",
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.qr_code_scanner,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "View My QR",
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.notifications,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "Notifications",
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Financial Features",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => WesternUnion()));
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/west.jpg",
                                height: 50,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Western Union",
                                style: TextStyle(color: Colors.black),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.payment,
                              color: Color(0xffe3d600),
                              size: 50,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Wallet Card",
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () async {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return SimpleDialog(
                                    children: <Widget>[
                                      SimpleDialogOption(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (builder) =>
                                                      SendMoney()));
                                        },
                                        child: const Text('Send Money'),
                                      ),
                                      SimpleDialogOption(
                                        onPressed: () {
                                          //  Navigator.pop(context, Department.state);
                                        },
                                        child: const Text('Request Money'),
                                      ),
                                    ],
                                  );
                                });
                          },
                          child: Column(
                            children: [
                              Icon(
                                Icons.money,
                                color: Colors.green,
                                size: 50,
                              ),
                              Text(
                                "Local Money\n Transfer",
                                style: TextStyle(color: Colors.black),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => SendCash()));
                          },
                          child: Column(
                            children: [
                              Icon(
                                Icons.monetization_on,
                                color: Colors.green,
                                size: 50,
                              ),
                              Text(
                                "Cash Out",
                                style: TextStyle(color: Colors.black),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Service Provider",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.flight,
                              color: Colors.blueAccent,
                              size: 50,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Flight and Hotel \n Bookings",
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.cast_for_education,
                              color: Colors.blue,
                              size: 50,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Education",
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.favorite_border,
                              color: Colors.black,
                              size: 50,
                            ),
                            Text(
                              "Health & Beauty",
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Flexible(child: Container()),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Pay",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(350, 54),
                        backgroundColor: Color(0xff006f76),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Text("");
          }
        });
  }
}
