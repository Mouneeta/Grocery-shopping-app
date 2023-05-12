import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop/model/product.dart';
import 'package:provider/provider.dart';
import '../components/bottom_nav_bar.dart';
import '../model/cart_model.dart';
class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer <CartModel>(
        builder: (context, value, child){
        return Scaffold(
          appBar:  AppBar(title: const Text('Shopping Cart                      '),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: AlignmentDirectional.centerStart,
                    end: AlignmentDirectional.centerEnd,
                    colors: <Color>[Colors.cyanAccent, Colors.blue]),
              ),
            ),
            actions: [
              Stack(
                children: [
                  IconButton(
                      icon: const ImageIcon(
                        AssetImage('lib/assets/images/Daco.png'),
                        size: 30,
                        //color: Color.fromRGBO(233, 237, 242, 1),
                      ),
                      onPressed: () {
                        // do something here
                      }),
                  Positioned(
                    top: 4,
                    right: 6,
                    child: Container(
                      height: 22,
                      width: 22,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(233, 237, 242, 1),
                      ),
                      child:   Center(
                          child: Text(
                           // "${value.CartLength()}" ,
                            "${value.CartLength()} " ,
                            //"0",
                            style: const TextStyle(
                              fontSize: 12,
                              //fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(0, 0, 0, 1),
                             ),
                          )),
                    ),
                  ),
                ],
              ),
            ],
              ),


          body: Column(
            children: [
              Container(
                color: const Color.fromRGBO(233, 237, 242, 1),
                child: Row(
                  children:  [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text('PRODUCTS',
                          style: GoogleFonts.lato(
                              fontSize: 16,
                              color: const Color.fromRGBO(43, 46, 67, 1),
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${value.CartLength()} ""ITEM(S)  " ,
                              style: GoogleFonts.lato(
                                fontSize: 12,
                                color:  const Color.fromRGBO(43, 46, 67, 1),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                      child: itemList()
                  )
              ),
              checkout()
            ],
          ),

          bottomNavigationBar: const MyBottomNavBar(),

        );
      }
    );
  }

  Widget itemList() {
    return Consumer <CartModel>(
      builder: (context, value, child){
        final currentItem = value.cartItems as List<Product>;
        return Column(
          children: [
            Column(
             children: currentItem.map((e)=>Padding(
               padding: const EdgeInsets.only(left:10, right: 10, top: 5),
               child: SizedBox(
                 height: 170,
                 child: Card(
                     shape: RoundedRectangleBorder(
                       side: const BorderSide(color: Colors.white70, width: 1),
                       borderRadius: BorderRadius.circular(10),
                     ),
                     elevation: 4.0,
                     child: Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Expanded(
                           child: Image.asset(
                             e.imageUrl,
                             height: 250,
                             width: 100,
                             alignment: Alignment.centerLeft,
                           ),
                         ),
                         Expanded(
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text(
                                     // ignore: prefer_interpolation_to_compose_strings
                                     "${"    "+e.name}  " ,

                                     // "California Oranges 8 Pcs"
                                     //textAlign: TextAlign.left,
                                     style: GoogleFonts.lato(
                                       fontSize: 18,
                                       color: const Color.fromRGBO(43, 46, 67, 1),
                                       fontWeight: FontWeight.bold,
                                     ),
                                   ),
                                   /// cancel button
                                   IconButton(
                                     icon: const ImageIcon(
                                       AssetImage('lib/assets/images/Close.png'),
                                       size: 30,
                                       color: Color.fromRGBO(171, 170, 170, 1),
                                     ),
                                     alignment: AlignmentDirectional.topEnd,
                                     onPressed: () =>
                                         Provider.of<CartModel>(context, listen : false)
                                             .removeItemFromCart(e.id),
                                   ),
                                 ],
                               ),

                               Row(
                                 children: [
                                   Text(
                                     "${"    \$"+e.price}  " ,
                                     textAlign: TextAlign.left,
                                     style: GoogleFonts.khand(
                                       fontSize: 18,
                                       color: Colors.green,
                                       fontWeight: FontWeight.bold,
                                     ),
                                   ),

                                   Text(
                                     "\$100",
                                     style: GoogleFonts.khand(
                                       decorationColor: const Color.fromRGBO(175, 175, 175, 1),
                                       decorationStyle: TextDecorationStyle.solid,
                                       decoration:
                                       TextDecoration.lineThrough,
                                       fontSize: 18,
                                       color: const Color.fromRGBO(175, 175, 175, 1),
                                       //fontWeight: FontWeight.bold,
                                     ),
                                   ),
                                 ],
                               ),

                               Row(
                                 children: [
                                   Text(
                                     "    Color: Black" ,

                                     style: GoogleFonts.lato(
                                         fontSize: 16,
                                         //color: value.cartItems[index][3],
                                         color:  const Color.fromRGBO(43, 46, 67, 1)
                                       //fontWeight: FontWeight.400,
                                     ),
                                   ),
                                 ],
                               ),

                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Container(
                                   width: 120,
                                   height: 30,

                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(20),
                                     color: Colors.white,
                                     border: Border.all(
                                       color: const Color.fromRGBO(237, 238, 245, 1),
                                       style: BorderStyle.solid,
                                       width: 1.0,
                                     ),
                                   ),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Container(
                                         width: 30,
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(200),
                                           color: Colors.white,
                                           boxShadow: const [
                                             BoxShadow(
                                               color: Colors.grey,
                                               blurRadius: 4,
                                               //offset: Offset(4, 8), // Shadow position
                                             ),
                                           ],
                                         ),
                                         child:  IconButton(
                                             icon: const ImageIcon(
                                               AssetImage('lib/assets/images/sub.png'),
                                               size: 30,
                                               color: Color.fromRGBO(169, 170, 191, 1),
                                             ),
                                           onPressed: () =>
                                               Provider.of<CartModel>(context, listen : false)
                                                   .sub(e.id),),

                                       ),
                                       Text(
                                         value.getQuantity(e.id),
                                         //  '${value.cartItems.[index].quantity.toString()}',
                                         //"  1  " ,
                                         textAlign: TextAlign.left,
                                         style: GoogleFonts.lato(
                                           fontSize: 14,
                                         ),
                                       ),
                                       Container(
                                         width: 30,
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(200),
                                           color: Colors.white,
                                           boxShadow: const [
                                             BoxShadow(
                                               color: Colors.grey,
                                               blurRadius: 4,
                                               //offset: Offset(4, 8), // Shadow position
                                             ),
                                           ],
                                         ),
                                         child:  IconButton(
                                           icon: const ImageIcon(
                                             AssetImage('lib/assets/images/add.png'),
                                             size: 30,
                                             color: Color.fromRGBO(169, 170, 191, 1),
                                           ),
                                           onPressed: () =>
                                               Provider.of<CartModel>(context, listen : false)
                                                   .add(e.id),),

                                       ),
                                     ],
                                   ),
                                 ),
                               ),
                               Row(
                                 children: [
                                   Text(
                                     "    Size: " ,
                                     textAlign: TextAlign.left,
                                     style: GoogleFonts.lato(
                                         fontSize: 16,
                                         //color: value.cartItems[index][3],
                                         color:  const Color.fromRGBO(43, 46, 67, 1)
                                       //fontWeight: FontWeight.400,
                                     ),
                                   ),
                                   Text(
                                     " XL " ,
                                     textAlign: TextAlign.left,
                                     style: GoogleFonts.lato(
                                       fontSize: 16,
                                       //color: value.cartItems[index][3],
                                       color:  const Color.fromRGBO(43, 46, 67, 1),
                                       fontWeight: FontWeight.bold,
                                     ),
                                   ),
                                 ],
                               ),
                             ],
                           ),
                         )
                       ],
                     )
                 ),
               ),
             )).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right : 8.0),
                      child: SizedBox(
                        height: 40,
                        width: 250,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(212, 212, 218, 1)
                              ),
                            ),
                            labelText: 'Enter your Coupon Card',
                          ),
                          style: GoogleFonts.montserrat(
                              fontSize: 15,
                              color: const Color.fromRGBO(175, 175, 175, 1)
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: 132,
                    child: ElevatedButton(
                      onPressed: () {},

                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(43, 46, 67, 1),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 3,
                          vertical: 3,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      child: Text(
                        'Add Gift Card',
                        style: GoogleFonts.lato(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(255, 255, 255, 1)
                        ),
                      ),


                    ),
                  ),
                ],

              ),
            ),
            ///  end of gift card

            /// end of coupon
            ///  gift card
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right : 8.0),
                      child: SizedBox(
                        height: 40,
                        width: 250,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(212, 212, 218, 1)
                              ),
                            ),
                            labelText: 'Enter Gift Card code',
                          ),
                          style: GoogleFonts.montserrat(
                              fontSize: 15,
                              color: const Color.fromRGBO(175, 175, 175, 1)
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: 132,
                    child: ElevatedButton(
                      onPressed: () {},

                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(43, 46, 67, 1),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 3,
                          vertical: 3,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      child: Text(
                        'Add Gift Card',
                        style: GoogleFonts.lato(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(255, 255, 255, 1)
                        ),
                      ),


                    ),
                  ),
                ],

              ),
            ),
            ///  end of gift card

            /// Divider
            //const SizedBox(height: 24),
            //divider
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.0),
              child: Divider(
                thickness: 1,
              ),
            ),

            /// total
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '  Sub-Total',
                    style: GoogleFonts.lato(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    //'  \$550.02  ',
                    "\$${value.calculateTotal()}",
                    style: GoogleFonts.lato(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            /// end of total
            /// Divider
            //const SizedBox(height: 24),
            //divider
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.0),
              child: Divider(
                thickness: 1,
              ),
            ),

            /// total
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '  Shipping',
                    style: GoogleFonts.lato(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  Text(

                    //'  \$550.02  ',
                    '\$${value.shippingCost()}',
                    style: GoogleFonts.lato(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),

            /// Divider
            //const SizedBox(height: 24),
            //divider
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.0),
              child: Divider(
                thickness: 1,
              ),
            ),

            /// total
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '  Total :',
                    style: GoogleFonts.lato(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$${value.TotalPrice()}',
                    style: GoogleFonts.lato(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }
    );
  }
  Widget checkout(){
  return Padding(
    padding: const EdgeInsets.all(0),
    child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(begin: AlignmentDirectional.centerStart,
              end: AlignmentDirectional.centerEnd,
              colors: <Color>[Colors.cyanAccent, Colors.blue]),
          //borderRadius: BorderRadius.circular(20),

          borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        ),
        padding: const EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// proceed to checkout
            Text(
              'PROCEED TO CHECKOUT',
              textAlign: TextAlign.left,
              style: GoogleFonts.lato(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            )
          ],
        )
    ),
  );
}

}
