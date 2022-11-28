import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pasien/src/core/config/theme_colors.dart';

Future<bool?> showConfirmationDialog({
  required BuildContext context,
  String? title,
  required String message,
  String negativeButton = 'Batal',
  String positiveButton = 'Ya',
}) async {
  return showDialog(
    context: context,
    barrierColor: ThemeColors.black70,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.sp)),
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(24.sp, 24.sp, 24.sp, 16.sp),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (title != null) ...{
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.sp),
                ),
                SizedBox(height: 16.sp),
              },
              Text(
                message,
                style: TextStyle(fontSize: 12.sp),
              ),
              SizedBox(height: 16.sp),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context, false),
                      style: ElevatedButton.styleFrom(
                        visualDensity: VisualDensity.standard,
                        backgroundColor: ThemeColors.backgroundField,
                        foregroundColor: ThemeColors.greyCaption,
                      ),
                      child: Text(negativeButton),
                    ),
                  ),
                  SizedBox(width: 16.sp),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context, true),
                      style: ElevatedButton.styleFrom(
                        visualDensity: VisualDensity.standard,
                      ),
                      child: Text(positiveButton),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
