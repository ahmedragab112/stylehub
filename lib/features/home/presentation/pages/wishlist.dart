import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/features/home/data/models/get_user_wishlist_model.dart';
import 'package:stylehub/features/home/presentation/manager/home_cubit.dart';
import 'package:stylehub/features/home/presentation/widgets/wish_list_iteam.dart';

class WishListBody extends StatelessWidget {
  const WishListBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return CustomScrollView(
      slivers: [
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is AddToWishListLoading) {
              return const SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            else if (state is AddToWishListError) {
              return SliverToBoxAdapter(
                child: Center(
                  child: Text(state.error),
                ),
              );
            }
            return SliverList.separated(
              itemBuilder: (context, index) => WishListIteam(
                userWishList: cubit.getUserWishList?.data?[index] ?? Data(),
              ),
              itemCount: cubit.getUserWishList?.data?.length,
              separatorBuilder: (context, index) => const VerticalSpace(24),
            );
          },
        )
      ],
    ).setPadding(context, horizontal: 8, vertical: 20);
  }
}
