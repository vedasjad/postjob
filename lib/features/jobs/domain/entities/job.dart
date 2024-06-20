import 'package:postjob/core/enums/enums.dart';

class Job {
  final String jobTitle;
  final String companyName;
  final int contactNumber;
  final String contactLocation;
  final JobType jobType;
  final JobLocation jobLocation;
  final Salary salary;
  final String resume;
  final String companyWebsiteLink;
  final String linkedinProfile;
  final String jobLink;
  final String description;
  final String role;
  final String benefits;
  final String skillsAndRequirements;

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
  });
}

class Salary {
  final int amount;
  final Currency currency;

  Salary({
    required this.currency,
    required this.amount,
  });
}
