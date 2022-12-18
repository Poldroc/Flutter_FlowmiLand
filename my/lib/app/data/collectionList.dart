class CollectListDate {
  final String id;
  final String imageUrl;
  final String userImage;
  final String address;
  final String userName;
  final List<String> tags;
  final int price;
  final String information;
  const CollectListDate({
    required this.id,
    required this.address,
    required this.imageUrl,
    required this.userImage,
    required this.userName,
    required this.price,
    required this.tags,
    required this.information,
  });
}

List<CollectListDate> dataList = [
  CollectListDate(
      price: 500,
      tags: ['标签1', '标签2'],
      imageUrl: "https://img95.699pic.com/photo/50158/3996.jpg_wh860.jpg",
      userImage:
          "https://img2.woyaogexing.com/2022/07/22/60953f9c08b884f0!400x400.jpg",
      userName: '1',
      address: '福建省',
      information: '',
      id: '12'),
  CollectListDate(
      price: 500,
      tags: ['标签1', '标签2'],
      imageUrl: "https://img95.699pic.com/photo/50158/3996.jpg_wh860.jpg",
      userImage:
          "https://img2.woyaogexing.com/2022/07/22/60953f9c08b884f0!400x400.jpg",
      userName: '1',
      address: '福建省',
      information: '',
      id: '12'),
  CollectListDate(
      price: 500,
      tags: ['标签1', '标签2'],
      imageUrl: "https://img95.699pic.com/photo/50158/3996.jpg_wh860.jpg",
      userImage:
          "https://img2.woyaogexing.com/2022/07/22/60953f9c08b884f0!400x400.jpg",
      userName: '1',
      address: '福建省',
      information: '',
      id: '12'),
  CollectListDate(
      price: 500,
      tags: ['标签1', '标签2'],
      imageUrl: "https://img95.699pic.com/photo/50158/3996.jpg_wh860.jpg",
      userImage:
          "https://img2.woyaogexing.com/2022/07/22/60953f9c08b884f0!400x400.jpg",
      userName: '1',
      address: '福建省',
      information: '',
      id: '12')
];
