// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppsYao extends StatefulWidget {
  const AppsYao({super.key});

  @override
  State<AppsYao> createState() => _AppsYaoState();
}

class _AppsYaoState extends State<AppsYao> {
  List<String> title = [
    "Geo Portal",
    "LPSE",
    "Satu Data",
    "PPID",
    "Pantau CCTV",
    "SAKIP",
    "LAPOR",
    "SIMPEG",
    "JDIH",
  ];

  List<String> imgUrl = [
    "https://images.unsplash.com/photo-1581922819941-6ab31ab79afc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=580&q=80",
    "https://images.unsplash.com/photo-1546984575-757f4f7c13cf?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80",
    "https://images.unsplash.com/photo-1488229297570-58520851e868?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=869&q=80",
    "https://images.unsplash.com/photo-1457694587812-e8bf29a43845?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=871&q=80",
    "https://images.unsplash.com/photo-1566060475410-1159300f046f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80",
    "https://images.unsplash.com/photo-1431576901776-e539bd916ba2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=871&q=80",
    "https://images.unsplash.com/photo-1503551723145-6c040742065b-v2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
    "https://images.unsplash.com/photo-1531315630201-bb15abeb1653?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=435&q=80",
    "https://images.unsplash.com/photo-1530543787849-128d94430c6b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
  ];

  List<String> linkApps = [
    "http://geoportal.banjarbarukota.go.id/",
    "https://lpse.banjarbarukota.go.id/eproc4",
    "https://data.banjarbarukota.go.id/",
    "http://ppid.banjarbarukota.go.id/",
    "https://cctv.banjarbarukota.go.id/",
    "http://batata.banjarbarukota.go.id/beranda.html",
    "https://www.lapor.go.id/",
    "https://simpeg.bkpp.banjarbarukota.go.id/simpeg/landing/",
    "http://jdih.banjarbarukota.go.id/",
  ];

  late ScrollController controller;
  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    controller.addListener(() {
      setState(() {});
    });
  }

  Future<void> _openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        controller: controller,
        itemCount: 9,
        itemBuilder: (context, index) {
          return Container(
            height: MediaQuery.of(context).size.height,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(),
            child: Stack(
              children: [
                Container(
                  transform: Matrix4.identity()
                    ..translate(
                      0.0,
                      controller.hasClients
                          ? (-(index * MediaQuery.of(context).size.height) +
                                  controller.position.pixels) /
                              2
                          : 0.0,
                    ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Image.network(
                    imgUrl[index],
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        color: Colors.white.withOpacity(0.5),
                        child: Text(
                          title[index],
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width >= 600
                                  ? 100
                                  : 50.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        color: Colors.blue.withOpacity(0.8),
                        child: InkWell(
                          onTap: () {
                            _openUrl(linkApps[index]);
                          },
                          child: Text(
                            'Buka Aplikasi',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
