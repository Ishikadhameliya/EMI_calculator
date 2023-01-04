import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EMIApp(),
    ),
  );
}

class EMIApp extends StatefulWidget {
  const EMIApp({Key? key}) : super(key: key);

  @override
  State<EMIApp> createState() => _EMIAppState();
}

class _EMIAppState extends State<EMIApp> {
  double Slidervalue = 100000;
  double SlidervalueA = 10;
  double SlidervalueB = 24;
  var P;
  var R;
  var N;
  double ANS = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EMI Calculator"),
        centerTitle: true,
        backgroundColor: const Color(0xff20295C),
        elevation: 0,
        leading: const Icon(Icons.apps),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: const BoxDecoration(
                gradient:  LinearGradient(
                  colors: [
                    Color(0xff20295C),
                    Color(0xff0F2027),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: const [
                      Text(
                        "Your Loan Emi is",
                        style:
                            TextStyle(color: Color(0xffFFFFFF), fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.currency_rupee,
                        color: Colors.white,
                        size: 50,
                      ),
                      Text(
                        "${ANS.toStringAsFixed(2)}",
                        style:
                            const TextStyle(color:  Color(0xffFFFFFF), fontSize: 50),
                      ),
                      const Text("Month",
                          style:  TextStyle(
                              color: Colors.grey, fontSize: 13, height: 4)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 1.35,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 6,
                      width: MediaQuery.of(context).size.width / 1.7,
                      child: Column(
                        children: [
                          const Text(
                            "Loan Amount",
                            style:  TextStyle(
                                color: Color(0xff484848),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Stack(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height / 17,
                                width: MediaQuery.of(context).size.width / 1.7,
                                alignment: Alignment.center,
                                child: const Text(
                                  "Loan Amount",
                                  style: TextStyle(
                                      color:  Color(0xffeeeeee),
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 17,
                                width: MediaQuery.of(context).size.width / 1.7,
                                color: Colors.transparent,
                                alignment: Alignment.center,
                                child: Text(
                                  "${Slidervalue.toInt()}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Slider(
                            value: Slidervalue,
                            min: 0,
                            max: 300000,
                            divisions: 30,
                            activeColor: Colors.lightBlueAccent.shade700,
                            thumbColor: const Color(0xff20295C),
                            onChanged: (value) {
                              setState(() {
                                Slidervalue = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 6,
                      width: MediaQuery.of(context).size.width / 1.7,
                      child: Column(
                        children: [
                          const Text(
                            "Interest Rate",
                            style: TextStyle(
                                color:  Color(0xff484848),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Stack(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height / 17,
                                width: MediaQuery.of(context).size.width / 1.7,
                                alignment: Alignment.center,
                                child: const Text(
                                  "Interest Rate",
                                  style: TextStyle(
                                      color: Color(0xffeeeeee),
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 17,
                                width: MediaQuery.of(context).size.width / 1.7,
                                color: Colors.transparent,
                                alignment: Alignment.center,
                                child: Text(
                                  "${SlidervalueA.toInt()}%",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Slider(
                            value: SlidervalueA,
                            min: 0,
                            max: 100,
                            activeColor: Colors.lightBlueAccent.shade700,
                            thumbColor: const Color(0xff20295C),
                            onChanged: (value) {
                              setState(() {
                                SlidervalueA = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 6,
                      width: MediaQuery.of(context).size.width / 1.7,
                      child: Column(
                        children: [
                          const Text(
                            "Loan Tenure",
                            style: TextStyle(
                                color: Color(0xff484848),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Stack(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height / 17,
                                width: MediaQuery.of(context).size.width / 1.7,
                                alignment: Alignment.center,
                                child: const Text(
                                  "Loan Tenure",
                                  style: TextStyle(
                                      color: Color(0xffeeeeee),
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 17,
                                width: MediaQuery.of(context).size.width / 1.7,
                                color: Colors.transparent,
                                alignment: Alignment.center,
                                child: Text(
                                  "${SlidervalueB.toInt()} Months",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Slider(
                            value: SlidervalueB,
                            min: 0,
                            max: 100,
                            activeColor: Colors.lightBlueAccent.shade700,
                            thumbColor: const Color(0xff20295C),
                            onChanged: (value) {
                              setState(() {
                                SlidervalueB = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              P = Slidervalue;
                              R = SlidervalueA;
                              N = SlidervalueB;
                              R = R / 12 / 100;
                              ANS = (P *
                                      R *
                                      pow((1 + R), N) ~/
                                      ((pow(1 + R, N)) - 1))
                                  .toDouble();
                            });
                          },
                          onDoubleTap: () {
                            setState(() {
                              ANS = 0;
                              Slidervalue = 100000;
                              SlidervalueA = 10;
                              SlidervalueB = 24;
                            });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height / 17,
                            width: MediaQuery.of(context).size.width / 2.5,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xffE7EAFF),
                              border: Border.all(
                                  color: const Color(0xff20295C), width: 0),
                            ),
                            child: const Text(
                              "Calculate",
                              style: TextStyle(
                                  color: Color(0xff2C3568),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: const Color(0xff0F2027),
    );
  }
}
