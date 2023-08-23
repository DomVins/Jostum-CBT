import 'package:flutter/material.dart';
import 'dart:async';

class Quiz extends StatefulWidget {
  final String course;
  final String courseT;
  final double timeAllowed;

  const Quiz(
      {Key? key,
      required this.course,
      required this.courseT,
      required this.timeAllowed})
      : super(key: key);
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final interval = const Duration(seconds: 1);
  int timerMaxSeconds = 0;

  int currentSeconds = 0;

  var c;

  startTimeout([int? milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) timer.cancel();
      });
    });
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    timerMaxSeconds = widget.timeAllowed.toInt() * 60;
    return Scaffold(
      body: _buildQuiz(context, timerMaxSeconds, currentSeconds),
    );
  }

  _buildQuiz(BuildContext ctx, int timerMaxSeconds, currentSeconds) => Center(
        child: Column(
          children: [
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(ctx);
                      },
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(widget.course,
                      style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                          letterSpacing: 1,
                          color: Colors.black)),
                  const SizedBox(width: 50, height: 50),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 35, left: 35),
              child: Row(
                children: [
                  const Text(
                    '1 of 10',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                  Expanded(child: Container()),
                  const Icon(
                    Icons.timer,
                    color: Colors.green,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.green,
                        fontSize: 16),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Container(
                width: MediaQuery.of(ctx).size.width - 50,
                height: MediaQuery.of(ctx).size.height / 1.5,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xff0f17ad), Color(0xFF6985e8)],
                        begin: Alignment.bottomLeft,
                        end: Alignment.centerRight),
                    borderRadius: BorderRadius.all(Radius.circular(23)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 19,
                          offset: Offset(4, 8))
                    ]),
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 25, left: 20, bottom: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Question 1: ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.4)),
                      const SizedBox(height: 10),
                      const Text(
                          'What is you name. Answer to yourself out loud. ',
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              letterSpacing: 1.2)),
                      const SizedBox(
                        width: 10,
                      ),
                      ListTile(
                        horizontalTitleGap: 1.0,
                        title: const Text('A. People',
                            style: TextStyle(color: Colors.white)),
                        leading: Radio(
                            value: 'A',
                            groupValue: c,
                            onChanged: (value) {setState(() {
                              c = value;
                            });}
                      ),
                      ListTile(
                        horizontalTitleGap: 1.0,
                        title: const Text('B. Person',
                            style: TextStyle(color: Colors.white)),
                        leading: Radio(
                            value: 'B',
                            groupValue: c,
                            onChanged: (value) => c = value),
                      ),
                      ListTile(
                        horizontalTitleGap: 1.0,
                        title: const Text('C. Man',
                            style: TextStyle(color: Colors.white)),
                        leading: Radio(
                            value: 'C',
                            groupValue: c,
                            onChanged: (value) => c = value),
                      ),
                      ListTile(
                        horizontalTitleGap: 1.0,
                        title: const Text('D. Man',
                            style: TextStyle(color: Colors.white)),
                        leading: Radio(
                            value: 'D',
                            groupValue: c,
                            onChanged: (value) => c = value),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(child: Container()),
                Container(
                    height: 40,
                    width: 65,
                    decoration: const BoxDecoration(
                        color: Color(0xff0f17ad),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: const Icon(Icons.arrow_back_rounded,
                        color: Colors.white)),
                const SizedBox(
                  width: 30,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  height: 40,
                  decoration: const BoxDecoration(
                      color: Color(0xff0f17ad),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: const Center(
                      child: Text(
                    'Submit',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 1.1),
                  )),
                ),
                const SizedBox(
                  width: 30,
                ),
                Container(
                    height: 40,
                    width: 65,
                    decoration: const BoxDecoration(
                        color: Color(0xff0f17ad),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: const Icon(Icons.arrow_forward_rounded,
                        color: Colors.white)),
                Expanded(child: Container()),
              ],
            )
          ],
        ),
      );
}
