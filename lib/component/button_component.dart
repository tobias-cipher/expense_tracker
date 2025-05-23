import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent(
      {super.key,
      this.width = double.infinity,
      this.height = 52,
      required this.text,
      this.buttonColor,
      this.buttonRadius = 12,
      this.buttonShape = BoxShape.rectangle,
      this.textColor = Colors.black,
      this.fontSize = 16,
      this.fontWeight = FontWeight.w600,
      required this.onTap,
      this.borderColor = Colors.black,
      this.borderWidth = 1,
      this.loaderColor,
      this.textFontSize = 13,
      this.isLoading = false,
      this.leading,
      this.fontFamily,
      this.isLeading = false,
      this.suffix,
      this.isSuffix = false,
      this.isCenter = true,
      this.disabled = false,
      this.isYellow = true // New parameter
      });

  final double? width;
  final double? textFontSize;
  final double? height;
  final Color? buttonColor;
  final Color textColor;
  final String text;
  final double buttonRadius;
  final BoxShape buttonShape;
  final double fontSize;
  final FontWeight fontWeight;
  final VoidCallback onTap;
  final Color borderColor;
  final double borderWidth;
  final bool isLoading;
  final Color? loaderColor;
  final String? leading;
  final bool? isLeading;
  final bool? isSuffix;
  final String? suffix;
  final String? fontFamily;
  final bool? isCenter;
  final bool disabled;
  final bool? isYellow; // New field

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isLoading || disabled, // Disable tap if loading or disabled
      child: GestureDetector(
        onTap: disabled ? null : onTap, // Prevent callback if disabled
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(buttonRadius),
            color: buttonColor,
            shape: buttonShape,
            gradient: buttonColor == null
                ? LinearGradient(
                    colors: isYellow ?? false
                        ? [
                            const Color(0xFFFFFE36),
                            const Color(0xFFFFFE36),
                            const Color(0xFFFFFE36),
                            const Color(0xFFFFFE36),
                            // Color(0xFFFFFFCE),
                            const Color(0xFFFFFF7D)
                          ]
                        : [
                            buttonColor ?? const Color(0xFFFFFE36),
                            buttonColor ?? const Color(0xFFFFFF7D)
                          ],
                    // stops: const [
                    //   0,
                    //   1
                    // ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)
                : null,
            border: Border.all(
              color: disabled ? Colors.grey.shade400 : borderColor,
              width: borderWidth,
            ),
          ),
          child: Center(
            child: isLoading
                ? Center(
                    child: SizedBox(
                      height: 38,
                      width: 38,
                      child: CircularProgressIndicator(
                        color: loaderColor ?? Colors.black,
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: isLeading!
                        ? MainAxisAlignment.spaceAround
                        : isCenter!
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.start,
                    children: [
                      if (!isCenter!) const SizedBox(width: 8),
                      isLeading!
                          ? Image.asset(
                              leading!,
                              height: 20,
                              width: 20,
                            )
                          : const SizedBox(),
                      Text(
                        text,
                        style: GoogleFonts.manrope(
                          fontSize: textFontSize,
                          color: disabled ? Colors.grey.shade600 : textColor,
                          fontWeight: fontWeight,
                        ),
                      ),
                      isSuffix!
                          ? Image.asset(
                              suffix!,
                              height: 20,
                              width: 20,
                            )
                          : const SizedBox()
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class CustomButtonComponent extends StatelessWidget {
  const CustomButtonComponent(
      {super.key,
      this.width = double.infinity,
      this.height = 52,
      required this.text,
      this.buttonColor,
      this.buttonRadius = 12,
      this.buttonShape = BoxShape.rectangle,
      this.textColor = Colors.black,
      this.fontSize = 16,
      this.fontWeight = FontWeight.w600,
      required this.onTap,
      this.borderColor = Colors.black,
      this.borderWidth = 1,
      this.loaderColor,
      this.textFontSize = 13,
      this.isLoading = false,
      this.leading,
      this.fontFamily,
      this.isLeading = false,
      this.suffix,
      this.isSuffix = false,
      this.isCenter = true,
      this.disabled = false,
      this.isYellow = true // New parameter
      });

  final double? width;
  final double? textFontSize;
  final double? height;
  final Color? buttonColor;
  final Color textColor;
  final String text;
  final double buttonRadius;
  final BoxShape buttonShape;
  final double fontSize;
  final FontWeight fontWeight;
  final VoidCallback onTap;
  final Color borderColor;
  final double borderWidth;
  final bool isLoading;
  final Color? loaderColor;
  final String? leading;
  final bool? isLeading;
  final bool? isSuffix;
  final String? suffix;
  final String? fontFamily;
  final bool? isCenter;
  final bool disabled;
  final bool? isYellow; // New field

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isLoading || disabled, // Disable tap if loading or disabled
      child: GestureDetector(
        onTap: disabled ? null : onTap, // Prevent callback if disabled
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(buttonRadius),
            color: buttonColor,
            shape: buttonShape,
            gradient: buttonColor == null
                ? LinearGradient(
                    colors: isYellow ?? false
                        ? [
                            const Color(0xFFFFFE36),
                            const Color(0xFFFFFE36),
                            const Color(0xFFFFFE36),
                            const Color(0xFFFFFE36),
                            // Color(0xFFFFFFCE),
                            const Color(0xFFFFFF7D),
                            const Color(0xFFFFFF7D),
                            const Color(0xFFFFFF7D),
                            const Color(0xFFFFFF7D),
                          ]
                        : [
                            buttonColor ?? const Color(0xFFFFFE36),
                            buttonColor ?? const Color(0xFFFFFF7D),
                          ],
                    // stops: const [
                    //   0,
                    //   1
                    // ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)
                : null,
            border: Border.all(
              color: disabled ? Colors.grey.shade400 : borderColor,
              width: borderWidth,
            ),
          ),
          child: Center(
            child: isLoading
                ? Center(
                    child: SizedBox(
                      height: 38,
                      width: 38,
                      child: CircularProgressIndicator(
                        color: loaderColor ?? Colors.black,
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: isLeading!
                        ? MainAxisAlignment.spaceAround
                        : isCenter!
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.start,
                    children: [
                      if (!isCenter!) const SizedBox(width: 8),
                      isLeading!
                          ? Image.asset(
                              leading!,
                              height: 20,
                              width: 20,
                            )
                          : const SizedBox(),
                      Text(
                        text,
                        style: GoogleFonts.manrope(
                          fontSize: textFontSize,
                          color: disabled ? Colors.grey.shade600 : textColor,
                          fontWeight: fontWeight,
                        ),
                      ),
                      isSuffix!
                          ? Image.asset(
                              suffix!,
                              height: 20,
                              width: 20,
                            )
                          : const SizedBox()
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
