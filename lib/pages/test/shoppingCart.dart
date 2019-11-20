import 'package:flutter/material.dart';

class Product{
  const Product({this.name});
  final String name;
}

typedef void CartChangedCallback( Product product, bool inCart );

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({Product product, this.inCart, this.onCartChanged})
    :product = product,
    super(key: ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context){
    return inCart ? Colors.black45 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context){
    if(!inCart) return null;

    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      onTap: (){
        onCartChanged(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(product.name, style: _getTextStyle(context)),
    );
  }
}

class ShoppingCart extends StatefulWidget {
  ShoppingCart({ Key key}): super(key:key);

  final List<Product> products = <Product>[
    Product(name: 'Animal'),
    Product(name: 'Plant'),
  ];

  @override
  _ShoppingListState createState()=> _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingCart>{
  Set<Product> _shopingCart = Set<Product>();

  void _handleCartChanged(Product product, bool inCart){
    setState(() {
      if( inCart ){
        _shopingCart.remove(product);
      }else{
        _shopingCart.add(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0 ),
        children: widget.products.map( (Product product){
            return ShoppingListItem(
              product: product,
              inCart: _shopingCart.contains(product),
              onCartChanged: _handleCartChanged,
            );
          } ).toList(),
      ),

    );
  }
}