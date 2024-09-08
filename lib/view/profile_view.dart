import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackaton_terricon/constance/color.dart';
import 'package:hackaton_terricon/data/menu_model.dart';

import '../widgets/event_widgets/event_widgets.dart';
import '../widgets/event_widgets/library_navigation.dart';
import '../widgets/event_widgets/purposes_widget.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 5.0, bottom: 5),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://avatars.mds.yandex.net/i?id=a917c07f6b9d1749fdc6230eb39ca844_l-5287757-images-thumbs&n=13',
            ),
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Aqylzhan Karimbek',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'Уровень 11',
              style: TextStyle(color: kTextColor, fontSize: 14),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/svg-images/layout.svg'),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: ListView(
              children: [
                _buildDivider(),
                _buildMenuSection([
                  MenuModel(
                    name: 'История',
                    svgPicture: SvgPicture.asset(
                      'assets/svg-images/time.svg',
                    ),
                  ),
                  MenuModel(
                    name: 'Команда проекта',
                    svgPicture: SvgPicture.asset(
                      'assets/svg-images/person.svg',
                    ),
                  ),
                  MenuModel(
                    name: 'Поддержать',
                    svgPicture: SvgPicture.asset(
                      'assets/svg-images/gift.svg',
                    ),
                  ),
                ], (index) {
                  setState(() {});
                }),
                _buildDivider(),
                _buildMenuSection([
                  MenuModel(
                    name: 'Настройки',
                    svgPicture: SvgPicture.asset(
                      'assets/svg-images/settings.svg',
                    ),
                  ),
                ], (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
                _buildDivider(),
                _buildMenuSection([
                  MenuModel(
                    name: 'Цели',
                    svgPicture: SvgPicture.asset(
                      'assets/svg-images/another_fignia.svg',
                    ),
                  ),
                  MenuModel(
                    name: 'Мероприятия',
                    svgPicture: SvgPicture.asset(
                      'assets/svg-images/data.svg',
                    ),
                  ),
                  MenuModel(
                    name: 'Достижения',
                    svgPicture: SvgPicture.asset(
                      'assets/svg-images/achievement.svg',
                    ),
                  ),
                  MenuModel(
                    name: 'Навигация по библиотеке',
                    svgPicture: SvgPicture.asset(
                      'assets/svg-images/navigation.svg',
                    ),
                  ),
                ], (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
              ],
            ),
          ),
          _buildDivider(),
          Expanded(
            flex: 2,
            child: IndexedStack(
              alignment: Alignment.center,
              index: _selectedIndex,
              children: [
                const PurposesWidget(),
                // Замени на свой виджет
                const EventWidget(),
                // Замени на свой виджет
                const Center(child: Text('Достижения Content')),
                // Замени на свой виджет
                const LibraryNavigation(),
                // Замени на свой виджет
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 5,
      width: double.infinity,
      color: kButtonColor,
    );
  }

  Widget _buildMenuSection(List<MenuModel> info, Function(int) onTap) {
    return Column(
      children: info
          .asMap()
          .map(
            (index, item) => MapEntry(
              index,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ListTile(
                  visualDensity: const VisualDensity(vertical: -3),
                  minVerticalPadding: 2,
                  onTap: () => onTap(index),
                  leading: item.svgPicture,
                  title: Text(
                    item.name,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          )
          .values
          .toList(),
    );
  }
}
