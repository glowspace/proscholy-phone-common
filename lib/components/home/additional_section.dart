import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proscholy_common/components/highlightable_widget.dart';
import 'package:proscholy_common/components/icon_item.dart';
import 'package:proscholy_common/components/section.dart';
import 'package:proscholy_common/constants.dart';
import 'package:proscholy_common/links.dart';
import 'package:proscholy_common/providers/app_dependencies.dart';
import 'package:proscholy_common/utils/extensions.dart';
import 'package:proscholy_common/utils/url_launcher.dart';

class AdditionalSection extends StatelessWidget {
  const AdditionalSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final version = context.providers.read(appDependenciesProvider).packageInfo.version;
    final platform = theme.platform == TargetPlatform.iOS ? 'iOS' : 'android';
    final url = 'https://$platform.$baseUrl/v$version';

    return Section(
      outsideTitle: 'Další možnosti',
      outsideTitleLarge: true,
      margin: const EdgeInsets.symmetric(vertical: 2 / 3 * kDefaultPadding),
      children: [
        // HighlightableWidget(
        //   highlightBackground: true,
        //   padding: const EdgeInsets.all(kDefaultPadding),
        //   onTap: () => context.push('/user'),
        //   child: const IconItem(icon: Icons.person, text: 'Uživatelský účet', trailingtext: 'Patrik Dobiáš'),
        // ),
        // const Divider(),
        HighlightableWidget(
          highlightBackground: true,
          padding: const EdgeInsets.all(kDefaultPadding),
          onTap: () => context.push('/settings'),
          child: Consumer(
            builder: (_, ref, __) => IconItem(
              icon: Icons.settings,
              text: 'Nastavení aplikace',
              trailingtext: ref.read(appDependenciesProvider).packageInfo.version,
            ),
          ),
        ),
        const Divider(),
        HighlightableWidget(
          highlightBackground: true,
          padding: const EdgeInsets.all(kDefaultPadding),
          onTap: () => launch('https://$baseUrl'),
          child: const IconItem(icon: Icons.language, text: 'Webová verze', trailingIcon: Icons.open_in_new),
        ),
        const Divider(),
        if (isZP) ...[
          HighlightableWidget(
            highlightBackground: true,
            padding: const EdgeInsets.all(kDefaultPadding),
            onTap: () => launch(theme.platform.isIos ? feedbackIOSUrl : feedbackAndroidUrl),
            child: const IconItem(icon: Icons.feedback, text: 'Zpětná vazba', trailingIcon: Icons.open_in_new),
          ),
          const Divider(),
          HighlightableWidget(
            highlightBackground: true,
            padding: const EdgeInsets.all(kDefaultPadding),
            onTap: () => launch(addSongUrl),
            child: const IconItem(icon: Icons.add, text: 'Přidat píseň', trailingIcon: Icons.open_in_new),
          ),
          const Divider(),
          HighlightableWidget(
            highlightBackground: true,
            padding: const EdgeInsets.all(kDefaultPadding),
            onTap: () => launch(dontaionsUrl),
            child: const IconItem(
              icon: Icons.favorite,
              text: 'Darovat',
              trailingIcon: Icons.open_in_new,
              iconColor: red,
            ),
          ),
        ],
        if (isEZ || isEK)
          HighlightableWidget(
            highlightBackground: true,
            padding: const EdgeInsets.all(kDefaultPadding),
            onTap: () => launch('$reportUrl?customfield_10056=$url'),
            child: const IconItem(icon: Icons.feedback, text: 'Nahlásit chybu', trailingIcon: Icons.open_in_new),
          ),
      ],
    );
  }
}
