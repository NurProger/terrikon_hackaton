import 'package:flutter/material.dart';
import 'package:hackaton_terricon/data/model.dart';
import 'package:hackaton_terricon/view/about_book_view.dart';

class BookCardWidget extends StatelessWidget {
  final BookModel bookModel;

  const BookCardWidget(
      {super.key,
      required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        double height = constraints.maxHeight;

        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (contex)=>AboutBookView(name: bookModel.name, cover_url: bookModel.cover_url, description: bookModel.description, rating: bookModel.rating)));
          },
          child: Container(
            height: height * 0.85,
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                        bookModel.cover_url,
                      ),
                      fit: BoxFit.fitWidth
                    ),
                  ),
                ),
                SizedBox(height: height * 0.05),
                Text(
                  bookModel.name,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.15,
                    fontWeight: FontWeight.w500
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: generateStars(bookModel.rating),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  generateStars(int rating) {
    List<Widget> stars = [];
    for (int i = 0; i < rating; i++) {
      stars.add(const Icon(
        Icons.star_outlined,
        color: Colors.yellow,
        size: 17,
      ));
    }
    for (int i = rating; i < 5; i++) {
      stars.add(const Icon(
        Icons.star_border,
        color: Colors.yellow,
        size: 17,
      ));
    }
    return stars;
  }
}
