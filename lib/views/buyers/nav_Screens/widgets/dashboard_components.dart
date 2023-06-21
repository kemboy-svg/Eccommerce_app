import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class DashboardScreen extends StatelessWidget {
  final Stream<QuerySnapshot> _CategoriesStream =
      FirebaseFirestore.instance.collection('Categories').snapshots();

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot>(
      stream: _CategoriesStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(
            color: Colors.blue,
          );
        }

        return GridView.builder(
          shrinkWrap: true,
            itemCount: snapshot.data!.size,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 0.4, crossAxisSpacing: 1, mainAxisExtent: 150 ),
            itemBuilder: (context, index) {
              final categoryData = snapshot.data!.docs[index];
              return Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.network(
                      categoryData['image'],

                      
                    ),
                  ),
                  Text(categoryData['category'],),
                ],
              );
            });
      },
    );
  }
}

