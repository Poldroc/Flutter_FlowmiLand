import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my/app/colors/global.colors.dart';
import 'package:my/app/modules/Collection/views/collection_view.dart';
import 'package:my/app/modules/Communication/views/communication_view.dart';
import 'package:my/app/modules/User/views/user_view.dart';
import 'package:my/app/modules/add/views/add_view.dart';
import 'package:my/app/modules/home/views/home_view.dart';

class TabNav extends StatefulWidget {
  const TabNav({super.key});
  
  @override
  State<TabNav> createState() => _TabNavState();
}

class _TabNavState extends State<TabNav> {
  int _currentIndex = 0;
  //界面
  final List<Widget> _pages = [
    HomeView(),
    CollectionView(),
    AddView(),
    CommunicationView(),
    UserView()
  ];
  get title => null;
  //页面控制器
  final PageController _pageController = PageController();
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 35,
        selectedFontSize: 15,
        unselectedFontSize: 10,
        selectedItemColor: GlobalColors.kPrimaryColor,
        unselectedItemColor: GlobalColors.kPrimaryLightColor,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.star_border), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.messenger_outline_rounded), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded), label: ""),
        ],
        onTap: ((int index) {
          setState(() {
            _pageController.jumpToPage(index);
            _currentIndex = index;
          });
        }),
      ),
      floatingActionButton: Container(
        height: 70, //调整
        width: 70,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(top: 15), //调整FloatingActionButton的位置
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(35)),
        child: FloatingActionButton(
            backgroundColor: _currentIndex == 2
                ? GlobalColors.kPrimaryLightColor
                : GlobalColors.kPrimaryColor,
            child: const Icon(Icons.add),
            onPressed: () {
              Get.bottomSheet(

                  //padding: EdgeInsets.only(bottom: 100),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                              child: Image.asset("images/add.png",width: size.width*0.2,),
                              onTap: () {
                                Get.to(const AddView());
                              },
                            ),
                            GestureDetector(
                              child: Image.asset("images/get.png",width: size.width*0.2),
                              onTap: () {
                                
                              },
                            ),
                      ],
                    ),
                    //alignment: Alignment.topCenter,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )),
                    height: 160,
                  ),
                  );
              /* setState(() {
                _pageController.jumpToPage(2);
                _currentIndex = 2;
              }); */
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
