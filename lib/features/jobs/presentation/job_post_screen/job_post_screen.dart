import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:postjob/core/constants/assets/assets.dart';
import 'package:postjob/core/enums/enums.dart';
import 'package:postjob/features/jobs/presentation/job_post_screen/widgets/form_field_container.dart';
import 'package:postjob/features/jobs/presentation/job_post_screen/widgets/my_drop_down_button.dart';
import 'package:postjob/features/jobs/presentation/job_post_screen/widgets/my_text_form_field.dart';

import '../../../../core/theme/colors.dart';
import '../controllers/job_post_controller.dart';

class JobPostScreen extends StatelessWidget {
  JobPostScreen({
    super.key,
  });

  final jobPostController = Get.put(JobPostController());

  final List<String> titles = [
    "Job Title",
    "Contact Number",
    "Contact Location",
  ];

  final List<String> hintTexts = [
    "Eg. FLUTTER DEVELOPER",
    "Eg. 9621303910",
    "Eg. Kochi, Kerela",
  ];

  final List<TextInputType> keyboardTypes = [
    TextInputType.name,
    TextInputType.number,
    TextInputType.text,
  ];

  final List<TextCapitalization> textCapitalization = [
    TextCapitalization.characters,
    TextCapitalization.none,
    TextCapitalization.words,
  ];

  final List<Currency> currencies = [
    Currency.inr,
    Currency.usd,
    Currency.cad,
    Currency.eur,
  ];

  final List<String> linksTitles = [
    "Company Website Link",
    "Linkedin Profile",
    "Job Link",
  ];

  final List<String> linksHintTexts = [
    "Eg. www.gamertag.in",
    "Eg. www.linkedin.com/in/vedasjad",
    "Eg. www.gamertag.in",
  ];

  final List<String> expandablesTitles = [
    "Description",
    "Your Role",
    "Benefits",
    "Skills & Requirements",
  ];

  final List<String> expandablesLeadingAssets = [
    AppAssets.edit,
    AppAssets.person,
    AppAssets.benefits,
    AppAssets.task,
  ];

  final ScrollController screenScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.red,
          ),
        ),
        title: const Text(
          "Job Post",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              child: Image.asset(
                AppAssets.delete,
                height: 26,
              ),
            ),
          )
        ],
      ),
      body: Obx(
        () => Form(
          key: jobPostController.formKey,
          child: SingleChildScrollView(
            controller: screenScrollController,
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ...List.generate(
                  titles.length,
                  (index) {
                    return FormFieldContainer(
                      title: titles[index],
                      child: MyTextFormField(
                        hintText: hintTexts[index],
                        textCapitalization: textCapitalization[index],
                        keyboardType: keyboardTypes[index],
                        validator: (String? value) {
                          return index == 1
                              ? jobPostController.validateContactNumber(
                                  value, titles[index])
                              : jobPostController.checkIfEmpty(
                                  value, titles[index]);
                        },
                        textEditingController: index == 0
                            ? jobPostController.jobTitleController
                            : index == 1
                                ? jobPostController.contactNumberController
                                : jobPostController.contactLocationController,
                        onChanged: (String value) {},
                        onFieldSubmitted: (String? value) {},
                      ),
                    );
                  },
                ),
                FormFieldContainer(
                  title: "Job Type",
                  child: Container(
                    margin: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.hintTextColor,
                        width: 0.5,
                      ),
                    ),
                    child: MyDropDownButton<JobType>(
                      value: jobPostController.selectedJobType.value,
                      enumValues: const [
                        JobType.fullTime,
                        JobType.partTime,
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          jobPostController.updateSelectedJobType(value);
                        }
                      },
                    ),
                  ),
                ),
                FormFieldContainer(
                  title: "Job Location",
                  child: Container(
                    margin: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.hintTextColor,
                        width: 0.5,
                      ),
                    ),
                    child: MyDropDownButton<JobLocation>(
                      value: jobPostController.selectedJobLocation.value,
                      enumValues: const [
                        JobLocation.onsite,
                        JobLocation.remote,
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          jobPostController.updateSelectedJobLocation(value);
                        }
                      },
                    ),
                  ),
                ),
                FormFieldContainer(
                  title: "Salary",
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      MyTextFormField(
                        hintText: "Eg. 5,60,000",
                        textCapitalization: TextCapitalization.none,
                        keyboardType: TextInputType.number,
                        textEditingController:
                            jobPostController.salaryController,
                        validator: (String? value) {
                          return jobPostController.checkIfEmpty(
                            value,
                            "Salary",
                          );
                        },
                        onChanged: (String value) {},
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: DropdownButton<Currency>(
                          value: jobPostController.selectedSalaryCurrency.value,
                          alignment: Alignment.centerRight,
                          isDense: true,
                          style: const TextStyle(
                            color: AppColors.hintTextColor,
                            fontSize: 16,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w300,
                          ),
                          dropdownColor: Colors.black,
                          icon: const SizedBox.shrink(),
                          underline: const SizedBox.shrink(),
                          items: currencies.map((currency) {
                            return DropdownMenuItem<Currency>(
                              value: currency,
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  enumToString(currency),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value != null) {
                              jobPostController
                                  .updateSelectedSalaryCurrency(value);
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
                FormFieldContainer(
                  title: "Resume",
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      MyTextFormField(
                        hintText: "Eg. resume.pdf",
                        textEditingController:
                            jobPostController.resumeController,
                        onChanged: (String value) {},
                        validator: (String? value) {
                          return jobPostController.checkIfEmpty(
                            value,
                            "Resume",
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Material(
                          color: AppColors.greyColor,
                          elevation: 16,
                          shadowColor: Colors.black,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 4),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 0.5,
                                ),
                              ),
                              child: const Text(
                                "Upload",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ...List.generate(
                  linksTitles.length,
                  (index) {
                    return FormFieldContainer(
                      title: linksTitles[index],
                      child: MyTextFormField(
                        hintText: linksHintTexts[index],
                        textCapitalization: TextCapitalization.none,
                        keyboardType: TextInputType.text,
                        textEditingController: index == 0
                            ? jobPostController.companyWebsiteLinkController
                            : index == 1
                                ? jobPostController.linkedinProfileController
                                : jobPostController.jobLinkController,
                        validator: (String? value) {
                          return jobPostController.checkIfEmpty(
                              value, linksTitles[index]);
                        },
                        onFieldSubmitted: index + 1 == linksTitles.length
                            ? (value) {
                                jobPostController.setExpansionTrue(0);
                              }
                            : null,
                        onChanged: (String value) {},
                      ),
                    );
                  },
                ),
                ...List.generate(jobPostController.areFieldsExpanded.length,
                    (index) {
                  final double contentHeight =
                      jobPostController.areFieldsExpanded[index] ? 140.0 : 0.0;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.borderColor,
                      ),
                    ),
                    height: jobPostController.areFieldsExpanded[index]
                        ? contentHeight + 58.0
                        : 58.0, // Title height + padding
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            jobPostController.toggleExpansion(index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.borderColor,
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.all(2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  color: AppColors.borderColor,
                                  height: 48,
                                  width: 48,
                                  child: Image.asset(
                                    expandablesLeadingAssets[index],
                                    height: 30,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    expandablesTitles[index],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        AnimatedSize(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          child: SizedBox(
                            height: contentHeight,
                            child: MyTextFormField(
                              hintText: "Description...",
                              textCapitalization: TextCapitalization.sentences,
                              textEditingController: index == 0
                                  ? jobPostController.descriptionController
                                  : index == 1
                                      ? jobPostController.roleController
                                      : index == 2
                                          ? jobPostController.benefitsController
                                          : jobPostController
                                              .skillsAndRequirementsController,
                              keyboardType: TextInputType.text,
                              textInputAction: index == 3
                                  ? TextInputAction.done
                                  : TextInputAction.next,
                              minLines: 4,
                              maxLines: 4,
                              maxLength: 200,
                              validator: (String? value) {
                                return jobPostController.checkIfEmpty(
                                    value, expandablesTitles[index]);
                              },
                              onFieldSubmitted: (value) {
                                if (index < 3) {
                                  jobPostController.setExpansionTrue(index + 1);
                                  final scrollable = Scrollable.of(context);
                                  scrollable.position.animateTo(
                                    scrollable.position.pixels + 500,
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                              onChanged: (String value) {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                const SizedBox(
                  height: 26,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          jobPostController.formKey.currentState!.validate();
                          for (int i = 0;
                              i < jobPostController.areFieldsExpanded.length;
                              i++) {
                            jobPostController.setExpansionTrue(i);
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.buttonGradientLeft,
                                  AppColors.buttonGradientRight,
                                ],
                                stops: [0, 1],
                              ),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              "POST",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
