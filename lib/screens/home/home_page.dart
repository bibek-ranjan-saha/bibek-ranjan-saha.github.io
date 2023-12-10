import 'package:Bibek/widgets/drawer.dart';
import 'package:Bibek/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../assets/images.dart';
import '../../constants/values.dart';

class MainPage extends StatelessWidget {
  static const String route = '/';
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        ValueListenableBuilder<Iterable<ItemPosition>>(
          valueListenable: itemPositionsListener.itemPositions,
          builder: (context, positions, child) {
            int min = 0;
            int max = 0;
            if (positions.isNotEmpty) {
              // Determine the first visible item by finding the item with the
              // smallest trailing edge that is greater than 0.  i.e. the first
              // item whose trailing edge in visible in the viewport.
              min = positions
                  .where(
                      (ItemPosition position) => position.itemTrailingEdge > 0)
                  .reduce((ItemPosition min, ItemPosition position) =>
                      position.itemTrailingEdge < min.itemTrailingEdge
                          ? position
                          : min)
                  .index;
              // Determine the last visible item by finding the item with the
              // greatest leading edge that is less than 1.  i.e. the last
              // item whose leading edge in visible in the viewport.
              max = positions
                  .where(
                      (ItemPosition position) => position.itemLeadingEdge < 1)
                  .reduce((ItemPosition max, ItemPosition position) =>
                      position.itemLeadingEdge > max.itemLeadingEdge
                          ? position
                          : max)
                  .index;
            }
            return TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 365),
              curve: Curves.easeInOut,
              tween: Tween<double>(
                begin: (min) / 6,
                end: (max + 1) / 6,
              ),
              builder: (context, value, _) => LinearProgressIndicator(
                minHeight: 6,
                value: value,
                backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              ),
            );
          },
        ),
        Expanded(
          child: Scaffold(
            backgroundColor: Colors.black,
            endDrawer: const CrazyDrawer(),
            appBar: AppBar(
              centerTitle: true,
              leading: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/b.png",
                      width: 35,
                      height: 35,
                      fit: BoxFit.contain,
                    ),
                    Container(
                      color: Colors.lightGreenAccent,
                      height: 10,
                      width: 10,
                    )
                  ],
                ),
              ),
              title: isWebMobile(size)
                  ? null
                  : const SingleChildScrollView(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          HeadText(
                            title: 'Home',
                            index: 0,
                          ),
                          HeadText(
                            title: 'About',
                            index: 1,
                          ),
                          HeadText(
                            title: 'Projects',
                            index: 2,
                          ),
                          HeadText(
                            title: 'Statistics',
                            index: 3,
                          ),
                          HeadText(
                            title: 'Experiments',
                            index: 4,
                          ),
                          HeadText(
                            title: 'Contacts',
                            index: 5,
                          ),
                        ],
                      ),
                    ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
            ),
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetAssets.backgroundImage),
                  fit: BoxFit.cover,
                  // colorFilter: ColorFilter.mode(
                  //     Colors.black.withOpacity(0.35), BlendMode.hue),
                ),
              ),
              child: ScrollablePositionedList.builder(
                itemCount: 6,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => pages[index],
                itemScrollController: itemScrollController,
                itemPositionsListener: itemPositionsListener,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
