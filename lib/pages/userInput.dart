import 'package:flutter/material.dart';
import 'package:flutterapp/pages/utils/all.dart';


class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  final myController = TextEditingController();

  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  List<String> _listText = ["one","two"];

  @override
  void dispose(){
    myController.dispose();
    super.dispose();
  }

  void _insertSingleItem(String newItem){
    _listText.insert(0,newItem);
    _listKey.currentState.insertItem(0);
  }
  
  Widget _outputListView(){
    return AnimatedList(
      key: _listKey,
      initialItemCount: _listText.length,
      itemBuilder: (context,index,animation){
        final item = _listText[index];
        return SizeTransition(
          sizeFactor:animation,
          child: Card(
            child: ListTile(
              title: Text(item),
            ),
          ),
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: FitText(
          text:"User Input Demo",
        ),
      ),
      drawer: MyDrawer(),
      body: Column(
        children: <Widget>[
        TextField(
          controller: myController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Input Text Here',
          ),
          onEditingComplete: (){
            setState((){
              _insertSingleItem(myController.text);
            });
          }
        ),
        Expanded(
          child: Container(
            child: _outputListView(),
          )
        ),
      ])
    );
  }
}