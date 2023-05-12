import 'package:flutter/material.dart';
import 'package:grocery_shop/pages/intro_page.dart';
import 'package:provider/provider.dart';

import 'model/cart_model.dart';

void main(){
  runApp( const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CartModel(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: IntroPage(),
          //home: categories(),
        ),
    );
  }
}
//height: MediaQuery.of(context).size.height*.9,