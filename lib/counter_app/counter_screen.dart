import 'package:bloc_practice/counter_app/counter_bloc.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  CounterBloc counterBloc = CounterBloc();
  @override
  void dispose() {
    counterBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('this widget build');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Jesus Teaching Bloc"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Current Count Is:',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            StreamBuilder<int>(
                stream: counterBloc.couterStateStream,
                initialData: 0,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      '${snapshot.data}',
                      style: Theme.of(context).textTheme.headlineLarge,
                    );
                  }
                  if (snapshot.hasError) {
                    return Text('Error ${snapshot.error}');
                  }
                  return const Text(
                      "Jesus Does not bring me this far to leave. What He has started He is going to finish.");
                }),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterBloc.couterEventSink.add(CouterEvent.decrement);
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              counterBloc.couterEventSink.add(CouterEvent.reset);
            },
            tooltip: 'Reset',
            child: const Icon(Icons.loop),
          ),
          FloatingActionButton(
            onPressed: () {
              counterBloc.couterEventSink.add(CouterEvent.increment);
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
