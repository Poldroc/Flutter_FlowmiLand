import 'dart:async';
import 'dart:convert';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my/app/modules/Communication/chatData.dart';
import 'package:my/app/modules/Communication/state/communicate_state.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:async';

import 'package:socket_io_client/socket_io_client.dart';

/* // STEP1:  Stream setup
class StreamSocketController extends GetxController {
  final _socketResponse = StreamController<ChatMessageData>();

  void Function(ChatMessageData) get addResponse => _socketResponse.sink.add;

  Stream<ChatMessageData> get getResponse => _socketResponse.stream;

  void dispose() {
    _socketResponse.close();
  }
} 

StreamSocketController streamSocket = StreamSocketController();
*/
class CommunicationController extends GetxController {
  final state = CommunicationState();
  late IO.Socket socket;
  final scrollController = ScrollController();
  //final socketResponse= StreamController<ChatMessageData>();
  final ChatInputController = TextEditingController();

  //void Function(ChatMessageData) get addResponse => socketResponse.sink.add;

  //Stream<ChatMessageData> get getResponse => socketResponse.stream;
  var url = 'http://182.61.52.110:5000';

  void connectAndListen(int senderId, int recipientId) {
    socket = IO.io(url, OptionBuilder()
       .setTransports(['websocket']).build());

    socket.onConnect((_) {
      print('connect');
      socket.emit('join', getRoomId(senderId, recipientId));
    });

    socket.on('server_response', (data) {
      var list = data as List;
      list.forEach((element) {
        print(element);
        state.data.add(ChatMessageData.fromJson(element));
      });
      update();
      scrollController.jumpTo(scrollController.position.maxScrollExtent + 80);
    });

    socket.onDisconnect((_) => print('disconnect'));

    // 链接出错时调用
    socket.on("connect_error", (data) => print('connect_error: ' + data.toString()));
    // 链接断开时调用
    socket.on('disconnect', (_) => print('disconnect======'));
    // 链接关闭时调用
    socket.on('close', (_) => print('close===='));
    // 服务端emit一个message的事件时，可以直接监听到
    socket.on('message', (data) {
      print('onmessage');
      print(data);
    });
  }

// 关闭websocket链接，避免内存占用

  sendMsg(String content, int senderId, int recipientId) {
    socket.emit('client_event', {
      "content": content,
      "senderId": senderId,
      "recipientId": recipientId,
      "roomId": getRoomId(senderId, recipientId)
    });
  }

  getMsg() {
    socket.on('server_response',
        (data) => state.data.add(ChatMessageData.fromJson(data)));
  }

  String getRoomId(int uid1, int uid2) {
    var num1 = (uid1 + uid2).toString();
    var num2 = (uid1 * uid2).toString();
    return base64.encode(utf8.encode(num1 + "|" + num2));
  }

  @override
  void onInit() {
    super.onInit();
    // 和服务器端建立连接
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    print('close');
    socket.close();
  }

  @override
  void dispose() {
    super.dispose();
    ChatInputController.dispose();
    scrollController.dispose();
  }
}
