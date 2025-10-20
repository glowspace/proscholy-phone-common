import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:proscholy_common/components/highlightable_widget.dart';
import 'package:proscholy_common/components/section.dart';
import 'package:proscholy_common/constants.dart';
import 'package:proscholy_common/links.dart';
import 'package:proscholy_common/providers/app_dependencies.dart';
import 'package:proscholy_common/providers/svgs.dart';
import 'package:proscholy_common/utils/data.dart';
import 'package:proscholy_common/utils/extensions/async_snapshot.dart';
import 'package:proscholy_common/utils/extensions/build_context.dart';
import 'package:proscholy_common/utils/url_launcher.dart';
import 'package:proscholy_common/views/app_dependencies.dart';
import 'package:proscholy_common/views/song_lyric.dart';

class UpdateSection extends StatefulWidget {
  const UpdateSection({super.key});

  @override
  State<UpdateSection> createState() => _UpdateSectionState();
}

class _UpdateSectionState extends State<UpdateSection> {
  bool _isHidden = false;

  late final _updateFuture = update(context.providers.read(appDependenciesProvider));

  @override
  Widget build(BuildContext context) {
    if (!shouldUpdate(context.providers.read(appDependenciesProvider))) return const SizedBox();

    return FutureBuilder(
      future: _updateFuture,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          log(
            'error during data update',
            name: 'UPDATE_SECTION',
            error: snapshot.error,
            stackTrace: snapshot.stackTrace,
            level: 1000,
          );
        }

        final theme = Theme.of(context);

        final updatedSongLyrics = snapshot.data
                ?.where((songLyric) =>
                    songLyric.shouldAppearToUser || context.providers.read(svgProvider(songLyric.id)).isNotEmpty)
                .toList() ??
            [];

        final isHidden = _isHidden || (!snapshot.isLoading && !snapshot.hasError && updatedSongLyrics.isEmpty);

        final title = snapshot.isLoading
            ? 'Probíhá stahování písní'
            : snapshot.hasError
                ? 'Při aktualizaci nastala chyba'
                : 'Počet aktualizovaných písní: ${updatedSongLyrics.length}';

        final version = context.providers.read(appDependenciesProvider).currentVersion;
        final platform = theme.platform == TargetPlatform.iOS ? 'iOS' : 'android';
        final url = 'https://$platform.$baseUrl/v$version';

        final description = Uri.encodeComponent('Chyba: ${snapshot.error}\n\nStackTrace: ${snapshot.stackTrace}');

        return AnimatedCrossFade(
          crossFadeState: isHidden ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: kDefaultAnimationDuration,
          firstChild: const SizedBox(),
          secondChild: Section(
            padding: const EdgeInsets.all(kDefaultPadding),
            margin: const EdgeInsets.symmetric(vertical: 2 / 3 * kDefaultPadding),
            children: [
              Row(children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: theme.textTheme.bodyMedium),
                      if (snapshot.isDone && snapshot.hasData)
                        HighlightableWidget(
                          foregroundColor: theme.colorScheme.primary,
                          padding: const EdgeInsets.only(top: 2 / 3 * kDefaultPadding),
                          onTap: () => context.push('/updated_song_lyrics', arguments: updatedSongLyrics),
                          child: const Text('Zobrazit'),
                        ),
                      if (snapshot.isDone && snapshot.hasError)
                        HighlightableWidget(
                          foregroundColor: red,
                          padding: const EdgeInsets.only(top: 2 / 3 * kDefaultPadding),
                          onTap: () => launch(
                              '$reportUrl?customfield_10056=$url&summary=Chyba při aktualizaci písní&description=$description'),
                          child: const Text('Nahlásit chybu'),
                        ),
                    ],
                  ),
                ),
                if (snapshot.isDone)
                  HighlightableWidget(
                    onTap: () => setState(() => _isHidden = true),
                    icon: const Icon(Icons.close),
                  )
              ]),
              if (snapshot.isLoading)
                Container(
                  padding: const EdgeInsets.only(top: kDefaultPadding / 2),
                  child: const LinearProgressIndicator(),
                ),
            ],
          ),
        );
      },
    );
  }
}
