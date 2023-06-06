import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 140,
        decoration: BoxDecoration(color: Colors.yellow.shade900,
        borderRadius: BorderRadius.circular(10),
          
          ),
        child: PageView(
          children: [
            Center(child: Text('Banner1')),
            Center(child: Text('Banner2')),
            Center(child: Text('Banner3')),
            Center(child: Text('Banner4')),
          ],
        )
      ),
    );
  }
}
