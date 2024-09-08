import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:hackaton_terricon/constance/color.dart';
import 'package:hackaton_terricon/data/model.dart';
import 'package:hackaton_terricon/view/about_book_view.dart';
import 'package:hackaton_terricon/widgets/genre_widget.dart';

import '../widgets/text_form_field.dart';
import '../widgets/top_books_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController searchController = TextEditingController();
  final List<String> bookGenre = [
    "Художественная литература",
    "Документальная литература",
    "Эссеистика",
    "Детская литература",
    "Прикладная литература",
    "Философская литература",
  ];
  bool isActive = false;
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: TextFieldAppBar(
            searchController: searchController,
            onChanged: (query) {
              searchQuery = query;
              setState(() {
                isActive = searchQuery.isNotEmpty;
              });
            },
          ),
          actions: [
            InkWell(
              onTap: () {},
              child: const Icon(
                Icons.notifications_none,
                size: 36,
                color: Colors.white,
              ),
            ),
          ],
          bottom: isActive
              ? null
              : const TabBar(
                  isScrollable: true,
                  padding: EdgeInsets.only(top: 8),
                  unselectedLabelColor: Color.fromRGBO(255, 255, 255, 0.5),
                  indicatorColor: kTextColor,
                  dividerColor: Colors.transparent,
                  labelStyle: TextStyle(color: kTextColor, fontSize: 20),
                  tabs: [
                      Tab(text: 'Топ книги'),
                      Tab(text: 'Новинки'),
                      Tab(
                        text: 'Аудиокниги',
                      ),
                    ]),
        ),
        body: isActive
            ? filterBooks()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final width = constraints.maxWidth;
                    final height = constraints.maxHeight;
                    return Column(
                      children: [
                        Container(
                          height: height * 0.3,
                          width: double.infinity,
                          child: TabBarView(
                            children: [
                              TopBooksWidget(
                                bookList: bookList
                                    .where((element) => element.rating >= 4)
                                    .toList(),
                              ),
                              TopBooksWidget(
                                bookList: bookList
                                    .where((element) => element.rating == 3)
                                    .toList(),
                              ),
                              TopBooksWidget(
                                bookList: bookList
                                    .where((element) => element.rating <= 2)
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Жанры',
                                style: TextStyle(
                                    fontSize: 36,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Expanded(
                                child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 5,
                                          mainAxisSpacing: 10,
                                          childAspectRatio: 1.4),
                                  itemCount: 6,
                                  itemBuilder: (context, index) {
                                    return GenreWidget(
                                      name: bookGenre[index],
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
      ),
    );
  }

  Widget filterBooks() {
    final List<BookModel> filteredBooks = bookList
        .where((book) =>
            book.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    if (filteredBooks.isEmpty) {
      return const Center(
        child: Text(
          'Книги не найдены',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      );
    }

    return ListView.builder(
      itemCount: filteredBooks.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.transparent,
          elevation: 0,
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutBookView(
                    name: filteredBooks[index].name,
                    cover_url: filteredBooks[index].cover_url,
                    description: filteredBooks[index].description,
                    rating: filteredBooks[index].rating,
                  ),
                ),
              );
            },
            leading: Image.network(
              filteredBooks[index].cover_url,
              height: 150,
              width: 45,
            ),
            // Обложка книги
            title: Text(
              filteredBooks[index].name,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w500),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Рейтинг: ${filteredBooks[index].rating}',
                    style: const TextStyle(color: Colors.white)),
                const SizedBox(height: 4),
                Text(filteredBooks[index].description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),
        );
      },
    );
  }
}
