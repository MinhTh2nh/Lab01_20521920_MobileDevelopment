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
      title: 'Sentiment Analysis',
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
        "https://myresourcegroupdemo.cognitiveservices.azure.com/text/analytics/v2.0/sentiment";
    final headers = {
      "Content-Type": "application/json",
      "Ocp-Apim-Subscription-Key": "ed113a4a4f6e4b52ae6f3d805c91b2ad",
    };

    final payload = jsonEncode({
      "documents": [
        {"id": "1", "language": "en", "text": text}
      ]
    });

    final response =
    await http.post(Uri.parse(apiUrl), headers: headers, body: payload);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)["documents"] as List<dynamic>;
      double maxScore = 0.0;
      for (var item in data) {
        double score = item['score'];
        if (score > maxScore) {
          maxScore = score;
          if (score > 0.5) {
            _sentiment = 'POS';
          } else if (score < 0.5) {
            _sentiment = 'NEG';
          } else {
            _sentiment = 'NEU';
          }
        }
      }
      return _sentiment;
    } else {
      throw Exception('Failed to query API');
    }
  }

  void _analyzeSentiment() async {
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
        backgroundColor = Colors.lightGreen; // Light green background for positive sentiment
        break;
      case 'NEU':
        sentimentIcon = Icons.sentiment_neutral;
        sentimentColor = Colors.grey;
        backgroundColor = Colors.grey; // Grey background for neutral sentiment
        break;
      case 'NEG':
        sentimentIcon = Icons.sentiment_very_dissatisfied;
        sentimentColor = Colors.red;
        backgroundColor = Colors.red; // Light red background for negative sentiment
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
        title: const Text('Sentiment Analysis'),
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
                labelText: 'Enter text to analyze',
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _analyzeSentiment,
              child: const Text('Analyze'),
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
