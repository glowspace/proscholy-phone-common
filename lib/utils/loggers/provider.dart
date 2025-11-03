import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:logging/logging.dart';

final _logger = Logger('PROVIDER_OBSERVER');

final class ProviderLogger extends ProviderObserver {
  @override
  void didAddProvider(ProviderObserverContext context, Object? value) {
    _logger.info('added provider: ${_describeProvider(context.provider)} with value: ${_describeValue(value)}');
  }

  @override
  void didUpdateProvider(ProviderObserverContext context, Object? previousValue, Object? newValue) {
    _logger.info('updated provider: ${_describeProvider(context.provider)} with value: ${_describeValue(newValue)}');
  }

  @override
  void didDisposeProvider(ProviderObserverContext context) {
    _logger.info('disposed provider: ${_describeProvider(context.provider)}');
  }

  String _describeProvider(ProviderBase provider) {
    if (provider.argument is List) return '${provider.runtimeType}(${provider.argument.runtimeType})';

    if (provider.argument != null) return '${provider.runtimeType}(${provider.argument})';

    return '${provider.runtimeType}';
  }

  String _describeValue(Object? value) {
    return value is List ? value.runtimeType.toString() : value.toString();
  }
}
