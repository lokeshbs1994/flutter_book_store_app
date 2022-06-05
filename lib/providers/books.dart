import 'package:book_store_app/model/httpexception.dart';
import 'package:book_store_app/providers/book.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Books with ChangeNotifier {
  // final String authToken;
  // final String userId;
  // Books(this.authToken, this.userId, this._items);

  List<Book> _items = [
    Book(
      id: "1",
      imageUrl:
          "https://png.pngtree.com/element_our/20190528/ourmid/pngtree-blue-open-book-image_1134778.jpg",
      title: "Building Planning",
      author: "S. S. Bhavikatti",
      price: 1400,
    ),
    Book(
      id: "2",
      imageUrl:
          "https://png.pngtree.com/element_our/20190528/ourmid/pngtree-blue-open-book-image_1134778.jpg",
      title: "Civil Engineering",
      author: "S. P. Gupta",
      price: 1200,
    ),
    Book(
        id: "3",
        imageUrl:
            "https://png.pngtree.com/element_our/20190528/ourmid/pngtree-blue-open-book-image_1134778.jpg",
        title: "Surveying",
        author: "S. K. Duggal",
        price: 1000),
    Book(
      id: "5",
      imageUrl:
          "https://png.pngtree.com/element_our/20190528/ourmid/pngtree-blue-open-book-image_1134778.jpg",
      title: "Rising hear",
      author: "Perumal",
      price: 400,
    ),
    Book(
        id: "6",
        imageUrl:
            "https://png.pngtree.com/element_our/20190528/ourmid/pngtree-blue-open-book-image_1134778.jpg",
        title: "Just like you",
        author: "Nick Hornby",
        price: 500),
    Book(
        id: "7",
        imageUrl:
            "https://png.pngtree.com/element_our/20190528/ourmid/pngtree-blue-open-book-image_1134778.jpg",
        title: "Richest man",
        author: "George S. Clason",
        price: 600),
    Book(
        id: "9",
        imageUrl:
            "https://png.pngtree.com/element_our/20190528/ourmid/pngtree-blue-open-book-image_1134778.jpg",
        title: "Chinese Communist",
        author: "Handry",
        price: 200),
    Book(
        id: "10",
        imageUrl:
            "https://png.pngtree.com/element_our/20190528/ourmid/pngtree-blue-open-book-image_1134778.jpg",
        title: "Think like a Rocket",
        author: "Panik H.",
        price: 800),
    Book(
        id: "11",
        imageUrl:
            "https://png.pngtree.com/element_our/20190528/ourmid/pngtree-blue-open-book-image_1134778.jpg",
        title: "How to speak",
        author: "Ron Malhotra",
        price: 850),
    Book(
        id: "12",
        imageUrl:
            "https://png.pngtree.com/element_our/20190528/ourmid/pngtree-blue-open-book-image_1134778.jpg",
        title: "Wining like Sourav",
        author: "Abhirup B.",
        price: 880),
    Book(
        id: "13",
        imageUrl:
            "https://png.pngtree.com/element_our/20190528/ourmid/pngtree-blue-open-book-image_1134778.jpg",
        title: "Oxfort Avanced",
        author: "Ajit J.",
        price: 1100),
    Book(
        id: "14",
        imageUrl:
            "https://png.pngtree.com/element_our/20190528/ourmid/pngtree-blue-open-book-image_1134778.jpg",
        title: "Tip of the Iceberg",
        author: "Suveen Sinha",
        price: 690),
    Book(
        id: "15",
        imageUrl:
            "https://png.pngtree.com/element_our/20190528/ourmid/pngtree-blue-open-book-image_1134778.jpg",
        title: "How to read a book",
        author: "Nortimer J. Adler",
        price: 780),
    Book(
        id: "16",
        imageUrl:
            "https://png.pngtree.com/element_our/20190528/ourmid/pngtree-blue-open-book-image_1134778.jpg",
        title: "Winning Sachin",
        author: "Devendra P.",
        price: 450)
  ];

  List<Book> get items {
    return [..._items];
  }

  Book findById(String id) {
    return _items.firstWhere((book) => book.id == id);
  }

  void addBook(Book book) {
    final newBook = Book(
      id: DateTime.now().toString(),
      title: book.title,
      author: book.author,
      price: book.price,
      imageUrl: book.imageUrl,
    );
    _items.add(newBook);
    notifyListeners();
  }

  void updateBook(String id, Book newBook) {
    final bookIndex = _items.indexWhere((book) => book.id == id);
    if (bookIndex >= 0) {
      _items[bookIndex] = newBook;
      notifyListeners();
    } else {
      print('....');
    }
    notifyListeners();
  }

  void deleteBook(String id) {
    _items.removeWhere((book) => book.id == id);
    notifyListeners();
  }
}
