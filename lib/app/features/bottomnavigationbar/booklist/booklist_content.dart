import 'package:flutter/material.dart';

class BookList extends StatelessWidget {
  BookList({Key? key}) : super(key: key);
  final searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black38,
                    hintText: 'Write name of the book',
                    hintStyle: TextStyle(fontSize: 15),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                  ),
                  controller: searchcontroller,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.search),
                label: Text('Search'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  fixedSize: const Size(120, 48),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
