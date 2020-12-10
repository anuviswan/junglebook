import 'package:flutter/material.dart';
import 'slide_cordinator.dart';
import 'dictionary.dart';


void main() => runApp(MaterialApp(home:new HomePage()));


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Jungle Book'),),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          new Card(
            color: Colors.white,
            child: new Column(
              children: <Widget>[
                new SizedBox(
                  height: 150.0,
                  child: new Stack(
                    children: <Widget>[
                      Positioned.fill(child: Image.asset('assets/graphics/birds_card.jpg',fit: BoxFit.cover,)),
                      Positioned(
                        bottom: 16.0,
                        left:16.0,
                        right:16.0,
                        child: new FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: new Text('Winged Wonders',style: Theme.of(context).textTheme.headline.copyWith(color: Colors.white),),
                        ),
                      )
                    ],
                  ),
                    
                ),
                ButtonTheme.bar(
                  child: ButtonBar(
                    alignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Text("Learn more on Winged Wonders"),
                      new FlatButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => new SlideCordinator(baseDictionary: new BirdsLocalDictionary(),)),
                        );
                      },  child: new Text('Start Tour'))
                    ],
                  ),
                )
              ],
            ),
          ),

      new Card(
      color: Colors.white,
      child: new Column(
        children: <Widget>[
          new SizedBox(
            height: 150.0,
            child: new Stack(
              children: <Widget>[
                Positioned.fill(child: Image.asset('assets/graphics/animals_card.jpg',fit: BoxFit.cover,)),
                Positioned(
                  bottom: 16.0,
                  left:16.0,
                  right:16.0,
                  child: new FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: new Text('Animal Kingdom.',style: Theme.of(context).textTheme.headline.copyWith(color: Colors.white),),
                  ),
                )
              ],
            ),

          ),
          ButtonTheme.bar(
            child: ButtonBar(
              alignment: MainAxisAlignment.end,
              children: <Widget>[
                new Text("Learn more on Animal world"),
                new FlatButton(onPressed: (){}, child: new Text('Start Tour'))
              ],
            ),
          )
        ],
      ),
    )
        ],
      )
    );
  }
}








