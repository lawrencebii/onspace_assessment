import 'package:flutter/material.dart';

class TopActions extends StatelessWidget {
  const TopActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
                child: Icon(
              Icons.search,
              color: Colors.black,
            )),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
                child: Icon(
              Icons.settings,
              color: Colors.black,
            )),
          ),
        ],
      ),
    );
  }
}
