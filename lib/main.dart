import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ТЕСТОВОЕ ЗАДАНИЕ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TextInputScreen(),
    );
  }
}

class TextInputScreen extends StatefulWidget {
  const TextInputScreen({super.key});

  @override
  TextInputScreenState createState() => TextInputScreenState();
}

class TextInputScreenState extends State<TextInputScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  String _inputText = '';
  String? _errorText;

  void _updateText(String newText) {
    setState(() {
      _inputText = newText;
      if (newText.isNotEmpty) {
        _errorText = null;
      }
    });
  }

  void _clearText() {
    setState(() {
      _textEditingController.clear();
      _inputText = '';
      _errorText = null;
    });
  }

  void _validateInput() {
    if (_inputText.isEmpty) {
      setState(() {
        _errorText = 'Введите текст';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ТЕСТОВОЕ ЗАДАНИЕ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: 'Введите текст',
                errorText: _errorText,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _updateText(_textEditingController.text);
                _validateInput();
              },
              child: const Text('Отобразить текст'),
            ),
            ElevatedButton(
              onPressed: () {
                _clearText();
              },
              child: const Text('Очистить текстовое поле'),
            ),
            const SizedBox(height: 20),
            Text(
              _inputText,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
