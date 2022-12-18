import 'package:get/get.dart';
import 'package:my/app/modules/Communication/chatData.dart';

class CommunicationState{
   var hasNoText = true.obs;
   RxList<ChatMessageData> data =<ChatMessageData> [].obs;

}