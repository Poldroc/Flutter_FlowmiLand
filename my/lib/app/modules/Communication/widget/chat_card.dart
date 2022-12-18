import 'package:flutter/material.dart';

import '../testData.dart';

class ChatCard extends StatelessWidget {
  final Uer chatUer;
  final VoidCallback press;
  const ChatCard({
    Key? key,
    required this.chatUer, required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 12),
      child: InkWell(
        onTap: press,
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(chatUer.avatar),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        chatUer.name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, bottom: 10),
                        child: Container(
                          alignment: Alignment.topRight,
                          height: 6,
                          width: 6,
                          decoration: BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Opacity(
                    opacity: 0.64,
                    child: Text(
                      chatUer.lastcontent,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14),
                    ),
                  )
                ],
              ),
            )),
            Opacity(
              opacity: 0.64,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.access_time,
                    size: 12,
                  ),
                  Text(
                    "5小时前",
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
