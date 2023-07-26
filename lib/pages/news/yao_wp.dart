import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class YaoWp extends StatefulWidget {
  const YaoWp({Key? key}) : super(key: key);

  @override
  State<YaoWp> createState() => _YaoWpState();
}

class _YaoWpState extends State<YaoWp> {
  List<dynamic> _post = [];
  @override
  void initState() {
    super.initState();
    fetchPost();
  }

  // fungsi call rest api wordpress
  Future<void> fetchPost() async {
    const String wpUrl =
        "https://mediacenter.banjarbarukota.go.id/wp-json/wp/v2/posts";
    final response = await http.get(Uri.parse(wpUrl));
    if (response.statusCode == 200) {
      setState(() {
        _post = json.decode(response.body);
      });
    } else {
      Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        initialPage: 0,
        height: 160.0,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: _post.map((
        post,
      ) {
        return Builder(
          builder: (
            BuildContext context,
          ) {
            return GestureDetector(
              onTap: () {
                // ignore: deprecated_member_use
                launch(post['link']);
              },
              child: Container(
                alignment: Alignment.bottomLeft,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6.0),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      post['yoast_head_json']['og_image'][0]['url'] ??
                          'No Image Available',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    post['title']['rendered'] ?? '',
                    style: TextStyle(
                      color: Colors.black,
                      backgroundColor: Colors.white.withOpacity(0.4),
                    ),
                    maxLines: 2,
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
