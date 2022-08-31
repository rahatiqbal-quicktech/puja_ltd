import 'package:flutter/material.dart';
import 'package:puja_ltd/common/widgets/vertical_space.dart';

class HomeScreenButton extends StatelessWidget {
  HomeScreenButton({
    required this.name,
    required this.icon,
    required this.color,
    this.function,
    Key? key,
  }) : super(key: key);

  String name;
  IconData icon;
  Color color;
  Function? function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (function != null) {
          function!();
        }
      },
      child: Container(
        height: 87,
        width: 85,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
            ),
            const VerticalSpace(height: 10),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
