import 'utils/all.dart';
import 'package:flutter/material.dart';

enum Orientation {
  horizontal,
  vertical,
}

class MondrianStruct {
  final double ratio;
  final Orientation orientation;
  final MondrianStruct first;
  final MondrianStruct second;
  const MondrianStruct({this.ratio,this.orientation,this.first,this.second});
}

class MondrianPage extends StatelessWidget {

  final _borderFormat = new BorderSide(
    width: 2.0,
    color: Color(0xFF000000),
  );


  Widget _mondrianCell(){
    return Container(
        decoration: new BoxDecoration(
          border: new Border(
            bottom: _borderFormat,
            right: _borderFormat,
          ),
        ),
        child: new LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              children: <Widget>[
                Expanded(child: Container(
                  child: Text("Height: " + constraints.maxHeight.toString()),
                  alignment: Alignment(0.0,0.0),
                ),),
                Expanded(child: Container(
                  child: Text("Width: " + constraints.maxWidth.toString()),
                  alignment: Alignment(0.0,0.0),
                ),),
            ],);
          }
        ),
      );
  } 


  MondrianStruct _genStructure (int dep){
    if(dep==0){
      return null;
    }
    var struc = MondrianStruct(
      ratio: 0.5,
      orientation: Orientation.horizontal,
      first: _genStructure(dep-1),
      second: _genStructure(dep-1),
    );
    return struc;
  }

  Widget _genMondrianLayout(MondrianStruct struc){
    
    if(struc == null){
      return Container(
        child: _mondrianCell(), 
      );
    } else {
      return Container(
        child: Flex(
          direction: (struc.orientation == Orientation.vertical)?Axis.vertical:Axis.horizontal ,
          children: <Widget>[
            Expanded(
              flex: (struc.ratio*100).round(),
              child: _genMondrianLayout(struc.first),
            ),
            Expanded(
              flex: 100-(struc.ratio*100).round(),
              child: _genMondrianLayout(struc.second),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    var _struc = _genStructure(int.parse('2'));
    var _mondrianWidg = _genMondrianLayout(_struc);

    return Scaffold(
      appBar: new AppBar(
        title: FitText(
          text:"User Input Demo",
        ),
      ),
      drawer: MyDrawer(),
      body: Container(
        decoration: new BoxDecoration(
          border: new Border(
            left: _borderFormat,
            top: _borderFormat,
          ),
        ),
        child: _mondrianWidg,
      ),
    );
  }
}