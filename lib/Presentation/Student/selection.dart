import 'package:flutter/material.dart';
class WorkingDraft extends StatefulWidget {
  final String? startType;
  final String? name;
  final String? currentContent;
  final String? currentID;
  final List? startContent;

  WorkingDraft(
      {this.startType,
         this.name,
         this.currentContent,
         this.currentID,
        this.startContent});

  @override
  _WorkingDraftState createState() => _WorkingDraftState();
}

class _WorkingDraftState extends State<WorkingDraft> {
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();

  //String _startType;
  String _currentContent = "";
  String _name = "Draft";
  List _startContent = [];
  List _outLineTiles = [];
  int _counter = 0;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();

    _currentContent = widget.currentContent!;
    _name = widget.name!;
    _startContent = widget.startContent!;
    _counter = 0;

    _startContent.forEach((element) {
      _outLineTiles.add(OutlineTile(
        key: Key("myKey$_counter"),
        outlineName: element[0],
        myContent: element[1],
        onTileSelected: clearHilights,
      ));
      _counter++;
    });
  }

  dynamic clearHilights(Key myKey) {
    _outLineTiles.forEach((element) {
      element
          .deselect(); // this throws an error Class 'OutlineTile' has no instance method 'deselect'.
      Key _foundKey = element.key;
      print("Element Key $_foundKey");
    });
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: ListView.builder(
        itemCount: _startContent.length,
        itemBuilder: (context, index) {
          return _outLineTiles[index];
        },
      ),
    );
  }

}

class OutlineTile extends StatefulWidget {
  final Key? key;
  final String outlineName;
  final Icon? myIcon;
  final String? myContent;
  final Function(Key)? onTileSelected;

  OutlineTile(
      {this.key,
        required this.outlineName,
        this.myIcon,
        this.myContent,
        this.onTileSelected});

  @override
  _OutlineTileState createState() => _OutlineTileState();
}

class _OutlineTileState extends State<OutlineTile> {
  late Color color;
  late Key _myKey;

  @override
  void initState() {
    super.initState();

    color = Colors.transparent;
  }

  bool _isSelected = false;

  set isSelected(bool value) {
    _isSelected = value;
    print("set is selected to $_isSelected");
  }

  void changeSelection() {
    setState(() {
      _myKey = widget.key!;
      _isSelected = !_isSelected;
      if (_isSelected) {
        color = Colors.lightBlueAccent;
      } else {
        color = Colors.transparent;
      }
    });
  }

  void deselect() {
    setState(() {
      isSelected = false;
      color = Colors.transparent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Row(
          children: [
            Card(
              elevation: 10,
              margin: EdgeInsets.fromLTRB(10.0, 6.0, 5.0, 0.0),
              child: SizedBox(
                width: 180,
                child: Container(
                  color: color,
                  child: ListTile(
                    title: Text(widget.outlineName),
                    onTap: () {
                      if (widget.outlineName == "Heading") {
                        Text("Called Heading");
                      } else
                        {
                        (widget.outlineName == "Paragraph");
                      }
                      {
                        Text("Called Paragraph");
                        widget.onTileSelected!(_myKey);
                        changeSelection();
                      }
                    },
                  ),
                ),
              ),
            ),
          ]
      ),
    );
  }


}