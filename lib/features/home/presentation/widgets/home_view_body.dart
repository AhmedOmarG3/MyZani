import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/theme/app_theme.dart';
import 'package:myzani/features/home/presentation/blocs/home/home_cubit.dart';
import 'package:myzani/features/home/presentation/widgets/custom_card.dart';
import 'package:myzani/features/home/presentation/widgets/custom_home_app_bar_container.dart';
import 'package:myzani/features/home/presentation/widgets/custom_list_tile.dart';
import 'package:myzani/features/home/presentation/widgets/home_app_bar_body.dart';
import 'package:myzani/features/transactions_management/presentation/blocs/get_transaction/get_transaction_cubit.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeIsEmpty) {
          return Center(child: Text('Empty'));
        } else if (state is HomeDataLoaded) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: CustomScrollView(
              clipBehavior: Clip.none,
              slivers: [
                SliverToBoxAdapter(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CustomHomeAppBarContainer(child: HomeAppBarBody()),
                      Positioned(
                        top: 180,
                        left: 20.w,
                        child: CustomCard(homeCardEntity: state.homeCardEntity),
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 100.h)),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20.r),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      'Expense History',
                      style: AppStyles.textStyle20SemiBold(
                        context,
                      ).copyWith(color: context.appTheme.textPrimaryColor),
                    ),
                  ),
                ),
                state.transactions.isNotEmpty
                    ? SliverPadding(
                        padding: EdgeInsets.only(
                          left: 20.r,
                          right: 20.r,
                          top: 5.r,
                        ),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) => CustomListTile(
                              onTap: () {
                                context
                                    .read<GetTransactionCubit>()
                                    .getTransaction(index);
                                context.read<HomeCubit>().changePage(2);
                              },
                              transactionEntity: state.transactions[index],
                            ),
                            childCount: state.transactions.length,
                          ),
                        ),
                      )
                    : SliverFillRemaining(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'No transactions yet !',
                              style: AppStyles.textStyle20SemiBold(
                                context,
                              ).copyWith(color: context.appTheme.primaryColor),
                            ),
                            Text(
                              'Start adding transactions',
                              style: AppStyles.textStyle20SemiBold(
                                context,
                              ).copyWith(color: context.appTheme.primaryColor),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
