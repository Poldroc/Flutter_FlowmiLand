class HttpHelper {
  //登录
  static const String Login = "/api/v1/user/login/";

  //注册
  static const String Sign_Up = "http://182.61.52.110:5000/api/v1/user/";

  //上传土地
  static const String Upload_Land = "http://182.61.52.110:5000/api/v1/land/";

  //查询土地
  static const String Get_Land = "http://182.61.52.110:5000/api/v1/land/";

  //收藏土地
  static const String Collect_Land =
      "http://182.61.52.110:5000/api/v1/user/collect/";

  //取消收藏
  static const String UnCollect_Land =
      "http://182.61.52.110:5000/api/v1/user/uncollect/";

  //查询收藏土地
  static const String Get_Collect_Land =
      "http://182.61.52.110:5000/api/v1/user/collections/";


  //评论土地
  static const String Comment_Land =
      "http://182.61.52.110:5000/api/v1/comment/";

  
  //获取评论列表
  static const String  Get_Comment =
      "http://182.61.52.110:5000/api/v1/comment/";

}
