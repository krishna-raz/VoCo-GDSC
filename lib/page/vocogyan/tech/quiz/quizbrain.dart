import 'package:loginuicolors/page/vocogyan/tech/quiz/question.dart';

class Brainquiz {
  int _questionno = 0;
  List<Question> _quesbank = [
    //_make the data pvt
    Question(
        q: 'Linked lists are a type of data structure used in computer science.',
        a: true),
    Question(
        q: 'Each element in a linked list points to the next element in the sequence.',
        a: true),
    Question(
        q: 'Linked lists can only be traversed in one direction', a: false),
    Question(
        q: 'Linked lists are not commonly used in programming because they are slow.',
        a: false),
    Question(
        q: 'Adding an element to the end of a linked list can be done in constant time.',
        a: false),
    Question(
        q: 'Deleting an element from the middle of a linked list requires shifting all subsequent elements.',
        a: false),
    Question(
        q: 'The first element in a linked list is called the head.', a: true),
    Question(
        q: 'A singly-linked list has two references for each node, one to the previous node and one to the next node.',
        a: false),
    Question(q: 'A circular linked list has no beginning or end.', a: true),
    Question(q: 'Google was originally called \"Backrub\".', a: true),
    Question(
        q: 'Linked lists allow for efficient insertion and deletion of elements at any position in the list..',
        a: true),
    Question(
        q: 'Linked lists are not commonly used in programming because they are slow.',
        a: false),
  ];

  void checknextquestion() {
    if (_questionno < _quesbank.length - 1) {
      _questionno++;

      print(_questionno);
      print(_quesbank.length);
    }
  }

  String getquestiontext() {
    //for fetching right question
    return _quesbank[_questionno].questiontext;
  }

  bool getanswer() {
    //for getting true ans without any cheating
    return _quesbank[_questionno].questionanswer;
  }

  bool isfinished() {
    //tocheck and reset the ques set for the app
    if (_questionno >= _quesbank.length - 1) {
      print('now returing true');
      return true;
    } else {
      print('now returning false');
      return false;
    }
  }

  void reset() {
    _questionno = 0;
  }
}
