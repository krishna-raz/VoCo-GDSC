class Question {
  late String questiontext;
  late bool questionanswer;
  //constructor

  Question(
      {required String q,
      required bool a}) //constructor  to  provide intial values
  {
    questiontext = q;
    questionanswer = a;
  }
}
