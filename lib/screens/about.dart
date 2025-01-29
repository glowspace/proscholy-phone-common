import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:proscholy_common/components/custom/back_button.dart';
import 'package:proscholy_common/constants.dart';
import 'package:proscholy_common/links.dart';
import 'package:proscholy_common/routing/safe_area_wrapper.dart';
import 'package:proscholy_common/utils/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final textStyle = theme.textTheme.bodyMedium;
    final highlightedStyle = textStyle?.copyWith(color: theme.colorScheme.primary);
    final boldStyle = textStyle?.copyWith(fontWeight: FontWeight.bold);

    final linkOpener = TapGestureRecognizer()..onTap = () => launch('https://$baseUrl');

    return SafeAreaWrapper(
      child: Scaffold(
        backgroundColor: theme.colorScheme.background,
        appBar: AppBar(leading: const CustomBackButton(), title: const Text('O projektu')),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: RichText(
              text: TextSpan(
                text: 'Zpěvník ',
                style: textStyle,
                children: [
                  TextSpan(text: 'ProScholy.cz', style: highlightedStyle, recognizer: linkOpener),
                  TextSpan(
                    text:
                        ', který přichází na${unbreakableSpace}pomoc všem scholám, křesťanským kapelám, společenstvím a${unbreakableSpace}všem, kdo se chtějí modlit hudbou!\n\nProjekt vzniká se svolením ',
                    style: textStyle,
                  ),
                  TextSpan(text: 'České biskupské konference', style: boldStyle),
                  TextSpan(
                    text:
                        '.\n\nDalší informace o${unbreakableSpace}stavu a${unbreakableSpace}rozvoji projektu naleznete na$unbreakableSpace',
                    style: textStyle,
                  ),
                  TextSpan(text: 'https://$baseUrl', style: highlightedStyle, recognizer: linkOpener),
                  TextSpan(text: '.', style: textStyle),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
