// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:omif/app/bloc/app_nav_cubit.dart';
// import 'package:omif/app/ui/account_scrn.dart';
// import 'package:omif/core/core.dart';
// import 'package:omif/core/styles/app_colors.dart';
// import 'package:omif/features/expense/presentation/ui/expenses_scrn.dart';

// class RouteHomeScreen extends StatelessWidget {
//   const RouteHomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: const SimpleAppBar(),
//       backgroundColor: AppColors.white,
//       resizeToAvoidBottomInset: false,
//       body: BlocBuilder<AppNavCubit, AppPage>(
//         builder: (_, state) => switch (state) {
//           AppPage.expense => const ExpensesScrn(),
//           AppPage.account => const AccountScrn(),
//         },
//       ),
//       bottomNavigationBar: const _AppNavBar(),
//     );
//   }
// }

// class _AppNavBar extends StatelessWidget {
//   const _AppNavBar();

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AppNavCubit, AppPage>(
//       builder: (_, state) {
//         return BottomNavigationBar(
//           backgroundColor: context.colorScheme.primary,
//           unselectedItemColor: Colors.white.withOpacity(0.5),
//           selectedItemColor: Colors.white,
//           showSelectedLabels: true,
//           showUnselectedLabels: true,
//           elevation: 0,
//           currentIndex: state.indx,
//           selectedLabelStyle: context.textTheme.labelSmall,
//           unselectedLabelStyle: context.textTheme.labelSmall,
//           onTap: context.cubit<AppNavCubit>().onScreenChanged,
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//               activeIcon: Icon(Icons.home_outlined),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label: 'Account',
//               activeIcon: Icon(Icons.person_outlined),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
