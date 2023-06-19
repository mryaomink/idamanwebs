import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:idaman_webs/model/place.dart';
import 'package:idaman_webs/screens/badapat_detail.dart';
import 'package:latlong2/latlong.dart';

import '../model/kategori.dart';

class YaoBadapat extends StatefulWidget {
  const YaoBadapat({super.key});

  @override
  State<YaoBadapat> createState() => _YaoBadapatState();
}

class _YaoBadapatState extends State<YaoBadapat> {
  TabController? _tabController;
  List<Kategori> kategori = [
    Kategori(
      judul: 'Wisata',
      icon: Icons.travel_explore,
    ),
    Kategori(
      judul: 'Kuliner',
      icon: Icons.food_bank,
    ),
    Kategori(
      judul: 'Hotel',
      icon: Icons.house,
    ),
    Kategori(
      judul: 'Tambal Ban',
      icon: Icons.travel_explore,
    ),
    Kategori(
      judul: 'Wisata Religi',
      icon: Icons.travel_explore,
    ),
  ];
  List<Place> wisata = [
    Place(
        name: 'Amanah Borneo Park',
        type: 'Wisata',
        lattitude: -3.499193232183101,
        longitude: 114.81170829176907,
        icon: 'assets/icon/wisata.png',
        imgUrl: [
          "https://images.unsplash.com/photo-1501785888041-af3ef285b470?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
          "https://images.unsplash.com/photo-1530789253388-582c481c54b0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
          'https://images.unsplash.com/photo-1506197603052-3cc9c3a201bd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
        ]),
    Place(
        name: 'Kampung Pelangi',
        type: 'Wisata',
        lattitude: -3.4473002,
        longitude: 114.8283131,
        icon: 'assets/icon/wisata.png',
        imgUrl: [
          "https://images.unsplash.com/photo-1501785888041-af3ef285b470?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
          "https://images.unsplash.com/photo-1530789253388-582c481c54b0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
          'https://images.unsplash.com/photo-1506197603052-3cc9c3a201bd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
        ]),
    Place(
        name: 'Taman Kota Van Der Pijl',
        type: 'Wisata',
        lattitude: -3.4426307,
        longitude: 114.8298288,
        icon: 'assets/icon/wisata.png',
        imgUrl: [
          "https://images.unsplash.com/photo-1501785888041-af3ef285b470?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
          "https://images.unsplash.com/photo-1530789253388-582c481c54b0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
          'https://images.unsplash.com/photo-1506197603052-3cc9c3a201bd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
        ]),
    Place(
      name: 'Rumah Makan Duta Rasa',
      type: 'Kuliner',
      lattitude: -3.4426307,
      longitude: 114.8298288,
      icon: 'assets/icon/wisata.png',
      imgUrl: [
        "https://images.unsplash.com/photo-1501785888041-af3ef285b470?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
        "https://images.unsplash.com/photo-1530789253388-582c481c54b0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
        'https://images.unsplash.com/photo-1506197603052-3cc9c3a201bd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
      ],
    ),
    Place(
      name: 'Tambal Ban & Kios',
      type: 'Tambal Ban',
      lattitude: -3.4312544863668974,
      longitude: 114.82272594842901,
      icon: 'assets/icon/wisata.png',
      imgUrl: [
        "https://images.unsplash.com/photo-1501785888041-af3ef285b470?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
        "https://images.unsplash.com/photo-1530789253388-582c481c54b0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
        'https://images.unsplash.com/photo-1506197603052-3cc9c3a201bd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
      ],
    ),
    Place(
      name: 'Soto Ratu Sari 2',
      type: 'Kuliner',
      lattitude: -3.4312544863668974,
      longitude: 114.82272594842901,
      icon: 'assets/icon/wisata.png',
      imgUrl: [
        "https://images.unsplash.com/photo-1501785888041-af3ef285b470?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
        "https://images.unsplash.com/photo-1530789253388-582c481c54b0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
        'https://images.unsplash.com/photo-1506197603052-3cc9c3a201bd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
      ],
    ),
    Place(
      name: 'Lerina Inn Hotel',
      type: 'Hotel',
      lattitude: -3.4464145015441563,
      longitude: 114.83371496200562,
      icon: 'assets/icon/wisata.png',
      imgUrl: [
        "https://images.unsplash.com/photo-1501785888041-af3ef285b470?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
        "https://images.unsplash.com/photo-1530789253388-582c481c54b0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
        'https://images.unsplash.com/photo-1506197603052-3cc9c3a201bd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
      ],
    ),
    Place(
      name: 'Museum Lambung Mangkurat',
      type: 'Wisata Religi',
      lattitude: -3.4428206,
      longitude: 114.7663146,
      icon: 'assets/icon/wisata.png',
      imgUrl: [
        "https://images.unsplash.com/photo-1501785888041-af3ef285b470?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
        "https://images.unsplash.com/photo-1530789253388-582c481c54b0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
        'https://images.unsplash.com/photo-1506197603052-3cc9c3a201bd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: kategori.length,
      child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
                tabs: kategori
                    .map((categori) => Tab(
                          text: categori.judul,
                          icon: Icon(categori.icon),
                        ))
                    .toList()),
          ),
          body: TabBarView(
              controller: _tabController,
              children: kategori.map((kategori) {
                List<Place> filteredPlace = wisata
                    .where((wisata) => wisata.type == kategori.judul)
                    .toList();
                return ListView.builder(
                    itemCount: filteredPlace.length,
                    itemBuilder: (contex, index) {
                      Place? tempat = filteredPlace[index];
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (contex) => BadapatDetail(
                                place: tempat,
                              ),
                            ),
                          );
                        },
                        title: Text(
                          tempat.name!,
                          maxLines: 2,
                        ),
                      );
                    });
              }).toList())),
    );
  }
}

class MapWisata extends StatelessWidget {
  const MapWisata({
    super.key,
    required this.wisata,
  });

  final List<Place> wisata;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: FlutterMap(
              options: MapOptions(
                center: const LatLng(-3.4537472, 114.819072),
                zoom: 10.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
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
      ],
    );
  }
}
