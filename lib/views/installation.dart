import 'package:flutter/material.dart';

class InstallationPage extends StatelessWidget {
  const InstallationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Installation',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(255, 5, 91, 12),
        automaticallyImplyLeading: false,
      ),
    );
  }
}
