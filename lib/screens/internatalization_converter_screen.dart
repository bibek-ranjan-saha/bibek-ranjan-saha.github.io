import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/converter_util.dart';

class InternationalizationConverterScreen extends StatefulWidget {
  static const String route = '/converter';

  const InternationalizationConverterScreen({super.key});

  @override
  State<InternationalizationConverterScreen> createState() =>
      _InternationalizationConverterScreenState();
}

class _InternationalizationConverterScreenState
    extends State<InternationalizationConverterScreen> {
  late TextEditingController _textEditingController;
  late TextEditingController _classNameEditingController;
  String code = '';
  String error = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _textEditingController = TextEditingController();
    _classNameEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _classNameEditingController,
              validator: (txt) {
                if (txt == null || txt.isEmpty) {
                  return "class name can not be empty";
                }
                if (!RegExp(r'^[A-Za-z]*$').hasMatch(txt.trim())) {
                  return "Class name must not contain spaces,special "
                      "characters and numbers";
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "Enter Class Name",
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
            Expanded(
              child: TextFormField(
                maxLines: null,
                expands: true,
                controller: _textEditingController,
                validator: (txt) {
                  if (txt == null || txt.isEmpty) {
                    return "JSON is empty";
                  }
                  try {
                    final Map<String, dynamic> json = jsonDecode(txt);
                    if (json.keys.isEmpty) {
                      return "Must have least 1 word";
                    }
                    if (json.keys.any((element) => element.isEmpty)) {
                      return "Key must not be empty String";
                    }
                    if (json.values
                        .any((element) => element.runtimeType != String)) {
                      return "Must contain only Strings";
                    }
                    if (json.keys.any((element) =>
                        !(RegExp(r'^[A-Za-z_0-9]*$').hasMatch(element)))) {
                      return "Invalid keys present please remove any space or"
                          " special characters";
                    }
                  } catch (e) {
                    if (e is FormatException) {
                      return "JSON is invalid $e";
                    } else {
                      return "Something went wrong $e";
                    }
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    hintText: "Enter Json here", filled: true),
              ),
            ),
            if (error.isNotEmpty)
              Text(
                error,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: Colors.red),
              ),
            InkWell(
              onTap: () {
                if (_formKey.currentState?.validate() ?? false) {
                  String source = _textEditingController.text;
                  String className = _classNameEditingController.text.trim();
                  String output =
                      ConverterUtil.convertFromJson(source, className);
                  if (output.isNotEmpty) {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          title: const Text("Converted JSON"),
                          content: SelectableText(output),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  Clipboard.setData(
                                      ClipboardData(text: output));
                                },
                                child: const Text("copy")),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("back")),
                          ],
                        );
                      },
                    );
                  } else {
                    setState(() {
                      error = "Converter returned empty String!!";
                    });
                  }
                }
              },
              child: Container(
                height: 56,
                width: size.width,
                color: Colors.blue,
                child: const Center(
                  child: Text("Convert"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _classNameEditingController.dispose();
    super.dispose();
  }
}
