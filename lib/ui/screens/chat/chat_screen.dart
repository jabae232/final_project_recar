import 'package:car_m/constants/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];

  void _handleSubmit(String text) {
    _controller.clear();
    setState(() {
      _messages.insert(0, text);
    });
  }

  Widget _buildTextComposer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              onSubmitted: _handleSubmit,
              decoration: const InputDecoration.collapsed(hintText: "Send a message"),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () => _handleSubmit(_controller.text),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.blue,
        ),
        elevation: 0,
        title: Text("Chat",style: AppStyles.s24w700.copyWith(color: AppColors.mainBlack),),
        backgroundColor: AppColors.background,
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Text(_messages[index]),
                );
              },
            ),
          ),
          const Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }
}