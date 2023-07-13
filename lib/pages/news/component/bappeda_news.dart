import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

class BappedaNews extends StatefulWidget {
  const BappedaNews({super.key});

  @override
  State<BappedaNews> createState() => _BappedaNewsState();
}

class _BappedaNewsState extends State<BappedaNews> {
  List<dynamic> wpPost = [];

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      final response = await get(
        Uri.parse('https://bappeda.banjarbarukota.go.id/wp-json/wp/v2/posts'),
      );
      if (response.statusCode == 200) {
        setState(() {
          wpPost = jsonDecode(response.body);
        });
      } else {
        throw Exception('Gagal Mendapatkan Artikel');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: wpPost.length,
        itemBuilder: (BuildContext context, int index) {
          final post = wpPost[index];
          final htmlContent = post['excerpt']['rendered'];

          final postUrl = post['link'];
          return ListTile(
            onTap: () {
              _launchUrl(postUrl);
            },
            title: Text(
              post['title']['rendered'],
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            subtitle: HtmlWidget(
              htmlContent,
            ),
          );
        },
      ),
    );
  }

  void _launchUrl(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
