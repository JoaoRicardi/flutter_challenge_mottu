import 'dart:async';

abstract class BaseStream<T> {
  listenTo();
  reset();

  StreamSubscription? subscription;
  Stream<T> getStream();
}
