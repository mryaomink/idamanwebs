import 'package:flutter/material.dart';
import 'package:idaman_webs/pages/home/idaman_home.dart';
import 'package:idaman_webs/screens/yao_badapat.dart';
import 'package:url_launcher/url_launcher.dart';

class YaoHome extends StatelessWidget {
  const YaoHome({super.key});

  void launchUrlDukcapil() async {
    const String dukCapil = 'https://dukcapilonline.banjarbarukota.go.id/';
    if (await launchUrl(Uri.parse(dukCapil))) {
    } else {
      throw 'Could not launch Dukcapil Online.';
    }
  }

  void launchUrlSipopi() async {
    const String siPopi = 'http://36.66.235.189:83/simrs/SIPOPI/apam/www/';
    if (await launchUrl(Uri.parse(siPopi))) {
    } else {
      throw 'Could not launch Sipopi.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            MediaQuery.of(context).size.width < 640
                ? const IdamanHome()
                : const IdamanHero(),
          ],
        ),
      ),
    );
  }
}

class IdamanHero extends StatelessWidget {
  const IdamanHero({
    super.key,
  });

  void launchUrlCctv() async {
    const String cCtv = 'https://cctv.banjarbarukota.go.id/';
    if (await launchUrl(Uri.parse(cCtv))) {
    } else {
      throw 'Could not launch CCTV.';
    }
  }

  void launchBapok() async {
    const String bapok = 'https://infobapokting.banjarbarukota.go.id/';
    if (await launchUrl(Uri.parse(bapok))) {
    } else {
      throw 'Could not launch Bapok.';
    }
  }

  void launchSatu() async {
    const String satuData = 'https://data.banjarbarukota.go.id/';
    if (await launchUrl(Uri.parse(satuData))) {
    } else {
      throw 'Could not launch Satu Data.';
    }
  }

  void launchUrlDataProdusen() async {
    const String dataProdusen = 'https://data.banjarbarukota.go.id/produsen';
    if (await launchUrl(Uri.parse(dataProdusen))) {
    } else {
      throw 'Could not launch Sipopi.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 30,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MediaQuery.of(context).size.width < 640
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        launchBapok();
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(width: 2)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                child: Icon(
                                  Icons.bar_chart,
                                  size: 50.0,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'INFOBAPOKTING',
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Informasi Harga Barang Pokok dan Penting',
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.blue),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    InkWell(
                      onTap: () {
                        launchUrlCctv();
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(width: 2)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                child: Icon(
                                  Icons.connected_tv,
                                  size: 50.0,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'CCTV Kota Banjarbaru',
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Peta Pantau CCTV',
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.blue),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    InkWell(
                      onTap: () {
                        launchSatu();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          image: const DecorationImage(
                              image: NetworkImage(
                                'https://images.unsplash.com/photo-1599658880436-c61792e70672?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
                              ),
                              fit: BoxFit.cover),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          color: Colors.black.withOpacity(0.7),
                          child: const Text(
                            'Portal Satu Data',
                            style:
                                TextStyle(color: Colors.white, fontSize: 26.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                )

              // Row(
              //     children: [
              //       SingleChildScrollView(
              //         child: Column(
              //           children: [
              //
              : Column(
                  children: [
                    Row(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  launchBapok();
                                },
                                child: Container(
                                  width: 395,
                                  height: 198,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      border: Border.all(width: 2)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          child: Icon(
                                            Icons.bar_chart,
                                            size: 50.0,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          'INFOBAPOKTING',
                                          style: TextStyle(
                                              fontSize: 22.0,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          'Informasi Harga Barang Pokok dan Penting',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.blue),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              InkWell(
                                onTap: () {
                                  launchUrlCctv();
                                },
                                child: Container(
                                  width: 395,
                                  height: 198,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      border: Border.all(width: 2)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          child: Icon(
                                            Icons.connected_tv,
                                            size: 50.0,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          'CCTV Kota Banjarbaru',
                                          style: TextStyle(
                                              fontSize: 22.0,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 14.0,
                                        ),
                                        Text(
                                          'Peta Pantau CCTV',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.blue),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              launchSatu();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(16.0),
                              height: 434,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                      'https://images.unsplash.com/photo-1599658880436-c61792e70672?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
                                    ),
                                    fit: BoxFit.cover),
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                color: Colors.black.withOpacity(0.7),
                                child: const Text(
                                  'Portal Satu Data',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 26.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
          const SizedBox(
            height: 20.0,
          ),
          if (MediaQuery.of(context).size.width < 640)
            InkWell(
              onTap: () {
                launchUrlDataProdusen();
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1523961131990-5ea7c61b2107?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1074&q=80'),
                        fit: BoxFit.cover)),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Satu Data',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                      ),
                    ),
                    Text(
                      'Produsen Data',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            )
          else
            InkWell(
              onTap: () {
                launchUrlDataProdusen();
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100.0,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1523961131990-5ea7c61b2107?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1074&q=80'),
                        fit: BoxFit.cover)),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Satu Data',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                      ),
                    ),
                    Text(
                      'Produsen Data',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1524661135-423995f22d0b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=874&q=80'),
                    fit: BoxFit.cover)),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const YaoBadapat(),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Badapat',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        backgroundColor: Colors.black.withOpacity(0.7)),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Banjarbaru dalam Peta',
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        backgroundColor: Colors.black.withOpacity(0.7)),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
