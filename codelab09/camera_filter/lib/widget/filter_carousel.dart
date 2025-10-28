import 'package:flutter/material.dart';
import 'filter_selector.dart';

class PhotoFilterCarousel extends StatefulWidget {
  final String imagePath;
  const PhotoFilterCarousel({super.key, required this.imagePath});

  @override
  State<PhotoFilterCarousel> createState() => _PhotoFilterCarouselState();
}

class _PhotoFilterCarouselState extends State<PhotoFilterCarousel> {
  final _filters = [
    Colors.white,
    ...List.generate(
      Colors.primaries.length,
      (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
    )
  ];

  final _filterColor = ValueNotifier<Color>(Colors.white);

  void _onFilterChanged(Color value) {
    _filterColor.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        children: [
          Positioned.fill(
            child: ValueListenableBuilder<Color>(
              valueListenable: _filterColor,
              builder: (context, color, _) {
                return Container(
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.3),
                    backgroundBlendMode: BlendMode.color,
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FilterSelector(
              onFilterChanged: _onFilterChanged,
              filters: _filters,
            ),
          ),
        ],
      ),
    );
  }
}
