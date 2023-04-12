import 'package:flutter/material.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Text(
            "gyudskjre rdkicxjfh5r xghytresdxbcg y5rewsxcvjgytntr edsxgyti654ewsx",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black.withOpacity(0.7),
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
