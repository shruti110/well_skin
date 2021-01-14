import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import './quiz1.dart';
import 'package:getwidget/getwidget.dart';
void main(){
  runApp(
      new MaterialApp(
        home: new FirstScreen(),
      )
  );
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return MaterialApp(

      home: AnimatedOpacity(
        opacity: 1.0,
        duration: Duration(seconds:5 ),
        child: Container(
          decoration: BoxDecoration(

              image: DecorationImage(
                  image: AssetImage("assets/we.jpg"), fit: BoxFit.cover)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const SizedBox(height: 200),
                  GestureDetector(
                    child: Text(
                      'TAP TO CONTINUE',
                      style: TextStyle(fontSize: 24),
                    ),

                    onTap: ()  {
                      Navigator.push(
                        ctxt,
                        new MaterialPageRoute(builder: (ctxt) => new Quiz()),
                      );
                    },
                  ),

                ],
              ),

            ),
          ),
        ),
      ),
    );

  }
}

class Quiz extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new QuizState();
  }
}

class QuizState extends State<Quiz>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        decoration: BoxDecoration(

            image: DecorationImage(
                image: AssetImage("assets/wall.jpg"), fit: BoxFit.cover)),

        child: GridView.count(
          //mainAxisSize: MainAxisSize.min,
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10.0,
          children: <Widget>[

            GFButton(

              color: Colors.pink[100],
              splashColor: Color(0xffB3365B),
              child: Padding(

                padding:const EdgeInsets.all(10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.face,
                      color: Colors.pink,
                    ),
                    Text(
                      "Self Examination",
                      maxLines: 1,
                      style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              onPressed: _launchURL4,
              shape: GFButtonShape.pills,
              size: GFSize.LARGE,
            ),
            GFButton(
              color: Colors.purple[100],
              splashColor: Color(0xffB3365B),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column (

                  children: const <Widget>[
                    SizedBox(height: 70.0,),
                    Icon(
                      Icons.edit_outlined,
                      color: Color(0xffB3365B),
                    ),
                    Text(
                      "Check your risk level",
                      maxLines: 1,
                      style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              onPressed: startQuiz,
              size: GFSize.LARGE,
              shape:  GFButtonShape.pills,

            ),
            GFButton(
              size: GFSize.LARGE,
              color: Colors.deepOrange[100],
              splashColor: Color(0xffB3365B),
              child: Padding(
                padding: EdgeInsets.only(top: 0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.calendar_today,
                      color: Color(0xffB3365B),
                    ),
                    Text(
                      "Reminder Alerts",
                      style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              onPressed: (){},
              shape:  GFButtonShape.pills,

            ),
            GFButton(
              size: GFSize.LARGE,
              color: Colors.blueGrey[100],
              splashColor: Color(0xffB3365B),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.navigation,
                      color: Color(0xffB3365B),
                    ),
                    Text(
                      "Nearby specialists",
                      style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              onPressed: _launchURL1,
              shape: GFButtonShape.pills,

            ),
            GFButton(
              size: GFSize.LARGE,
              color: Colors.red[100],
              elevation: 10,
              splashColor: Color(0xffB3365B),
              child: Padding(
                padding:const EdgeInsets.all(8),
                child: Column
                  (
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.healing,
                      color: Color(0xffB3365B),
                    ),
                    Text(
                      "Self help suggestions",
                      style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              onPressed: _launchURL2,
              shape: GFButtonShape.pills,
            ),
            GFButton(
              size: GFSize.LARGE,
              color: Colors.green[100],
              splashColor: Color(0xffB3365B),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.query_builder,
                      color: Color(0xffB3365B),
                    ),
                    Text(
                      "What next?",
                      style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              onPressed: _launchURL,
              shape:  GFButtonShape.pills,

            ),
            GFButton(
              size: GFSize.LARGE,
              color: Colors.blue[100],
              splashColor: Color(0xffB3365B),
              child: Padding(
                padding:const EdgeInsets.all(8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.question_answer,
                      color: Colors.pink,
                    ),
                    Text(
                      "Blogs",
                      style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              onPressed: _launchURL3,
              shape: GFButtonShape.pills,
            ),

          ],
        ),
      ),

    );
  }
  _launchURL() async {
    const url = 'https://www.cancer.gov/types/skin/patient/skin-treatment-pdq';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURL1() async {
    const url = 'https://www.google.com/search?client=opera-gx&hs=X0z&sxsrf=ALeKk02YG_E6lhvTgUdyr3DiCaZ4n-ujgQ%3A1610209768764&ei=6Nn5X6WVLq3H4-EPms2JiAY&q=oncologist+near+me&oq=oncologinear+me&gs_lcp=CgZwc3ktYWIQAxgAMgYIABAHEB4yBggAEAcQHjIGCAAQBxAeMgYIABAHEB4yBggAEAcQHjIGCAAQBxAeMgYIABAHEB4yBggAEAcQHjIGCAAQBxAeMgYIABAHEB46BAgAEEc6BwgAELEDEEM6BAgAEA1Q4doFWNPxBWCB_AVoAHADeACAAZYEiAHMD5IBCTAuMS42LjUtMZgBAKABAaoBB2d3cy13aXrIAQjAAQE&sclient=psy-ab';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURL2() async {
    const url = 'https://www.google.com/search?client=opera-gx&q=therapists+near+me&sourceid=opera&ie=UTF-8&oe=UTF-8';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURL3() async {
    const url = 'https://survivornet.ca/cancer-type/skin-cancer-non-melanoma/skin-cancer-blogs/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURL4() async {
    const url = 'https://www.aad.org/public/diseases/skin-cancer/find/check-skin';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  void startQuiz(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Quiz1()));
    });
  }
}

