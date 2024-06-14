import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:sumangalam/core/model/failure.dart';
import 'package:sumangalam/core/utils/date_format_util.dart';

extension StringExentions on String? {
  // Either<Failure, T> asFailure<T>() => left(Failure(error: this!));

  bool get containsValidValue =>
      this != null && (this!.trim().isNotEmpty) && this!.trim() != 'null';

  bool get doesNotHaveValue => !containsValidValue;

  String get valueOrEmpty => this ?? '';

  Either<Failure, T> asFailure<T>() => left(Failure(error: this!));

  String get toFriendlyDate {
    if (this == null || this!.trim().isEmpty) return '';
    final originalDateFormat = DateFormatUtil.obDateTimeFormat;
    final uiDateFormat = DateFormat('dd-MMM-yyyy');
    return uiDateFormat.format(originalDateFormat.parse(this!));
  }
}
