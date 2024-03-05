//import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrogang/screens/prediction_result.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> pickImageAndPredict(BuildContext context) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    final imageFile = File(pickedFile.path);

    try {
      const String apiUrl = 'http://10.0.2.2:5000/predict';

      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      request.files.add(
        await http.MultipartFile.fromPath('file', imageFile.path),
      );

      var response = await request.send();

      if (response.statusCode == 200) {
        // Successful response, handle the prediction result
        String? predictionResult = await response.stream.bytesToString();
        if (kDebugMode) {
          print('Prediction Result: $predictionResult');
        }

        //String? predictionResult = await response.stream.bytesToString();

        // ignore: unnecessary_null_comparison
        if (predictionResult != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PredictionResultScreen(
                predictionResult: predictionResult,
              ),
            ),
          );
        } else {
          // Handle error
          if (kDebugMode) {
            print('Error: Prediction result is null');
          }
        }
      } else {
        // Handle error
        if (kDebugMode) {
          print('Error: ${response.statusCode}');
        }
      }
    } catch (e) {
      // handle error
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }
}
