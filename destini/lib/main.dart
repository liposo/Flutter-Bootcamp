import 'package:flutter/material.dart';

import 'story_helper.dart';

void main() => runApp(Destini());

StoryHelper storyHelper = StoryHelper();

class Destini extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  void initState() {
    storyHelper.start();
    super.initState();
  }

  void restartGame() {
    storyHelper.start();
  }

  void updateStory(int choice) {
    storyHelper.decisionTree(choice);
    setState(() {
      storyHelper.getCurrentStory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyHelper.getCurrentStory().title,
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  onPressed: () {
                    updateStory(1);
                  },
                  color: Colors.red,
                  child: Text(
                    storyHelper.getCurrentStory().firstChoice,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyHelper.buttonShouldBeVisible(),
                  child: FlatButton(
                    onPressed: () {
                      updateStory(2);
                    },
                    color: Colors.green,
                    child: Text(
                      storyHelper.getCurrentStory().secondChoice,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
