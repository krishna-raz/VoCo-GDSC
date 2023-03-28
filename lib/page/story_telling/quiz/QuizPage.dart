import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginuicolors/page/home.dart';
import 'package:loginuicolors/page/story_telling/quiz/quizbrain.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quizbrain.getquestiontext(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  checkanswers(true);
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  checkanswers(false);
                },
              ),
            ),
          ),
          Row(children: scorekeeper),
        ],
      ),
    );
  }
}
