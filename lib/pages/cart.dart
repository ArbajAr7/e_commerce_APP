import 'package:flutter/material.dart';
import 'package:DamiStyle/pages/product_details.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:DamiStyle/components/cart_products.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  var carttotal=11;
  Razorpay _razorpay;
  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_live_5TdMdtIYB2MizI',
      'amount': carttotal * 100,
      'name': 'DamiKart',
      'description': 'Bill Amount',
      'prefill': {
        'contact': '',
        'email': '',
      },
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(msg: "SUCCESS: " + response.paymentId);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + "-" + response.message);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "EXTERNAL WALLET: " + response.walletName);
  }
  void initState() {
    ;
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 5,
        backgroundColor: Colors.pink,
        title: InkWell(
          onTap: () {},
          child: Text('Shopping cart'),
        ),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),

      body: new Cart_products(),

      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(children: <Widget>[
          Expanded(
            child: ListTile(
              title: new Text("Total:"),
              subtitle: new Text("\Rs${carttotal}"),
            ),
          ),
          Expanded(
            child: new MaterialButton(
              onPressed: () {
                openCheckout();
              },
              child: new Text("Check out", style: TextStyle(color: Colors.white),),
              color:Colors.pink,
            ),
          ),
        ]),
      ),
    );
  }
}
