// lib/Services/vision_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class VisionService {
  final String apiKey = 'YOUR_GOOGLE_CLOUD_VISION_API_KEY'; // Ganti dengan API key Anda

  Future<List<String>> analyzeImage(String imageUrl) async {
    final apiUrl = 'https://vision.googleapis.com/v1/images:annotate?key=$apiKey';

    final body = json.encode({
      "requests": [
        {
          "image": {
            "source": {
              "imageUri": imageUrl
            }
          },
          "features": [
            {
              "type": "LABEL_DETECTION",
              "maxResults": 5
            }
          ]
        }
      ]
    });

    final response = await http.post(Uri.parse(apiUrl), headers: {
      'Content-Type': 'application/json',
    }, body: body);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final labels = (jsonResponse['responses'][0]['labelAnnotations'] as List)
          .map<String>((label) => label['description'])
          .toList();
      return labels;
    } else {
      throw Exception('Failed to analyze image');
    }
  }
}
