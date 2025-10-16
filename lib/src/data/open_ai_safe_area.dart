import 'package:freezed_annotation/freezed_annotation.dart';

part 'open_ai_safe_area.freezed.dart';
part 'open_ai_safe_area.g.dart';

@freezed
abstract class OpenAiSafeArea with _$OpenAiSafeArea {
  factory OpenAiSafeArea({
    required OpenAiSafeAreaInsets insets,
  }) = _OpenAiSafeArea;

  factory OpenAiSafeArea.fromJson(Map<String, dynamic> json) =>
      _$OpenAiSafeAreaFromJson(json);
}

@freezed
abstract class OpenAiSafeAreaInsets with _$OpenAiSafeAreaInsets {
  factory OpenAiSafeAreaInsets({
    required double top,
    required double bottom,
    required double left,
    required double right,
  }) = _OpenAiSafeAreaInsets;

  factory OpenAiSafeAreaInsets.fromJson(Map<String, dynamic> json) =>
      _$OpenAiSafeAreaInsetsFromJson(json);
}
