import 'package:flutter/material.dart';
import 'package:matchingsport/features/authentication/widgets/page_indicator.dart';
import 'package:matchingsport/models/content_introduction_model.dart';
import 'package:matchingsport/res/app.context.extension.dart';
import 'package:matchingsport/res/resources.dart';

class LinearRecommendSport extends StatefulWidget {
  final List<ContentIntroductionModel> newsItems;

  const LinearRecommendSport({super.key, required this.newsItems});

  @override
  State<LinearRecommendSport> createState() => _LinearRecommendSportState();
}

class _LinearRecommendSportState extends State<LinearRecommendSport>
    with TickerProviderStateMixin {
  late PageController pageController;
  late TabController tabContronller;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    tabContronller =
        TabController(length: widget.newsItems.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
    tabContronller.dispose();
  }

  void onPageChanged(int value) {
    tabContronller.animateTo(value);
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final Resources resources = context.resources;

    return Column(
      children: [
        SizedBox(
          height: screenSize.height * 0.15,
          width: double.infinity,
          child: PageView.builder(
            itemCount: widget.newsItems.length,
            pageSnapping: true,
            controller: pageController,
            onPageChanged: (value) => onPageChanged(value),
            itemBuilder: (context, index) {
              final ContentIntroductionModel newsItem = widget.newsItems[index];

              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //title
                      Text(
                        newsItem.title,
                        style: TextStyle(
                          fontSize: resources.sizes.textLarge,
                          fontWeight: FontWeight.bold,
                          color: resources.colors.whiteColor,
                        ),
                      ),

                      const SizedBox(height: 15),

                      //content
                      Text(
                        newsItem.content,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: resources.sizes.textSmall,
                          color: resources.colors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        PageIndicator(
          tabController: tabContronller,
          currentPageIndex: 0,
          onUpdateCurrentPageIndex: (index) {},
          isOnDesktopAndWeb: true,
        ),
      ],
    );
  }
}
