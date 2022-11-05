import 'package:flutter/material.dart';
import 'package:google_keep/utils/modalbottom_sheet.dart';
import 'package:google_keep/utils/notesappbar.dart';
import 'package:google_keep/views/bottom_nav_screens/new_note.dart';

enum MenuItem { item1 }

class ListScreen extends StatefulWidget {
  static const routeName = '/list-screen';
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  static List<String?> listItem = [null];
  final _formKey = GlobalKey<FormState>();
  bool value = false;
  bool isListItemTapped = false;

  @override
  Widget build(BuildContext context) {
    print("The value of isTapped again is: $isListItemTapped");
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.055,
                      ),
                      notesAppBar(),
                      SizedBox(
                        height: 29,
                      ),
                      SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                          hintText: "Title",
                                          hintStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                          border: InputBorder.none),
                                      maxLines: null,
                                    ),
                                  ),
                                  PopupMenuButton(
                                      onSelected: ((value) {
                                        if (value == MenuItem.item1) {
                                          Navigator.of(context).popAndPushNamed(
                                              NewNote.routeName);
                                        }
                                      }),
                                      itemBuilder: (context) => [
                                            PopupMenuItem(
                                                value: MenuItem.item1,
                                                child: Text("Hide checkboxes"))
                                          ]),
                                ],
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              ..._getItemList(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(child: Icon(Icons.format_paint_sharp)),
                    GestureDetector(child: Text("Edited 11:56 am")),
                    GestureDetector(
                        onTap: () {
                          bottomSheet(context);
                        },
                        child: Icon(Icons.more_vert))
                  ],
                )),
          )
        ],
      ),
    ));
  }

  Widget displayCloseButton(bool isTapped) {
    //if the row is tapped add the close iconbutton
    return Visibility(visible: isListItemTapped, child: Icon(Icons.close));
    // return Icon(isTapped ? Icons.close : null);
  }

  void changeVisibility() {
    setState(() {
      isListItemTapped = !isListItemTapped;
    });
  }

  List<Widget> _getItemList() {
    print("The value of isTappedThrice is: $isListItemTapped");
    List<Widget> itemTextFieldList = [];
    for (int i = 0; i < listItem.length; i++) {
      itemTextFieldList.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Row(
          children: [
            Checkbox(
                value: value,
                onChanged: (value) {
                  setState(() {
                    this.value = value!;
                  });
                }),
            Expanded(
                child: InkWell(
                    onTap: changeVisibility, child: ListItemTextField(i))),
            displayCloseButton(isListItemTapped),
            _removeButton(i)
          ],
        ),
      ));
    }
    print("The value of isTapped fourth is: $isListItemTapped");
    return itemTextFieldList;
  }

  Widget _removeButton(int index) {
    return InkWell(
      onTap: () {
        listItem.removeAt(index);

        setState(() {});
      },
      child: Container(
        height: 30,
        width: 30,
        child: Icon(Icons.close),
      ),
    );
  }
}

class ListItemTextField extends StatefulWidget {
  final int index;
  const ListItemTextField(this.index);

  @override
  State<ListItemTextField> createState() => _ListItemTextFieldState();
}

class _ListItemTextFieldState extends State<ListItemTextField> {
  late TextEditingController _listItemController;

  @override
  void initState() {
    _listItemController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _listItemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _listItemController.text = _ListScreenState.listItem[widget.index] ?? '';
    });
    return TextFormField(
      maxLines: null,
      controller: _listItemController,
      // save text field data in listItem at index
      // whenever text field value changes
      onChanged: ((value) => _ListScreenState.listItem[widget.index] = value),
      decoration:
          InputDecoration(hintText: "List Item", border: InputBorder.none),
      onTap: () {
        _ListScreenState.listItem.insert(widget.index + 1, null);
        _removeButton(widget.index);
      },
    );
  }

  Widget _removeButton(int index) {
    return InkWell(
      onTap: () {
        _ListScreenState.listItem.removeAt(index);

        setState(() {});
      },
      child: Container(
        height: 30,
        width: 30,
        child: Icon(Icons.close),
      ),
    );
  }
}
