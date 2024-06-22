import 'package:flutter/material.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart'
    as inset;
import 'package:get/get.dart';
import 'package:postjob/core/enums/enums.dart';
import 'package:postjob/features/jobs/presentation/controllers/jobs_controller.dart';

import '../../../../../core/constants/assets/assets.dart';
import '../../../../../core/theme/colors.dart';
import '../../../data/models/job.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JobsController>(
      builder: (jobsController) {
        return Obx(
          () => Scaffold(
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
                "WORK WITH US",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                "${jobsController.jobs.length} Job${jobsController.jobs.length > 1 ? "s" : ""}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed('/job-post');
                          },
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.buttonGradientLeft,
                                  AppColors.buttonGradientRight,
                                ],
                                stops: [0, 1],
                              ),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ...List.generate(
                    jobsController.jobs.length,
                    (index) {
                      return JobBox(
                        job: jobsController.jobs[index],
                        onApply: () {
                          jobsController.updateJob(
                            jobsController.jobs[index].copyWith(
                              isApplied: true,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class JobBox extends StatelessWidget {
  const JobBox({
    super.key,
    required this.job,
    required this.onApply,
  });

  final Job job;
  final Function() onApply;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/job-post', arguments: job);
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: inset.BoxDecoration(
          border: Border.all(
            color: AppColors.jobBoxBorder,
          ),
          borderRadius: BorderRadius.circular(5),
          color: AppColors.jobBoxColor,
          boxShadow: [
            inset.BoxShadow(
              color: Colors.white.withOpacity(0.25),
              blurRadius: 4,
              inset: true,
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: Image.asset(
                    AppAssets.leading,
                    height: 48,
                    width: 48,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      job.jobTitle.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      job.companyName.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                JobPropertyChip(
                  title: job.jobType.toShortString,
                ),
                JobPropertyChip(
                  title: job.jobLocation.toShortString,
                ),
                const Spacer(),
                job.isApplied
                    ? Container(
                        decoration: const BoxDecoration(
                          color: AppColors.green,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        child: Row(
                          children: [
                            Image.asset(
                              AppAssets.applied,
                              height: 16,
                              width: 16,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Text(
                              "Applied",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      )
                    : GestureDetector(
                        onTap: onApply,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.green,
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 4),
                          child: const Text(
                            "APPLY",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class JobPropertyChip extends StatelessWidget {
  const JobPropertyChip({
    required this.title,
    super.key,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.chipColor,
        borderRadius: BorderRadius.circular(2),
      ),
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
