import 'package:flutter/material.dart';
import 'package:matchingsport/features/authentication/widgets/page_indicator.dart';
import 'package:matchingsport/models/content_login_register_model.dart';
import 'package:matchingsport/res/app.context.extension.dart';
import 'package:matchingsport/res/resources.dart';

class LinearLoginRegisterSport extends StatefulWidget {
  final List<ContentLoginRegisterModel> newsItems;

  const LinearLoginRegisterSport({super.key, required this.newsItems});

  @override
  State<LinearLoginRegisterSport> createState() => _LinearLoginRegisterSport();
}

class _LinearLoginRegisterSport extends State<LinearLoginRegisterSport>
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
          height: screenSize.height * 0.3,
          width: double.infinity,
          child: PageView.builder(
            itemCount: widget.newsItems.length,
            pageSnapping: true,
            controller: pageController,
            onPageChanged: (value) => onPageChanged(value),
            itemBuilder: (context, index) {
              final ContentLoginRegisterModel newsItem =
                  widget.newsItems[index];

              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //content
                      Text(
                        newsItem.content,
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: resources.sizes.textSmall,
                          color: resources.colors.whiteColor,
                        ),
                      ),
                      const SizedBox(height: 15),

                      Row(
                        children: [
                          // Image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              newsItem.image,
                              width: 90,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),

                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // actor
                              Text(
                                newsItem.actor,
                                style: TextStyle(
                                  fontSize: resources.sizes.textNormal,
                                  fontWeight: FontWeight.bold,
                                  color: resources.colors.whiteColor,
                                ),
                              ),

                              const SizedBox(height: 5),

                              // sport
                              Text(
                                newsItem.sport,
                                style: TextStyle(
                                  fontSize: resources.sizes.textSmall,
                                  fontWeight: FontWeight.bold,
                                  color: resources.colors.whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ],
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
