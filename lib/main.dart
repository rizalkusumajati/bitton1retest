import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


void main() {
  runApp(new MaterialApp(
      home: new MyApp()
  ));
}

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return new _State();
  }
}

class _State extends State<MyApp>{
  String _value = "Hello World";
  bool _value1 = false;
  bool _value2 = false;
  int valueRadio1 = 0;
  int valueRadio2 = 0;
  
  void _onClick(){
    setState(() {
      _value = "My Name is Rizal";
    });
  }

  void _onClickWithParam(String value){
    setState(() {
      _value = value;
    });
  }

  void _onClickShowDateTime(){
    setState(() {
      _value = new DateTime.now().toString();
    });
  }

  void add(){
    setState(() {
      _value = "This is icon button clicked";
    });
  }

  void _onChange(String value){
    setState(() {
      _value = "Change: $value";
    });
  }


  void _onSubmit(String value){
    setState(() {
      _value = "Submit: $value";
    });
  }

  void _value1Changed(bool? value){
    setState(() {
      _value1 = value!;
    });
  }

  void _value2Changed(bool? value){
    setState(() {
      _value2 = value!;
    });
  }
  
  void _setValue(int? value){
    setState(() {
      valueRadio1 = value!;
    });
  } 
  void _setValue2(int? value){
    setState(() {
      valueRadio2 = value!;
    });
  }
  
  Widget makeRadios(){
    List<Widget> list = new List.empty(growable: true);
    
    for(int i = 0; i < 3; i++){
      list.add(new Radio(value: i, groupValue: valueRadio1, onChanged: _setValue));
    }
    
    Column column = new Column(children: list,);
    return column;
  } 
  Widget makeRadioTiles(){
    List<Widget> list = new List.empty(growable: true);
    
    for(int i = 0; i < 3; i++){
      list.add(new RadioListTile(
          value: i,
          groupValue: valueRadio2,
          onChanged: _setValue2,
        activeColor: Colors.green,
        controlAffinity: ListTileControlAffinity.trailing,
        title: new Text("Item $i"),
        subtitle: new Text("sub title"),
      )
      );
    }
    
    Column column = new Column(children: list,);
    return column;
  }
  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: new AppBar(
       title: new Text("Name Here"),
     ),
     body: new SingleChildScrollView(
       scrollDirection: Axis.vertical,
         child: new Container(
             padding: new EdgeInsets.all(32.0),
             child: new Center(
               child: new Column(
                 children: <Widget>[
                   new Text(_value),
                   new RaisedButton(onPressed: _onClick, child: new Text("raised button"),),
                   new RaisedButton(onPressed: () => _onClickWithParam("Someone"), child: new Text("raised button with param"),),
                   new FlatButton(onPressed: _onClickShowDateTime, child: new Text("flat button")),
                   new IconButton(onPressed: () => add(), icon: new Icon(Icons.add)),
                   new TextField(
                     decoration: new InputDecoration(
                         labelText: "Hello",
                         hintText: "Hint",
                         icon: new Icon(Icons.people)
                     ),
                     autocorrect: true,
                     autofocus: true,
                     keyboardType: TextInputType.text,
                     onChanged: _onChange,
                     onSubmitted: _onSubmit,
                   ),
                   new Checkbox(value: _value1, onChanged: _value1Changed),
                   new CheckboxListTile(
                     value: _value2,
                     onChanged: _value2Changed,
                     title: new Text("Hello world"),
                     controlAffinity: ListTileControlAffinity.leading,
                     subtitle: new Text("Subtitle"),
                     secondary: new Icon(Icons.archive),
                     activeColor: Colors.red,
                   ),
                   makeRadios(),
                   makeRadioTiles()

                 ],
               ),
         )
     )
     ),
   );
  }

}
