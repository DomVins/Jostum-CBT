import 'package:flutter/material.dart';
import 'package:jostum_cbt/quiz_land.dart';

class CourseQuizPage extends StatefulWidget {
  final String course;
  final String courseT;
  const CourseQuizPage({Key? key, required this.course, required this.courseT})
      : super(key: key);

  @override
  State<CourseQuizPage> createState() => _CourseQuizPageState();
}

class _CourseQuizPageState extends State<CourseQuizPage> {
  String dropdownvalue = '10';

  double timeA = 5;

  var items = ['10', '15', '20', '25'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildCourseQuiz(context),
    );
  }

  _buildCourseQuiz(BuildContext ctx) => SingleChildScrollView(
        child: Center(
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
              Center(
                child: Container(
                  width: MediaQuery.of(ctx).size.width - 50,
                  height: MediaQuery.of(ctx).size.height / 2.0,
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
                        top: 25, left: 20, bottom: 30, right: 28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.courseT,
                            style: const TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2)),
                        const SizedBox(
                          height: 18,
                        ),
                        const Text('CBT practice',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.4)),
                        const SizedBox(height: 10),
                        Row(children: [
                          const Text(
                              'Select number of questions \nyou want to answer: ',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  letterSpacing: 1.2)),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                              padding: const EdgeInsets.all(5),
                              height: 30,
                              width: 50,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0xff0f17ad),
                                        blurRadius: 18,
                                        offset: Offset(6, 6))
                                  ]),
                              child: DropdownButton(
                                  underline: Container(),
                                  value: dropdownvalue,
                                  icon: const Icon(Icons.arrow_drop_down_sharp),
                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                      child: Text(
                                        items,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      value: items,
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownvalue = newValue!;
                                      timeA = double.parse(newValue) / 2;
                                    });
                                  })),
                        ]),
                        Expanded(child: Container()),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Time allowed: $timeA minutes ',
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    letterSpacing: 1.2)),
                            Expanded(child: Container()),
                            Container(
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xff0f17ad),
                                      blurRadius: 25,
                                      offset: Offset(2, 18))
                                ],
                              ),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        ctx,
                                        MaterialPageRoute(
                                            builder: (ctx) => Quiz(
                                                  course: widget.course,
                                                  courseT: widget.courseT,
                                                  timeAllowed: timeA,
                                                )));
                                  },
                                  icon: const Icon(
                                    Icons.play_circle,
                                    color: Colors.white,
                                    size: 55,
                                  )),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
