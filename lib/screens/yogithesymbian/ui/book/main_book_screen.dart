import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_starterpack_jelly/screens/yogithesymbian/ui/book/book_brain.dart';
import 'package:flutter_starterpack_jelly/screens/yogithesymbian/ui/book/detail_book_screen.dart';
import 'package:flutter_starterpack_jelly/utils/anim/flip_card_transition.dart';
import 'package:flutter_starterpack_jelly/utils/anim/react_tween.dart';
import 'package:provider/src/provider.dart';

class MainBookScreen extends StatefulWidget {
  static const String id = '/main_book_screen';
  const MainBookScreen({Key? key}) : super(key: key);

  @override
  _MainBookScreenState createState() => _MainBookScreenState();
}

class _MainBookScreenState extends State<MainBookScreen> {
  final _controller = PageController();
  final _notifierScroll = ValueNotifier(0.0);

  RectTween _createRectTween(Rect? begin, Rect? end) {
    return CustomMaterialRectCenterArcTween(begin: begin, end: end);
  }

  void _listener() {
    _notifierScroll.value = _controller.page ?? 0.0;
  }

  @override
  void initState() {
    _controller.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bookHeight = size.height * 0.45;
    final bookWidth = size.width * 0.6;
    final bookBrainW = context.watch<BookBrain>();
    final bookBrainR = context.read<BookBrain>();

    return Scaffold(
      // extendBodyBehindAppBar: true,
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
                'BookIo',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              elevation: 0,
              backgroundColor: Colors.white,
            ),
          ),
          ValueListenableBuilder<double>(
              valueListenable: _notifierScroll,
              builder: (context, value, _) {
                return PageView.builder(
                  itemCount: bookBrainW.count,
                  controller: _controller,
                  itemBuilder: (context, index) {
                    final book = bookBrainW.books[index];
                    final percentage = index - value;
                    final rotation = percentage.clamp(0.0, 1.0);
                    final fixRotation = pow(rotation, 0.5);

                    if (index == 1) {
                      // print(percentage);
                    }
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Stack(
                              children: [
                                Container(
                                  height: bookHeight,
                                  width: bookWidth,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 20.0,
                                        offset: Offset(5.0, 5.0),
                                        spreadRadius: 10,
                                      )
                                    ],
                                  ),
                                ),
                                Transform(
                                  alignment: Alignment.centerLeft,
                                  transform: Matrix4.identity()
                                    ..setEntry(3, 2, 0.002)
                                    ..rotateY(1.8 * fixRotation)
                                    ..translate(-rotation * size.width * 0.8)
                                    ..scale(1 + rotation),
                                  child: Hero(
                                    tag: book.title.toString(),
                                    flightShuttleBuilder: (
                                      flightContext,
                                      animation,
                                      flightDirection,
                                      fromHeroContext,
                                      toHeroContext,
                                    ) {
                                      // final toHero = toHeroContext.widget;
                                      // return Transform(
                                      //   alignment: Alignment.centerLeft,
                                      //   transform: Matrix4.identity()
                                      //     ..setEntry(3, 2, 0.002)
                                      //     ..rotateY(1.8 * fixRotation)
                                      //     ..translate(
                                      //         -rotation * size.width * 0.8)
                                      //     ..scale(1 + rotation),
                                      //   child: toHero,
                                      // );
                                      // final toHero = toHeroContext.widget;
                                      // const begin = Offset(0.0, 1.0);
                                      // const end = Offset.zero;
                                      // const curve = Curves.ease;

                                      // var tween = Tween(begin: begin, end: end)
                                      //     .chain(CurveTween(curve: curve));

                                      // return SlideTransition(
                                      //   position: animation.drive(tween),
                                      //   child: toHero,
                                      // );
                                      // final toHero = toHeroContext.widget;
                                      // return FadeTransition(
                                      //   opacity: animation.drive(
                                      //     Tween<double>(begin: 0.0, end: 1.0)
                                      //         .chain(
                                      //       CurveTween(
                                      //         curve: Interval(0.0, 1.0,
                                      //             curve:
                                      //                 ValleyQuadraticCurve()),
                                      //       ),
                                      //     ),
                                      //   ),
                                      //   child: toHero,
                                      // );
                                      // final toHero = toHeroContext.widget;
                                      // return FlipcardTransition(
                                      //   flipAnim: animation,
                                      //   child: toHero,
                                      // );
                                      // final toHero = toHeroContext.widget;
                                      // return RotationTransition(
                                      //   turns: animation,
                                      //   child: toHero,
                                      // );
                                      final toHero = toHeroContext.widget;
                                      return ScaleTransition(
                                          scale: animation.drive(
                                            Tween<double>(begin: 0.0, end: 1.0)
                                                .chain(
                                              CurveTween(
                                                curve: Interval(0.0, 0.1,
                                                    curve:
                                                        PeakQuadraticCurve()),
                                              ),
                                            ),
                                          ),
                                          child: flightDirection ==
                                                  HeroFlightDirection.push
                                              ? RotationTransition(
                                                  turns: animation,
                                                  child: toHero,
                                                )
                                              : RotationTransition(
                                                  turns: animation,
                                                  child: toHero,
                                                )
                                          // FadeTransition(
                                          //     opacity: animation.drive(
                                          //       Tween<double>(
                                          //               begin: 0.0, end: 1.0)
                                          //           .chain(
                                          //         CurveTween(
                                          //           curve: Interval(0.0, 1.0,
                                          //               curve:
                                          //                   ValleyQuadraticCurve()),
                                          //         ),
                                          //       ),
                                          //     ),
                                          //     child: toHero,
                                          //   ),
                                          );
                                    },
                                    // createRectTween: _createRectTween,
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
                          ),
                          Center(
                            child: Opacity(
                              opacity: 1 - rotation,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 90.0,
                                  ),
                                  Text(
                                    '${book.title}',
                                    style: TextStyle(
                                      fontSize: 30.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    'By ${book.author}',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      bookBrainR.position(index);
                                      Navigator.pushNamed(
                                          context, DetailBookScreen.id);
                                    },
                                    icon: Icon(Icons.open_in_browser),
                                    label: Text(
                                      'Open Book',
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.black26,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              })
        ],
      ),
    );
  }
}
