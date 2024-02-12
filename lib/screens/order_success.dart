import 'package:flutter/material.dart';

class OrderSuccesScreen extends StatelessWidget {
  const OrderSuccesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("images/success.png"),
          Text("Success!"),
          Text("Your order will be delivered soon."),
          Text("Thank you for choosing our system."),
        ],
      ),
    );
  }
}
