import 'dart:developer';

import 'package:cartapplication/list.dart';
import 'package:cartapplication/orderplaced.dart';
import 'package:flutter/material.dart';

class checkout extends StatefulWidget {
  final data;
  final sum;
  checkout(this.data, this.sum);

  @override
  _checkoutState createState() => _checkoutState(this.data, this.sum);
}

class _checkoutState extends State<checkout> {
  final data;
  final sum;
  _checkoutState(this.data, this.sum);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Check Out'),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.15,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 1.40,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          shrinkWrap: true,
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
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text('Rs. ${data[index].itemPrice}',
                                      style: TextStyle(
                                        fontSize: 14,
                                      )),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Amount:',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Text('$sum'),
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              data.clear();
                            });
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OrderPlaced()));
                          },
                          child: Text('Proceed')),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
