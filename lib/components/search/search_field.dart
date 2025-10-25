import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proscholy_common/components/highlightable_widget.dart';
import 'package:proscholy_common/components/selected_displayable_item_arguments.dart';
import 'package:proscholy_common/constants.dart';
import 'package:proscholy_common/providers/song_lyrics_search.dart';
import 'package:proscholy_common/routing/arguments.dart';
import 'package:proscholy_common/theme.dart';
import 'package:proscholy_common/utils/extensions/brightness.dart';
import 'package:proscholy_common/utils/extensions/build_context.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({super.key});

  static InputDecoration inputDecoration(BuildContext context) {
    final theme = Theme.of(context);

    return InputDecoration(
      hintText: 'Název, číslo nebo část textu',
      hintStyle: theme.textTheme.titleMedium?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: theme.brightness.isLight ? lightIconColor : darkIconColor,
      ),
      filled: true,
      fillColor: theme.colorScheme.surface,
      isDense: true,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(kDefaultRadius),
      ),
      prefixIcon: Container(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Icon(Icons.search, color: theme.iconTheme.color),
      ),
      prefixIconConstraints: const BoxConstraints(),
      suffixIconConstraints: const BoxConstraints(),
      contentPadding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: inputDecoration(context),
      // disable pasting to search field on home screen, as it should only open search screen
      enableInteractiveSelection: false,
      readOnly: true,
      onTap: () => context.push('/search'),
    );
  }
}

class SearchField extends StatefulWidget {
  final bool showCancelButton;

  const SearchField({super.key, required this.showCancelButton});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late final TextEditingController _controller = TextEditingController(
    text: context.read(songLyricsSearchProvider).searchText,
  );

  late bool _showingClearButton = _controller.text.isNotEmpty;

  late final ProviderSubscription<String> _searchTextSubscription;

  @override
  void initState() {
    super.initState();

    _searchTextSubscription = context.listen(
      songLyricsSearchProvider.select((result) => result.searchText),
      (_, searchText) {
        if (searchText != _controller.text) {
          _controller.text = searchText;
          _showingClearButton = searchText.isNotEmpty;
        }
      },
    );
  }

  @override
  void dispose() {
    _searchTextSubscription.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final inputDecoration = HomeSearchField.inputDecoration(context).copyWith(
      fillColor: theme.brightness.isLight ? theme.scaffoldBackgroundColor : theme.colorScheme.surface,
      suffixIcon: _showingClearButton
          ? HighlightableWidget(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              onTap: _clear,
              icon: const Icon(Icons.clear),
            )
          : null,
    );

    return Padding(
      padding: widget.showCancelButton
          ? const EdgeInsets.only(left: kDefaultPadding) // cancel button has its padding on right
          : const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              autofocus: true,
              controller: _controller,
              decoration: inputDecoration,
              onChanged: _searchTextChanged,
              onSubmitted: (_) => _maybePushMatchedSonglyric(),
            ),
          ),
          if (widget.showCancelButton)
            HighlightableWidget(
              onTap: () => context.maybePop(),
              padding: const EdgeInsets.all(kDefaultPadding),
              textStyle: theme.textTheme.bodyMedium,
              foregroundColor: theme.colorScheme.primary,
              child: const Text('Zrušit'),
            ),
        ],
      ),
    );
  }

  void _clear() {
    _controller.clear();

    _searchTextChanged('');
  }

  void _searchTextChanged(String searchText) {
    if (_showingClearButton != searchText.isNotEmpty) setState(() => _showingClearButton = searchText.isNotEmpty);

    context.read(songLyricsSearchProvider.notifier).searchTextChanged(searchText);
  }

  void _maybePushMatchedSonglyric() {
    final matchedById = context.read(songLyricsSearchProvider).matchedById;

    if (matchedById == null) return;

    final arguments = ModalRoute.of(context)?.settings.arguments;
    final selectedDisplayableItemArgumentsNotifier = SelectedDisplayableItemArguments.of(context);

    if (arguments is SearchScreenArguments && arguments.shouldReturnSongLyric) {
      Navigator.of(context).pop(matchedById);
    } else if (selectedDisplayableItemArgumentsNotifier != null) {
      selectedDisplayableItemArgumentsNotifier.value = DisplayScreenArguments.songLyric(matchedById);
    } else {
      context.push('/display', arguments: DisplayScreenArguments.songLyric(matchedById, showSearchScreen: true));
    }
  }
}
