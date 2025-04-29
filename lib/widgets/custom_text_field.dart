import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {

  TextEditingController? textEditingController;
  IconData? iconData;
  String? hintString;
  bool? isObscure= true;
  bool? enabled;



   CustomTextField({super.key, this.hintString, this.iconData, this.textEditingController, this.isObscure ,this.enabled});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
       padding: const EdgeInsets.all(8),
       margin: const EdgeInsets.all(12),
        child: TextFormField(
          style: const TextStyle(
            color: Colors.black87,
          ),
          enabled: widget.enabled,
          controller: widget.textEditingController,
          obscureText: widget.isObscure!,
          decoration: InputDecoration(
            hintText: widget.hintString,
            hintStyle: const TextStyle(
              color: Colors.black87,
            ),
            prefixIcon: Icon(
              widget.iconData,
              color: Colors.blueAccent,
            ),
            border: InputBorder.none,
          ),
        ),

    );
  }
}