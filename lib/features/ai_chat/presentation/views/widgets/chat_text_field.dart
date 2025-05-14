import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class ChatTextField extends StatefulWidget {
  final VoidCallback onSendPressed;
  final FocusNode? focusNode;
  final TextEditingController? textEditingController;

  const ChatTextField(
      {super.key,
      required this.onSendPressed,
      this.focusNode,
      this.textEditingController});

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  late final TextEditingController _internalController;
  late final FocusNode _internalFocusNode;
  bool _hasText = false;
  final double _minHeight = 50;
  final double _maxHeight = 150;
  int _previousLineCount = 1;

  @override
  void initState() {
    super.initState();
    _internalController =
        widget.textEditingController ?? TextEditingController();
    _internalFocusNode = widget.focusNode ?? FocusNode();

    _internalController.addListener(_updateTextState);
  }

  @override
  void dispose() {
    super.dispose();
    _internalController.removeListener(_updateTextState);
    if (widget.textEditingController == null) _internalController.dispose();
    if (widget.focusNode == null) _internalFocusNode.dispose();
  }

  void _updateTextState() {
    setState(() {
      _hasText = _internalController.text.trim().isNotEmpty;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: _minHeight,
        maxHeight: _maxHeight,
      ),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  maxLines: null,
                  minLines: 1,
                  onChanged: (text) {
                    final lineCount = '\n'.allMatches(text).length + 1;
                    if(lineCount != _previousLineCount){
                      setState(() {
                        _previousLineCount = lineCount;
                      });
                    }
                  },
                  focusNode: _internalFocusNode,
                  controller: _internalController,
                  textInputAction: TextInputAction.send,
                  onSubmitted: (_) => widget.onSendPressed,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      hintText: 'Ask AI.....',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(30),
                      )),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: _hasText ? AppColors.primary1 : AppColors.primary1.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: IconButton(
                  onPressed: _hasText ? widget.onSendPressed : null,
                  icon: const Icon(
                    Icons.arrow_upward,
                    color: AppColors.white,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
