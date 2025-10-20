import 'package:flutter/material.dart';
import 'package:proscholy_common/components/highlightable_widget.dart';
import 'package:proscholy_common/components/section.dart';
import 'package:proscholy_common/constants.dart';
import 'package:proscholy_common/links.dart';
import 'package:proscholy_common/models/generated/objectbox.g.dart';
import 'package:proscholy_common/models/news_item.dart';
import 'package:proscholy_common/providers/app_dependencies.dart';
import 'package:proscholy_common/utils/extensions/build_context.dart';
import 'package:proscholy_common/utils/extensions/store.dart';
import 'package:proscholy_common/utils/url_launcher.dart';

const double _newsItemHeight = 32;

class NewsSection extends StatefulWidget {
  const NewsSection({super.key});

  @override
  State<NewsSection> createState() => _NewsSectionState();
}

class _NewsSectionState extends State<NewsSection> {
  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final store = context.providers.read(appDependenciesProvider).store;

    return StreamBuilder(
        stream: store.watchQuery(condition: NewsItem_.expiresAt.greaterOrEqual(DateTime.now().millisecondsSinceEpoch)),
        builder: (_, snapshot) {
          final newsItems = snapshot.data ?? [];

          if (newsItems.isEmpty) return const SizedBox();

          return Section(
            insideTitle: 'NOVINKY',
            insideTitleIcon: Icons.info_outline,
            insideTitleIconColor: yellow,
            padding: const EdgeInsets.all(kDefaultPadding).copyWith(bottom: kDefaultPadding / 2),
            margin: const EdgeInsets.symmetric(vertical: 2 / 3 * kDefaultPadding),
            children: [
              SizedBox(
                height: _newsItemHeight,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: newsItems.length,
                  itemBuilder: (_, index) => HighlightableWidget(
                    padding: EdgeInsets.zero,
                    onTap: newsItems[index].hasLink ? () => launch(newsItems[index].preparedLink) : null,
                    child: Row(children: [
                      Expanded(child: Text(newsItems[index].text, maxLines: 1, overflow: TextOverflow.ellipsis)),
                      if (newsItems[index].hasLink)
                        const Padding(
                          padding: EdgeInsets.only(left: kDefaultPadding / 2),
                          child: Icon(Icons.open_in_new, size: 20),
                        )
                    ]),
                  ),
                ),
              ),
              if (newsItems.isNotEmpty)
                Row(children: [
                  for (int i = 0; i < newsItems.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: HighlightableWidget(
                        highlightBackground: true,
                        onTap: () => _pageController.animateToPage(i,
                            duration: kDefaultAnimationDuration, curve: Curves.easeInOut),
                        child: ListenableBuilder(
                          listenable: _pageController,
                          builder: (_, __) => Container(
                            margin: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                            width: 24,
                            height: 2,
                            color: yellow.withAlpha((_pageController.page?.round() ?? 0) == i ? 0xff : 0x40),
                          ),
                        ),
                      ),
                    ),
                ]),
            ],
          );
        });
  }
}

extension _NewsItemView on NewsItem {
  bool get hasLink => link.isNotEmpty;

  String get preparedLink => link.startsWith('/') ? 'https://$baseUrl$link' : link;
}
