import 'package:flutter_starterpack_jelly/models/midtrans/midtrans_brain.dart';
import 'package:flutter_starterpack_jelly/models/scores/score_brain.dart';
import 'package:flutter_starterpack_jelly/screens/yogithesymbian/ui/book/book_brain.dart';
import 'package:provider/provider.dart';

final providers = [
  ChangeNotifierProvider<MidtransBrain>(
    create: (context) => MidtransBrain(),
    lazy: false,
  ),
  ChangeNotifierProvider<ScoreBrain>(
    create: (context) => ScoreBrain(),
    lazy: false,
  ),
  ChangeNotifierProvider<BookBrain>(
    create: (context) => BookBrain(),
    lazy: false,
  )
];
