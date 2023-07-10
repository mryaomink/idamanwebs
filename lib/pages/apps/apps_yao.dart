import 'package:flutter/material.dart';

class AppsYao extends StatefulWidget {
  const AppsYao({super.key});

  @override
  State<AppsYao> createState() => _AppsYaoState();
}

class _AppsYaoState extends State<AppsYao> {
  List<String> title = [
    "Badapat",
    "Intan BJB",
    "Satu Data",
    "PPID",
    "CCTV",
  ];

  List<String> imgUrl = [
    "https://images.unsplash.com/photo-1444723121867-7a241cacace9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
    "https://images.unsplash.com/photo-1608637273739-15f0cd97285e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
    "https://images.unsplash.com/photo-1488229297570-58520851e868?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=869&q=80",
    "https://images.unsplash.com/photo-1457694587812-e8bf29a43845?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=871&q=80",
    "https://images.unsplash.com/photo-1566060475410-1159300f046f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80",
  ];

  late ScrollController controller;
  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        controller: controller,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            height: MediaQuery.of(context).size.height,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(),
            child: Stack(
              children: [
                Container(
                  transform: Matrix4.identity()
                    ..translate(
                      0.0,
                      controller.hasClients
                          ? (-(index * MediaQuery.of(context).size.height) +
                                  controller.position.pixels) /
                              2
                          : 0.0,
                    ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Image.network(
                    imgUrl[index],
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    color: Colors.white.withOpacity(0.5),
                    child: Text(
                      title[index],
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width >= 600
                              ? 100
                              : 50.0),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
