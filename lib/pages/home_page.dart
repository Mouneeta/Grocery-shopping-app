import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../components/grocery_item_tile.dart';
import '../model/cart_model.dart';
import 'cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context){
                return const CartPage();
              },
          ),
        ),
        backgroundColor: Colors.black,
        child: const Icon(Icons.shopping_bag),
      ),

      body: SafeArea(
        child: Column(
          children:  [
            const SizedBox(height: 48),

            // good morning
           /* const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text("Good morning,"),
            ),*/



            const SizedBox(height: 4),
            // lets order fresh items for you
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0 ),
              child: Text(
                  "Lets order fresh items for you",

                  style: GoogleFonts.notoSerif(
                    fontSize: 36,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
              ),
            ),

            const SizedBox(height: 24),
            //divider
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(
                thickness: 4,
              ),
            ),

            const SizedBox(height: 24),


            // fresh items + grid

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                  "Fresh Items",
                  style: TextStyle(fontSize: 16),
              ),
            ),

           Expanded(
               child: Consumer<CartModel>(
                 builder: (context, value, child) {
                  return GridView.builder(
                     itemCount: value.shopItems.length,
                     padding: const EdgeInsets.all(12),
                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                         crossAxisCount: 2,
                         childAspectRatio: 1/1.3,
                     ),
                     itemBuilder: (context, index) {
                       return GroceryItemTile(
                         /*id : value.shopItems[index][0],
                         itemName: value.shopItems[index][1],
                         itemPrice: value.shopItems[index][2],
                         imagePath: value.shopItems[index][3],
                         color: value.shopItems[index][4],
                         quantity: value.shopItems[index][5],*/
                         id : value.shopItems[index].id,
                         name: value.shopItems[index].name,
                         price: value.shopItems[index].price,
                         imageUrl: value.shopItems[index].imageUrl,
                         color: value.shopItems[index].color,
                         quantity: value.shopItems[index].quantity,

                         onPressed: () {
                           Provider.of<CartModel>(context, listen: false).addItemToCart(index);showDialog(
                               context: context,
                               builder: (context) => const AlertDialog(
                                 title: Text("Successfully added to cart"),
                                 //icon: Icon(Icons.add),
                                 //icon: TextButton.icon(
                                    // onPressed: , icon: Icon(Icons.add), label: label),

                               ),
                           );
                           },
                       );
                     },
                   );
                 },
               ),
             )
          ],
        ),
      )
    );
  }
}
