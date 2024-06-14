import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sumangalam/core/ext/context_ext.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/styles/app_icon.dart';
import 'package:sumangalam/core/widgets/app_text_field.dart';
import 'package:sumangalam/core/widgets/primary_btn.dart';
import 'package:sumangalam/core/widgets/spaced_column.dart';
import 'package:sumangalam/features/auth/presentation/bloc/sign_in/sign_in_cubit.dart';


class SignInFormWidget extends StatefulWidget {
  const SignInFormWidget({super.key});

  @override
  State<SignInFormWidget> createState() => _SignInFormWidgetState();
}

class _SignInFormWidgetState extends State<SignInFormWidget> {
  late final TextEditingController _username;
  late final TextEditingController _pswd;
  bool _showPswd = true;

  @override
  void initState() {
    super.initState();
    _username = TextEditingController();
    _pswd = TextEditingController();
  }

  void togglePswd() => setState(() {
        _showPswd = !_showPswd;
      });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12.0),
      child: SpacedColumn(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        defaultHeight: 6,
        children: [
          SizedBox(
            height: context.sizeOfHeight * 0.4, 
            width: context.sizeOfWidth,
            child: SvgPicture.asset(AppIcons.appLogo.path, fit: BoxFit.fitWidth),
          ),
          AppTextField(
            title: 'User ID',
            controller: _username,
            prefixIcon: const Icon(Icons.person),
          ),
          AppTextField(
            title: 'Password',
            controller: _pswd,
            obscureText: _showPswd,
            suffixIcon: InkWell(
              onTap: togglePswd,
              child: Text(
                _showPswd ? ' show ' : ' hide ',
                style: context.textTheme.titleMedium?.copyWith(
                  color: Colors.transparent,
                  shadows: [
                    const Shadow(
                      color: AppColors.catalineBlue,
                      offset: Offset(0, -5),
                    ),
                  ],
                  decorationColor: AppColors.catalineBlue,
                  decoration: TextDecoration.underline,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
          BlocBuilder<SignInCubit, SignInState>(
            builder: (_, state) {
              final isloading =
                  state.maybeWhen(loading: () => true, orElse: () => false);
              return PrimaryBtn(
                isloading: isloading,
                onPressed: () {
                  context
                      .cubit<SignInCubit>()
                      .login(_username.text, _pswd.text);
                },
                title: 'SIGN IN',
              );
            },
          ),
        ],
      ),
    );
  }
}
