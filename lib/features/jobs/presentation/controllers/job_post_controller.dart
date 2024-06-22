import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:postjob/features/jobs/data/models/job.dart';

import '../../../../core/enums/enums.dart';

class JobPostController extends GetxController {
  late Job? job;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController jobTitleController = TextEditingController(),
      contactNumberController = TextEditingController(),
      contactLocationController = TextEditingController(),
      salaryController = TextEditingController(),
      resumeController = TextEditingController(),
      companyWebsiteLinkController = TextEditingController(),
      linkedinProfileController = TextEditingController(),
      jobLinkController = TextEditingController(),
      descriptionController = TextEditingController(),
      roleController = TextEditingController(),
      benefitsController = TextEditingController(),
      skillsAndRequirementsController = TextEditingController();
  Rx<Currency> selectedSalaryCurrency = Currency.inr.obs;
  Rx<JobType> selectedJobType = JobType.fullTime.obs;
  Rx<JobLocation> selectedJobLocation = JobLocation.onsite.obs;

  RxBool isUpdate = false.obs;

  @override
  void onInit() {
    super.onInit();

    if (Get.arguments != null) {
      job = Get.arguments as Job;
      isUpdate = true.obs;
      jobTitleController.text = job!.jobTitle;
      contactNumberController.text = job!.contactNumber.toString();
      contactLocationController.text = job!.contactLocation;
      salaryController.text = job!.salary.amount.toString();
      resumeController.text = job!.resume;
      companyWebsiteLinkController.text = job!.companyWebsiteLink;
      linkedinProfileController.text = job!.linkedinProfile;
      jobLinkController.text = job!.jobLink;
      descriptionController.text = job!.description;
      roleController.text = job!.role;
      benefitsController.text = job!.benefits;
      skillsAndRequirementsController.text = job!.skillsAndRequirements;
      selectedSalaryCurrency = job!.salary.currency.obs;
      selectedJobType = job!.jobType.obs;
      selectedJobLocation = job!.jobLocation.obs;
    }
  }

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

  String? validateUrl(String? value, String fieldName) {
    final String? emptyFieldMessage = checkIfEmpty(value, fieldName);
    if (emptyFieldMessage != null) {
      return emptyFieldMessage;
    }
    const urlPattern =
        r'^(https?:\/\/)?([a-z0-9\w]+(\.[a-z\w]+)+)?([a-zA-Z0-9\._-]+)*(\?[a-zA-Z0-9\._-]+)?(\/[a-zA-Z0-9\._-]+)*\/?$';
    final result = RegExp(urlPattern).hasMatch(value!);
    if (!result) {
      return 'Please enter a valid URL for $fieldName';
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

  Future<void> uploadPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);

      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref =
          storage.ref().child('resumes/${result.files.single.name}');

      UploadTask uploadTask = ref.putFile(file);

      uploadTask.then((res) {
        res.ref.getDownloadURL().then((url) {
          print("File URL: $url");
          resumeController.text = url;
        });
      }).catchError((error) {
        print("Failed to upload: $error");
      });
    }
  }
}
