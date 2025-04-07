import 'package:flutter/material.dart';
import 'package:matchingsport/res/app.context.extension.dart';
import 'package:matchingsport/res/resources.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
    required this.isOnDesktopAndWeb,
    this.tabColor,
    this.selectedTabColor,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;
  final bool isOnDesktopAndWeb;
  final Color? tabColor;
  final Color? selectedTabColor;

  @override
  Widget build(BuildContext context) {
    final Resources resources = context.resources;
    final Color tabColor = this.tabColor ?? resources.colors.whiteColor;
    final Color selectedTabColor =
        this.selectedTabColor ?? resources.colors.whiteColor;

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
