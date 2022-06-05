import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String bookId;
  final double price;
  final int quantity;
  final String title;
  final String image;
  CartItem(
    this.id,
    this.bookId,
    this.price,
    this.quantity,
    this.title,
    this.image,
  );

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to remove the item from the cart?'),
            actions: [
              FlatButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text('Yes'),
              ),
            ],
          ),
        );
      },
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(bookId);
      },
      child: Container(
        margin: EdgeInsets.all(5),
        width: 400,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 211, 176, 163)),
          color: Colors.white,
        ),
        child: Row(
          children: [
            const SizedBox(width: 10),
            Image.network(
              image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(title),
                Text('Total: \$${price * quantity}'),
                Row(
                  children: <Widget>[
                    quantity > 1
                        ? GestureDetector(
                            child: Container(
                              width: 20.0,
                              height: 20.0,
                              decoration: BoxDecoration(
                                color: Colors.brown,
                                borderRadius:
                                    BorderRadiusDirectional.circular(4.0),
                              ),
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 15.0,
                              ),
                            ),
                            onTap: () {
                              Provider.of<Cart>(context, listen: false)
                                  .removeSingleItem(bookId);
                            },
                          )
                        : SizedBox(
                            width: 15,
                          ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        '$quantity',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadiusDirectional.circular(4.0),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 15.0,
                        ),
                      ),
                      onTap: () {
                        Provider.of<Cart>(context, listen: false)
                            .addItem(bookId, price, title, image);
                      },
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
                child: Text('Remove'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Are you sure?'),
                      content:
                          Text('Do you want to remove the item from the cart?'),
                      actions: [
                        FlatButton(
                          child: Text('No'),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                        ),
                        FlatButton(
                          onPressed: () {
                            Provider.of<Cart>(context, listen: false)
                                .removeItem(bookId);
                            Navigator.of(context).pop();
                          },
                          child: Text('Yes'),
                        ),
                      ],
                    ),
                  );
                }),
            const SizedBox(width: 5)
          ],
        ),
      ),

      // Card(
      //   margin: EdgeInsets.symmetric(
      //     horizontal: 15,
      //     vertical: 4,
      //   ),
      //   child: ListTile(
      //       leading: CircleAvatar(
      //         child: Padding(
      //           padding: EdgeInsets.all(5),
      //           child: FittedBox(
      //             child: Text('\$$price'),
      //           ),
      //         ),
      //       ),
      //       title: Text(title),
      //       subtitle: Text('Total: \$${price * quantity}'),
      //       trailing: Text('$quantity x')),
      // ),
    );
  }
}
