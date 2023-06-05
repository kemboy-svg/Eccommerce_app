import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: MediaQuery.of(context).padding.top, left: 25,right: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Hey, Welcome this is the best Site\n what are you looking for?',style: TextStyle(
                fontSize: 10, fontWeight: FontWeight.bold
                ),
              ),
           Container(
            child: SvgPicture.asset(
              'assets/icons/cart.svg', width: 20,
            ),
           )
           
            ],

            
          ),

        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: TextField(
              decoration: InputDecoration(hintText: 'Search for products',
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(borderSide: BorderSide.none)
              ),
              
            ),
        ),
        ],
      ),
    );
  }
}
