import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class OrderSuccessful extends StatelessWidget {
  static const routeName = '/ordersucess';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('Book Store'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Order Placed Successfully'),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              color: Colors.brown,
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
              child: Text(
                'Continue Shopping',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
