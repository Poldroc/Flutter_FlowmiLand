class InfoItem {
  final String id;
  final String imageUrl;
  final String userImage;
  final String address;
  final String userName;
  final List<String> tags;
  final int price;
  final String information;
  InfoItem( {required this.id,
    required this.address,
    required this.imageUrl,
    required this.userImage,
    required this.userName,
    required this.price,
    required this.tags,
    required this.information,
  });
}

List<InfoItem> infoData = [
  InfoItem(
      price: 500,
      tags: ['标签1', '标签2'],
      imageUrl: "https://img95.699pic.com/photo/50158/3996.jpg_wh860.jpg",
      userImage:
          "https://img2.woyaogexing.com/2022/07/22/60953f9c08b884f0!400x400.jpg",
      userName: '1',
      address: '福建省',
      information: '', id: '12'),
  InfoItem(
      price: 500,
      tags: ['标签1', '标签2'],
      imageUrl: "https://i.hexuexiao.cn/up/d7/40/87/8443453a15a2eaeb3a78cca46f8740d7.jpg.source.jpg",
      userImage:
          "https://img2.woyaogexing.com/2022/07/22/60953f9c08b884f0!400x400.jpg",
      userName: '2',
      address: '福建省',
      information: '', id: '32'),
  InfoItem(
      price: 500,
      tags: ['标签1', '标签2'],
      imageUrl: "https://ts1.cn.mm.bing.net/th/id/R-C.58099163d98d8a7fe1b76dc2d63e8202?rik=BY1fWjxegoljgQ&riu=http%3a%2f%2fimg.pconline.com.cn%2fimages%2fupload%2fupc%2ftx%2fphotoblog%2f1406%2f11%2fc6%2f35182775_35182775_1402491368015.jpg&ehk=jjog%2bWyO9hP8efcvKxNwskVzZiHfWNoEaaZWw7rJces%3d&risl=&pid=ImgRaw&r=0",
      userImage:
          "https://img2.woyaogexing.com/2022/07/22/60953f9c08b884f0!400x400.jpg",
      userName: '3',
      address: '福建省',
      information: '', id: '34'),
  InfoItem(
      price: 500,
      tags: ['标签1', '标签2'],
      imageUrl: "https://ts1.cn.mm.bing.net/th/id/R-C.a9f9ac152d7ebb76a456f4d7ac74d6f7?rik=uNQRHK0aRvWo2w&riu=http%3a%2f%2fimg.pconline.com.cn%2fimages%2fupload%2fupc%2ftx%2fphotoblog%2f1406%2f11%2fc6%2f35182775_35182775_1402491351187.jpg&ehk=MvF0%2ffkwO0wgmsUOvO9cnW8jRKipflQ09o6vlCf33%2bo%3d&risl=&pid=ImgRaw&r=0",
      userImage:
          "https://img2.woyaogexing.com/2022/07/22/60953f9c08b884f0!400x400.jpg",
      userName: '4',
      address: '福建省',
      information: '', id: '51'),
  InfoItem(
      price: 500,
      tags: ['标签1', '标签2'],
      imageUrl: "https://ts1.cn.mm.bing.net/th/id/R-C.29954e6b9511a86a4b92124c5e0227b1?rik=H0eWlhA5F5bY5Q&riu=http%3a%2f%2fimg.pconline.com.cn%2fimages%2fupload%2fupc%2ftx%2fphotoblog%2f1205%2f23%2fc1%2f11717105_11717105_1337743650179.jpg&ehk=vNc4mTQZsFHr5G2k7gHn%2bG2YnGAKpoDMrh7LSVfqV3E%3d&risl=&pid=ImgRaw&r=0",
      userImage:
          "https://img2.woyaogexing.com/2022/07/22/60953f9c08b884f0!400x400.jpg",
      userName: '5',
      address: '福建省',
      information: '', id: '18'),
];
