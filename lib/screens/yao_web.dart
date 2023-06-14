import 'package:flutter/material.dart';
import 'package:idaman_webs/screens/yao_home.dart';

class YaoWeb extends StatelessWidget {
  const YaoWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Idaman Juara Apps'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.person,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  width: 4.0,
                ),
                const Text('Login')
              ],
            ),
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            return _buildWideLayout();
          } else {
            return _buildNarrowLayout();
          }
        },
      ),
    );
  }

  Widget _buildWideLayout() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: _buildNavigation(),
        ),
        Expanded(
          flex: 3,
          child: _buildContent(),
        ),
      ],
    );
  }

  Widget _buildNarrowLayout() {
    return Column(
      children: [
        _buildNavigation(),
        _buildContent(),
      ],
    );
  }

  Widget _buildNavigation() {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(
              Icons.home,
              color: Colors.black,
            ),
            title: const Text(
              'Beranda',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              print('Home tapped');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.location_city,
              color: Colors.black,
            ),
            title: const Text(
              'Badapat',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              print('Badapat tapped');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            title: const Text(
              'UMKM',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              print('UMKM tapped');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.newspaper,
              color: Colors.black,
            ),
            title: const Text(
              'Media Center,',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              print('UMKM tapped');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
            title: const Text(
              'Pengaturan',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              print('Settings tapped');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return const YaoHome();
  }
}
