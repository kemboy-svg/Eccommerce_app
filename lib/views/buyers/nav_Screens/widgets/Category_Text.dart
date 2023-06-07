import 'package:flutter/material.dart';

class CategoryText extends StatelessWidget {
  final List<String> _categorylable = [
    'Shoes',
    'Electronics',
    'Wear',
    'Beauty',
    'Hardware'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categories',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Container(
            
            height: 60,
            child: Row(
              children: [
                Expanded(child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categorylable.length,
                  itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ActionChip(
                      label: Text(_categorylable[index],style: TextStyle(color: Colors.orange.shade900,fontWeight: FontWeight.bold,),)),
                  );
                })
                ),
                IconButton(onPressed:() {}, icon: Icon(Icons.arrow_forward_ios)
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
