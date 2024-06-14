import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/styles/app_icon.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SimpleAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: context.canPop()
          ? IconButton(
              onPressed: context.pop,
              icon: const CircleAvatar(
                backgroundColor: AppColors.deepSapphire,
                radius: 14,
                child: Icon(Icons.arrow_back, color: AppColors.white, size: 18),
              ),
            )
          : null,
      title: SvgPicture.asset(
        AppIcons.appLogo.path,
      ),
      backgroundColor: AppColors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
