import 'package:cartapplication/list.dart';
import 'package:flutter/material.dart';

class OrderPlaced extends StatefulWidget {
  @override
  _OrderPlacedState createState() => _OrderPlacedState();
}

class _OrderPlacedState extends State<OrderPlaced> {
  @override
  void initState() {
    new Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => dashboard()),
            ));
    // Navigator.pop(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('assets/orderplaced.jpg'),
            ),
            Center(
                child: Text(
              'Thanks For Placing The Order',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )),
            Center(
                child: Text(
              'Successfully Your Order is Placed',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ))
          ],
        ),
      ),
    );
  }
}
