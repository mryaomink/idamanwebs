import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:idaman_webs/model/place.dart';
import 'package:latlong2/latlong.dart';

class YaoBadapat extends StatefulWidget {
  const YaoBadapat({super.key});

  @override
  State<YaoBadapat> createState() => _YaoBadapatState();
}

class _YaoBadapatState extends State<YaoBadapat> {
  List<Place> wisata = [
    Place(
        name: 'Amanah Borneo Park',
        type: 'wisata',
        lattitude: -3.4993967,
        longitude: 114.8091441,
        icon: 'assets/icon/wisata.png'),
    Place(
        name: 'Kampung Pelangi',
        type: 'wisata',
        lattitude: -3.4473002,
        longitude: 114.8283131,
        icon: 'assets/icon/wisata.png'),
    Place(
        name: 'Taman Kota Van Der Pijl',
        type: 'wisata',
        lattitude: -3.4426307,
        longitude: 114.8298288,
        icon: 'assets/icon/wisata.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: FlutterMap(
                  options: MapOptions(
                    center: const LatLng(-3.4537472, 114.819072),
                    zoom: 16.0,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.idaman_webs',
                    ),
                    MarkerLayer(
                      markers: wisata.map(
                        (tempat) {
                          return Marker(
                            point: LatLng(tempat.lattitude, tempat.longitude),
                            builder: (ctx) => SizedBox(
                              width: 100,
                              height: 100,
                              child: InkWell(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/icon/wisata.png',
                                ),
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.location_city),
                      ),
                      const Text('Wisata')
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.location_city),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.location_city),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
