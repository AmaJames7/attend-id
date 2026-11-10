// import 'dart:async';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// // Change the Notifier state to DateTime
// class TimestampIntervalNotifier extends Notifier<int> {
//   Timer? _timer;

//   @override
//   int build() {
//     // Safely cancel the timer when the provider is destroyed
//     ref.onDispose(() => _timer?.cancel());
//     final int expiry = DateTime.now().millisecondsSinceEpoch ~/ 1000;
//     return expiry; // Initial state timestamp
//   }

//   void startIntervalTask() {
//     _timer?.cancel(); // Clear existing timers

//     _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
//       // 1. Generate the new timestamp
//       final newTimestamp = DateTime.now();
//       final int expiry = DateTime.now().millisecondsSinceEpoch ~/ 1000;

//       // 2. Update the state (this alerts all listeners)
//       state = expiry;

//       // 3. Execute your logic using the current state timestamp
//       // _executeYourCode(expiry);
//     });
//   }

//   // void _executeYourCode(int timestamp) {
//   //   print("Function executed at timestamp: $timestamp");
//   // }

//   void stopIntervalTask() {
//     _timer?.cancel();
//   }
// }

// // Global provider declaration
// final timestampIntervalProvider =
//     NotifierProvider<TimestampIntervalNotifier, int>(() {
//       return TimestampIntervalNotifier();
//     });

import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimestampIntervalNotifier extends Notifier<int> {
  Timer? _timer;

  @override
  int build() {
    // 1. Safely cancel the timer when the provider is destroyed
    ref.onDispose(() => _timer?.cancel());

    // 2. Auto-start the timer logic using the separate function
    _initTimer();

    // 3. Return the initial state timestamp (in seconds)
    return DateTime.now().millisecondsSinceEpoch ~/ 1000;
  }

  // Extracted timer logic into a fresh function
  void _initTimer() {
    _timer?.cancel(); // Clear existing timers to prevent duplicates

    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      // 1. Generate the new timestamp in seconds
      final int expiry = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      // 2. Update the state (this alerts all listeners)
      state = expiry;
    });
  }

  void stopIntervalTask() {
    _timer?.cancel();
  }
}

// Global provider declaration
final timestampIntervalProvider =
    NotifierProvider<TimestampIntervalNotifier, int>(() {
      return TimestampIntervalNotifier();
    });
