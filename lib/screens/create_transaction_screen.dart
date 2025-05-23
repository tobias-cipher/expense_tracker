import 'dart:developer';

import 'package:expense_tracker/component/app_colors.dart';
import 'package:expense_tracker/component/button_component.dart';
import 'package:expense_tracker/component/textfiled_component.dart';
import 'package:expense_tracker/controller/create_transaction_controller.dart';
import 'package:expense_tracker/screens/widget/custom_tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateTransactionScreen extends StatefulWidget {
  const CreateTransactionScreen({super.key});

  @override
  State<CreateTransactionScreen> createState() =>
      _CreateTransactionScreenState();
}

class _CreateTransactionScreenState extends State<CreateTransactionScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int tabIndex = 0;
  int selectedStatus = 0;
  int selectedStatus1 = 0;

  @override
  void initState() {
    super.initState();
    // bidPlacedList();
    // bidReceived();
    controller = TabController(length: 2, vsync: this);
  }

  void updateStatusCustom(int status) {
    setState(() {
      selectedStatus1 = status;
      debugPrint('=====> $status');
    });
  }

  void updateStatusPrivate(int status) {
    setState(() {
      selectedStatus = status;
      debugPrint('=====> $status');
    });
  }

  final CreateTransactionController controllerr =
      Get.put(CreateTransactionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined,
                color: AppColors.whito),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: AppColors.arsenic,
          title: const Text(
            'Create Transaction',
            style: TextStyle(
              color: AppColors.whito,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: AppColors.arsenic,
        body: Form(
          key:controllerr.signInScreenKey,
          child: Column(children: [
            Gap(10.h),
            // ================ Tab Bar : ==================================================
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.charlestonGreen,
                  borderRadius: BorderRadius.circular(5.r)),
              child: TabBar(
                dividerColor: Colors.transparent,
                padding:
                    EdgeInsets.only(top: 6.h, bottom: 3.h, left: 6.w, right: 6.w),
                controller: controller,
                unselectedLabelColor: AppColors.graniteGray,
                labelColor: Colors.white,
                onTap: (index) {
                  setState(() {
                    tabIndex = index;
                  });
                },
                indicatorColor: Colors.transparent,
                indicatorPadding: EdgeInsets.zero,
                // No padding for the indicator
                labelPadding: EdgeInsets.zero,
          
                // Tabs --------------------------------
                tabs: [
                  // ================= private Session : =======================
                  CustomTab(
                    label: 'Icome',
                    index: 0,
                    currentIndex: tabIndex,
                    isLeft: true,
                    activeColor: AppColors.yellowGreen,
                    inactiveColor: AppColors.charlestonGreen,
                    activeGradient: const [
                      AppColors.grdientYColor,
                      AppColors.grdientYColor,
                      AppColors.gainsboro,
                    ],
                    inactiveGradient: const [
                      AppColors.charlestonGreen,
                      AppColors.charlestonGreen,
                    ],
                  ),
                  // ================= custom Session : =======================
                  CustomTab(
                    label: 'Expense',
                    index: 1,
                    currentIndex: tabIndex,
                    isLeft: false,
                    activeColor: AppColors.yellowGreen,
                    inactiveColor: AppColors.charlestonGreen,
                    activeGradient: const [
                      AppColors.grdientYColor,
                      AppColors.grdientYColor,
                      AppColors.gainsboro,
                    ],
                    inactiveGradient: const [
                      AppColors.charlestonGreen,
                      AppColors.charlestonGreen,
                    ],
                  ),
                ],
              ),
            ),
            // ================ inside tabbar data : ========================
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                // color: AppColors.charlestonGreen,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.r),
                  bottomLeft: Radius.circular(5.r),
                ),
              ),
              child: TabBarView(
                physics: const AlwaysScrollableScrollPhysics(),
                controller: controller,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: SingleChildScrollView(
                      physics:const  NeverScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          TextFieldComponent(
                             labelColor: AppColors.whito,
                            fontSize: 18.r,
                            labelText: "Category",
                            controllerr.categoryController,
                            currentFocus: controllerr.focusNodeCategory,
                            hintText: 'Enter Category',
                            // validator: validateEmail,
                            hintTextStyle: GoogleFonts.manrope(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp),
                          ),
                          Gap(10.h),
                          TextFieldComponent(
                            keyboardType: TextInputType.number,
                            labelText: 'Amount',
                            controllerr.amountController,
                            maxLength: 3, // because max is 50e
                            formatter: [
                              FilteringTextInputFormatter
                                  .digitsOnly, // Only allows 0-9
                            ],
                            labelColor: AppColors.whito,
                            fontSize: 18.r,
                            currentFocus: controllerr.focusNodeamount,
                            //      nextFocus:
                            hintText: 'Enter Amount',
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return 'Amount is required';
                              final number = int.tryParse(value);
                              if (number == null || number < 1 || number > 999) {
                                return 'Enter a Amount between 1 and 999';
                              }
                              return null;
                            },
                            hintTextStyle: GoogleFonts.manrope(
                              color: AppColors.whito,
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                            ),
                          ),
                                 //  Gap(10.h),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Text(
                                  'Date',
                                  style: GoogleFonts.manrope(
                                      color: AppColors.whito,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18.sp),
                                ),
                              ),
                            ],
                          ),
                          Gap(5.h),
                          Container(
                            alignment: Alignment.centerLeft,
                            //  padding: const EdgeInsets.only(left: 16),
                            height: 52.h,
                            decoration: BoxDecoration(
                                color: AppColors.charlestonGreen,
                                borderRadius: BorderRadius.circular(12.r)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15.w,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controllerr
                                            .currentDateController.text.isNotEmpty
                                        ? "${controllerr.currentDateController.text} "
                                        : 'Select Date',
                                    style: GoogleFonts.manrope(
                                        color: AppColors.whito,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16.sp),
                                  ),
                                  GestureDetector(
                                      onTap: () async {
                                        DateTime? pickedDate = await showDatePicker(
                                            initialDatePickerMode:
                                                DatePickerMode.day,
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(3000),
                                            currentDate: DateTime.now(),
                                            //
                                            builder: (BuildContext context,
                                                Widget? child) {
                                              return Theme(
                                                data: ThemeData.light().copyWith(
                                                  // Customizing the dialog background color
                                                  colorScheme:
                                                      const ColorScheme.light(
                                                    primary:
                                                        AppColors.bottomBarColor,
                                                    onPrimary: Colors.white,
                                                    // header text color
                                                    surface: Color.fromARGB(
                                                        255, 191, 204, 207),
                                                    // Colors.deepPurpleAccent, // background of selected date
                                                    onSurface: Colors
                                                        .black, // text color for unselected dates
                                                  ),
                                                  // Customizing the text theme for the picker
                                                  textTheme: const TextTheme(
                                                    headlineMedium: TextStyle(
                                                        color: Colors
                                                            .deepPurple), // year selection text
                                                    labelLarge: TextStyle(
                                                        color: Colors
                                                            .black), // month, day text
                                                    bodyLarge: TextStyle(
                                                        color: Colors
                                                            .red), // general text style
                                                  ),
                                                  // Styling the shape of the picker dialog
                                                  dialogTheme: DialogTheme(
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                  ),
                                                ),
                                                child: child!,
                                              );
                                            });
                                        FocusScope.of(context).unfocus();
                                        //
                                        if (pickedDate != null) {
                                          controllerr.currentDateController.text =
                                              DateFormat('MM-dd-yyyy')
                                                  .format(pickedDate);
                                          log("::::::Date ::::::::::${controllerr.currentDateController.text}");
                                        }
                                      },
                                      child: Icon(Icons.calendar_month,color: AppColors.whito,)),
                                
                                  
                                      
                                ],
                              ),
                            ),
                          ),
                            Gap(50.h),
                                        Obx(()=>
                                    ButtonComponent(
                                   
                        isLoading: controllerr.isLoading.value,
                        textFontSize: 16,
                        text: 'Create',
                        onTap: () {
                          if (controllerr.signInScreenKey.currentState!.validate()) {
                            controllerr.createTransaction('income',controllerr.categoryController.text,controllerr.currentDateController.text,controllerr.amountController.text
                      );
                          }
                        },
                      ),
                                        ),
                        ],
                      ),
                    ),
                  ),
                                 Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: SingleChildScrollView(
                        physics:const  NeverScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          TextFieldComponent(
                             labelColor: AppColors.whito,
                            fontSize: 18.r,
                            labelText: "Category",
                            controllerr.categoryController,
                            currentFocus: controllerr.focusNodeCategory,
                            hintText: 'Enter Category',
                            // validator: validateEmail,
                            hintTextStyle: GoogleFonts.manrope(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp),
                          ),
                          Gap(10.h),
                          TextFieldComponent(
                            keyboardType: TextInputType.number,
                            labelText: 'Amount',
                                
                            controllerr.amountController,
                            maxLength: 3, // because max is 50e
                            formatter: [
                              FilteringTextInputFormatter
                                  .digitsOnly, // Only allows 0-9
                            ],
                            labelColor: AppColors.whito,
                            fontSize: 18.r,
                            currentFocus: controllerr.focusNodeamount,
                            //      nextFocus:
                            hintText: 'Enter Amount',
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return 'Amount is required';
                              final number = int.tryParse(value);
                              if (number == null || number < 1 || number > 999) {
                                return 'Enter a Amount between 1 and 999';
                              }
                              return null;
                            },
                            hintTextStyle: GoogleFonts.manrope(
                              color: AppColors.whito,
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                            ),
                          ),
                                 //  Gap(10.h),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Text(
                                  'Date',
                                  style: GoogleFonts.manrope(
                                      color: AppColors.whito,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18.sp),
                                ),
                              ),
                            ],
                          ),
                          Gap(5.h),
                          Container(
                            alignment: Alignment.centerLeft,
                            //  padding: const EdgeInsets.only(left: 16),
                            height: 52.h,
                            decoration: BoxDecoration(
                                color: AppColors.charlestonGreen,
                                borderRadius: BorderRadius.circular(12.r)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15.w,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controllerr
                                            .currentDateController.text.isNotEmpty
                                        ? "${controllerr.currentDateController.text} "
                                        : 'Select Date',
                                    style: GoogleFonts.manrope(
                                        color: AppColors.whito,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16.sp),
                                  ),
                                  GestureDetector(
                                      onTap: () async {
                                        DateTime? pickedDate = await showDatePicker(
                                            initialDatePickerMode:
                                                DatePickerMode.day,
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(3000),
                                            currentDate: DateTime.now(),
                                            //
                                            builder: (BuildContext context,
                                                Widget? child) {
                                              return Theme(
                                                data: ThemeData.light().copyWith(
                                                  // Customizing the dialog background color
                                                  colorScheme:
                                                      const ColorScheme.light(
                                                    primary:
                                                        AppColors.bottomBarColor,
                                                    onPrimary: Colors.white,
                                                    // header text color
                                                    surface: Color.fromARGB(
                                                        255, 191, 204, 207),
                                                    // Colors.deepPurpleAccent, // background of selected date
                                                    onSurface: Colors
                                                        .black, // text color for unselected dates
                                                  ),
                                                  // Customizing the text theme for the picker
                                                  textTheme: const TextTheme(
                                                    headlineMedium: TextStyle(
                                                        color: Colors
                                                            .deepPurple), // year selection text
                                                    labelLarge: TextStyle(
                                                        color: Colors
                                                            .black), // month, day text
                                                    bodyLarge: TextStyle(
                                                        color: Colors
                                                            .red), // general text style
                                                  ),
                                                  // Styling the shape of the picker dialog
                                                  dialogTheme: DialogTheme(
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                  ),
                                                ),
                                                child: child!,
                                              );
                                            });
                                        FocusScope.of(context).unfocus();
                                        //
                                        if (pickedDate != null) {
                                          controllerr.currentDateController.text =
                                              DateFormat('MM-dd-yyyy')
                                                  .format(pickedDate);
                                          log("::::::Date ::::::::::${controllerr.currentDateController.text}");
                                        }
                                      },
                                      child: Icon(Icons.calendar_month,color: AppColors.whito,)),
                                
                                  
                                      
                                ],
                              ),
                            ),
                          ),
                            Gap(50.h),
                                        Obx(()=>
                                    ButtonComponent(
                                   
                        isLoading: controllerr.isLoading.value,
                        textFontSize: 16,
                        text: 'Create',
                        onTap: () {
                          if (controllerr.signInScreenKey.currentState!.validate()) {
                            controllerr.createTransaction('expense',controllerr.categoryController.text,controllerr.currentDateController.text,controllerr.amountController.text
                      );
                          }
                        },
                      ),
                                        ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ))
          ]),
        ));
  }
}
