import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:getwidget/getwidget.dart';


var finalScore = 0;
var questionNumber = 0;
var quiz = new AQuiz();
var age=0;

class AQuiz{
  var images = [
    "1.png","2.png","3.png","4.jpg","5.png","6.png","7.png","8.jpg",
  ];


  var questions = [
    "Your age is",
    "Has any member of your family been diagnosed with skin cancer?",
    "Does your skin freckle",
    "Do you have moles with irregular edge and color?",
    "Do you get bad su burns easily?",
    "Do you protect your skin at home or on holiday?",
    "Have you been diagnosed with melanoma in the past?",
    "Do you notice any of these warning signs?",
  ];


  var choices = [
    ["more than 50", "less than 50"],
    ["Yes", "No"],
    ["Yes", "No"],
    [ "Yes", "No"],
    ["Yes", "No"],
    ["Yes", "No"],
    ["Yes", "No"],
    [ "Yes", "No"],
  ];


  var correctAnswers = [
    "more than 50","Yes","Yes","Yes", "No", "Yes", "Yes","Yes",
  ];
}

class Quiz1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new Quiz1State();
  }
}

class Quiz1State extends State<Quiz1> {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(

          body: new Container(
            decoration: BoxDecoration(

                image: DecorationImage(
                    image: AssetImage("assets/wall.jpg"), fit: BoxFit.cover)),
            margin: const EdgeInsets.all(10.0),
            alignment: Alignment.topCenter,
            child: new Column(
              children: <Widget>[
                new Padding(padding: EdgeInsets.all(50.0)),


                new Image.asset(
                  "images/${quiz.images[questionNumber]}",
                ),

                new Padding(padding: EdgeInsets.all(10.0)),

                new Text(quiz.questions[questionNumber],
                  style: new TextStyle(
                    fontSize: 40.0,
                  ),),

                new Padding(padding: EdgeInsets.all(20.0)),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[

                    //button 1
                    new GFButton(
                      //minWidth: 120.0,
                      color: Colors.pink[200],
                      onPressed: (){
                        if(quiz.choices[questionNumber][0] == quiz.correctAnswers[questionNumber]){
                          finalScore+=10;
                        }
                        updateQuestion();
                      },
                      child: new Text(quiz.choices[questionNumber][0],
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                        ),),
                      shape:  GFButtonShape.pills,
                    ),

                    //button 2
                    new GFButton(
                      shape:  GFButtonShape.pills,
                      //minWidth: 120.0,
                      color: Colors.pink[200],
                      onPressed: (){

                        if(quiz.choices[questionNumber][1] == quiz.correctAnswers[questionNumber]){

                          finalScore+=10;
                        }
                        updateQuestion();
                      },
                      child: new Text(quiz.choices[questionNumber][1],
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                        ),),
                    ),

                  ],
                ),



                new Padding(padding: EdgeInsets.all(15.0)),

                new Container(
                    alignment: Alignment.bottomCenter,
                    child:  new MaterialButton(
                        minWidth: 240.0,
                        height: 30.0,
                        color: Colors.red,
                        onPressed: resetQuiz,
                        child: new Text("Quit",
                          style: new TextStyle(
                              fontSize: 18.0,
                              color: Colors.white
                          ),)
                    )
                ),




              ],
            ),
          ),

        )
    );
  }

  void resetQuiz(){
    setState(() {
      Navigator.pop(context);
      finalScore = 0;
      questionNumber = 0;
    });
  }



  void updateQuestion(){
    setState(() {
      if(questionNumber == quiz.questions.length - 1){
        Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Summary(score: finalScore,)));

      }else{
        questionNumber++;
      }
    });
  }
}


class Summary extends StatelessWidget{
  final int score;
  Summary({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: new Container(
        decoration: BoxDecoration(

            image: DecorationImage(
                image: AssetImage("assets/we.jpg"), fit: BoxFit.fill)),


        child: ListView(
          //mainAxisSize: MainAxisSize.min,
          //mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            SizedBox(height: 300,),
            new Text("Final Score: $score",
              style: new TextStyle(
                  fontSize: 35.0
              ),),
            if(score>50)
              new Text("Get a check up done as soon as possible!",style: new TextStyle(fontSize: 50,color: Colors.black,backgroundColor: Colors.red))
            else
              new Text("You are fine!",style: new TextStyle(fontSize: 50,fontWeight:FontWeight.bold ,color: Colors.black,backgroundColor: Colors.green,decorationColor: Colors.black26)),

            // new Padding(padding: EdgeInsets.all(80.0)),

            MaterialButton(
              color: Colors.purple[200],
              onPressed: (){
                questionNumber = 0;
                finalScore = 0;
                Navigator.pop(context);
              },
              child: new Text("Reset Quiz",
                style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.white
                ),
              ),
            ),

          ],
        ),


      ),
    );
  }


}