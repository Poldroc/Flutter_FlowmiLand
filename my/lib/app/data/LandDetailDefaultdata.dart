class LandDetailData {
  final String username;
  final String avator_address;
  final int land_id;
  final int sell_id;
  final String uid;
  final String address;
  final String price;
  final String land_type;
  final String area;
  final String ageLimit;
  final String describe;
  final int collections;
  final List<String> tags;
  final List<String> pic_address;

  LandDetailData(
      {required this.sell_id, 
        required this.uid,
      required this.collections,
      required this.ageLimit,
      required this.avator_address,
      required this.address,
      required this.pic_address,
      required this.area,
      required this.land_id,
      required this.describe,
      required this.price,
      required this.tags,
      required this.land_type,
      required this.username});

  
}

var defaultData = LandDetailData(
  uid: "1",
  collections: 0,
  land_id: 12,
  pic_address: [
    "https://img95.699pic.com/photo/50158/3996.jpg_wh860.jpg",
    "https://i.hexuexiao.cn/up/d7/40/87/8443453a15a2eaeb3a78cca46f8740d7.jpg.source.jpg",
    "https://ts1.cn.mm.bing.net/th/id/R-C.58099163d98d8a7fe1b76dc2d63e8202?rik=BY1fWjxegoljgQ&riu=http%3a%2f%2fimg.pconline.com.cn%2fimages%2fupload%2fupc%2ftx%2fphotoblog%2f1406%2f11%2fc6%2f35182775_35182775_1402491368015.jpg&ehk=jjog%2bWyO9hP8efcvKxNwskVzZiHfWNoEaaZWw7rJces%3d&risl=&pid=ImgRaw&r=0",
  ],
  username: '租地的张三',
  avator_address:
      "https://img2.woyaogexing.com/2022/07/22/60953f9c08b884f0!400x400.jpg",
  address: '福州 闽侯县',
  price: '5000',
  land_type: "农田",
  area: '1000',
  describe:
      "   详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述  描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述",
  tags: ['满足排水', '地形平整'],
  ageLimit: '5', sell_id: 1,
);

List<LandDetailData> defaultList = [
  LandDetailData(
  uid: "1",
  collections: 0,
  land_id: 12,
  pic_address: [
    "https://img95.699pic.com/photo/50158/3996.jpg_wh860.jpg",
    "https://i.hexuexiao.cn/up/d7/40/87/8443453a15a2eaeb3a78cca46f8740d7.jpg.source.jpg",
    "https://ts1.cn.mm.bing.net/th/id/R-C.58099163d98d8a7fe1b76dc2d63e8202?rik=BY1fWjxegoljgQ&riu=http%3a%2f%2fimg.pconline.com.cn%2fimages%2fupload%2fupc%2ftx%2fphotoblog%2f1406%2f11%2fc6%2f35182775_35182775_1402491368015.jpg&ehk=jjog%2bWyO9hP8efcvKxNwskVzZiHfWNoEaaZWw7rJces%3d&risl=&pid=ImgRaw&r=0",
  ],
  username: '租地的张三',
  avator_address:
      "https://img2.woyaogexing.com/2022/07/22/60953f9c08b884f0!400x400.jpg",
  address: '福州 闽侯县',
  price: '5000',
  land_type: "农田",
  area: '1000',
  describe:
      "   详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述  描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述",
  tags: ['满足排水', '地形平整'],
  ageLimit: '5', sell_id: 1,
),

  
  LandDetailData(
    uid: "1",
  collections: 0,
  land_id: 12,
  pic_address: [
    "https://img95.699pic.com/photo/50158/3996.jpg_wh860.jpg",
    "https://i.hexuexiao.cn/up/d7/40/87/8443453a15a2eaeb3a78cca46f8740d7.jpg.source.jpg",
    "https://ts1.cn.mm.bing.net/th/id/R-C.58099163d98d8a7fe1b76dc2d63e8202?rik=BY1fWjxegoljgQ&riu=http%3a%2f%2fimg.pconline.com.cn%2fimages%2fupload%2fupc%2ftx%2fphotoblog%2f1406%2f11%2fc6%2f35182775_35182775_1402491368015.jpg&ehk=jjog%2bWyO9hP8efcvKxNwskVzZiHfWNoEaaZWw7rJces%3d&risl=&pid=ImgRaw&r=0",
  ],
  username: '租地的张三',
  avator_address:
      "https://img2.woyaogexing.com/2022/07/22/60953f9c08b884f0!400x400.jpg",
  address: '福州 闽侯县',
  price: '5000',
  land_type: "农田",
  area: '1000',
  describe:
      "   详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述  描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述",
  tags: ['满足排水', '地形平整'],
  ageLimit: '5', sell_id: 1,
  ),
  LandDetailData(
    uid: "1",
  collections: 0,
  land_id: 12,
  pic_address: [
    "https://img95.699pic.com/photo/50158/3996.jpg_wh860.jpg",
    "https://i.hexuexiao.cn/up/d7/40/87/8443453a15a2eaeb3a78cca46f8740d7.jpg.source.jpg",
    "https://ts1.cn.mm.bing.net/th/id/R-C.58099163d98d8a7fe1b76dc2d63e8202?rik=BY1fWjxegoljgQ&riu=http%3a%2f%2fimg.pconline.com.cn%2fimages%2fupload%2fupc%2ftx%2fphotoblog%2f1406%2f11%2fc6%2f35182775_35182775_1402491368015.jpg&ehk=jjog%2bWyO9hP8efcvKxNwskVzZiHfWNoEaaZWw7rJces%3d&risl=&pid=ImgRaw&r=0",
  ],
  username: '租地的张三',
  avator_address:
      "https://img2.woyaogexing.com/2022/07/22/60953f9c08b884f0!400x400.jpg",
  address: '福州 闽侯县',
  price: '5000',
  land_type: "农田",
  area: '1000',
  describe:
      "   详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述  描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述",
  tags: ['满足排水', '地形平整'],
  ageLimit: '5', sell_id: 1,
  ),
  LandDetailData(
   uid: "1",
  collections: 0,
  land_id: 12,
  pic_address: [
    "https://img95.699pic.com/photo/50158/3996.jpg_wh860.jpg",
    "https://i.hexuexiao.cn/up/d7/40/87/8443453a15a2eaeb3a78cca46f8740d7.jpg.source.jpg",
    "https://ts1.cn.mm.bing.net/th/id/R-C.58099163d98d8a7fe1b76dc2d63e8202?rik=BY1fWjxegoljgQ&riu=http%3a%2f%2fimg.pconline.com.cn%2fimages%2fupload%2fupc%2ftx%2fphotoblog%2f1406%2f11%2fc6%2f35182775_35182775_1402491368015.jpg&ehk=jjog%2bWyO9hP8efcvKxNwskVzZiHfWNoEaaZWw7rJces%3d&risl=&pid=ImgRaw&r=0",
  ],
  username: '租地的张三',
  avator_address:
      "https://img2.woyaogexing.com/2022/07/22/60953f9c08b884f0!400x400.jpg",
  address: '福州 闽侯县',
  price: '5000',
  land_type: "农田",
  area: '1000',
  describe:
      "   详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述  描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述",
  tags: ['满足排水', '地形平整'],
  ageLimit: '5', sell_id: 1,
  ),
  LandDetailData(
    uid: "1",
  collections: 0,
  land_id: 12,
  pic_address: [
    "https://img95.699pic.com/photo/50158/3996.jpg_wh860.jpg",
    "https://i.hexuexiao.cn/up/d7/40/87/8443453a15a2eaeb3a78cca46f8740d7.jpg.source.jpg",
    "https://ts1.cn.mm.bing.net/th/id/R-C.58099163d98d8a7fe1b76dc2d63e8202?rik=BY1fWjxegoljgQ&riu=http%3a%2f%2fimg.pconline.com.cn%2fimages%2fupload%2fupc%2ftx%2fphotoblog%2f1406%2f11%2fc6%2f35182775_35182775_1402491368015.jpg&ehk=jjog%2bWyO9hP8efcvKxNwskVzZiHfWNoEaaZWw7rJces%3d&risl=&pid=ImgRaw&r=0",
  ],
  username: '租地的张三',
  avator_address:
      "https://img2.woyaogexing.com/2022/07/22/60953f9c08b884f0!400x400.jpg",
  address: '福州 闽侯县',
  price: '5000',
  land_type: "农田",
  area: '1000',
  describe:
      "   详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述  描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述详细产品描述",
  tags: ['满足排水', '地形平整'],
  ageLimit: '5', sell_id: 1,
  )
];
