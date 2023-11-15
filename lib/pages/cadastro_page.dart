import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prova_flutter/models/text_item.dart';
import 'package:prova_flutter/state/text_itens.dart';
import 'package:prova_flutter/utils/screen.dart';
import 'package:prova_flutter/utils/string_utils.dart';
import 'package:prova_flutter/widgets/app_textfield.dart';
import 'package:prova_flutter/widgets/politica_widget.dart';

import '../widgets/background_widget.dart';

TextItens textItens = TextItens();

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  TextEditingController _controllerTexto = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    textItens.fetchItens();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SingleChildScrollView(
          child: Container(
            height: Screen.of(context).height,
            width: Screen.of(context).width,
            padding: EdgeInsets.only(top: 60, right: 30, bottom: 30, left: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _crudTexto(),
                PoliticaWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _crudTexto() {
    return Column(
      children: [
        Container(
          height: Screen.of(context).height * 0.5,
          child: Card(
            child: _list(),
          ),
        ),
        SizedBox(height: 30),
        AppTextField(
          focusNode: _focusNode,
          controller: _controllerTexto,
          validator: (value) {},
          hint: 'Digite seu texto',
          textAlign: TextAlign.center,
          textStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          onFieldSubmitted: (value) {
            if (StringUtils.isNullOrEmpty(value)) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Necessário preencher o campo!'),
                ),
              );
              _focusNode.requestFocus();
              return;
            }
            textItens.addOrUpdateItem(value);
            _controllerTexto.clear();
            textItens.setItemToUpdate(indexToUpdate: null, itemToUpdate: null);
            Screen.of(context).hideKeyboard();

            Future.delayed(Duration(seconds: 1), () {
              _focusNode.requestFocus();
            });
          },
        )
      ],
    );
  }

  _list() {
    return Observer(
      builder: (context) {
        return Column(
          children: [
            Flexible(
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(thickness: 2),
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                itemCount: textItens.getItens().length,
                itemBuilder: ((context, index) {
                  TextItem textItem = textItens.getItens()[index];
                  return Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            textItem.value,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _controllerTexto.text = textItem.value;
                          textItens.setItemToUpdate(
                            indexToUpdate: index,
                            itemToUpdate: textItem,
                          );
                        },
                        child: Icon(
                          Icons.edit,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          _showMessageDeleteTextItem(textItem);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  );
                }),
              ),
            ),
            textItens.getItens().length > 0
                ? Divider(thickness: 2)
                : Container()
          ],
        );
      },
    );
  }

  _showMessageDeleteTextItem(TextItem textItem) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Confirmação'),
            content:
                Text("Deseja realmente excluir o item: '${textItem.value}'? "),
            actions: [
              TextButton(
                child: Text('NÃO'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('SIM'),
                onPressed: () {
                  textItens.deleteItem(textItem);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
