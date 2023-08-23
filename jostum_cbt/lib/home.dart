import 'package:flutter/material.dart';
import 'package:jostum_cbt/course_quiz.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class Course {
  final String imageName;
  final String title;
  final String code;

  Course(this.imageName, this.title, this.code);
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int current = 0;

  List<String> levelS = [
    '100 level',
    '200 level',
    '300 level',
    '400 level',
    '500 level'
  ];

  final List<Course> courses = [
    Course('maths.jfif', 'Fundamentals of Mathematics', 'MTH 111'),
    Course('phy.jfif', 'Mechanics, properties of Heat and Matter', 'PHY 111'),
    Course('efe-kurnaz.jpg', 'Communication in English', 'GST 111'),
    Course('chem.jfif', 'Introduction to Chemistry', 'CHM 111'),
    Course('rodion-kutsaev.jpeg', 'Nigeria Peoples Culture', 'GST 113'),
    Course('sci.jfif', 'History and Philosophy of Science', 'GST 115'),
    Course('cmp.jfif', 'Introduction to  Computer Science', 'CMP 111'),
    Course('phy.jfif', 'Practical Physics', 'PHY 191'),
    Course('chem.jfif', 'Practical Chemistry', 'CHM 151'),
    Course('stat.jfif', 'Statistics', 'STA 111'),
  ];

  final List<Course> courses1 = [
    Course('stat.jfif', 'Applied Calculus', 'MTH 122'),
    Course('sci.jfif', 'Electricity and Magnetism', 'PHY 142'),
    Course('cmp.jfif', 'Communication in English II', 'GST 116'),
    Course('chem.jfif', 'Physical Chemistry', 'CHM 122'),
    Course('rodion-kutsaev.jpeg', 'Philosophy and human eistence', 'GST 112'),
    Course('phy.jfif', 'Waves and Optics', 'PHY 132'),
    Course('cmp.jfif', 'Organic Chemistry', 'CHM 132'),
    Course('phy.jfif', 'Practical Physics II', 'PHY 192'),
    Course('chem.jfif', 'Practical Chemistry II', 'CHM 152'),
    Course('maths.jfif', 'Use of Library', 'GST 114'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      body: _buildHome(),
    );
  }

  _buildHome() => Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                        const NavDrawer();
                      },
                      child: const Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Text("JOSTUM CBT",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                          letterSpacing: 1,
                          color: Colors.black)),
                  const SizedBox(width: 50, height: 50),
                ],
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10, bottom: 10),
                        child: const Text("NiMechE",
                            style: TextStyle(
                                fontSize: 20,
                                letterSpacing: 2.5,
                                color: Color(0xFFc7c0b2),
                                shadows: [
                                  Shadow(
                                    color: Colors.black26,
                                    blurRadius: 5,
                                    offset: Offset(2.0, 0.0),
                                  ),
                                ])),
                      ),
                      Container(
                        height: 35,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: Color(0xff0f17ad),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25),
                                bottomRight: Radius.circular(25))),
                        child: const Text(
                          "100 Level CBT Practice",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Text(
                          "First semester courses",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                      _buildQuizContainers(courses),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Text(
                          "Second semester courses",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                      _buildQuizContainers(courses1),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 80,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xff0f17ad), Color(0xFF6985e8)],
                                begin: Alignment.bottomLeft,
                                end: Alignment.centerRight),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 13, left: 25),
                              child: const Text(
                                "Resources for other levels",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.5,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(child: Container()),
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 9, bottom: 7),
                                  height: 35,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xff0f17ad),
                                          blurRadius: 25,
                                          offset: Offset(0.2, 0.2))
                                    ],
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "200L",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14.5,
                                          letterSpacing: 1.1),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 15, top: 9, bottom: 7),
                                  height: 35,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xff0f17ad),
                                          blurRadius: 25,
                                          offset: Offset(0.5, 0.5))
                                    ],
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "300L",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14.5,
                                          letterSpacing: 1.1),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 15, top: 9, bottom: 7),
                                  height: 35,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xff0f17ad),
                                          blurRadius: 23,
                                          offset: Offset(0.5, 0.5))
                                    ],
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "400L",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14.5,
                                          letterSpacing: 1.1),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 15, top: 9, bottom: 7),
                                  height: 35,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xff0f17ad),
                                          blurRadius: 23,
                                          offset: Offset(0.5, 0.5))
                                    ],
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "500L",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14.5,
                                          letterSpacing: 1.1),
                                    ),
                                  ),
                                ),
                                Expanded(child: Container())
                              ],
                            )
                          ],
                        ),
                      )
                    ]),
              ),
            )
          ]);

  _buildQuizContainers(List<Course> crs) => Container(
        margin: const EdgeInsets.only(top: 15),
        child: SizedBox(
          height: 150,
          width: MediaQuery.of(context).size.width,
          child: ListView(
              padding: const EdgeInsets.only(left: 40),
              scrollDirection: Axis.horizontal,
              children: getQuizCards(crs)),
        ),
      );
  List<Widget> getQuizCards(List<Course> crs) {
    List<Widget> courseCards = [];
    for (int i = 0; i < crs.length; i++) {
      courseCards
          .add(getCourseCard(crs[i].title, crs[i].imageName, crs[i].code));
    }
    return courseCards;
  }

  Widget getCourseCard(String title, String image, String code) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CourseQuizPage(
                      course: code,
                      courseT: title,
                    )));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 20, bottom: 15),
        width: 110,
        height: 200,
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2.0,
          ),
        ], borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(children: [
          ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image(
                  image: AssetImage('assets/$image'),
                  height: 90,
                  width: 110,
                  fit: BoxFit.fill)),
          Container(
              padding: const EdgeInsets.only(left: 8, right: 8),
              height: 45,
              width: 110,
              decoration: const BoxDecoration(
                  //color: Color(0xff0f17ad),
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(15))),
              child: Center(
                child: Text(title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w700)),
              ))
        ]),
      ),
    );
  }
}

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: Text(
              '',
              style: TextStyle(
                color: Color(0xff0f17ad),
                fontSize: 25,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.3,
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xff0f17ad),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.question_answer_rounded),
            title: const Text('About App'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.border_color),
            title: const Text('Feedback and Suggestions'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Exit'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
