import 'package:flutter/material.dart';
import 'package:hackaton_terricon/data/model.dart';
import 'package:hackaton_terricon/widgets/book_card_widget.dart';

class TopBooksWidget extends StatelessWidget {
  final List<BookModel> bookList;

  const TopBooksWidget({super.key, required this.bookList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: List.generate(
          3,
          (index) => Expanded(
            child: BookCardWidget(
              bookModel: bookList[index],
            ),
          ),
        ),
      ),
    );
  }
}
