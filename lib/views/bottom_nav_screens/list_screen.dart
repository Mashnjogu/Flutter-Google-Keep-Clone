import 'package:flutter/material.dart';
import 'package:google_keep/utils/modalbottom_sheet.dart';
import 'package:google_keep/utils/notesappbar.dart';

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

  @override
  Widget build(BuildContext context) {
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
                                  GestureDetector(
                                      child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Icon(Icons.more_vert),
                                  ))
                                ],
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              ..._getItemList(),
                              ElevatedButton(
                                  onPressed: () {}, child: Text("save"))
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

  List<Widget> _getItemList() {
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
            Expanded(child: ListItemTextField(i)),
            _removeButton(i)
          ],
        ),
      ));
    }
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
      decoration: InputDecoration(hintText: "List Item"),
      onTap: () {
        _ListScreenState.listItem.insert(widget.index + 1, null);
      },
    );
  }
}
