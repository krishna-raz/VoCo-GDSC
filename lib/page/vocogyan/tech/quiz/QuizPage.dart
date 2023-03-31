import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginuicolors/page/home.dart';
import 'package:loginuicolors/page/vocogyan/tech/quiz/quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scorekeeper = [
    //to check the score
  ];
  void checkanswers(bool userpickedanswer) {
    bool correctanswer = quizbrain.getanswer();

    setState(() {
      // for reset the ques
      if (quizbrain.isfinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();
        quizbrain.reset();
        scorekeeper = [];
      } else if (userpickedanswer == correctanswer) {
        scorekeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        print('user got a wrong answer');
        scorekeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }

      quizbrain.checknextquestion();
    });
  }

//object of quiz brain
  Brainquiz quizbrain = Brainquiz();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0), // here the desired height
          child: AppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return TextButton(
                  onPressed: () async {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: Text(
                    'Home',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
            title: Text(
              " Story Telling",
              style: GoogleFonts.lora(
                  fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () async {
                    Navigator.of(context).pop(true);
                  },
                  child: Text(
                    'Back',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
        //add background image
        body: SafeArea(
            child: Container(
          width: mediaQuery.size.width * 1,
          height: mediaQuery.size.height * 1,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/register.png'), fit: BoxFit.cover),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: mediaQuery.size.width * 1,
                  height: mediaQuery.size.height * 0.02,
                ),
                Container(
                  width: mediaQuery.size.width * 1,
                  height: mediaQuery.size.height * 0.6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/storytelling.png'),
                        fit: BoxFit.fill),
                  ),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: mediaQuery.size.width * 0.6,
                          height: mediaQuery.size.height * 0.02,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: mediaQuery.size.width * 0.6,
                          height: mediaQuery.size.height * 0.07,
                          // color: Colors.black

                          // color: Colors.white,
                          //add text in center
                          child: Center(
                            child: Text(
                              "Linked List",
                              style: GoogleFonts.lora(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  fontSize: mediaQuery.size.width * 0.05),
                              // color: Colors.black),
                            ),
                          ),
                          // color: Color.fromARGB(255, 14, 11, 11),
                        )
                      ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                              child: Column(children: [
                            // Container(
                            //   width: mediaQuery.size.width * 0.88,
                            //   height: mediaQuery.size.height * 0.3,
                            //   //add text
                            // ),
                            //add button
                            Container(
                              width: mediaQuery.size.width * 0.88,
                              height: mediaQuery.size.height * 0.35,
                              child: Center(
                                child: Container(
                                  width: mediaQuery.size.width * 0.84,
                                  height: mediaQuery.size.height * 0.38,
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Center(
                                      child: Text(
                                        quizbrain.getquestiontext(),
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.lora(
                                          fontSize: mediaQuery.size.height *
                                              0.03, // 0.03
                                          color: Color.fromARGB(255, 0, 0, 255),
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              width: mediaQuery.size.width * 1,
                              height: mediaQuery.size.height * 0.03,
                            ),
                            Container(
                                width: mediaQuery.size.width * 1,
                                height: mediaQuery.size.height * 0.05,
                                color: Colors.amber,
                                child: Text(
                                  " play a story quiz",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lora(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: mediaQuery.size.height * 0.03,
                                  ),
                                )),
                          ])),
                        ]),
                  ]),
                ),
                // SizedBox(
                //   width: mediaQuery.size.width * 1,
                //   height: mediaQuery.size.height * 0.02,
                // ),
                Container(
                  child: Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                              width: mediaQuery.size.width * 0.48,
                              height: mediaQuery.size.height * 0.25,
                              // color: Color.fromARGB(255, 252, 65, 65),
                              child: SizedBox(
                                  child: ElevatedButton(
                                      onPressed: () {
                                        checkanswers(true);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(248, 212, 255, 251),
                                      ),
                                      child: Text(
                                        "True",
                                        style: GoogleFonts.lora(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 50,
                                        ),
                                      )))),
                          Container(
                              width: mediaQuery.size.width * 0.48,
                              height: mediaQuery.size.height * 0.25,
                              child: SizedBox(
                                  child: ElevatedButton(
                                      onPressed: () {
                                        checkanswers(false);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(248, 212, 255, 251),
                                      ),
                                      child: Text(
                                        "False",
                                        style: GoogleFonts.lora(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 50,
                                        ),
                                      )))),
                        ]),
                  ]),
                ),
              ]),
        )));
  }
}





//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
        
//         children: <Widget>[
          
//           Expanded(
//             flex: 5,
//             child: Padding(
//               padding: EdgeInsets.all(10.0),
//               child: Center(
//                 child: Text(
//                   quizbrain.getquestiontext(),
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 25.0,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.all(15.0),
//               child: TextButton(
//                 style: TextButton.styleFrom(
//                   backgroundColor: Colors.green,
//                 ),
//                 child: Text(
//                   'True',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20.0,
//                   ),
//                 ),
//                 onPressed: () {
//                   checkanswers(true);
//                 },
//               ),
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.all(15.0),
//               child: TextButton(
//                 style: TextButton.styleFrom(
//                   backgroundColor: Colors.green,
//                 ),
//                 child: Text(
//                   'False',
//                   style: TextStyle(
//                     fontSize: 20.0,
//                     color: Colors.white,
//                   ),
//                 ),
//                 onPressed: () {
//                   checkanswers(false);
//                 },
//               ),
//             ),
//           ),
//           Row(children: scorekeeper),
//         ],
//       ),
//     );
//   }
// }
