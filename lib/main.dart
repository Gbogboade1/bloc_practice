import 'package:e_report/bloc/math_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MathBloc(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'Flutter Demo Home Page')),
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
  MathBloc bloc;
  @override
  void dispose() {
    super.dispose();

    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<MathBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<MathBloc, double>(
        builder: (context, double state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Simple calculator.....$state"
                    // "You have clicked ${(state as LatestCounterState).newCounterValue} Times",
                    ),
                SizedBox(height: 64),
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text("Increment counter"),
                  onPressed: () {
                    bloc.add(MathEvent.add);
                    // _counterBlocSink.add(IncreaseCounterEvent());
                  },
                ),
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.red,
                  child: Text("Decrement counter"),
                  onPressed: () {
                    bloc.add(MathEvent.subtract);

                    // _counterBlocSink.add(DecreaseCounterEvent());
                  },
                ),
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.black,
                  child: Text("Double counter"),
                  onPressed: () {
                    bloc.add(MathEvent.by2);

                    // _counterBlocSink.add(DoubleCounterEvent());
                  },
                ),
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  child: Text("Half counter"),
                  onPressed: () {
                    bloc.add(MathEvent.half);

                    // _counterBlocSink.add(SquareCounterEvent());
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
