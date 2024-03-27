import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import the services.dart package
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sentiment Analysis Ver Vietnamese',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SentimentAnalysisPage(),
    );
  }
}

class SentimentAnalysisPage extends StatefulWidget {
  const SentimentAnalysisPage({Key? key});

  @override
  _SentimentAnalysisPageState createState() => _SentimentAnalysisPageState();
}

class _SentimentAnalysisPageState extends State<SentimentAnalysisPage> {
  final TextEditingController _textEditingController = TextEditingController();
  String _sentiment = '';
  IconData _sentimentIcon = Icons.sentiment_neutral;
  Color _sentimentColor = Colors.black;
  Color _backgroundColor = Colors.white; // Define _backgroundColor variable

  Future<String> queryAPI(String text) async {
    const apiUrl =
        "https://api-inference.huggingface.co/models/wonrax/phobert-base-vietnamese-sentiment";
    final headers = {
      "Authorization": "Bearer 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",
      "Content-Type": "application/json",
    };

    final payload = jsonEncode({
      "inputs": text
    });

    final response =
    await http.post(Uri.parse(apiUrl), headers: headers, body: payload);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)[0] as List<dynamic>; // Access the first array in the response
      double maxScore = 0.0;
      String sentiment = 'NEU'; // Default to neutral sentiment
      for (var item in data) {
        double score = item['score'];
        if (score > maxScore) {
          maxScore = score;
          sentiment = item['label'];
        }
      }
      return sentiment;
    } else {
      throw Exception('Failed to query API');
    }
  }



  void _analyzeSentiment() async {
    Color colorPOS = Colors.green[400]!; // Selects a mid-range green.
    Color colorNEG = Colors.red[400]!; // Selects a mid-range green.
    Color colorNEU = Colors.grey[400]!; // Selects a mid-range green.
    String inputText = _textEditingController.text;
    String sentiment;
    try {
      sentiment = await queryAPI(inputText);
    } catch (e) {
      sentiment = 'Error';
    }

    IconData sentimentIcon;
    Color sentimentColor;
    Color backgroundColor;

    switch (sentiment) {
      case 'POS':
        sentimentIcon = Icons.sentiment_very_satisfied;
        sentimentColor = Colors.green;
        backgroundColor = colorPOS; // Light green background for positive sentiment
        break;
      case 'NEU':
        sentimentIcon = Icons.sentiment_neutral;
        sentimentColor = Colors.grey;
        backgroundColor = colorNEU; // Grey background for neutral sentiment
        break;
      case 'NEG':
        sentimentIcon = Icons.sentiment_very_dissatisfied;
        sentimentColor = Colors.red;
        backgroundColor = colorNEG ;
        break;
      default:
        sentimentIcon = Icons.sentiment_neutral;
        sentimentColor = Colors.black;
        backgroundColor = Colors.white; // Default white background
    }

    setState(() {
      _sentiment = sentiment;
      _sentimentIcon = sentimentIcon;
      _sentimentColor = sentimentColor;
      _backgroundColor = backgroundColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phân tích tình cảm'),
      ),
      body: Container(
      color: _backgroundColor, // Set the background color dynamically
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _textEditingController,
              keyboardType: TextInputType.text,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'[a-zA-ZÀ-ỹ\s\d]+$'),
                ),
              ],
              decoration: const InputDecoration(
                labelText: 'Nhập để phân tích từ ngữ',
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _analyzeSentiment,
              child: const Text('Phân tích'),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Sentiment: $_sentiment',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: _sentimentColor,
              ),
            ),
            const SizedBox(height: 10.0),
            Icon(
              _sentimentIcon,
              size: 50.0,
              color: _sentimentColor,
            ),
          ],
        ),
      ),
    ),
    );
  }
}
