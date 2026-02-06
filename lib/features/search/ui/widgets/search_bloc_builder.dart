import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/color_manager.dart';
import '../../../../core/theme/text_styles.dart';
import '../../logic/cubit/search_cubit.dart';
import 'user_tile.dart';

class SearchBlocBuilder extends StatelessWidget {
  const SearchBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        switch (state) {
          case SearchInitial():
            return Center(
              child: Text('Search for users', style: TextStyles.font18W600),
            );
          case SearchLoading():
            return Center(
              child: CircularProgressIndicator(color: ColorManager.black23),
            );
          case SearchSuccess():
            final users = state.users;
            if (users.isEmpty) {
              return Center(
                child: Text('No users found', style: TextStyles.font18W600),
              );
            }
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return UserTile(user: users[index]);
              },
            );
          case SearchFailure():
            return Center(
              child: Text(
                state.errorMessage,
                style: TextStyles.font18W600.copyWith(color: Colors.red),
              ),
            );
        }
      },
    );
  }
}
