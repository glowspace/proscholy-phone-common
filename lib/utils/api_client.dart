import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:proscholy_common/constants.dart';

final _dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

const String _apiLink = 'https://zpevnik.proscholy.cz/graphql';

const _newsQuery = '''
query {
  news_items(active: true) {
    id
    text
    link
    expires_at
  }
}''';

const _songLyricFields = '''
id
name
secondary_name_1
secondary_name_2
lyrics
${isEZ || isEK ? 'hymnology' : ''}
lang
lang_string
type_enum
is_arrangement
song {
  id
}
authors_pivot {
  pivot {
    author {
      id
    }
  }
}
tags {
  id
}
''';

const _updateQuery = '''
query(\$updated_after: DateTime!) {
  authors {
    id
    name
  }
  externals {
    id
    public_name
    url
    media_id
    media_type
    song_lyric {
      id
    }
  }
  songbooks {
    id
    name
    shortcut
    color
    color_text
    is_private
    records {
      pivot {
        id
            number
            ${isEZ || isEK ? 'song_name' : ''}
        song_lyric {
          id
        }
        songbook {
          id
        }
      }
    }
  }
  songs {
      id
      name
  }
  song_lyrics(updated_after: \$updated_after) {
    $_songLyricFields
  }
  tags_enum {
    id
    name
    type_enum
    song_lyrics_count
  }
}''';

const _songLyricIdsQuery = '''
query {
  song_lyrics {
    id
  }
}
''';

const _songLyricQuery = '''
query(\$id: ID!) {
  song_lyric(id: \$id) {
    $_songLyricFields
  }
}''';

class ApiClient {
  late final GraphQLClient graphQLClient = GraphQLClient(
    link: HttpLink(_apiLink),
    cache: GraphQLCache(),
    // big enough timeout, so it hopefully does not timeout often
    queryRequestTimeout: const Duration(seconds: 60),
  );

  Future<Map<String, dynamic>> getNews() async {
    return _query(QueryOptions(document: gql(_newsQuery)));
  }

  Future<Map<String, dynamic>> getData(DateTime updatedAfter) async {
    return _query(QueryOptions(document: gql(_updateQuery), variables: {'updated_after': _dateFormat.format(updatedAfter)}));
  }

  Future<Map<String, dynamic>> getSongLyricIds() async {
    return _query(QueryOptions(document: gql(_songLyricIdsQuery)));
  }

  Future<Map<String, dynamic>> getSongLyric(int id) async {
    return _query(QueryOptions(document: gql(_songLyricQuery), variables: {'id': id}));
  }

  Future<List<int>> getSvgs(DateTime updatedAfter) async {
    final response = await http
        .get(Uri.https('zpevnik.proscholy.cz', 'download-svgs', {'updated_after': _dateFormat.format(updatedAfter)}));

    return response.bodyBytes;
  }

  Future<Map<String, dynamic>> _query(QueryOptions options) async {
    final result = await graphQLClient.query(options);

    if (result.hasException) throw result.exception!;

    return result.data!;
  }
}
