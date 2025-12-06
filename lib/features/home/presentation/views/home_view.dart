import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myzani/core/app_router.dart';
import 'package:myzani/features/home/presentation/blocs/home/home_cubit.dart';
import 'package:myzani/features/transactions_management/presentation/blocs/get_transaction/get_transaction_cubit.dart';
import 'package:myzani/features/transactions_management/presentation/views/transaction_details_view.dart';
import 'package:myzani/features/home/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:myzani/features/home/presentation/widgets/custom_floating_action.dart';
import 'package:myzani/features/home/presentation/widgets/home_view_body.dart';
import 'package:myzani/features/insights/presentation/views/insights_view.dart';
import 'package:myzani/features/profile/presentation/views/profile_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const pages = [
    HomeViewBody(),
    InsightsView(),
    TransactionDetailsView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        int currentIndex = 0;
        if (state is HomeDataLoaded) {
          currentIndex = state.currentIndex;
        }

        return Scaffold(
          extendBody: true,
          body: IndexedStack(index: currentIndex, children: pages),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: currentIndex == 0
              ? CustomFAB(onTap: () => context.push(AppRouter.addTrasaction))
              : const SizedBox(),
          bottomNavigationBar: CustomBottomNavBar(
            currentIndex: currentIndex,
            onTap: (index) {
              context.read<HomeCubit>().changePage(index);
              if (index == 2) {
             context.read<GetTransactionCubit>().getLastTransaction();
              }
            },
          ),
        );
      },
    );
  }
}
