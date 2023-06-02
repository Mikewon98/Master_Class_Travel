import 'package:flutter/material.dart';
import 'package:master_travel_app/pages/navpages/bar_item.dart';
import 'package:master_travel_app/pages/home_page.dart';
import 'package:master_travel_app/pages/navpages/my_page.dart';
import 'package:master_travel_app/pages/navpages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final String? bottomNavigationBarItemOne = 'Home';
  final String? bottomNavigationBarItemTwo = 'Bar';
  final String? bottomNavigationBarItemThree = 'Search';
  final String? bottomNavigationBarItemFour = 'MyProfile';

  List pages = const [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
              label: bottomNavigationBarItemOne, icon: const Icon(Icons.apps)),
          BottomNavigationBarItem(
              label: bottomNavigationBarItemTwo,
              icon: const Icon(Icons.bar_chart_sharp)),
          BottomNavigationBarItem(
              label: bottomNavigationBarItemThree,
              icon: const Icon(Icons.search)),
          BottomNavigationBarItem(
              label: bottomNavigationBarItemFour,
              icon: const Icon(Icons.person)),
        ],
      ),
    );
  }
}
