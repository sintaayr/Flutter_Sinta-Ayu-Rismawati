import 'dart:convert';

import 'package:http/http.dart' as http;
import '../constants/open_ai.dart';
import '../models/open_ai.dart';

class RecommendationService {
  static Future<GptData> getSmartphoneRecommendations({
    required String price,
    required String cameraQuality,
    required String storageCapacity,
  }) async {
    late GptData gptData = GptData(
      id: "",
      object: "",
      created: 0,
      model: "",
      choices: [],
      usage: Usage(completionTokens: 0, promptTokens: 0, totalTokens: 0),
    );

    try {
      var url = Uri.parse('https://api.openai.com/v1/completions');

      Map<String, String> headers = {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8',
        'Authorization': 'Bearer $apiKey'
      };

      String promptData =
          "Berikan rekomendasi smartphone dengan harga kisaran $price rupiah dengan kualitas kamera $cameraQuality MP dan memiliki penyimpanan lokal $storageCapacity GB.";
      final data = jsonEncode({
        "model": "text-davinci-003",
        "prompt": promptData,
        "temperature": 0.4,
        "max_tokens": 1000,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0
      });

      var response = await http.post(url, headers: headers, body: data);
      
      if (response.statusCode == 200) {
        gptData = gptDataFromJson(response.body);
      }
    } catch (e) {
      throw Exception('Error occurred when sending request.');
    }

    return gptData;
  }
}
