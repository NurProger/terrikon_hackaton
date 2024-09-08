import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_terricon/constance/color.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_terricon/constance/color.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String hintText;
  bool obscureText;
  final bool visibility;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator; // Добавляем параметр для валидации

  TextFormFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    required this.obscureText,
    required this.visibility,
    this.validator, // Инициализируем параметр для валидации
  });

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(255, 255, 255, 1)),
        ),
        hintText: widget.hintText,
        suffixIcon: widget.visibility ? _visibilityMethod() : null, // Исправляем на null, если нет иконки
        hintStyle: const TextStyle(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
      ),
    );
  }

  IconButton _visibilityMethod() {
    return IconButton(
      onPressed: () {
        setState(() {
          widget.obscureText = !widget.obscureText;
        });
      },
      icon: widget.obscureText
          ? const Icon(Icons.visibility_off_sharp, color: kBackroundColor, size: 22)
          : const Icon(Icons.visibility_sharp, color: kBackroundColor, size: 22),
    );
  }
}


class TextFieldAppBar extends StatelessWidget {
  const TextFieldAppBar({
    super.key,
    required this.searchController, required this.onChanged,
  });

  final TextEditingController searchController;
  final onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      onChanged: onChanged,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(5),
        filled: true,
        fillColor: const Color.fromARGB(255, 69, 71, 75),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100)
        ),
        enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(100)
        ),
        hintText: 'Поиск по назначению',
        prefixIcon: const Icon(Icons.search,color: kBackroundColor,size: 22,),
        hintStyle: const TextStyle(
            color: Color.fromRGBO(255, 255, 255, 0.5),
            fontWeight: FontWeight.w400
        ),
      ),
    );
  }
}
