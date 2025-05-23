import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';


class TextFieldComponent extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final bool isPassword;
  final bool isRequired;
  final String? Function(String?)? validator;
  final Function(String _)? onChanged;
  final TextInputType keyboardType;
  final int maxLength;
  final dynamic suffixIcon;
  final Function()? onSuffixPressed;
  final Widget? prefixWidget;
  final Color fillColor;
  final bool enlargePrefixWidget;
  final Color labelColor;
  final FontWeight? labelFontWeight;
  final bool readOnly;
  final bool enabled;
  final int? maxLines;
  final VoidCallback? onTap;
  final VoidCallback? onEdittingCompleted;
  final FocusNode currentFocus;
  final FocusNode? nextFocus;
  final EdgeInsetsGeometry? padding;
  final bool isSmall;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final TextStyle? textStyle;
  final List<TextInputFormatter>? formatter;
  final TextAlign textAlign;
  final Color borderColor;
  final Color? cursorColor;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final double? borderRadius;
  final TextCapitalization? textCapitalization;
  final bool enableSuggestions;
  final bool autocorrect;
  final double fontSize;
  final double errorfontSize;
  final Color? focusColor;

  const TextFieldComponent(
    this.controller, {
    super.key,
    this.labelFontWeight,
    this.hintText,
    this.cursorColor,
    this.labelText,
    this.errorfontSize = 12,
    this.isPassword = false,
    this.isRequired = false,
    this.labelTextStyle,
    this.validator,
    this.onChanged(String _)?,
    this.keyboardType = TextInputType.text,
    this.maxLength = 80,
    this.suffixIcon,
    this.onSuffixPressed,
    this.prefixWidget,
    this.onTap,
    this.fillColor = AppColors.charlestonGreen,
    this.enlargePrefixWidget = true,
    this.labelColor = Colors.black,
    this.readOnly = false,
    this.enabled = true,
    this.maxLines,
    required this.currentFocus,
    this.nextFocus,
    this.padding,
    this.isSmall = false,
    this.hintTextStyle,
    this.textStyle,
    this.formatter,
    this.textAlign = TextAlign.start,
    this.borderColor = Colors.transparent,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.borderRadius,
    this.textCapitalization,
    this.autocorrect = false,
    this.enableSuggestions = false,
    this.fontSize = 12,
    this.focusColor = Colors.transparent,
    this.onEdittingCompleted,
  });

  @override
  State<TextFieldComponent> createState() => _TextFieldComponentState();
}

class _TextFieldComponentState extends State<TextFieldComponent> {
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return widget.isSmall == false
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _showLabelText(),
              const SizedBox(
                height: 4,
              ),
              Center(child: _textField()),
            ],
          )
        : _textField();
  }

  Widget _textField() {
    return TextFormField(
      cursorColor: widget.cursorColor ?? Colors.white,
      maxLines: widget.maxLines ?? 1,
      controller: widget.controller,
      readOnly: widget.readOnly,
      focusNode: widget.currentFocus,
      enableSuggestions: widget.enableSuggestions,
      autocorrect: widget.autocorrect,

      autovalidateMode: AutovalidateMode.onUserInteraction,
      enabled: widget.enabled,
      obscureText: widget.isPassword ? _hidePassword : !_hidePassword,
      maxLength: widget.maxLength,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      textInputAction: widget.nextFocus != null
          ? TextInputAction.next
          : TextInputAction.done,
      onTap: widget.onTap,
      onChanged: (_) => widget.onChanged == null ? () {} : widget.onChanged!(_),
      onEditingComplete: () {
        widget.currentFocus.unfocus();
        if (widget.nextFocus != null) {
          widget.nextFocus?.requestFocus();
        }
      },
      style: widget.textStyle ?? const TextStyle(color: Colors.white),
      // ??
      // GoogleFonts.robotoCondensed(
      //     fontSize: 14, color: ColorsConstant.black),
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.formatter,
      textAlign: widget.textAlign,
      decoration: InputDecoration(
        errorStyle: TextStyle(fontSize: widget.errorfontSize),
        counterText: '',
        filled: true,
        errorMaxLines: 2,
        fillColor: widget.fillColor,
        enabledBorder: widget.enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
            ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
        ),
        focusedBorder: widget.focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: widget.focusColor!),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
            ),
        errorBorder: widget.errorBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
            ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
        ),
        contentPadding: widget.padding ??
            EdgeInsetsDirectional.only(
                start: 16,
                top: 16,
                bottom: 15,
                end: widget.suffixIcon != null ? 0 : 16),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
        ),
        hintText: widget.hintText ?? '',
        hintStyle: widget.hintTextStyle,
        labelStyle: widget.labelTextStyle,
        // ??
        //   GoogleFonts.robotoCondensed(
        //       fontSize: 12, color: Colors.blueGrey),
        prefixIcon: widget.prefixWidget != null
            ? SizedBox(
                width: widget.enlargePrefixWidget ? 60 : null,
                child: widget.prefixWidget,
              )
            : null,
        suffixIcon: widget.isPassword
            ? GestureDetector(
                child: !_hidePassword
                    ? const Icon(
                        Icons.visibility,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.visibility_off,
                        color: Colors.white,
                      ),
                onTap: () {
                  setState(() {
                    _hidePassword = !_hidePassword;
                  });
                },
              )
            : widget.suffixIcon != null && widget.onSuffixPressed != null
                ? GestureDetector(
                    onTap: widget.onSuffixPressed,
                    child: widget.suffixIcon.runtimeType == IconData
                        ? Icon(
                            widget.suffixIcon,
                            color: Colors.blueGrey,
                          )
                        : widget.suffixIcon,
                  )
                : null,
      ),
    );
  }

  Widget _showLabelText() {
    if (widget.labelText != null) {
      return Row(
        children: [
          Text(
            widget.labelText!,
            style: TextStyle(
                fontSize: widget.fontSize.sp,
                fontWeight: widget.labelFontWeight,
                color: widget.labelColor,
                fontFamily: 'GeneralSans'),
          ),
          Text(
            widget.isRequired ? '*' : '',
            // style: GoogleFonts.robotoCondensed(
            //   fontSize: 14,
            //   color: widget.labelColor,
            // ),
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}

class TextFieldComponentNew extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final bool isPassword;
  final bool isRequired;
  final String? Function(String?)? validator;
  final Function(String _)? onChanged;
  final TextInputType keyboardType;
  final int maxLength;
  final Widget? suffixIcon;
  final VoidCallback? onSuffixPressed;
  final Widget? prefixWidget;
  final Color? fillColor;
  final Color? labelColor;
  final Color? borderColor;
  final Color? cursorColor;
  final Color? focusColor;
  final bool enlargePrfixWidget;
  final bool readOnly;
  final bool enabled;
  final double fontSize;
  final int maxLines;
  final int minLines;
  final void Function()? onTap;
  final FocusNode? currentFocus;
  final FocusNode? nextFocus;
  final EdgeInsetsGeometry? padding;
  final bool isSmall;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final List<TextInputFormatter>? formatter;
  final TextAlign textAlign;
  final TextAlignVertical textAlignVertical;
  final TextCapitalization textCapitalization;
  final bool enableSuggestions;
  final bool autocorrect;
  final void Function()? onEditingComplete;
  final Widget? subText;
  final bool showLimit;
  final InputBorder? border;

  const TextFieldComponentNew({
    this.onEditingComplete,
    this.controller,
    super.key,
    this.hintText,
    this.labelText,
    this.isPassword = false,
    this.isRequired = false,
    this.showLimit = false,
    this.validator,
    this.onChanged(String _)?,
    this.keyboardType = TextInputType.text,
    this.maxLength = 30,
    this.suffixIcon,
    this.fontSize = 12,
    this.onSuffixPressed,
    this.prefixWidget,
    this.onTap,
    this.fillColor,
    this.borderColor = Colors.transparent,
    this.focusColor = Colors.transparent,
    this.labelColor = Colors.black,
    this.cursorColor,
    this.enlargePrfixWidget = true,
    this.readOnly = false,
    this.enabled = true,
    this.maxLines = 1,
    this.currentFocus,
    this.nextFocus,
    this.padding,
    this.isSmall = false,
    this.hintTextStyle,
    this.textStyle,
    this.formatter,
    this.textAlign = TextAlign.start,
    this.textAlignVertical = TextAlignVertical.center,
    this.textCapitalization = TextCapitalization.words,
    this.autocorrect = false,
    this.enableSuggestions = true,
    this.minLines = 1,
    this.subText,
    this.border,
  });

  @override
  State<TextFieldComponentNew> createState() => _TextFieldComponentNewState();
}

class _TextFieldComponentNewState extends State<TextFieldComponentNew> {
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return widget.isSmall == false
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _showLabelText(),
              const Gap(
                8,
              ),
              Center(child: _textField(context)),
            ],
          )
        : _textField(context);
  }

  Widget _textField(BuildContext context) {
    return TextFormField(
      cursorColor: widget.cursorColor,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      controller: widget.controller,
      readOnly: widget.readOnly,
      focusNode: widget.currentFocus,
      enableSuggestions: widget.isPassword ? false : true,
      autocorrect: widget.autocorrect,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enabled: widget.enabled,
      obscureText: widget.isPassword ? _hidePassword : !_hidePassword,
      maxLength: widget.maxLength,
      textCapitalization: widget.textCapitalization,
      textInputAction: widget.nextFocus != null
          ? TextInputAction.next
          : TextInputAction.done,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete ??
          () {
            widget.currentFocus?.unfocus();
            if (widget.nextFocus != null) {
              widget.nextFocus?.requestFocus();
            }
          },
      onFieldSubmitted: (v) {
        widget.currentFocus?.unfocus();
        if (widget.nextFocus != null) {
          widget.nextFocus?.requestFocus();
        }
      },
      style: widget.textStyle,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.formatter,
      textAlign: widget.textAlign,
      textAlignVertical: widget.textAlignVertical,
      decoration: InputDecoration(
        counterText: widget.showLimit ? null : '',
        filled: true,
        errorMaxLines: 2,
        fillColor: widget.fillColor ?? AppColors.charlestonGreen,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(12),
        ),

        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.redAccent),
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: widget.padding ??
            EdgeInsetsDirectional.only(
                start: 16,
                top: 16,
                bottom: 15,
                end: widget.suffixIcon != null ? 0 : 16),
        hintText: widget.hintText ?? '',
        // hintStyle: widget.hintTextStyle ?? context.titleSmall,
        hintStyle: widget.hintTextStyle,
        //   context.titleSmall?.copyWith(color: AppColors.white),
        prefixIcon: widget.prefixWidget != null
            ? SizedBox(
                width: widget.enlargePrfixWidget ? 32 : null,
                child: widget.prefixWidget,
              )
            : null,
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.isPassword)
              GestureDetector(
                child: _hidePassword
                    ? const Icon(Icons.visibility_off, color: AppColors.whito)
                    : const Icon(Icons.visibility, color: AppColors.whito),
                onTap: () {
                  setState(() {
                    _hidePassword = !_hidePassword;
                  });
                },
              ),
            if (widget.isPassword && widget.suffixIcon != null) const Gap(5),
            if (widget.suffixIcon != null)
              GestureDetector(
                onTap: widget.onSuffixPressed,
                child: widget.suffixIcon,
              ),
          ],
        ),
      ),
    );
  }

  Widget _showLabelText() {
    if (widget.labelText != null) {
      return Row(
        children: [
          Text(
            widget.labelText!,
            style: GoogleFonts.manrope(
              color: widget.labelColor,
              fontSize: widget.fontSize,
            ),
          ),
          if (widget.subText != null) ...[
            const Spacer(),
            widget.subText!,
          ],
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
