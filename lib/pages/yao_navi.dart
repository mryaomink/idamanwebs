import 'package:flutter/material.dart';
import 'package:idaman_webs/pages/about/about_yao.dart';
import 'package:idaman_webs/pages/apps/apps_yao.dart';
import 'package:idaman_webs/pages/news/news_yao.dart';
import 'package:idaman_webs/screens/yao_home.dart';

class YaoNav extends StatefulWidget {
  const YaoNav({super.key});

  @override
  State<YaoNav> createState() => _YaoNavState();
}

class _YaoNavState extends State<YaoNav> {
  final List<Widget> _myMenu = [
    const YaoHome(),
    const AppsYao(),
    const NewsYao(),
    const AboutYao(),
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MediaQuery.of(context).size.width < 640
          ? BottomNavigationBar(
              currentIndex: _selectedIndex,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.blue,
              onTap: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Beranda',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.apps,
                  ),
                  label: 'Apps',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.newspaper,
                  ),
                  label: 'Informasi',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: 'Tentang',
                ),
              ],
            )
          : null,
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width >= 640)
            NavigationRail(
                labelType: NavigationRailLabelType.all,
                selectedLabelTextStyle: const TextStyle(color: Colors.blue),
                unselectedLabelTextStyle: const TextStyle(color: Colors.grey),
                leading: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Container(
                        width: 129.0,
                        height: 129.0,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage(
                            'assets/icon/juara.png',
                          ),
                        )),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
                onDestinationSelected: (int index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(
                      Icons.home,
                    ),
                    label: Text('Beranda'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(
                      Icons.apps,
                    ),
                    label: Text('Apps'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(
                      Icons.newspaper,
                    ),
                    label: Text('Informasi'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(
                      Icons.person,
                    ),
                    label: Text('Tentang'),
                  ),
                ],
                selectedIndex: _selectedIndex),
          Expanded(
            child: _myMenu[_selectedIndex],
          ),
        ],
      ),
    );
  }
}
