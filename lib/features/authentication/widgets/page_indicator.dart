import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
    required this.isOnDesktopAndWeb,
    this.tabColor = Colors.white,
    this.selectedTabColor = Colors.white,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;
  final bool isOnDesktopAndWeb;
  final Color tabColor;
  final Color selectedTabColor;

  @override
  Widget build(BuildContext context) {
    if (!isOnDesktopAndWeb) {
      return const SizedBox.shrink();
    }
    // final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TabPageSelector(
        controller: tabController,
        color: tabColor.withOpacity(0.5),
        selectedColor: selectedTabColor,
      ),
    );
  }
}
