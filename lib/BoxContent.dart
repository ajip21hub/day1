import 'package:flutter/material.dart';

/// A small, reusable widget that displays a circular image with a gradient
/// ring and two text fields to the right. Designed to be used as an
/// individual grid/list item.
class BoxContent extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final double imageSize;

  const BoxContent({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    this.imageSize = 64.0,
  }) : super(key: key);

  @override
  State<BoxContent> createState() => _BoxContentState();
}

class _BoxContentState extends State<BoxContent> {
  @override
  Widget build(BuildContext context) {
    final double outerSize = widget.imageSize;

    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        // borderRadius: BorderRadius.circular(12.0),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.05),
        //     blurRadius: 6,
        //     offset: const Offset(0, 3),
        //   ),
        // ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Gradient circular image with a small inner padding
          Container(
            width: outerSize,
            height: outerSize,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              // gradient: const LinearGradient(
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              //   colors: [Color(0xFF6D0EB5), Color(0xFF4059F1)],
              // ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Container(
              child: Image.network(
                widget.imageUrl,
                width: outerSize - 6,
                height: outerSize - 6,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey.shade200,
                  alignment: Alignment.center,
                  child: const Icon(Icons.person, color: Colors.grey),
                ),
              ),
            ),
          ),
          Text(
            widget.title,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          // const SizedBox(height: 4.0),
          Text(
            widget.subtitle,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
