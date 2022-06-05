import 'package:book_store_app/providers/book.dart';
import 'package:book_store_app/providers/books.dart';
import 'package:book_store_app/providers/cart.dart';
import 'package:book_store_app/screens/cart_screen.dart';
import 'package:book_store_app/widgets/app_drawer.dart';
import 'package:book_store_app/widgets/badge.dart';
import 'package:book_store_app/widgets/book_item.dart';
import 'package:book_store_app/widgets/bookgrid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookOverviewScreen extends StatefulWidget {
  BookOverviewScreen({Key? key}) : super(key: key);

  @override
  State<BookOverviewScreen> createState() => _BookOverviewScreenState();
}

class _BookOverviewScreenState extends State<BookOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text("Book Store App"),
        actions: [
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              value: cart.itemCount.toString(),
              child: ch!,
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_bag),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: BooksGrid(),
    );
  }
}
