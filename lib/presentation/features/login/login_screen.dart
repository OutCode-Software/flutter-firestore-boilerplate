import 'package:bloc_demo/base/utils/colors.dart';
import 'package:bloc_demo/base/utils/loading.dart';
import 'package:bloc_demo/presentation/features/register/register_screen.dart';
import 'package:bloc_demo/presentation/navigation/dashboard_screen.dart';
import 'package:bloc_demo/presentation/widgets/form_field.dart';
import 'package:bloc_demo/presentation/widgets/primary_button.dart';
import 'package:bloc_demo/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../base/utils/app_spacing.dart';
import '../../../data/constants.dart';
import '../../../injector/injector.dart';
import 'bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginScreen());
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isObscureText = true;

  late final LoginBloc _loginBloc;

  @override
  void initState() {
    _loginBloc = Injector.instance<LoginBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginStates>(
      bloc: _loginBloc,
      listener: (context, state) {
        if (state is LoginFailed) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
        if (state is LoginSuccess) {
          Navigator.pushReplacement(context, DashboardScreen.route());
        }
      },
      builder: (context, state) {
        var loading = (state is ShowLoginLoader)
            ? state.loadingStatus == LoadingStatus.loading
                ? true
                : false
            : false;
        return Scaffold(
          body: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppSpacing.verticalSpacing24,
                  const Spacer(),
                  loginForm(),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      textViewComponent(
                          text: 'Don\'t have an account?',
                          fontWeight: FontWeight.w400,
                          textColor: AppColors.primaryElementColor,
                          fontSize: 18),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, RegisterScreen.route());
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          child: textViewComponent(
                              text: 'Register Here',
                              fontWeight: FontWeight.w700,
                              textColor: AppColors.primaryElementColor,
                              fontSize: 19),
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.verticalSpacing24,
                ],
              ),
              loading ? CustomLoaderDialog().showLoaderDialog() : Container(),
            ],
          ),
        );
      },
    );
  }

  Widget loginForm() {
    return Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.all(12),
          child: Column(
            children: <Widget>[
              formField(
                context,
                placeholder: 'Email',
                hint: 'Enter email',
                controller: userNameController,
                doValidate: true,
                editable: true,
                selection: TextInputType.emailAddress,
                setRules: FieldValidationRules.email,
              ),
              AppSpacing.verticalSpacing24,
              formField(context,
                  placeholder: 'Password',
                  hint: 'Enter password',
                  controller: passwordController,
                  doValidate: true,
                  editable: true,
                  isPassword: true,
                  isObscureText: _isObscureText,
                  selection: TextInputType.visiblePassword,
                  action: TextInputAction.done, onPasswordVisibleClick: () {
                setState(() {
                  _isObscureText = !_isObscureText;
                });
              }),
              AppSpacing.verticalSpacing24,
              Row(
                children: [
                  Expanded(
                    child: primaryButton('Login', () {
                      if (_formKey.currentState!.validate()) {
                        _loginBloc.add(
                          OnLoginPressed(
                              email: userNameController.text.trim(),
                              password: passwordController.text.trim()),
                        );
                      }
                    }),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
