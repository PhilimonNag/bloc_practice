import 'dart:async';

enum CouterEvent { increment, decrement, reset }

class CounterBloc {
  late int _counter;
  final _stateStreamController = StreamController<int>();
  StreamSink<int> get counterStateSink => _stateStreamController.sink;
  Stream<int> get couterStateStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<CouterEvent>();
  StreamSink get couterEventSink => _eventStreamController.sink;
  Stream get counterEventStream => _eventStreamController.stream;

  CounterBloc() {
    _counter = 0;
    counterEventStream.listen((event) {
      switch (event) {
        case CouterEvent.increment:
          _counter++;
          counterStateSink.add(_counter);
          break;
        case CouterEvent.decrement:
          if (_counter > 0) _counter--;
          counterStateSink.add(_counter);
          break;
        case CouterEvent.reset:
          _counter = 0;
          counterStateSink.add(_counter);
          break;
        default:
      }
    });
  }
}
