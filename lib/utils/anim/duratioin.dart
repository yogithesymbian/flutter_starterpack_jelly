import 'package:flutter/scheduler.dart';

Duration get duration00Sec => Duration(milliseconds: timeDilation.ceil() * 300);
Duration get duration0Sec => Duration(milliseconds: timeDilation.ceil() * 600);
Duration get duration1Sec => Duration(milliseconds: timeDilation.ceil() * 1250);
Duration get duration2Sec => Duration(milliseconds: timeDilation.ceil() * 2250);
Duration get duration3Sec => Duration(milliseconds: timeDilation.ceil() * 3000);
Duration get duration4Sec => Duration(milliseconds: timeDilation.ceil() * 4000);
