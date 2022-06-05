import 'package:book_store_app/providers/books.dart';
import 'package:book_store_app/screens/edit_book_screen.dart';
import 'package:book_store_app/widgets/app_drawer.dart';
import 'package:book_store_app/widgets/user_book_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserBooksScreen extends StatelessWidget {
  static const routeName = 'user-books';

  @override
  Widget build(BuildContext context) {
    final booksData = Provider.of<Books>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text('Your Books'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditBookScreen.routeName);
            },
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: booksData.items.length,
          itemBuilder: (_, i) => Column(
            children: [
              UserBookItem(booksData.items[i].id, booksData.items[i].title,
                  booksData.items[i].imageUrl),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
