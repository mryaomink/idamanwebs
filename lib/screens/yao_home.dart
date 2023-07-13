import 'package:flutter/material.dart';
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const IdamanHero(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            launchUrlDukcapil();
                          },
                          child: Stack(
                            children: [
                              Container(
                                alignment: Alignment.bottomLeft,
                                height: 280,
                                color: Colors.blueGrey,
                                child: Image.asset('assets/icon/kadis.png'),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  margin: const EdgeInsets.all(8.0),
                                  color: Colors.black.withOpacity(0.5),
                                  child: const Text(
                                    'Dukcapil Online',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            launchUrlSipopi();
                          },
                          child: Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(right: 16.0),
                                alignment: Alignment.bottomRight,
                                height: 280,
                                color: Colors.blue,
                                child: Image.asset('assets/icon/bupati.png'),
                              ),
                              MediaQuery.of(context).size.width >= 600
                                  ? Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        margin: const EdgeInsets.all(8.0),
                                        color: Colors.black.withOpacity(0.5),
                                        child: const Text(
                                          'Sipopi',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        margin: const EdgeInsets.all(8.0),
                                        color: Colors.black.withOpacity(0.5),
                                        child: const Text(
                                          'Sipopi',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
            ],
          )),
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
                                'Informasi Harga Pangan',
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Faucibus interdum posuere lorem ipsum.',
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
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Faucibus interdum posuere lorem ipsum.',
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
                                          'Informasi Harga Pangan',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Faucibus interdum posuere lorem ipsum.',
                                          style: TextStyle(
                                              fontSize: 12.0,
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
                                              fontSize: 16.0,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Faucibus interdum posuere lorem ipsum.',
                                          style: TextStyle(
                                              fontSize: 12.0,
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
