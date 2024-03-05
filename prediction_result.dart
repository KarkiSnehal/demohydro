import 'dart:convert';

import 'package:flutter/material.dart';

class PredictionResultScreen extends StatelessWidget {
  final String predictionResult;

  const PredictionResultScreen({super.key, required this.predictionResult});

  String getDeficiencyMessage(int classLabel) {
    switch (classLabel) {
      case 1:
        return 'Your plant has Nitrogen deficiency.';
      case 2:
        return 'Your plant has Phosphorous deficiency.';
      case 3:
        return 'Your plant is Fully Nutritional.';
      case 0:
        return 'Your plant has Potassium deficiency.';
      default:
        return 'Unknown deficiency.';
    }
  }

  @override
  Widget build(BuildContext context) {
    //Parse the JSON string to a Map
    Map<String, dynamic> result = jsonDecode(predictionResult);

    //Extrsct the class_label from the Map
    int classLabel = result['class_label'];

    //Get the deficiency message
    String deficiencyMessage = getDeficiencyMessage(classLabel);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          'Prediction Result',
          style: TextStyle(color: Colors.white),
        ),
        toolbarHeight: 80,
        backgroundColor: const Color.fromARGB(255, 5, 91, 12),
      ),
      body: Center(
        //child: Text(predictionResult),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              deficiencyMessage,
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
