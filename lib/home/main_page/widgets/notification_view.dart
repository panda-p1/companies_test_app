import 'package:flutter/material.dart';
import 'package:news_test_app/tools/dialog.dart';

class NotificationView extends StatelessWidget {
  final String? imagePath;
  final String description;
  final EdgeInsets? margin;
  const NotificationView({Key? key,
    this.imagePath,
    this.margin,
    required this.description,
  }) : super(key: key);

  String get _imagePath => imagePath ?? '';
  bool hasImage() => imagePath != null;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(20);
    return Container(
      height: 86,
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(255, 216, 60, 1),
            blurRadius: 7,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: () {
            InDevelopmentSimpleDialog.show(context);
          },
          child: Row(
            children: [
              if(hasImage())
                Image.asset(_imagePath),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Text(description,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
