import 'package:flutter/foundation.dart';
import 'package:halo/halo.dart';

void main() {
  EventDistributor eventDistributor = EventDistributor(const Duration(milliseconds: 1000));

  for (int i = 0; i < 100; i++) {
    eventDistributor.addEvent(() {
      if (kDebugMode) print('event $i');
    });
  }
}
