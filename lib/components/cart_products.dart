import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_the_cart = [
    {
      "name": "Women top",
      "picture": "images/products/dress2.jpeg",
      "price": 6,
      "size": "M",
      "color": "Black",
      "quantity": 1,
    },
    {
      "name": "Mini skirt",
      "picture": "images/products/skt2.jpeg",
      "price": 5,
      "size": "S",
      "color": "Red",
      "quantity": 1,
    },

  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: Products_on_the_cart.length,
      itemBuilder: (context, index) {
        return Single_cart_product(
          cart_prod_name: Products_on_the_cart[index]["name"],
          cart_prod_color: Products_on_the_cart[index]["color"],
          cart_prod_qty: Products_on_the_cart[index]["quantity"],
          cart_prod_picture: Products_on_the_cart[index]["picture"],
          cart_prod_price: Products_on_the_cart[index]["price"],
          cart_prod_size: Products_on_the_cart[index]["size"],
        );
      },
    );
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;

  Single_cart_product({
    this.cart_prod_color,
    this.cart_prod_name,
    this.cart_prod_picture,
    this.cart_prod_price,
    this.cart_prod_qty,
    this.cart_prod_size,
  });

  @override
  Widget build(BuildContext context) {
    return Card(

      child: ListTile(
        //=========== leading section============
        leading: new Image.asset(
          cart_prod_picture,
          height: 50,
          width: 50,
        ),
        //===============title section=================
        title: new Text(cart_prod_name),
        //==================subtitle section==============
        subtitle: new Column(
          children: <Widget>[
            //===========Inside of a column===========
            new Row(
              children: <Widget>[
                //  this section is for the size of the product
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: new Text("Size:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(
                    cart_prod_size,
                    style: TextStyle(color: Colors.pink),
                  ),
                ),
                //====== THis section is for the product color===========
                new Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 8.0, 4.0, 8.0),
                  child: new Text("Color:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: new Text(
                    cart_prod_color,
                    style: TextStyle(color: Colors.pink),
                  ),
                ),

                //==================cart quantity increaser===============
                Container(
                  child: new Row(
                    children: <Widget>[
                      IconButton(icon: Icon(Icons.arrow_left,), onPressed:(){},alignment: Alignment.topRight,),
                      new Text("$cart_prod_qty",),
                      IconButton(icon: Icon(Icons.arrow_right,), onPressed:(){},alignment: Alignment.topRight,),
                    ],
                  ),
                ),
              ],

            ),
            //==========this section is for product price=======

            new Container(
              alignment: Alignment.topLeft,
              child: new Text(
                "\Rs ${cart_prod_price}",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}
