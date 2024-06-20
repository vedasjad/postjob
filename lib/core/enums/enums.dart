enum JobType {
  fullTime,
  partTime,
}

enum JobLocation {
  onsite,
  remote,
}

enum Currency {
  inr,
  usd,
  eur,
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
