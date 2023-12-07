import 'package:flutter/material.dart';
import 'package:onspace_assessment/features/location/components/textStyle.dart';
import 'package:onspace_assessment/features/navigation/navigation_provider.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<NavigationProvider>().setSelectedIndex(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: 70,
      width: width,
      margin: EdgeInsets.only(bottom: 20, top: 20),
      padding: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: Colors.white,
        // border: Border(
        //   top: BorderSide(width: 0.5, color: Color(0xffBDBDBD)),
        // ),
      ),
      child: Consumer<NavigationProvider>(
        builder: (context, provider, child) {
          int selected = provider.selectedIndex;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomIconButton2(
                onTap: () {
                  context.read<NavigationProvider>().setSelectedIndex(0);
                },
                mainfocus: selected == 0,
                icon: bottomIcon(selected == 0, Icons.map_outlined),
                name: "Location",
              ),
              CustomIconButton2(
                onTap: () {
                  context.read<NavigationProvider>().setSelectedIndex(1);
                },
                mainfocus: selected == 1,
                icon: bottomIcon(selected == 1, Icons.safety_check),
                name: "Driving",
              ),
              CustomIconButton2(
                onTap: () {
                  context.read<NavigationProvider>().setSelectedIndex(2);
                },
                mainfocus: selected == 2,
                icon: bottomIcon(selected == 2, Icons.safety_check),
                name: "Safety",
              ),
              CustomIconButton2(
                onTap: () {
                  context.read<NavigationProvider>().setSelectedIndex(3);
                },
                mainfocus: selected == 3,
                icon: bottomIcon(selected == 3, Icons.chat),
                name: "Chat",
              ),
            ],
          );
        },
      ),
    );
  }

  Widget bottomIcon(bool selected, IconData icon) {
    return Icon(
      icon,
      color: selected ? darkColor : darkColor.withOpacity(0.4),
    );
  }
}

class CustomIconButton2 extends StatelessWidget {
  CustomIconButton2({
    this.mainfocus = false,
    this.icon,
    required this.onTap,
    this.backgroundcolor,
    this.iconcolor,
    this.name,
    Key? key,
  }) : super(key: key);
  String? name;
  final bool mainfocus;
  final icon;
  final Function() onTap;
  final Color? backgroundcolor;
  final Color? iconcolor;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(bottom: height * 0.01),
      width: 70,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35),
        child: Material(
          color: Colors.white,
          child: InkWell(
            onTap: onTap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(
                        top: 4, left: 4, bottom: 2, right: 4),
                    child: icon),
                Text(
                  name.toString(),
                  style: commonStyle.copyWith(fontSize: 12),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
