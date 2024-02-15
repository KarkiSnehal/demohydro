import 'package:flutter/material.dart';

class OrderSuccesScreen extends StatelessWidget {
  const OrderSuccesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://i.gifer.com/7efs.gif',
            width: 100,
            height: 100,
          ),
          Text("Success!"),
          Text("Your order will be delivered soon."),
          Text("Thank you for choosing our system."),
        ],
      ),
    );
  }
}
