import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';
import 'package:proscholy_common/models/model.dart';

part 'generated/user_text.freezed.dart';

@freezed
sealed class UserText extends Model with _$UserText, ContentItem, RecentItem {
  const UserText._();

  @Entity(realClass: UserText)
  const factory UserText({
    @Id(assignable: true) @Default(0) int id,
    required String name,
    required String content,
  }) = _UserText;

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other is UserText && id == other.id && name == other.name);
  }
}
