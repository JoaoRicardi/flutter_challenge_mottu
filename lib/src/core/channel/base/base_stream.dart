import 'dart:async';

abstract class BaseStream<T>{
  late StreamController<T> controller;

  late StreamSubscription _subscription;

  late bool _alreadyInit;

  late Stream stream;

  listenTo();
  reset();
}