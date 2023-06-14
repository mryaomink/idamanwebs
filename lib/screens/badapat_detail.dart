import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:idaman_webs/model/place.dart';
import 'package:latlong2/latlong.dart';

class BadapatDetail extends StatelessWidget {
  final Place place;
  const BadapatDetail({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name!),
      ),
      body: Column(
        children: [
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(place.lattitude, place.longitude),
                zoom: 16.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.idaman_webs',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: LatLng(place.lattitude, place.longitude),
                      builder: (ctx) => const Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 40.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          CarouselSlider(
              items: place.imgUrl
                  .map((img) => Builder(builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Image.network(
                            img,
                            fit: BoxFit.cover,
                          ),
                        );
                      }))
                  .toList(),
              options: CarouselOptions(
                  enlargeCenterPage: true, height: 200.0, autoPlay: true))
        ],
      ),
    );
  }
}
