import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/core/theme/app_colors.dart';
import 'package:marketplace_musical_instruments_app/generated/l10n.dart';

class ReadMoreText extends StatefulWidget {
  final String text;
  final int maxLines;

  const ReadMoreText({
    super.key,
    required this.text,
    this.maxLines = 2,
  });

  @override
  State<ReadMoreText> createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool _isReadMore = true;
  bool _isOverflowing = false;

  @override
  void didChangeDependencies() {
    _checkIfTextOverflow();
    super.didChangeDependencies();
  }

  void _readTextMore() {
    setState(() {
      _isReadMore = !_isReadMore;
    });
  }

  void _checkIfTextOverflow() {
    print('It is work');
    final textSpan = TextSpan(
      text: widget.text,
      style: DefaultTextStyle.of(context).style,
    );
    final textPainter = TextPainter(
      text: textSpan,
      maxLines: widget.maxLines,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(maxWidth: MediaQuery.of(context).size.width);
    setState(() {
      _isOverflowing = textPainter.didExceedMaxLines;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(
          widget.text,
          maxLines: _isReadMore ? widget.maxLines : null,
          overflow: _isReadMore ? TextOverflow.ellipsis : TextOverflow.fade,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        if (_isOverflowing)
          GestureDetector(
            onTap: _readTextMore,
            child: Text(
              _isReadMore ? S.of(context).readMore : S.of(context).readLess,
              style: TextStyle(
                color: const Color(AppColors.kBlue),
                fontWeight: FontWeight.w500,
                fontSize: MediaQuery.textScalerOf(context).scale(17),
              ),
            ),
          ),
      ],
    );
  }
}
