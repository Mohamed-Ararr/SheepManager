// ignore_for_file: file_names

import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_slidable/flutter_slidable.dart";
import "package:go_router/go_router.dart";
import "package:sheepmanager/Core/Utils/deleteOption.dart";
import "package:sheepmanager/Core/Utils/soldOption.dart";
import "package:sheepmanager/Features/HomeScreen/Data/Model/sheep_model.dart";
import "package:sheepmanager/Features/HomeScreen/Presentation/Bloc%20Manager/SheepsCubit/sheeps_cubit.dart";

import "../../../../Core/Utils/colors.dart";
import "../../../../Core/Utils/router.dart";
import "SheepCard.dart";

class CardsListView extends StatelessWidget {
  const CardsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SheepsCubit, SheepsState>(
      builder: (context, state) {
        if (state is SheepsSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.sheepList.length,
            itemBuilder: (context, index) {
              return Slidable(
                actionPane: const SlidableDrawerActionPane(),
                secondaryActions: [
                  Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: const DeleteOption()),
                  const SoldOption(),
                ],
                child: SheepCard(
                  sheep: state.sheepList[index],
                  onTap: () => GoRouter.of(context).push(
                    AppRouter.showSheepInfoView,
                    extra: state.sheepList[index],
                  ),
                ),
              );
            },
          );
        } else if (state is SheepsFailed) {
          return Text(state.errorMsg);
        } else {
          return Center(
              child: CircularProgressIndicator(
            color: AppColors.secColor,
          ));
        }
      },
    );
  }
}
