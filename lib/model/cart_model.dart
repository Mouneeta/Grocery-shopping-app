import 'package:flutter/material.dart';
import 'package:grocery_shop/model/product.dart';


class CartModel extends ChangeNotifier{
  // list of items on sale

  final List<Product> _shopItems = [
    // [id, itemName, itemPrice, imagePath, color, quantity]
    Product(
        name: 'Avocado',
        id: 1,
        quantity: 1,
        imageUrl: 'lib/assets/images/avocado.png',
        price: '4.00',
        color: Colors.green,
    ),
    Product(
        name: 'Banana',
        id: 2,
        quantity: 1,
        imageUrl: 'lib/assets/images/banana.png',
        price: '2.50',
        color: Colors.yellow,
    ),
    Product(
        name: 'Chicken',
        id: 3,
        quantity: 1,
        imageUrl: 'lib/assets/images/chicken.png',
        price: '12.80',
        color: Colors.brown,
    ),
    Product(
        name: 'Water',
        id: 4,
        quantity: 1,
        imageUrl: 'lib/assets/images/water.png',
        price: '1.00',
        color: Colors.blue,
    ),

   /* ["1","Avocado", "4.00" , "lib/assets/images/Rectangle 523.png", Colors.green, "1"],
    ["2","Banana", "2.50" , "lib/assets/images/Rectangle 523 (1).png", Colors.yellow, "1"],
    ["3","Chicken", "12.80" , "lib/assets/images/chicken.png", Colors.brown, "1"],
    ["4","Water", "1.00" , "lib/assets/images/water.png", Colors.blue, "1"],*/

  ];




  // list of cart items
  final List<Product> _cartItems = [];


  get shopItems => _shopItems;

  get  cartItems => _cartItems;

  // add item to the cart
  void addItemToCart(int index){
    final item = _shopItems[index];
    bool found = false;

    for (var element in _cartItems) {
      if (element.id == item.id) {
        element.quantity++;
        found = true;
        break;
      }
    }

    if (!found) {
      _cartItems.add(item);
    }

    notifyListeners();
  }


 // remove  item from the cart
  void removeItemFromCart(int id){
     var deleteItem = cartItems.where((e) => e.id == id);
     if (deleteItem.length > 0) {
       cartItems.removeWhere((item) => item.id == id);
     } else {
       // Element is not found
     }
    notifyListeners();
}


 // calculate total price
String calculateTotal(){
    double totalPrice = 0;
    for(int i=0; i<_cartItems.length; i++){
      //double quantity = double.parse(_cartItems[i][5]);
      totalPrice=totalPrice+(
          double.parse(_cartItems[i].price)*_cartItems[i].quantity
      );
    }
    return totalPrice.toStringAsFixed(2);
}

String shippingCost(){
    double shippingCost = 20;
    if(_cartItems.isEmpty){
      shippingCost = 0;
    }
    return shippingCost.toStringAsFixed(2);
}

String TotalPrice(){
    double totalPrice = 0;
    if(_cartItems.isEmpty){
      totalPrice=0;
    }
    else{
    for(int i=0; i<_cartItems.length; i++){
      totalPrice=totalPrice+double.parse(_cartItems[i].price)*_cartItems[i].quantity;
    }
    totalPrice = totalPrice + 20;}
    return totalPrice.toStringAsFixed(2);
  }

String CartLength(){
    //var length = _cartItems.length/*+double.parse(_cartItems[5])*/;
   var length = 0;
  for(int i=0;i<_cartItems.length;i++){
    length= _cartItems[i].quantity+length;
  }
    return length.toString();
}
  String getQuantity(int productId){
    int one = 1;
    for(int i=0; i<_cartItems.length; i++){
     if(_cartItems[i].id==productId){
       one = _cartItems[i].quantity;
     }
    }
    return one.toString();
  }


  void add( int uid ){
    for(int i=0;i<_shopItems.length;i++){
      if(uid==_shopItems[i].id){

        _shopItems[i].quantity=_shopItems[i].quantity+1;
      }
      else {
        print("bye");
      }
    }

   notifyListeners();
  }

  void sub( int uid ){
    for(int i=0;i<_shopItems.length;i++){
      if(uid==_shopItems[i].id){
        if(_shopItems[i].quantity>1){
        _shopItems[i].quantity=_shopItems[i].quantity-1;}
        else{
          _shopItems[i].quantity=1;
        }
      }
    }

    notifyListeners();
  }


}