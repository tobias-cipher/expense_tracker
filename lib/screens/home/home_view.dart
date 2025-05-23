import 'dart:developer';

import 'package:expense_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:linear_calender/linear_calender.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      floatingActionButton: FloatingActionButton(onPressed: () {
        log(controller.dates.toString());
      }),
      gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xFF2C3C5E),
            Color(0xFF462760),
          ]),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 90,
        centerTitle: true,
        title: Column(
          children: [
            SizedBox(height: 20.h),
            Container(
              padding: EdgeInsets.all(8.sp),
              width: 120.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.33),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'July Balance',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: Colors.white),
                  ),
                  InkWell(
                    child: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Rs0.00',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white),
            )
          ],
        ),
        actions: [
          Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      width: 35.w,
                      height: 35.h,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.33),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.line_axis_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      width: 35.w,
                      height: 35.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.33),
                      ),
                      child: Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                  height: 32.h,
                  child: Obx(
                    () => ListView.builder(
                        controller: controller.dateScrollController,
                        itemCount: controller.dates.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                controller.selectedDate.value =
                                    controller.dates[index];
                              },
                              child: Obx(
                                () => Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  padding: EdgeInsets.all(4.sp),
                                  width: 70.w,
                                  decoration: BoxDecoration(
                                    color: controller.selectedDate.value ==
                                            controller.dates[index]
                                        ? Colors.white.withOpacity(0.33)
                                        : null,
                                    borderRadius: BorderRadius.circular(24.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                        DateFormat('MMM dd')
                                            .format(controller.dates[index]),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(color: Colors.white)),
                                  ),
                                ),
                              ));
                        }),
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(8.sp),
                    width: 0.43.sw,
                    height: 80.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: Colors.white.withOpacity(0.33),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.all(3.sp),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green, width: 2),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Icon(
                            Icons.trending_up,
                            color: Colors.green,
                            size: 20,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Income',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              'Rs0.00',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.sp),
                    width: 0.43.sw,
                    height: 80.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: Colors.white.withOpacity(0.33),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.all(3.sp),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.red, width: 2),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: const Icon(
                            Icons.trending_down,
                            color: Colors.red,
                            size: 20,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Expenses',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              'Rs0.00',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                height: 0.6.sh,
                child: ListView.builder(itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 8.h),
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                    width: 1.sw,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(
                        0.33,
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Fries and All',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              'Banks',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(color: Colors.grey),
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Text(
                              'Rs1400',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: Colors.white),
                            ),
                            Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
