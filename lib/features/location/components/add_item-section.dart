import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class AddItemTagSection extends StatelessWidget {
  const AddItemTagSection({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 10),
      constraints: BoxConstraints(maxWidth: size.width),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(right: 10),
            margin: EdgeInsets.only(right: 10),
            constraints: BoxConstraints(maxWidth: size.width * 0.5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: primaryGreen,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                      child: Icon(
                    Icons.add,
                    color: Colors.black,
                  )),
                ),
                Text("Add new tag")
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 10),
            constraints: BoxConstraints(maxWidth: size.width * 0.4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: primaryGreen,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                      child: Icon(
                    Icons.add,
                    color: Colors.black,
                  )),
                ),
                Text("Add new item")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
