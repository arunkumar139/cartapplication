import 'dart:developer';
import 'package:badges/badges.dart';

import 'package:cartapplication/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'checkout.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  List<items> data = [];
  List<items> data1 = [];
  late final ValueSetter<items> _valueSetter;

  int counter = 0;
  int sum = 0;
  @override
  void initState() {
    getItemDetails();
    // TODO: implement initState
    super.initState();
  }

  getdata(_valueSetter) {
    setState(() {
      data1.add(_valueSetter);
      sum = 0;
      data1.forEach((element) {
        sum = sum + element.itemPrice;
      });
      print('sum is $sum');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Text('Dashboard'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  setState(() {
                    preferences.remove('Email');
                    preferences.remove('Password');
                  });

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                },
                icon: Icon(Icons.logout)),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => checkout(data1, sum)));
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 20),
              child: Badge(
                badgeColor: Colors.white,
                badgeContent: Text('$counter'),
                child: Icon(Icons.shopping_cart_outlined),
              ),
            ),
          ),
          // InkWell(
          //   onTap: () {
          //
          //   },
          //   child: Padding(
          //     padding: const EdgeInsets.only(right: 10.0),
          //     child: Row(
          //       children: [
          //         Center(child: Icon(Icons.shopping_cart)),
          //         Center(child: Text('$counter')),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Card(
                          color: Colors.white,
                          child: ListTile(
                            minLeadingWidth: 10,
                            horizontalTitleGap: 2,
                            leading: Image.asset(
                              data[index].imagepath,
                              height: 80,
                              width: 100,
                            ),
                            title: Text(
                              data[index].itemName,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text('Rs. ${data[index].itemPrice}',
                                style: TextStyle(
                                  fontSize: 14,
                                )),
                            trailing: ElevatedButton(
                              child: Text('Add to cart'),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.black)),
                              onPressed: () {
                                setState(() {
                                  getdata(data[index]);
                                  counter++;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    )),
          )
        ],
      )),
    );
  }

  void getItemDetails() {
    data = [];
    data.add(items('Biryani', 300, 'assets/foodimage.jpg'));
    data.add(items('Pizza', 400, 'assets/foodimage.jpg'));
    data.add(items('Meals', 400, 'assets/foodimage.jpg'));
    data.add(items('Desert', 500, 'assets/foodimage.jpg'));
    data.add(items('IceCream', 600, 'assets/foodimage.jpg'));
    data.add(items('Pepper Chicken', 700, 'assets/foodimage.jpg'));
  }
}

class items {
  String itemName, imagepath;
  int itemPrice;
  items(this.itemName, this.itemPrice, this.imagepath);
}
