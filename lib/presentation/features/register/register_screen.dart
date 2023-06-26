import 'package:bloc_demo/base/utils/loading.dart';
import 'package:bloc_demo/injector/injector.dart';
import 'package:bloc_demo/presentation/features/register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../base/utils/app_spacing.dart';
import '../../../base/utils/colors.dart';
import '../../../data/constants.dart';
import '../../widgets/form_field.dart';
import '../../widgets/primary_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const RegisterScreen());
  }
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  late final RegisterBloc _registerBloc;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool _showPassword = true;
  bool _showConfirmPassword = true;

  @override
  void initState() {
    _registerBloc = Injector.instance<RegisterBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterStates>(
      bloc: _registerBloc,
      listener: (context, state) {
        if (state is RegisterFailed) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
        if (state is RegisterSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${state.userModel.firstName}, your account is registered successfully.')));
        }
      },
      builder: (context, state) {
        var loading = (state is ShowRegisterLoader)
            ? state.loadingStatus == LoadingStatus.loading
                ? true
                : false
            : false;
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(backgroundColor: AppColors.primary,),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppSpacing.verticalSpacing24,
                      _registerForm(),
                    ],
                  ),
                ),
                loading ? CustomLoaderDialog().showLoaderDialog() : Container(),
              ],
            ),
          ),
        );
      },
    );
  }

  _registerForm() {
    return Form(
      key: _formKey,
      child: Container(
        margin: const EdgeInsets.all(12),
        child: Column(
          children: [
            formField(
              context,
              placeholder: 'First Name',
              hint: 'Enter first name',
              controller: firstNameController,
              doValidate: true,
              editable: true,
              setRules: FieldValidationRules.mandatoryField,
            ),
            AppSpacing.verticalSpacing24,
            formField(
              context,
              placeholder: 'Last Name',
              hint: 'Enter last name',
              controller: lastNameController,
              doValidate: true,
              editable: true,
              setRules: FieldValidationRules.mandatoryField,
            ),
            AppSpacing.verticalSpacing24,
            formField(
              context,
              placeholder: 'Email',
              hint: 'Enter email',
              controller: emailController,
              doValidate: true,
              editable: true,
              selection: TextInputType.emailAddress,
              setRules: FieldValidationRules.email,
            ),
            AppSpacing.verticalSpacing24,
            formField(
              context,
              placeholder: 'Password',
              hint: 'Enter password',
              controller: passwordController,
              doValidate: true,
              editable: true,
              isPassword: true,
              isObscureText: _showPassword,
              selection: TextInputType.visiblePassword,
              onPasswordVisibleClick: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              },
            ),
            AppSpacing.verticalSpacing24,
            formField(
              context,
              placeholder: 'Confirm Password',
              hint: 'Enter password',
              controller: confirmPasswordController,
              doValidate: true,
              editable: true,
              isPassword: true,
              isObscureText: _showConfirmPassword,
              selection: TextInputType.visiblePassword,
              action: TextInputAction.done,
              onPasswordVisibleClick: () {
                setState(() {
                  _showConfirmPassword = !_showConfirmPassword;
                });
              },
            ),
            AppSpacing.verticalSpacing24,
            Row(
              children: [
                Expanded(
                  child: primaryButton('Register', () {
                    if (_formKey.currentState!.validate()) {
                      if (passwordController.text.trim() ==
                          confirmPasswordController.text.trim()) {
                        _registerBloc.add(
                          OnRegisterPressed(
                            firstName: firstNameController.text.trim(),
                            lastName: lastNameController.text.trim(),
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          ),
                        );
                      }
                    }
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}
