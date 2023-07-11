import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsYao extends StatefulWidget {
  const NewsYao({super.key});

  @override
  State<NewsYao> createState() => _NewsYaoState();
}

class _NewsYaoState extends State<NewsYao> {
  List<dynamic> wpPost = [];
  List<dynamic> featuredPost = [];
  @override
  void initState() {
    super.initState();
    fetchPosts();
    getFeaturePost();
  }

  Future<void> fetchPosts() async {
    try {
      final response = await get(
        Uri.parse(
            'https://mediacenter.banjarbarukota.go.id/wp-json/wp/v2/posts'),
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

  Future<void> getFeaturePost() async {
    try {
      final response = await get(Uri.parse(
          'https://mediacenter.banjarbarukota.go.id/wp-json/wp/v2/categories'));
      if (response.statusCode == 200) {
        setState(() {
          featuredPost = jsonDecode(response.body);
        });
      } else {
        throw Exception('Gagal mendapatkan Featured Post');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Media Center",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
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
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'Kategori Berita',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            SizedBox(
              height: 400,
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: featuredPost.length,
                itemBuilder: (BuildContext context, int index) {
                  final post = featuredPost[index];

                  final postUrl = post['link'];
                  return ListTile(
                    onTap: () {
                      _launchUrl(postUrl);
                    },
                    title: Text(
                      post['yoast_head_json']['title'],
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                fontSize: 14.0,
                                color: Colors.blue,
                              ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
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
