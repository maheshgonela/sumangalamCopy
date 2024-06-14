import 'package:flutter/material.dart';

import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/styles/app_icon.dart';
import 'package:svg_flutter/svg.dart';

enum AppSnackBarType { error, success, info}

class AppSnackBarWidget extends StatelessWidget {
  const AppSnackBarWidget({super.key, required this.content, required this.type});

  final String content;
  final AppSnackBarType type;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.sizeOfHeight * 0.08,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              color: _snackbarColor(type), 
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20)),
              child: SvgPicture.asset(
                AppIcons.appLogo.path,
                height: context.sizeOfHeight * 0.06,
                width: context.sizeOfWidth * 0.05,
              ),
            ),
          ),
          Positioned.fill(
            child: Center(
              child: Text(content, 
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600, 
                  color: type == AppSnackBarType.info ? AppColors.black : AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _snackbarColor(AppSnackBarType type) => switch(type) {
    AppSnackBarType.error => AppColors.rejected,
    AppSnackBarType.success => AppColors.success,
    AppSnackBarType.info => AppColors.grey,
  };
}