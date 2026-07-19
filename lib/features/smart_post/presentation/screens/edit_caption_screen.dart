import 'package:flutter/material.dart';

class EditCaptionScreen extends StatefulWidget {
  const EditCaptionScreen({
    super.key,
    required this.initialCaption,
    required this.autofocus,
  });

  final String initialCaption;
  final bool autofocus;

  @override
  State<EditCaptionScreen> createState() => _EditCaptionScreenState();
}

class _EditCaptionScreenState extends State<EditCaptionScreen> {
  late final TextEditingController captionController;

  bool get isTextDirty {
    return captionController.text != widget.initialCaption;
  }

  bool get canSave {
    return isTextDirty && captionController.text.trim().isNotEmpty;
  }

  void handleTextChanged() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    captionController = TextEditingController(text: widget.initialCaption);

    captionController.addListener(handleTextChanged);
  }

  @override
  void dispose() {
    captionController
      ..removeListener(handleTextChanged)
      ..dispose();

    super.dispose();
  }

  void closeScreen() {
    Navigator.of(context).pop(widget.initialCaption);
  }

  void saveCaption() {
    if (captionController.text.trim() == "") {
      return;
    }
    Navigator.of(context).pop(captionController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 72,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF292929),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leadingWidth: 64,
        leading: IconButton(
          tooltip: 'Close',
          onPressed: closeScreen,
          icon: const Icon(Icons.close_rounded, size: 30),
        ),
        title: const Text(
          'Edit Caption',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SaveButton(isEnabled: canSave, onPressed: saveCaption),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
        child: TextField(
          controller: captionController,
          autofocus: widget.autofocus,
          expands: true,
          minLines: null,
          maxLines: null,
          textAlignVertical: TextAlignVertical.top,
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          cursorColor: const Color.fromARGB(255, 121, 207, 167),
          style: const TextStyle(
            color: Color.fromARGB(255, 62, 62, 62),
            fontSize: 16,
            height: 1.35,
            fontWeight: FontWeight.w400,
          ),
          decoration: const InputDecoration(
            hintText: 'Write your caption...',
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
    required this.isEnabled,
    required this.onPressed,
  });

  final bool isEnabled;

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: FilledButton(
        onPressed: isEnabled ? onPressed : null,
        style: FilledButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 126, 192, 134),
          disabledBackgroundColor: const Color.fromARGB(255, 202, 230, 206),
          foregroundColor: Colors.white,
          disabledForegroundColor: Colors.white,
          elevation: 0,
          padding: EdgeInsets.symmetric(horizontal: 16),
          shape: StadiumBorder(),
        ),
        child: Text(
          'Save',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
