import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/features/home/presentation/widgets/custom_card.dart';
import 'package:myzani/features/home/presentation/widgets/custom_home_app_bar_container.dart';
import 'package:myzani/features/home/presentation/widgets/custom_list_tile.dart';
import 'package:myzani/features/home/presentation/widgets/home_app_bar_body.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
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
                Positioned(top: 180, left: 20.w, child: CustomCard()),
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 100.h)),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20.r),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Expense History',
                style: AppStyles.textStyle20SemiBold.copyWith(
                  color: Color(0XFF222222),
                ),
              ),
            ),
          ),

          SliverPadding(
            padding: EdgeInsets.only(left: 20.r, right: 20.r, top: 5.r),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => CustomListTile(),
                childCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
