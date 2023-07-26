import 'package:flutter/material.dart';
import 'package:idaman_webs/pages/news/yao_wp.dart';
import 'package:url_launcher/url_launcher_string.dart';

class IdamanHome extends StatefulWidget {
  const IdamanHome({super.key});

  @override
  State<IdamanHome> createState() => _IdamanHomeState();
}

class _IdamanHomeState extends State<IdamanHome> {
  List<String> menuIcon = [
    'assets/icon/badapat.png',
    'assets/icon/cctv.png',
    'assets/icon/infopangan.png',
    'assets/icon/intan.png',
    'assets/icon/penerbangan.png',
    'assets/icon/jdih.png',
    'assets/icon/dukcapil.png',
    'assets/icon/sipopi.png',
    'assets/icon/erespon.jpg',
  ];

  List<String> judul = [
    'Badapat',
    'CCTV',
    'Info Pangan',
    'Intan BJB',
    'Info Penerbangan',
    'JDIH',
    'Dukcapil Online',
    'Sipopi',
    'E Respon',
  ];

  List<String> urlApp = [
    "https://badapatweb.bukutamutes.banjarbarukota.go.id/",
    "https://cctv.banjarbarukota.go.id",
    "https://infobapokting.banjarbarukota.go.id",
    "http://intanbjb.banjarbarukota.go.id",
    "https://syamsudinnoor-airport.co.id/id/terminal-kedatangan/index/domestic",
    "https://jdih.banjarbarukota.go.id",
    "https://dukcapilonline.banjarbarukota.go.id",
    "http://36.66.235.189:83/simrs/SIPOPI/apam/www/",
    "https://idaman.banjarbarukota.go.id/erespon",
  ];

  void _bukaLink(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw "Error fetch url $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          alignment: Alignment.topCenter,
          width: 150,
          height: 80,
          child: Image.asset(
            'assets/icon/juara.png',
            fit: BoxFit.cover,
          ),
        ),
        const Divider(),
        const SizedBox(
          height: 180,
          child: YaoWp(),
        ),
        const SizedBox(
          height: 20.0,
        ),
        SizedBox(
          child: GridView.builder(
            primary: false,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Number of columns in the grid
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              childAspectRatio: 2 / 2,
            ),
            itemCount: 9,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  // Handle onTap event if needed
                  _bukaLink(urlApp[index]);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          menuIcon[index],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          judul[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
