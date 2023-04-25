import 'package:car_m/constants/app_assets.dart';
import 'package:car_m/constants/app_colors.dart';
import 'package:car_m/secure_storage/shared_preferences.dart';
import 'package:car_m/ui/navigation/main_navigation.dart';
import 'package:car_m/ui/screens/news_page/news_page.dart';
import 'package:car_m/ui/screens/notifications_page/notifications_page.dart';
import 'package:car_m/ui/screens/search_page/search_page.dart';
import 'package:car_m/ui/screens/services/services_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../domain/data_provider/box_manager.dart';
import 'chat/chat_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedTab = 0;
  void onSelectTab(int index) {
    if (_selectedTab == index) {

    }
    setState(() {
      _selectedTab = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bottomAppBarTheme,
      floatingActionButton: FloatingActionButton(
        onPressed: () =>Navigator.push(context, MaterialPageRoute(
        builder: (context) => ChatScreen())),
        child: (const Icon(
          Icons.message,
        )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            elevation: 15,
            backgroundColor: AppColors.bottomAppBarTheme,
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.blue,
            currentIndex: _selectedTab,
            onTap: onSelectTab,
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppAssets.svg.news,
                    color: _selectedTab == 0
                        ? AppColors.main
                        : AppColors.iconUnselected,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppAssets.svg.search,
                      color: _selectedTab == 1
                          ? AppColors.main
                          : AppColors.iconUnselected),
                  label: ''),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppAssets.svg.notifications,
                      color: _selectedTab == 2
                          ? AppColors.main
                          : AppColors.iconUnselected),
                  label: ''),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppAssets.svg.profile,
                      color: _selectedTab == 3
                          ? AppColors.main
                          : AppColors.iconUnselected),
                  label: ''),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: const [
          NewsWidget(),
          SearchWidget(),
          NotificationsWidget(),
          ServicesPage(),
        ],
      ),
    );
  }
}
