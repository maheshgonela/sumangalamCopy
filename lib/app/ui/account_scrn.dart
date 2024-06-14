import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:sumangalam/core/ext/context_ext.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/styles/app_icon.dart';
import 'package:sumangalam/core/widgets/app_dialogs.dart';
import 'package:sumangalam/core/widgets/app_spacer.dart';
import 'package:sumangalam/core/widgets/primary_btn.dart';

class AccountScrn extends StatelessWidget {
  const AccountScrn({super.key});

  final double topWidgetHeight = 150.0;
  final double avatarRadius = 68.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: AppBar(),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColors.budhaGold
              ),
          ),
          Positioned(
            top: 12,
            left: 12,
            child: SizedBox(
              width: double.maxFinite,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Profile',
                      style: context.textTheme.headlineMedium!.copyWith(
                          color: AppColors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          Positioned.fill(
            top: kToolbarHeight + 94,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.white),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32)),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: avatarRadius,
                  ),
                  ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.deepSapphire, width: 2),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(
                        Icons.info,
                        size: 26,
                        color: AppColors.deepSapphire,
                      ),
                    ),
                    title: Text(
                      'Details',
                      style: context.textTheme.headlineMedium?.copyWith(
                        color: AppColors.deepSapphire,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Divider(
                    endIndent: 10,
                    indent: 10,
                    color: AppColors.black,
                    thickness: 1.3,
                  ),
                  // ProfileTile(
                  //   icon: Icons.person_rounded,
                  //   title: 'Name',
                  //   value: context.user.userName,
                  // ),
                  // ProfileTile(
                  //   icon: Icons.corporate_fare_rounded,
                  //   title: 'Organization',
                  //   value: context.user.organizationName,
                  // ),
                  // ProfileTile(
                  //   icon: Icons.badge_rounded,
                  //   title: 'Role',
                  //   value: context.user.defaultRoleName,
                  // ),
                  FutureBuilder<PackageInfo>(
                    future: PackageInfo.fromPlatform(),
                    builder: (context, snapshot) =>
                        switch (snapshot.connectionState) {
                      ConnectionState.done => ProfileTile(
                          icon: Icons.lock_rounded,
                          title: 'App Version',
                          value: snapshot.data!.version),
                      _ => const ProfileTile(
                          icon: Icons.lock_rounded,
                          title: 'App Version',
                          value: 'Loading..'),
                    },
                  ),
                  PrimaryBtn(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 30),
                    height: 56,
                    color: AppColors.deepSapphire,
                    icon: const Icon(
                      Icons.logout_rounded,
                      size: 26,
                      color: AppColors.white,
                    ),
                    onPressed: () async {
                      final res = await AppDialog.askForConfirmation<bool>(
                            context,
                            content: 'Are you sure. Do you want to logout?',
                            buttonText: 'No',
                            confirmBtnText: 'Yes',
                            onTapDismiss: () => context.pop(false),
                            onTapConfirm: () => context.pop(true),
                          ) ??
                          false;
                      if (res && context.mounted) {
                      }
                    },
                    title: 'Logout',
                    style: context.textTheme.headlineSmall?.copyWith(
                        color: AppColors.white, fontWeight: FontWeight.bold),
                  ),
                  Flexible(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Powered by ',
                              style: context.textTheme.labelLarge?.copyWith(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w600)),
                          InkWell(
                              onTap: () {},
                              child: Text(
                                'EasyCloud',
                                style: context.textTheme.labelLarge?.copyWith(
                                    color: AppColors.normal,
                                    fontWeight: FontWeight.w600),
                              )),
                        ],
                      ),
                      AppSpacer.p4(),
                    ],
                  ))
                ],
              ),
            ),
          ),
          Positioned(
            left: (MediaQuery.of(context).size.width / 2) - avatarRadius,
            top: topWidgetHeight - avatarRadius,
            child: Container(
                width: avatarRadius * 2,
                height: avatarRadius * 2,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 2),
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),
                  ],
                  // gradient: const RadialGradient(
                  //   colors: [AppColors.white, Color(0xFFFFEED1)],
                  //   stops: [.4, 1],
                  //   center: Alignment.center,
                  // ),
                  borderRadius: BorderRadius.all(Radius.circular(avatarRadius)),
                  border: Border.all(
                    color: AppColors.budhaGold,
                    width: 2.0,
                  ),
                ),
                child: SvgPicture.asset(AppIcons.appLogo.path)),
          ),
        ],
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final String title;
  final String value;

  final IconData icon;

  const ProfileTile({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.budhaGold, width: 2),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(
          icon,
          size: 21,
          color: AppColors.budhaGold,
        ),
      ),
      title: Text(
        title,
        style: context.textTheme.titleMedium
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      trailing: Text(
        value,
        style: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: AppColors.grey,
        ),
      ),
    );
  }
}
