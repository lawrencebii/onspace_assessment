import 'package:flutter/material.dart';
import 'package:onspace_assessment/features/chat/views/chat.dart';
import 'package:onspace_assessment/features/location/views/location_detail.dart';
import 'package:onspace_assessment/features/location/views/location_page.dart';
import 'package:provider/provider.dart';

import '../driving/views/driving.dart';
import '../safety/views/safety.dart';

import 'bottomNav.dart';
import 'navigation_provider.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<NavigationProvider>().setSelectedIndex(0);
      context.read<NavigationProvider>().updateCurrentTime();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future(() => false);
      },
      child: Stack(
        children: [
          SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white54,
              body: Consumer<NavigationProvider>(
                builder: (context, provider, child) {
                  return IndexedStack(
                    index: provider.selectedIndex,
                    children: const [
                      LocationPage(),
                      // LocationDetail(),
                      DrivingPage(),
                      SafetyPage(),
                      ChatPage(),
                    ],
                  );
                },
              ),
              // bottomNavigationBar: const BottomNavBar(),
            ),
          ),
          // const AppProgressIndicator(),
          Positioned(bottom: 10, child: BottomNavBar()),
        ],
      ),
    );
  }
}
