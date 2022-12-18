import 'dart:convert';

import 'package:flutter/foundation.dart';

class ChatMessageData {
  final int? senderId;
  final String? content;
  ChatMessageData({this.senderId, this.content});

  factory ChatMessageData.fromJson(Map<String, dynamic> json) {
    return ChatMessageData(
      senderId: json["senderId"],
      content: json["content"],
    );
  }
}

List defaultChatMessages = [
  ChatMessageData(content: "Hello", senderId: 1),
  ChatMessageData(content: "Hello", senderId: 2),
  ChatMessageData(content: "你好吗", senderId: 1),
  ChatMessageData(content: "好好好好好好", senderId: 1),
  ChatMessageData(content: "HelloHelloHello", senderId: 2),
  ChatMessageData(content: "", senderId: 2),
  ChatMessageData(content: "Hello", senderId: 1),
  
];
