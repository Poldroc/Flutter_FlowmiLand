import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my/app/colors/global.colors.dart';
import 'package:my/app/widget/common_image.dart';
import 'package:my/models/Land_Comment.dart';
import 'package:my/utils/config.dart';
import 'package:my/utils/dio_http.dart';
import 'package:my/utils/http_helper.dart';

List<LandComment> dataList = [];

class CommentBottomSheet extends StatefulWidget {
  final TextEditingController editingController =
      TextEditingController(); //输入框的编辑
  final int? uid;
  final String token;
  final int? land_id;

  CommentBottomSheet({
    Key? key,
    this.uid,
    required this.token,
    this.land_id,
  }) : super(key: key);

  @override
  State<CommentBottomSheet> createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet>
    with WidgetsBindingObserver {
  @override
  late bool keyboard = false;
  void initState() {
    super.initState();
    print("我执行了吗");
    print(widget.land_id.toString());
    _getCommentList(widget.land_id);
    // 初始化监听页面高度
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      if (mounted)
        setState(() {
          // MediaQuery.of(context).viewInsets.bottom大于0就是代表键盘弹起，0位收回
          keyboard = MediaQuery.of(context).viewInsets.bottom > 0;
        });
    });
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    double height =
        MediaQuery.of(context).padding.bottom; // 这个很简单，就是获取高度，获取的底部安全区域的高度
    //键盘的弹起、收回状态

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // 触摸收起键盘
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(4),
                height: 4,
                width: 32,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Container(
                height: 24,
                alignment: Alignment.center,
                // color: Colors.white.withOpacity(0.2),
                child: Text(
                  '${dataList.length}条评论',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  itemCount: dataList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _CommentRow(commentData: dataList[index]);
                  },
                ),
              ), //评论框
              Row(
                children: [
                  Expanded(
                      child: Container(
                          margin: new EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: TextField(
                              autocorrect: true,
                              decoration: InputDecoration(
                                enabledBorder: new UnderlineInputBorder(
                                  // 不是焦点的时候颜色
                                  borderSide:
                                      BorderSide(color: Color(0x19000000)),
                                ),
                                focusedBorder: new UnderlineInputBorder(
                                  // 焦点集中的时候颜色
                                  borderSide:
                                      BorderSide(color: Color(0x19000000)),
                                ),

                                //设置提示内容，字体颜色、大小等
                                border: InputBorder.none,
                                hintText: "请发表你的评论",
                              ),
                              controller: widget.editingController))),
                  Offstage(
                    //控件隐藏控件
                    offstage: !keyboard,

                    ///键盘弹起，发布按钮显示、反之隐藏
                    child: GestureDetector(
                      onTap: () {
                        // 点击发布按钮判断输入框内容是否为空，并提示用户
                        if (widget.editingController.text.isEmpty) {
                          Fluttertoast.showToast(msg: "请填写评论信息");
                          return;
                        }
                        _submitComments(widget.editingController.text,
                            widget.land_id, widget.token, widget.uid);
                        widget.editingController.text = ""; //不为空，点击发布后，清空内容
                        FocusScope.of(context).requestFocus(FocusNode());
                        //关闭键盘
                      },
                      child: Container(
                        height: 30,
                        width: 50,
                        alignment: Alignment.center,
                        //padding: new EdgeInsets.fromLTRB(10, 0, 20, 0),
                        margin: new EdgeInsets.only(bottom: 0, right: 20),
                        decoration: BoxDecoration(
                          color: GlobalColors.kOrangeColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        child: Text(
                          "发布",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }

  _submitComments(
    String content,
    int? land_id,
    String token,
    int? uid,
  ) async {
    var url = HttpHelper.Comment_Land;

    var res = await DioHttp.of(context).post(url,
        {"token": token, "uid": uid, "land_id": land_id, "content": content});

    var resMap = json.decode(res.toString());
    int status = resMap['code'];
    String error = resMap['errorMsg'];
    print(status.toString());
    print('errorMsg' + error);
    print("token" +
        token +
        "uid" +
        uid.toString() +
        "land_id" +
        land_id.toString() +
        "content" +
        content);

    if (status == 1) {
      Fluttertoast.showToast(gravity: ToastGravity.CENTER, msg: "评论成功!");
    }
    if (mounted) {
      setState(() {
        _getCommentList(land_id);
      });
    }
  }

  Future<void> _getCommentList(int? land_id) async {
    var url = HttpHelper.Get_Comment;
    var res = await DioHttp.of(context)
        .get(url, {"land_id": land_id, "page": 1, "per_page": 20});

    print("land_id" + land_id.toString());

    var resMap = json.decode(res.toString());

    int status = resMap['code'];

    var list = [];
    dataList = [];

    list = resMap['data']['list'] as List;

    list.forEach((element) {
      print("list");
      print("-------");
      print(element);
      dataList.add(LandComment.fromJson(element));
    });
    if (mounted) {
      setState(() {});
    }

    dataList.forEach((element) {
      print(element);
    });
  }
}

class _CommentRow extends StatelessWidget {
  final LandComment commentData;
  const _CommentRow({
    Key? key,
    required this.commentData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String avator_address =
        Config.BaseUrl + commentData.commentUser!['avator_address'];
    String userName = commentData.commentUser!['username'];
    String content = commentData.content!;
    var info = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          userName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Container(height: 2),
        Text(
          content,
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
      ],
    );
    Widget right = Text(
        DateTime.fromMillisecondsSinceEpoch(
                int.parse(commentData.comment_time!) * 1000)
            .add(Duration(hours: 8))
            .toString()
            .substring(0, 19),
        style: TextStyle(fontSize: 12));

    var avatar = Container(
      margin: EdgeInsets.fromLTRB(0, 8, 10, 8),
      child: Container(
        height: 36,
        width: 36,
        child: ClipOval(
            child: CommonImage(
          src: avator_address,
          fit: BoxFit.cover,
          height: 36,
          width: 36,
        )),
      ),
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        children: <Widget>[
          avatar,
          Expanded(child: info),
          right,
        ],
      ),
    );
  }
}
