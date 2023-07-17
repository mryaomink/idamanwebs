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
  List<dynamic> bkppPost = [];
  List<dynamic> bpkad = [];
  List<dynamic> dishub = [];
  List<dynamic> disperkim = [];
  List<dynamic> dinsos = [];
  List<dynamic> ulp = [];
  @override
  void initState() {
    super.initState();
    fetchPosts();
    fetchPostsBkpp();
    fetchPostsBpkad();
    fetchPostsDishub();
    fetchPostsDisperkim();
    fetchPostsDinsos();
    fetchPostsUlp();
    getFeaturePost();
  }

  Future<void> fetchPostsUlp() async {
    try {
      final response = await get(
        Uri.parse('https://ulp.banjarbarukota.go.id/wp-json/wp/v2/posts/'),
      );
      if (response.statusCode == 200) {
        setState(() {
          ulp = jsonDecode(response.body);
        });
      } else {
        throw Exception('Gagal Mendapatkan Artikel');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchPostsDinsos() async {
    try {
      final response = await get(
        Uri.parse('https://dinsos.banjarbarukota.go.id/wp-json/wp/v2/posts/'),
      );
      if (response.statusCode == 200) {
        setState(() {
          dinsos = jsonDecode(response.body);
        });
      } else {
        throw Exception('Gagal Mendapatkan Artikel');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchPostsDisperkim() async {
    try {
      final response = await get(
        Uri.parse(
            'https://disperkim.banjarbarukota.go.id/wp-json/wp/v2/posts/'),
      );
      if (response.statusCode == 200) {
        setState(() {
          disperkim = jsonDecode(response.body);
        });
      } else {
        throw Exception('Gagal Mendapatkan Artikel');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchPostsDishub() async {
    try {
      final response = await get(
        Uri.parse('https://dishub.banjarbarukota.go.id/wp-json/wp/v2/posts/'),
      );
      if (response.statusCode == 200) {
        setState(() {
          dishub = jsonDecode(response.body);
        });
      } else {
        throw Exception('Gagal Mendapatkan Artikel');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchPostsBpkad() async {
    try {
      final response = await get(
        Uri.parse('https://bpkad.banjarbarukota.go.id/wp-json/wp/v2/posts/'),
      );
      if (response.statusCode == 200) {
        setState(() {
          bpkad = jsonDecode(response.body);
        });
      } else {
        throw Exception('Gagal Mendapatkan Artikel');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchPostsBkpp() async {
    try {
      final response = await get(
        Uri.parse('https://bkpp.banjarbarukota.go.id/wp-json/wp/v2/posts/'),
      );
      if (response.statusCode == 200) {
        setState(() {
          bkppPost = jsonDecode(response.body);
        });
      } else {
        throw Exception('Gagal Mendapatkan Artikel');
      }
    } catch (e) {
      print('Error: $e');
    }
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
          "Berita & Informasi",
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
              child: MediaQuery.of(context).size.width < 640
                  ? _mediaCenterMobile()
                  : _mediaCenterWeb(),
            ),

            // bkpp Post
            SizedBox(
              child: MediaQuery.of(context).size.width < 640
                  ? _bkppMobile()
                  : _bkppWeb(),
            ),
            // bpkad post
            SizedBox(
              child: MediaQuery.of(context).size.width < 640
                  ? _bpkadMobile()
                  : _bpkadWeb(),
            ),
            // Dishub post
            SizedBox(
              child: MediaQuery.of(context).size.width < 640
                  ? _dishubMobile()
                  : _dishubWeb(),
            ),
            // Disperkim post
            SizedBox(
              child: MediaQuery.of(context).size.width < 640
                  ? _disperkimMobile()
                  : _disperkimWeb(),
            ),
            // Dinsos post
            SizedBox(
              child: MediaQuery.of(context).size.width < 640
                  ? _dinsosMobile()
                  : _dinsosWeb(),
            ),
            // Ulp Post
            SizedBox(
              child: MediaQuery.of(context).size.width < 640
                  ? _ulpMobile()
                  : _ulpWeb(),
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

  Widget _ulpWeb() {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: ulp.length,
      itemBuilder: (BuildContext context, int index) {
        final post = ulp[index];
        final htmlContent = post['excerpt']['rendered'];
        final postUrl = post['link'];
        return ListTile(
          onTap: () {
            _launchUrl(postUrl);
          },
          title: Text(
            post['title']['rendered'],
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HtmlWidget(
                htmlContent,
                textStyle: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextButton(
                onPressed: () {
                  _launchUrl(postUrl);
                },
                child: Text(
                  "Selengkapnya",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.blue,
                        fontSize: 20.0,
                      ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _ulpMobile() {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: ulp.length,
      itemBuilder: (BuildContext context, int index) {
        final post = ulp[index];
        final htmlContent = post['excerpt']['rendered'];
        final postUrl = post['link'];
        return ListTile(
          onTap: () {
            _launchUrl(postUrl);
          },
          title: Text(
            post['title']['rendered'],
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HtmlWidget(
                htmlContent,
                textStyle: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextButton(
                onPressed: () {
                  _launchUrl(postUrl);
                },
                child: Text(
                  "Selengkapnya",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.blue,
                        fontSize: 14.0,
                      ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _dinsosWeb() {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: dinsos.length,
      itemBuilder: (BuildContext context, int index) {
        final post = dinsos[index];
        final htmlContent = post['excerpt']['rendered'];
        final postUrl = post['link'];
        return ListTile(
          onTap: () {
            _launchUrl(postUrl);
          },
          title: Text(
            post['title']['rendered'],
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HtmlWidget(
                htmlContent,
                textStyle: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextButton(
                onPressed: () {
                  _launchUrl(postUrl);
                },
                child: Text(
                  "Selengkapnya",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.blue,
                        fontSize: 20.0,
                      ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _dinsosMobile() {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: dinsos.length,
      itemBuilder: (BuildContext context, int index) {
        final post = dinsos[index];
        final htmlContent = post['excerpt']['rendered'];
        final postUrl = post['link'];
        return ListTile(
          onTap: () {
            _launchUrl(postUrl);
          },
          title: Text(
            post['title']['rendered'],
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HtmlWidget(
                htmlContent,
                textStyle: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextButton(
                onPressed: () {
                  _launchUrl(postUrl);
                },
                child: Text(
                  "Selengkapnya",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.blue,
                        fontSize: 14.0,
                      ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _disperkimWeb() {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: disperkim.length,
      itemBuilder: (BuildContext context, int index) {
        final post = disperkim[index];

        final postUrl = post['link'];
        return ListTile(
          onTap: () {
            _launchUrl(postUrl);
          },
          title: Text(
            post['title']['rendered'],
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          subtitle: Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () {
                _launchUrl(postUrl);
              },
              child: Text(
                "Selengkapnya",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.blue,
                      fontSize: 20.0,
                    ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _disperkimMobile() {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: disperkim.length,
      itemBuilder: (BuildContext context, int index) {
        final post = disperkim[index];

        final postUrl = post['link'];
        return ListTile(
          onTap: () {
            _launchUrl(postUrl);
          },
          title: Text(
            post['title']['rendered'],
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          subtitle: TextButton(
            onPressed: () {
              _launchUrl(postUrl);
            },
            child: Text(
              "Selengkapnya",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Colors.blue,
                    fontSize: 14.0,
                  ),
            ),
          ),
        );
      },
    );
  }

  Widget _dishubWeb() {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: dishub.length,
      itemBuilder: (BuildContext context, int index) {
        final post = dishub[index];
        final htmlContent = post['excerpt']['rendered'];
        final postUrl = post['link'];
        return ListTile(
          onTap: () {
            _launchUrl(postUrl);
          },
          title: Text(
            post['title']['rendered'],
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HtmlWidget(
                htmlContent,
                textStyle: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextButton(
                onPressed: () {
                  _launchUrl(postUrl);
                },
                child: Text(
                  "Selengkapnya",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.blue,
                        fontSize: 20.0,
                      ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _dishubMobile() {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: dishub.length,
      itemBuilder: (BuildContext context, int index) {
        final post = dishub[index];
        final htmlContent = post['excerpt']['rendered'];
        final postUrl = post['link'];
        return ListTile(
          onTap: () {
            _launchUrl(postUrl);
          },
          title: Text(
            post['title']['rendered'],
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HtmlWidget(
                htmlContent,
                textStyle: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextButton(
                onPressed: () {
                  _launchUrl(postUrl);
                },
                child: Text(
                  "Selengkapnya",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.blue,
                        fontSize: 14.0,
                      ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _bpkadWeb() {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: bpkad.length,
      itemBuilder: (BuildContext context, int index) {
        final post = bpkad[index];
        final htmlContent = post['excerpt']['rendered'];
        final postUrl = post['link'];
        return ListTile(
          onTap: () {
            _launchUrl(postUrl);
          },
          title: Text(
            post['title']['rendered'],
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HtmlWidget(
                htmlContent,
                textStyle: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextButton(
                onPressed: () {
                  _launchUrl(postUrl);
                },
                child: Text(
                  "Selengkapnya",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.blue,
                        fontSize: 20.0,
                      ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _bpkadMobile() {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: bpkad.length,
      itemBuilder: (BuildContext context, int index) {
        final post = bpkad[index];
        final htmlContent = post['excerpt']['rendered'];
        final postUrl = post['link'];
        return ListTile(
          onTap: () {
            _launchUrl(postUrl);
          },
          title: Text(
            post['title']['rendered'],
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HtmlWidget(
                htmlContent,
                textStyle: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextButton(
                onPressed: () {
                  _launchUrl(postUrl);
                },
                child: Text(
                  "Selengkapnya",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.blue,
                        fontSize: 14.0,
                      ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _bkppWeb() {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: bkppPost.length,
      itemBuilder: (BuildContext context, int index) {
        final post = bkppPost[index];
        final htmlContent = post['excerpt']['rendered'];
        final postUrl = post['link'];
        return ListTile(
          onTap: () {
            _launchUrl(postUrl);
          },
          title: Text(
            post['title']['rendered'],
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HtmlWidget(
                htmlContent,
                textStyle: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextButton(
                onPressed: () {
                  _launchUrl(postUrl);
                },
                child: Text(
                  "Selengkapnya",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.blue,
                        fontSize: 20.0,
                      ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _bkppMobile() {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: bkppPost.length,
      itemBuilder: (BuildContext context, int index) {
        final post = bkppPost[index];
        final htmlContent = post['excerpt']['rendered'];
        final postUrl = post['link'];
        return ListTile(
          onTap: () {
            _launchUrl(postUrl);
          },
          title: Text(
            post['title']['rendered'],
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HtmlWidget(
                htmlContent,
                textStyle: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextButton(
                onPressed: () {
                  _launchUrl(postUrl);
                },
                child: Text(
                  "Selengkapnya",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.blue,
                        fontSize: 14.0,
                      ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _mediaCenterWeb() {
    return ListView.builder(
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
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HtmlWidget(
                htmlContent,
                textStyle: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextButton(
                onPressed: () {
                  _launchUrl(postUrl);
                },
                child: Text(
                  "Selengkapnya",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.blue,
                        fontSize: 20.0,
                      ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _mediaCenterMobile() {
    return ListView.builder(
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
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HtmlWidget(
                htmlContent,
                textStyle: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextButton(
                onPressed: () {
                  _launchUrl(postUrl);
                },
                child: Text(
                  "Selengkapnya",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.blue,
                        fontSize: 14.0,
                      ),
                ),
              ),
            ],
          ),
        );
      },
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
