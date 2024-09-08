import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_terricon/constance/color.dart';
import 'package:hackaton_terricon/model_view/add_purposes_view_model.dart';
import 'package:hackaton_terricon/widgets/button_border.dart';
import 'package:hackaton_terricon/widgets/text_form_field.dart';
import 'package:provider/provider.dart';

class PurposesWidget extends StatefulWidget {
  const PurposesWidget({super.key});

  @override
  State<PurposesWidget> createState() => _PurposesWidgetState();
}

class _PurposesWidgetState extends State<PurposesWidget> {
  List<bool> isActiveList = List.generate(2, (_) => false);
  TextEditingController dialogController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final list = context.watch<PurposesViewModel>().purposesList;
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  list[index],
                  style: const TextStyle(color: Colors.white),
                ),
                trailing: isActiveList[index]
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            isActiveList[index] = !isActiveList[index];
                          });
                        },
                        icon: const Icon(Icons.check_circle_outline,
                            color: kTextColor),
                      )
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            isActiveList[index] = !isActiveList[index];
                          });
                        },
                        icon: const Icon(Icons.circle_outlined),
                      ),
              );
            },
          ),
        ),
        ButtonBorderWidget(
            text: 'Добавить цель',
            onTap: () {
              openDialog();
            })
      ],
    );
  }

  Future openDialog() => showDialog(
        context: context,
        builder: (contex) => AlertDialog(
          backgroundColor: kButtonColor,
          title: const Text(
            'Добавить цель',
            style: TextStyle(color: Colors.white),
          ),
          content: TextFormFieldWidget(
            hintText: 'Цель',
            controller: dialogController,
            obscureText: false,
            visibility: false,
          ),
          actions: [
            TextButton(
              onPressed: () {
                if(dialogController.text == null || dialogController.text.isEmpty){
                  Navigator.pop(context);
                }else{
                  context.read<PurposesViewModel>().addPurposesToList(dialogController.text);
                  Navigator.pop(context);
                }

              },
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      );
}
