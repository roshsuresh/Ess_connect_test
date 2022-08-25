import 'package:flutter/material.dart';

class TextWrapper extends StatefulWidget {
  const TextWrapper({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  _TextWrapperState createState() => _TextWrapperState();
}

class _TextWrapperState extends State<TextWrapper>
    with TickerProviderStateMixin {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: ConstrainedBox(
              constraints: isExpanded
                  ? const BoxConstraints()
                  : const BoxConstraints(maxHeight: 45),
              child: Text(
                widget.text,
                style: const TextStyle(fontSize: 15),
                softWrap: true,
                overflow: TextOverflow.fade,
              ))),
      isExpanded
          ? OutlinedButton.icon(
              icon: const Icon(
                Icons.arrow_upward,
                size: 12,
              ),
              label: const Text(
                'Read less',
                style: TextStyle(fontSize: 12),
              ),
              onPressed: () => setState(() => isExpanded = false))
          : TextButton.icon(
              icon: const Icon(
                Icons.arrow_downward,
                size: 12,
              ),
              label: const Text(
                'Read more',
                style: TextStyle(fontSize: 12),
              ),
              onPressed: () => setState(() => isExpanded = true))
    ]);
  }
}
