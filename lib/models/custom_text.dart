import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';
import 'package:proscholy_common/models/model.dart';

part 'generated/custom_text.freezed.dart';

@freezed
sealed class CustomText extends Model with _$CustomText, ContentItem, RecentItem {
  const CustomText._();

  @Entity(realClass: CustomText)
  const factory CustomText({
    @Id(assignable: true) required int id,
    required String name,
    required String content,
  }) = _CustomText;
}
