import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_starterpack_jelly/screens/yogithesymbian/ui/book/book.dart';

const _bookAppAsset = 'assets/images/book';
final bookAppBackground = '$_bookAppAsset/Bg.png';

class BookBrain with ChangeNotifier {
  int _index = 0;
  List<Book> _books = [
    Book(
      title: 'Wink Poppy Midnight',
      author: 'April Genev Tucholke',
      image: '$_bookAppAsset/book1.jpg',
    ),
    Book(
      title: 'Walking with Miss Millie',
      author: 'Tamara Bundy',
      image: '$_bookAppAsset/book2.jpg',
    ),
    Book(
      title: 'Trio',
      author: 'Sarah Tolmie',
      image: '$_bookAppAsset/book3.jpg',
    ),
    Book(
      title: 'The Junble Book',
      author: 'Rudyard Kipling',
      image: '$_bookAppAsset/imt.jpg',
    ),
    Book(
      title: 'The Maker of Swans',
      author: 'Paraig 0\'Donnell',
      image: '$_bookAppAsset/book5.jpg',
    ),
  ];

  UnmodifiableListView<Book> get books {
    return UnmodifiableListView(_books);
  }

  int get count {
    return _books.length;
  }

  void position(int pos) {
    _index = pos;
    notifyListeners();
  }

  Book get detail {
    return _books[_index];
  }
}
