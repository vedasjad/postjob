import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:postjob/core/constants/assets/assets.dart';
import 'package:postjob/core/enums/enums.dart';
import 'package:postjob/features/jobs/presentation/job_post_screen/widgets/form_field_container.dart';
import 'package:postjob/features/jobs/presentation/job_post_screen/widgets/my_drop_down_button.dart';
import 'package:postjob/features/jobs/presentation/job_post_screen/widgets/my_text_form_field.dart';

import '../../../../core/theme/colors.dart';
import '../controllers/job_post_controller.dart';

class JobPostScreen extends StatefulWidget {
  const JobPostScreen({
    super.key,
  });

  @override
  State<JobPostScreen> createState() => _JobPostScreenState();
}

class _JobPostScreenState extends State<JobPostScreen> {
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

  List<bool> areFieldsExpanded = [
    true,
    false,
    false,
    false,
  ];

  List<GlobalKey> expandablesKeys = List.generate(4, (_) => GlobalKey());

  void _toggleExpansion(int index) {
    setState(() {
      areFieldsExpanded[index] = !areFieldsExpanded[index];
    });
  }

  final ScrollController screenScrollController = ScrollController();

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
  Currency selectedSalaryCurrency = Currency.inr;
  JobType selectedJobType = JobType.fullTime;
  JobLocation selectedJobLocation = JobLocation.onsite;

  @override
  void initState() {
    super.initState();
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
    selectedJobType = JobType.fullTime;
    selectedJobLocation = JobLocation.onsite;
  }

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
      body: Form(
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
                      textEditingController: index == 0
                          ? jobTitleController
                          : index == 1
                              ? contactNumberController
                              : contactLocationController,
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
                    value: selectedJobType,
                    enumValues: const [
                      JobType.fullTime,
                      JobType.partTime,
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedJobType = value;
                        });
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
                    value: selectedJobLocation,
                    enumValues: const [
                      JobLocation.onsite,
                      JobLocation.remote,
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedJobLocation = value;
                        });
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
                      textEditingController: salaryController,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: DropdownButton<Currency>(
                        value: selectedSalaryCurrency,
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
                            setState(() {
                              selectedSalaryCurrency = value;
                            });
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
                      textEditingController: resumeController,
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
                          ? companyWebsiteLinkController
                          : index == 1
                              ? linkedinProfileController
                              : jobLinkController,
                      onFieldSubmitted: index + 1 == linksTitles.length
                          ? (value) {
                              setState(() {
                                areFieldsExpanded[0] = true;
                                Scrollable.ensureVisible(
                                    expandablesKeys[0].currentContext!);
                              });
                            }
                          : null,
                    ),
                  );
                },
              ),
              ...List.generate(areFieldsExpanded.length, (index) {
                final double contentHeight =
                    areFieldsExpanded[index] ? 140.0 : 0.0;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.borderColor,
                    ),
                  ),
                  height: areFieldsExpanded[index]
                      ? contentHeight + 58.0
                      : 58.0, // Title height + padding
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _toggleExpansion(index);
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
                            key: expandablesKeys[index],
                            hintText: "Description...",
                            textCapitalization: TextCapitalization.sentences,
                            textEditingController: index == 0
                                ? descriptionController
                                : index == 1
                                    ? roleController
                                    : index == 2
                                        ? benefitsController
                                        : skillsAndRequirementsController,
                            keyboardType: TextInputType.text,
                            textInputAction: index == 3
                                ? TextInputAction.done
                                : TextInputAction.next,
                            minLines: 4,
                            maxLines: 4,
                            maxLength: 200,
                            onFieldSubmitted: (value) {
                              if (index < 3) {
                                setState(() {
                                  areFieldsExpanded[index + 1] = true;
                                  Scrollable.ensureVisible(
                                      expandablesKeys[index].currentContext!);
                                });
                              }
                            },
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
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
