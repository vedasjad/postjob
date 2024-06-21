import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/enums/enums.dart';

class JobPostController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController jobTitleController,
      contactNumberController,
      contactLocationController,
      salaryController,
      resumeController,
      companyWebsiteLinkController,
      linkedinProfileController,
      jobLinkController,
      descriptionController,
      roleController,
      benefitsController,
      skillsAndRequirementsController;

  @override
  void onInit() {
    super.onInit();

    jobTitleController = TextEditingController();
    contactNumberController = TextEditingController();
    contactLocationController = TextEditingController();
    salaryController = TextEditingController();
    resumeController = TextEditingController();
    companyWebsiteLinkController = TextEditingController();
    linkedinProfileController = TextEditingController();
    jobLinkController = TextEditingController();
    descriptionController = TextEditingController();
    roleController = TextEditingController();
    benefitsController = TextEditingController();
    skillsAndRequirementsController = TextEditingController();
    selectedJobType = JobType.fullTime.obs;
    selectedJobLocation = JobLocation.onsite.obs;
  }

  final RxString jobTitle = ''.obs,
      contactNumber = ''.obs,
      contactLocation = ''.obs,
      salary = ''.obs,
      resume = ''.obs,
      companyWebsiteLink = ''.obs,
      linkedinProfile = ''.obs,
      jobLink = ''.obs,
      description = ''.obs,
      role = ''.obs,
      benefits = ''.obs,
      skillsAndRequirements = ''.obs;
  Rx<Currency> selectedSalaryCurrency = Currency.inr.obs;
  Rx<JobType> selectedJobType = JobType.fullTime.obs;
  Rx<JobLocation> selectedJobLocation = JobLocation.onsite.obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  RxList<bool> areFieldsExpanded = [
    true,
    false,
    false,
    false,
  ].obs;

  String? validateContactNumber(String? value, String fieldName) {
    final String? emptyFieldMessage = checkIfEmpty(value, fieldName);
    if (emptyFieldMessage != null) {
      return emptyFieldMessage;
    } else if (value!.length != 10) {
      return "$fieldName must be of 10 digits only";
    }
    return null;
  }

  String? checkIfEmpty(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return "$fieldName can't be empty";
    }
    return null;
  }

  void toggleExpansion(int index) {
    areFieldsExpanded[index] = !areFieldsExpanded[index];
  }

  void setExpansionTrue(int index) {
    areFieldsExpanded[index] = true;
  }

  void updateSelectedSalaryCurrency(Currency newCurrency) {
    selectedSalaryCurrency.value = newCurrency;
  }

  void updateSelectedJobType(JobType newJobType) {
    selectedJobType.value = newJobType;
  }

  void updateSelectedJobLocation(JobLocation newJobLocation) {
    selectedJobLocation.value = newJobLocation;
  }
}
