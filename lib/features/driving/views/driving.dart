import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../location/views/location_page.dart';

class DrivingPage extends StatefulWidget {
  const DrivingPage({super.key});

  @override
  State<DrivingPage> createState() => _DrivingPageState();
}

class _DrivingPageState extends State<DrivingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 100,
            backgroundColor: Colors.transparent,
            floating: false,
            pinned: false,
            automaticallyImplyLeading: false,
            collapsedHeight: 100,
            elevation: 0.0,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero,
              background: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      splashColor: Colors.white54,
                      radius: 30,
                      onTap: () {},
                      child: const Padding(
                          padding: EdgeInsets.only(top: 3),
                          child: Icon(Icons.search)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Driving"),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
