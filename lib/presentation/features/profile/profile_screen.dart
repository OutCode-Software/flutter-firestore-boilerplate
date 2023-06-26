import 'package:bloc_demo/injector/injector.dart';
import 'package:bloc_demo/presentation/features/login/login_screen.dart';
import 'package:bloc_demo/presentation/features/profile/bloc/profile_bloc.dart';
import 'package:bloc_demo/presentation/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../base/utils/loading.dart';
import '../../../data/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final ProfileBloc _profileBloc;

  @override
  void initState() {
    _profileBloc = Injector.instance<ProfileBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileStates>(
      bloc: _profileBloc,
      listener: (context, state) {
        if (state is LoggedOut) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.responseEntity.message ?? 'Logged Out')));
          Navigator.pushAndRemoveUntil(
              context, LoginScreen.route(), (route) => false);
        }
        if (state is LogOutFailed) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        var loading = (state is ShowLogoutLoader)
            ? state.loadingStatus == LoadingStatus.loading
                ? true
                : false
            : false;
        return SafeArea(
            child: Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        primaryButton(
                          'Log out',
                          () {
                            _profileBloc.add(OnLogOutPressed());
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
              loading ? CustomLoaderDialog().showLoaderDialog() : Container(),
            ],
          ),
        ));
      },
    );
  }
}
