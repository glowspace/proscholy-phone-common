import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:proscholy_common/components/custom/close_button.dart';
import 'package:proscholy_common/components/highlightable_widget.dart';
import 'package:proscholy_common/components/navigation/scaffold.dart';
import 'package:proscholy_common/constants.dart';
import 'package:proscholy_common/models/custom_text.dart';
import 'package:proscholy_common/providers/app_dependencies.dart';
import 'package:proscholy_common/providers/playlists.dart';
import 'package:proscholy_common/utils/extensions.dart';

class CustomTextEditScreen extends StatefulWidget {
  final CustomText? customText;

  const CustomTextEditScreen({super.key, this.customText});

  @override
  State<CustomTextEditScreen> createState() => _CustomTextEditScreenState();
}

class _CustomTextEditScreenState extends State<CustomTextEditScreen> {
  late final _nameController = TextEditingController(text: widget.customText?.name);

  late final _controller = QuillController(
    document: _deserializeMarkdownToDocument(widget.customText?.content ?? ''),
    selection: const TextSelection.collapsed(offset: 0),
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomScaffold(
      appBar: AppBar(
        leading: const CustomCloseButton(),
        title: TextField(
          controller: _nameController,
          style: theme.appBarTheme.titleTextStyle,
          autofocus: true,
          decoration: const InputDecoration(border: InputBorder.none, hintText: 'Název'),
        ),
        actions: [
          ValueListenableBuilder<TextEditingValue>(
            valueListenable: _nameController,
            builder: (_, value, __) => HighlightableWidget(
              onTap: () => _editOrPop(value.text),
              padding: const EdgeInsets.symmetric(horizontal: 1.5 * kDefaultPadding),
              isEnabled: value.text.isNotEmpty,
              icon: const Icon(Icons.check),
            ),
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: QuillSimpleToolbar(
              controller: _controller,
              config: QuillSimpleToolbarConfig(
                showClearFormat: false,
                showCodeBlock: false,
                showFontFamily: false,
                showFontSize: false,
                showInlineCode: false,
                showQuote: false,
                showSearchButton: false,
                showSubscript: false,
                showSuperscript: false,
                showBackgroundColorButton: false,
              ),
            ),
          ),
          const Divider(),
          Expanded(
            child: QuillEditor.basic(
              controller: _controller,
              config: QuillEditorConfig(
                padding: EdgeInsets.symmetric(horizontal: 1.5 * kDefaultPadding, vertical: kDefaultPadding),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  void _editOrPop(String name) {
    final CustomText customText;

    if (widget.customText == null) {
      customText = context.providers
          .read(playlistsProvider.notifier)
          .createCustomText(name: name, content: _serializeDocumentToMarkdown(_controller.document) ?? '');
    } else {
      customText =
          widget.customText!.copyWith(name: name, content: _serializeDocumentToMarkdown(_controller.document) ?? '');

      context.providers.read(appDependenciesProvider).store.box<CustomText>().put(customText);
    }

    context.pop(customText);
  }

  String? _serializeDocumentToMarkdown(Document document) {
    return jsonEncode(document.toDelta().toJson()).toString();
  }

  Document _deserializeMarkdownToDocument(String serializedDelta) {
    if (serializedDelta.isEmpty) return Document();

    final value = jsonDecode(serializedDelta);

    return Document.fromJson(value);
  }
}
