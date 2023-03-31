// 4(c)
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginuicolors/page/home.dart';
// import 'package:loginuicolors/page/story_telling/storytelling2.dart';
import 'package:loginuicolors/page/ui/comingsoon.dart';
import 'package:loginuicolors/page/vocogyan/tech/quizDsa.dart';

class DSA extends StatefulWidget {
  const DSA({Key? key}) : super(key: key);

  @override
  _DSA createState() => _DSA();
}

class _DSA extends State<DSA> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
        key: scaffoldKey,
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
                      ));
                },
              ),
              title: Text(
                "Technical Words ",
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
            )),
        body: SingleChildScrollView(

            // controller: controller,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
              Container(
                // width: mediaQuery.size.width * 1,
                // height: mediaQuery.size.height * 0.39,
                // color: Colors.black,
                child: Column(children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        CustomizedButton(
                          mediaQuery: mediaQuery,
                          title: "Ep. 1 - Linked List",
                          onpressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => new DsaQuiz()));
                          },
                        ),
                        CustomizedButton(
                          mediaQuery: mediaQuery,
                          title: "Ep. 1 -c",
                          onpressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => new comingsoon()));
                          },
                        ),
                      ]),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        CustomizedButton(
                          mediaQuery: mediaQuery,
                          title: "Ep. 3 - c++",
                          onpressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => new comingsoon()));
                          },
                        ),
                        CustomizedButton(
                          mediaQuery: mediaQuery,
                          title: "Ep. 4 - C#",
                          onpressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => new comingsoon()));
                          },
                        ),
                      ]),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        CustomizedButton(
                          mediaQuery: mediaQuery,
                          title: "Ep. 5 - Java",
                          onpressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => new comingsoon()));
                          },
                        ),
                        CustomizedButton(
                          mediaQuery: mediaQuery,
                          title: "Ep. 6 - Python",
                          onpressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => new comingsoon()));
                          },
                        ),
                      ]),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        CustomizedButton(
                          mediaQuery: mediaQuery,
                          title: "Ep. 1 -Ruby",
                          onpressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => new comingsoon()));
                          },
                        ),
                        CustomizedButton(
                          mediaQuery: mediaQuery,
                          title: "Ep. 8 - Fluent",
                          onpressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => new comingsoon()));
                          },
                        ),
                      ]),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        CustomizedButton(
                          mediaQuery: mediaQuery,
                          title: "Ep. 9 - Go",
                          onpressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => new comingsoon()));
                          },
                        ),
                        CustomizedButton(
                          mediaQuery: mediaQuery,
                          title: "Ep. 10 - Dart",
                          onpressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => new comingsoon()));
                          },
                        ),
                      ]),
                ]),
              ),

              //add text

              Container(
                width: mediaQuery.size.width * 1,
                height: mediaQuery.size.height * 0.04,
                // color: Color.fromARGB(255, 22, 204, 43),
                // color: Colors.black,
              ),
            ])));
  }
}

class CustomizedButton extends StatelessWidget {
  const CustomizedButton({
    Key? key,
    required this.mediaQuery,
    required this.title,
    required this.onpressed,
  }) : super(key: key);

  final MediaQueryData mediaQuery;
  final String title;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mediaQuery.size.width * 0.48,
      height: mediaQuery.size.height * 0.42,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(248, 212, 255, 251),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        onPressed: onpressed,
        child: Text(title,
            textAlign: TextAlign.center,
            style: GoogleFonts.lora(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              fontSize: mediaQuery.size.width * 0.05,
            )),
      ),
    );
  }
}
