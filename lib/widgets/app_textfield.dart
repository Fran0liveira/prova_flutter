import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppTextField extends StatefulWidget {
  IconData? icon;
  TextEditingController? controller;
  String? label;
  String? Function(String? value)? validator;
  bool? password;
  String? hint;
  TextAlign? textAlign;
  TextStyle? textStyle;
  void Function(String)? onFieldSubmitted;
  FocusNode? focusNode;

  AppTextField({
    this.focusNode,
    this.icon,
    this.controller,
    this.label,
    this.validator,
    this.password,
    this.hint,
    this.textAlign,
    this.textStyle,
    this.onFieldSubmitted,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.label != null
            ? Row(
                children: [
                  Text(
                    widget.label!,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              )
            : Container(),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          focusNode: widget.focusNode,
          onFieldSubmitted: widget.onFieldSubmitted,
          obscureText: widget.password ?? false,
          enableSuggestions:
              widget.password == null || widget.password == false,
          autocorrect: widget.password == null || widget.password == false,
          textAlign: widget.textAlign ?? TextAlign.left,
          validator: widget.validator,
          style: widget.textStyle,
          decoration: InputDecoration(
            hintText: widget.hint,
            prefixIcon: widget.icon != null
                ? Icon(
                    widget.icon,
                    color: Colors.black,
                  )
                : null,
            filled: true,
            hintStyle: widget.textStyle,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            errorStyle: TextStyle(
              color: Colors.orange,
              fontSize: 15,
            ),
            errorMaxLines: 5,
          ),
          inputFormatters: widget.password == null || widget.password == false
              ? []
              : [FilteringTextInputFormatter.allow(RegExp("[0-9 a-z A-Z]"))],
          controller: widget.controller,
        ),
      ],
    );
  }
}
