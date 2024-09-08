
import 'package:hackaton_terricon/data/json_data.dart';

class BookModel {
  String cover_url;
  String name;
  String description;
  int rating;

  BookModel({
    required this.rating, required this.name, required this.description, required this.cover_url
  });

  factory BookModel.fromJson(Map<String, dynamic> json){
    return BookModel(
      rating: json['rating'],
      name: json['name'],
      description: json['description'],
      cover_url: json['cover_url'],
    );
  }
}

List<BookModel> parseBook(List<Map<String,dynamic>>jsonData){
  return jsonData.map((json) => BookModel.fromJson(json)).toList();
}

final List<BookModel> bookList = parseBook(jsonData);