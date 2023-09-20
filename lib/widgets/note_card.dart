import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_text.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.yellow[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Flutter Tips",
                  fontSize: 22.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            CustomText(
              text: "Build your career with Abdallah Mohellebi",
              fontSize: 16.0,
              color: const Color.fromARGB(255, 110, 110, 110),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomText(
                  text: "Sep 20, 2023",
                  color: const Color.fromARGB(255, 110, 110, 110),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
