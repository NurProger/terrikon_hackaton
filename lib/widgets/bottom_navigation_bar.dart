import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackaton_terricon/view/home_view.dart';

import '../view/profile_view.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  late int selectedIndex = 0;
  late final List<Widget> pages;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pages = [
      HomeView(),
      iconPage(SvgPicture.asset('assets/svg-images/2.svg')),
      iconPage(SvgPicture.asset('assets/svg-images/3.svg')),
      iconPage(SvgPicture.asset('assets/svg-images/4.svg')),
      ProfileView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          backgroundColor: Color.fromRGBO(30, 30, 30, 1),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svg-images/1.svg'), label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svg-images/2.svg'), label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svg-images/3.svg'), label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svg-images/4.svg'), label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svg-images/5.svg'), label: ''),
          ]),
      body: pages[selectedIndex]
    );
  }

  iconPage(iconName) {
    return Center(
      child: iconName
    );
  }
}
