import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:idaman_webs/model/place.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class BadapatDetail extends StatelessWidget {
  final Place place;
  const BadapatDetail({super.key, required this.place});

  void launchGoogleMaps(double latitude, double longitude) async {
    final String googleMapsUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await launchUrl(Uri.parse(googleMapsUrl))) {
    } else {
      throw 'Could not launch Google Maps.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name!),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
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
                      builder: (ctx) => InkWell(
                        onTap: () {
                          launchGoogleMaps(place.lattitude, place.longitude);
                        },
                        child: const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 40.0,
                        ),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: CarouselSlider(
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
                  enlargeCenterPage: true,
                  height: 300.0,
                  autoPlay: true,
                  aspectRatio: 9 / 16),
            ),
          )
        ],
      ),
    );
  }
}
