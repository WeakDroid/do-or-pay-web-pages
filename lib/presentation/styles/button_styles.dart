import 'package:flutter/material.dart';
import 'colors.dart';

class AppButtonStyle {
  static ButtonStyle mainButton = ElevatedButton.styleFrom(
      fixedSize: const Size(double.infinity, 48),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)));

  static ButtonStyle bottomSheetButtonStyle = ElevatedButton.styleFrom(
      fixedSize: const Size(double.infinity, 48),
      elevation: 0,
      backgroundColor: AppColors.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)));

  static ButtonStyle dialogButtonStyle = ElevatedButton.styleFrom(
      fixedSize: const Size(double.infinity, 48),
      elevation: 1,
      backgroundColor: AppColors.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      side: const BorderSide(width: 0.6, color: AppColors.slateGray));

  static ButtonStyle settingsButton = ElevatedButton.styleFrom(
      fixedSize: const Size(double.infinity, 58),
      backgroundColor: AppColors.background,
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      foregroundColor: AppColors.slateGray,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      side: const BorderSide(width: 0.6, color: AppColors.charcoal));

  static ButtonStyle contactUsButton = ElevatedButton.styleFrom(
      fixedSize: const Size(double.infinity, 58),
      backgroundColor: AppColors.slateGray,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      side: const BorderSide(width: 0.6, color: AppColors.charcoal));

  static ButtonStyle bottomMenuButtonStyle = ElevatedButton.styleFrom(
      fixedSize: const Size(double.infinity, 56),
      backgroundColor: AppColors.background,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));
}
