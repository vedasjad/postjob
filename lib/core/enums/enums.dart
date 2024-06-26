import 'package:hive_flutter/adapters.dart';

part 'enums.g.dart';

@HiveType(typeId: 0)
enum JobType {
  @HiveField(0)
  fullTime,
  @HiveField(1)
  partTime,
}

@HiveType(typeId: 1)
enum JobLocation {
  @HiveField(0)
  onsite,
  @HiveField(1)
  remote,
}

@HiveType(typeId: 2)
enum Currency {
  @HiveField(0)
  inr,
  @HiveField(1)
  usd,
  @HiveField(2)
  eur,
  @HiveField(3)
  cad,
}

extension JobTypeExtension on JobType {
  String get toShortString {
    switch (this) {
      case JobType.fullTime:
        return 'Full-Time';
      case JobType.partTime:
        return 'Part-Time';
      default:
        return 'Full-Time';
    }
  }
}

extension CurrencyExtension on Currency {
  String get toShortString {
    switch (this) {
      case Currency.inr:
        return 'INR';
      case Currency.usd:
        return 'USD';
      case Currency.eur:
        return 'EUR';
      case Currency.cad:
        return 'CAD';
      default:
        return 'INR';
    }
  }
}

extension JobLocationExtension on JobLocation {
  String get toShortString {
    switch (this) {
      case JobLocation.onsite:
        return 'Onsite';
      case JobLocation.remote:
        return 'Remote';
      default:
        return 'On-site';
    }
  }
}

String enumToString(dynamic enumValue) {
  if (enumValue is JobType) {
    return enumValue.toShortString;
  } else if (enumValue is JobLocation) {
    return enumValue.toShortString;
  } else if (enumValue is Currency) {
    return enumValue.toShortString;
  } else {
    return "";
  }
}
