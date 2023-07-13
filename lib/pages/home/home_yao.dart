import 'dart:ui';

import 'package:flutter/material.dart';

class HomeYao extends StatelessWidget {
  const HomeYao({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Image.network(
                  'https://images.unsplash.com/photo-1494714198743-ba35ce177d03?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80',
                  fit: BoxFit.cover,
                ),
                ClipRRect(
                  clipBehavior: Clip.none,
                  borderRadius: BorderRadius.circular(10),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 15),
                    child: Container(
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(20.0),
                    width: 300.0,
                    height: 486.0,
                    child: Stack(
                      children: [
                        // Background image
                        Image.network(
                          'https://images.unsplash.com/photo-1494714198743-ba35ce177d03?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80',
                          fit: BoxFit.fitHeight,
                        ),
                        // Glass effect container
                        ClipRRect(
                          clipBehavior: Clip.none,
                          borderRadius: BorderRadius.circular(10),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 15),
                            child: Container(
                              color: Colors.white.withOpacity(0.2),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(20.0),
                      width: 300.0,
                      height: 486.0,
                      child: Stack(
                        children: [
                          // Background image

                          // Glass effect container
                          ClipRRect(
                            clipBehavior: Clip.none,
                            borderRadius: BorderRadius.circular(10),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 15),
                              child: Container(
                                color: Colors.white.withOpacity(0.2),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
