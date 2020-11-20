import 'package:e_report/bloc/simplecalculator_bloc.dart';
import 'package:e_report/data.dart';
import 'package:e_report/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  SimplecalculatorBloc bloc;

  @override
  void dispose() {
    super.dispose();

    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<SimplecalculatorBloc>(context);
    return Scaffold(
        body: BlocBuilder<SimplecalculatorBloc, SimplecalculatorState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "${(state as CurrentCalculatorState).calculatorData}",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "${(state as CurrentCalculatorState).result}",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            GridView.builder(
              itemCount: calcList.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 2 / 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                CalcItem item = calcList[index];
                return InkWell(
                  onTap: () {
                    if ("${item.boxValue}" == "." &&
                        getType((state as CurrentCalculatorState)
                                .calculatorData
                                .last) ==
                            CharType.numberDouble) {
                      return;
                    }
                    bloc.add(item.event);
                  },
                  child: index % 5 < 3
                      ? Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.grey.shade50,
                                Colors.grey.shade200,
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "${item.boxValue}",
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.grey.shade50,
                                Colors.grey.shade200,
                              ],
                            ),
                            border: Border.all(color: Colors.black, width: .1),
                          ),
                          child: Center(
                            child: Text(
                              "${item.boxValue}",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                );
              },
            )
          ],
        );
      },
    ));
  }
}
