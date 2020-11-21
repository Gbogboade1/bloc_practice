import 'package:e_report/bloc/simplecalculator_bloc.dart';
import 'package:e_report/data.dart';
import 'package:e_report/functions.dart';
import 'package:e_report/result_processor.dart';
import 'package:e_report/spaces.dart';
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
        appBar: AppBar(
          backgroundColor: Colors.transparent.withOpacity(0),
          elevation: 0,
          title: Text(
            "BLOC Calculator",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: BlocBuilder<SimplecalculatorBloc, SimplecalculatorState>(
          builder: (context, state) {
            List<String> data =
                (state as CurrentCalculatorState).calculatorData;
            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  verticalSpace(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.center,
                        spacing: 8,
                        children: List.generate(
                          data.length,
                          (index) => Text(
                            data[index],
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Text(
                        "${calcResult((state as CurrentCalculatorState).calculatorData.toList())}",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 29,
                        ),
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
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
                                  border: Border.all(
                                      color: Colors.black, width: .1),
                                ),
                                child: Center(
                                  child: Text(
                                    "${item.boxValue}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ),
                      );
                    },
                  )
                ],
              ),
            );
          },
        ));
  }
}
