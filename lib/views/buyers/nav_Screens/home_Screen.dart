import 'package:eccommerce_app/views/buyers/nav_Screens/widgets/Banner_Widget.dart';
import 'package:eccommerce_app/views/buyers/nav_Screens/widgets/Search_input.dart';
import 'package:eccommerce_app/views/buyers/nav_Screens/widgets/Welcome_Screen.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WelcomeText(),

        SizedBox(height: 14,),

      SearchInputScreen(),
      BannerWidget(),
      
     ],
    );
  }
}




