import 'package:hive_flutter/adapters.dart';
import 'package:postjob/core/enums/enums.dart';

part 'job.g.dart';

@HiveType(typeId: 4)
class Job extends HiveObject {
  @HiveField(0)
  final String jobTitle;
  @HiveField(1)
  final String companyName;
  @HiveField(2)
  final int contactNumber;
  @HiveField(3)
  final String contactLocation;
  @HiveField(4)
  final JobType jobType;
  @HiveField(5)
  final JobLocation jobLocation;
  @HiveField(6)
  final Salary salary;
  @HiveField(7)
  final String resume;
  @HiveField(8)
  final String companyWebsiteLink;
  @HiveField(9)
  final String linkedinProfile;
  @HiveField(10)
  final String jobLink;
  @HiveField(11)
  final String description;
  @HiveField(12)
  final String role;
  @HiveField(13)
  final String benefits;
  @HiveField(14)
  final String skillsAndRequirements;
  @HiveField(15)
  final String id;
  @HiveField(16)
  final bool isApplied;
  Job({
    required this.jobLocation,
    required this.companyName,
    required this.jobType,
    required this.jobTitle,
    required this.benefits,
    required this.companyWebsiteLink,
    required this.contactLocation,
    required this.contactNumber,
    required this.description,
    required this.jobLink,
    required this.linkedinProfile,
    required this.resume,
    required this.role,
    required this.salary,
    required this.skillsAndRequirements,
    required this.id,
    this.isApplied = false,
  });

  Job copyWith({
    String? jobTitle,
    String? companyName,
    int? contactNumber,
    String? contactLocation,
    JobType? jobType,
    JobLocation? jobLocation,
    Salary? salary,
    String? resume,
    String? companyWebsiteLink,
    String? linkedinProfile,
    String? jobLink,
    String? description,
    String? role,
    String? benefits,
    String? skillsAndRequirements,
    String? id,
    bool? isApplied,
  }) {
    return Job(
      jobTitle: jobTitle ?? this.jobTitle,
      companyName: companyName ?? this.companyName,
      contactNumber: contactNumber ?? this.contactNumber,
      contactLocation: contactLocation ?? this.contactLocation,
      jobType: jobType ?? this.jobType,
      jobLocation: jobLocation ?? this.jobLocation,
      salary: salary ?? this.salary,
      resume: resume ?? this.resume,
      companyWebsiteLink: companyWebsiteLink ?? this.companyWebsiteLink,
      linkedinProfile: linkedinProfile ?? this.linkedinProfile,
      jobLink: jobLink ?? this.jobLink,
      description: description ?? this.description,
      role: role ?? this.role,
      benefits: benefits ?? this.benefits,
      skillsAndRequirements:
          skillsAndRequirements ?? this.skillsAndRequirements,
      id: id ?? this.id,
      isApplied: isApplied ?? this.isApplied,
    );
  }
}

@HiveType(typeId: 3)
class Salary {
  @HiveField(0)
  final int amount;
  @HiveField(1)
  final Currency currency;

  Salary({
    required this.currency,
    required this.amount,
  });

  Salary copyWith({
    int? amount,
    Currency? currency,
  }) {
    return Salary(
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
    );
  }
}
