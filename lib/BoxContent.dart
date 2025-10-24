import 'package:flutter/material.dart';

/// A small, reusable widget that displays a circular image with a gradient
/// ring and two text fields to the right. Designed to be used as an
/// individual grid/list item.
class BoxContent extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final double? imageSize;

  const BoxContent({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    this.imageSize = 200.0,
  }) : super(key: key);

  @override
  State<BoxContent> createState() => _BoxContentState();
}

class _BoxContentState extends State<BoxContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: double.infinity, // Make container take full width
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Gradient circular image with a small inner padding
          Container(
            width: widget.imageSize ?? double.infinity,
            height: widget.imageSize ?? double.infinity,
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
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Image.network(
                widget.imageUrl,
                width: widget.imageSize ?? double.infinity,
                height: widget.imageSize ?? double.infinity,
                fit: BoxFit.fill,
                loadingBuilder: (context, child, loadingProgress) {
                  // Debug: Log image loading state
                  print('Loading image from URL: ${widget.imageUrl}');
                  if (loadingProgress == null) {
                    print('Image loaded successfully');
                    return child;
                  } else {
                    print(
                      'Image loading progress: ${(loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1) * 100).toStringAsFixed(1)}%',
                    );
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                            : null,
                        strokeWidth: 2,
                      ),
                    );
                  }
                },
                errorBuilder: (context, error, stackTrace) {
                  // Debug: Log image loading error
                  print('Error loading image from URL: ${widget.imageUrl}');
                  print('Error details: $error');
                  return Container(
                    color: Colors.grey.shade200,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.person, color: Colors.grey, size: 40),
                        const SizedBox(height: 8),
                        Text(
                          'Image failed to load',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
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
