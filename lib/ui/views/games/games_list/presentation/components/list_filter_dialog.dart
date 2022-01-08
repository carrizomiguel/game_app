import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_app/ui/views/games/games_list/domain/entities/categories.dart';
import 'package:games_app/ui/views/games/games_list/presentation/bloc/games_bloc.dart';

class ListFilterDialog extends StatelessWidget {
  const ListFilterDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<GamesBloc>();
    final textColor = Theme.of(context).textTheme.subtitle1!.color;
    return AlertDialog(
      content: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .6,
        child: SingleChildScrollView(
          child: BlocBuilder<GamesBloc, GamesState>(
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order',
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.grey.shade400,
                    height: 3,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Wrap(spacing: 6, runSpacing: 6, children: [
                    FilterChip(
                        selected: bloc.orderSelected == 'A - Z',
                        label: const Text('A - Z'),
                        onSelected: (isSelected) {
                          bloc.add(const GamesEvent.changeOrder('A - Z'));
                        }),
                    FilterChip(
                        selected: bloc.orderSelected == 'Z - A',
                        label: const Text('Z - A'),
                        onSelected: (isSelected) {
                          bloc.add(const GamesEvent.changeOrder('Z - A'));
                        }),
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Categories',
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.grey.shade400,
                    height: 3,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: List<Widget>.generate(
                      categoriesList.length,
                      (index) => FilterChip(
                        selected: bloc.categoriesSelected
                            .contains(categoriesList[index].name),
                        label: Text(categoriesList[index].name),
                        onSelected: (isSelected) {
                          bloc.add(GamesEvent.addCategoryFilter(
                            categoriesList[index].name
                          ));
                        }
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}
