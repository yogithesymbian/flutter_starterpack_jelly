import 'package:flutter/material.dart';
import 'package:flutter_starterpack_jelly/screens/yogithesymbian/ui/book/book_brain.dart';
import 'package:provider/src/provider.dart';
import 'dart:math' as math;

class DetailBookScreen extends StatefulWidget {
  static const String id = '/detail_book_screen';
  const DetailBookScreen({Key? key}) : super(key: key);

  @override
  _DetailBookScreenState createState() => _DetailBookScreenState();
}

class _DetailBookScreenState extends State<DetailBookScreen> {
  @override
  Widget build(BuildContext context) {
    final bookBrainW = context.watch<BookBrain>();
    final book = bookBrainW.detail;
    final size = MediaQuery.of(context).size;
    final bookHeight = size.height * 0.55;
    final bookWidth = size.width * 0.7;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Hero(
              tag: 'background_image',
              child: Image.asset(
                bookAppBackground,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: kToolbarHeight * 2,
            child: AppBar(
              centerTitle: false,
              leadingWidth: 0.0,
              title: Text(
                'Detail Book',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              elevation: 0,
              backgroundColor: Colors.white,
            ),
          ),
          Stack(
            children: [
              Center(
                child: Container(
                  height: bookHeight,
                  width: bookWidth,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 20.0,
                        offset: Offset(5.0, 5.0),
                        spreadRadius: 10,
                      )
                    ],
                  ),
                ),
              ),
              Center(
                child: Hero(
                  tag: book.title.toString(),
                  child: Image.asset(
                    book.image ?? bookAppBackground,
                    fit: BoxFit.cover,
                    height: bookHeight,
                    width: bookWidth,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
