import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noteapp/modle/note_modle.dart';
import 'package:noteapp/view/edit_page.dart';

class NoteOne extends StatelessWidget {
  const NoteOne({super.key, required this.note});
  final NoteModle note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditPage();
        }));
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 25, right: 10, left: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color:  Color(note.color)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  note.subTitle,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              minVerticalPadding: 30,
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(FontAwesomeIcons.trash),
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                note.date,
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
