import 'package:flutter_starterpack_jelly/utils/constanta.dart';
import 'package:flutter/material.dart';

class RoundedTextfield extends StatelessWidget {
  const RoundedTextfield({
    Key? key,
    this.hintText,
    this.colorField,
    this.colorIcon,
    this.prefixIcon,
    this.textInputType,
    this.textEditingController,
    this.textInputAction,
    this.onSubmit,
  }) : super(key: key);

  final String? hintText;
  final Color? colorField;
  final Color? colorIcon;
  final Icon? prefixIcon;
  final TextInputType? textInputType;
  final TextEditingController? textEditingController;
  final TextInputAction? textInputAction;
  final Function(String)? onSubmit;

  @override
  Widget build(BuildContext context) {
    return TextField(
        autofocus: false,
        style: kTextFieldTextStyle.copyWith(
          color: colorField,
        ),
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.white,
        decoration: kInputDecoration.copyWith(
          hintText: 'Search Words',
          prefixIcon: Icon(
            Icons.search,
            color: colorIcon,
          ),
          suffixIcon: textEditingController!.text.isNotEmpty
              ? IconButton(
                  onPressed: textEditingController!.clear,
                  icon: Icon(
                    Icons.clear,
                    color: colorIcon,
                  ),
                )
              : null,
        ),
        textInputAction: textInputAction,
        controller: textEditingController,
        onSubmitted: onSubmit);
  }
}
