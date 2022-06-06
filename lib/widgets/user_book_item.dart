import 'package:book_store_app/providers/books.dart';
import 'package:book_store_app/screens/edit_book_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserBookItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  UserBookItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.of(context);
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(EditBookScreen.routeName, arguments: id);
                },
                icon: Icon(
                  Icons.edit,
                  color: Theme.of(context).primaryColor,
                )),
            IconButton(
                onPressed: () async {
                  try {
                    await Provider.of<Books>(context, listen: false)
                        .deleteBook(id);
                  } catch (error) {
                    scaffold.showSnackBar(SnackBar(
                        content: Text(
                      'Deleting failed',
                      textAlign: TextAlign.center,
                    )));
                  }
                },
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ))
          ],
        ),
      ),
    );
  }
}
