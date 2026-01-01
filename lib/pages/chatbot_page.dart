// lib/pages/chatbot_page.dart
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../models/chat_message.dart';
import '../config/secrets.dart';

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({super.key});

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];
  bool _loading = false;

  void _sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(ChatMessage(text, true));
      _loading = true;
    });
    _controller.clear();

    try {
      final dio = Dio();
      final response = await dio.post(
        'https://api.openai.com/v1/chat/completions',
        options: Options(headers: {
          'Authorization': 'Bearer $openAiApiKey',
          'Content-Type': 'application/json',
        }),
        data: {
          'model': 'gpt-3.5-turbo',
          'messages': [{'role': 'user', 'content': text}],
          'max_tokens': 150,
          'temperature': 0.7,
        },
      );

      final botReply =
          response.data['choices'][0]['message']['content'].trim();
      setState(() {
        _messages.add(ChatMessage(botReply, false));
      });
    } catch (e) {
      setState(() {
        _messages.add(ChatMessage("Erreur de connexion", false));
      });
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chatbot")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (_, i) {
                final msg = _messages[i];
                return ListTile(
                  title: Align(
                    alignment: msg.isUser
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: msg.isUser
                          ? Colors.indigo[100]
                          : Colors.grey[300],
                      child: Text(msg.text),
                    ),
                  ),
                );
              },
            ),
          ),
          if (_loading) const LinearProgressIndicator(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration:
                        const InputDecoration(hintText: "Posez une question..."),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}