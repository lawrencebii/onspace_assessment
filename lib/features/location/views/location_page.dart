import 'package:flutter/material.dart';
import 'package:onspace_assessment/features/location/components/textStyle.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
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
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  mainAxisAlignment:
                      MainAxisAlignment.center,
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
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
