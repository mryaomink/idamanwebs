import 'package:flutter/material.dart';

class AboutYao extends StatelessWidget {
  const AboutYao({super.key});

  @override
  Widget build(BuildContext context) {
    const String visiTitle =
        '''“BANJARBARU MAJU, AGAMIS, DAN SEJAHTERA (BANJARBARU JUARA)"BANJARBARU JUARA dimaknai sebagai motivasi atau semangat yang mampu menumbuhkan kekuatan dan daya juang sehingga Kota Banjarbaru memliki keunggulan komparatif dan kompetitif dengan daerah lainnya.''';
    const String misiTitle =
        '''Meningkatkan kualitas kehidupan masyarakat yang sejahtera dan berakhlak mulia.Meningkatkan pembangunan perekonomian daerah yang berkelanjutan dengan kearifan lokal dan tetap menjaga kelestarian lingkungan hidup.Mewujudkan tata kelola pemerintahan yang amanah.''';
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              alignment: Alignment.topCenter,
              width: 150,
              height: 150,
              child: Image.asset(
                'assets/icon/juara.png',
                fit: BoxFit.cover,
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 20.0,
            ),
            Center(
              child: MediaQuery.of(context).size.width < 640
                  ? const Text(
                      'VISI & MISI',
                      style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  : const Text(
                      'VISI & MISI',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            MediaQuery.of(context).size.width < 640
                ? const Text(
                    'VISI',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )
                : const Text(
                    'VISI',
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
            const SizedBox(
              height: 10.0,
            ),
            MediaQuery.of(context).size.width < 640
                ? const Text(
                    visiTitle,
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal),
                  )
                : const Text(
                    visiTitle,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal),
                  ),
            const SizedBox(
              height: 10.0,
            ),
            MediaQuery.of(context).size.width < 640
                ? const Text(
                    'MISI',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )
                : const Text(
                    'MISI',
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
            const SizedBox(
              height: 10.0,
            ),
            MediaQuery.of(context).size.width < 640
                ? const Text(
                    misiTitle,
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal),
                  )
                : const Text(
                    misiTitle,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal),
                  ),
          ],
        ),
      ),
    );
  }
}
