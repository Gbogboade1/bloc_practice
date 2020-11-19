import 'package:e_report/events.dart';
import 'package:e_report/logic.dart';
import 'package:e_report/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<CounterBloc>(
        create: (context) =>
            CounterBloc(initialState: LatestCounterState(newCounterValue: 0)),
        child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CounterBloc _counterBlocSink;

  @override
  void dispose() {
    super.dispose();

    //Close the Stream Sink when the widget is disposed
    _counterBlocSink?.close();
  }

  @override
  Widget build(BuildContext context) {
    _counterBlocSink = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<CounterBloc, CounterBlocState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "You have clicked ${(state as LatestCounterState).newCounterValue} Times",
                ),
                SizedBox(height: 64),
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text("Increment counter"),
                  onPressed: () {
                    _counterBlocSink.add(IncreaseCounterEvent());
                  },
                ),
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.red,
                  child: Text("Decrement counter"),
                  onPressed: () {
                    _counterBlocSink.add(DecreaseCounterEvent());
                  },
                ),
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.black,
                  child: Text("Double counter"),
                  onPressed: () {
                    _counterBlocSink.add(DoubleCounterEvent());
                  },
                ),
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  child: Text("Square counter"),
                  onPressed: () {
                    _counterBlocSink.add(SquareCounterEvent());
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
