import 'package:bloc_demo/presentation/features/cart/cart_screen.dart';
import 'package:bloc_demo/presentation/features/products/products_screen.dart';
import 'package:bloc_demo/presentation/features/profile/profile_screen.dart';
import 'package:bloc_demo/presentation/navigation/bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/utils/colors.dart';
import '../../base/utils/loading.dart';
import '../../injector/injector.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const DashboardScreen());
  }
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final BottomNavigationBloc _navigationBloc;

  @override
  void initState() {
    _navigationBloc = Injector.instance<BottomNavigationBloc>();
    _navigationBloc.add(const OnTabSelected(index: 0));
    super.initState();
  }

  void _onTabSelected(int index) {
    _navigationBloc.add(OnTabSelected(
      index: index,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
            bloc: _navigationBloc,
            builder: (context, state) {
              return state.when(
                initial: () => Container(),
                loading: () {
                  return CustomLoaderDialog().showLoaderDialog();
                },
                onTabLoad: ((index, navigationState) {
                  switch (navigationState) {
                    case BottomNavigationStates.homePageLoaded:
                      return const ProductsScreen();
                    case BottomNavigationStates.cartPageLoaded:
                      return const CartScreen();
                    case BottomNavigationStates.profilePageLoaded:
                      return const ProfileScreen();
                    default:
                      return const ProductsScreen();
                  }
                }),
              );
            },
          ),
          bottomNavigationBar: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
            bloc: _navigationBloc,
            builder: (context, state) {
              return BottomNavigationBar(
                selectedItemColor: AppColors.primary,
                unselectedItemColor: AppColors.textColorGrey,
                currentIndex: _navigationBloc.currentIndex,
                onTap: _onTabSelected,
                showUnselectedLabels: true,
                elevation: 8,
                type: BottomNavigationBarType.fixed,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shop),
                    label: 'Products',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart),
                    label: 'Cart',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
