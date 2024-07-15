import 'package:flutter/material.dart';
import 'package:mobile_project/app/controllers/sp_controller/your_library_controller.dart';

class YourLibraryUtils extends StatelessWidget {
  final YourLibraryController controller;

  const YourLibraryUtils({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            controller.openRecentSortBottomSheet();
          },
          child: const Row(
            children: [
              Icon(Icons.swap_vert),
              SizedBox(width: 8),
              Text(
                'Recent',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
        ValueListenableBuilder<bool>(
          valueListenable: controller.isGridViewNotifier,
          builder: (_, isGridView, __) {
            return GestureDetector(
              onTap: () {
                controller.isGridView.value = !isGridView;
                controller.isGridViewNotifier.value = !isGridView;
              },
              child: Icon(isGridView ? Icons.list : Icons.grid_view),
            );
          },
        ),
      ],
    );
  }
}
