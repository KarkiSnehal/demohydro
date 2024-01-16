import 'package:flutter/material.dart';

class SystemBuy extends StatelessWidget {
  const SystemBuy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          'System',
          style: TextStyle(color: Colors.white),
        ),
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(255, 5, 91, 12),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(),
        ),
      ),
    );
  }
}
