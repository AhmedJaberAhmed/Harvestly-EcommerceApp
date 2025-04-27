

import 'package:flutter/cupertino.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'custom_colors.dart';

void showUtilSuccessTopSnackBar(BuildContext context, String message) {
  final overlay = Overlay.of(context);
  if (overlay != null) {
    showTopSnackBar(
      overlay,
      CustomSnackBar.success(
        message: message,
        backgroundColor: AppColors.primaryColor,
      ),
    );
  }
}



void showUtilFailTopSnackBar(BuildContext context, {required String  message}) {
  final overlay = Overlay.of(context);
  if (overlay != null) {
    showTopSnackBar(
      overlay,
      CustomSnackBar.error(
        message: message,
        backgroundColor: AppColors.primaryColor,
      ),
    );
  }
}



void showUtilInfoTopSnackBar(BuildContext context, String message) {
  final overlay = Overlay.of(context);
  if (overlay != null) {
    showTopSnackBar(
      overlay,
      CustomSnackBar.info(
        message: message,
        backgroundColor: AppColors.primaryColor,
      ),
    );
  }
}
