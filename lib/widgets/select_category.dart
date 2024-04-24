import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:v1project/providers/providers.dart';
import 'package:v1project/utils/utils.dart';
import 'package:v1project/widgets/circle_container.dart';

class SelectCategory extends ConsumerWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = TaskCategories.values.toList();
    final selectedCategory = ref.watch(categoryProvider);

    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Text('Category:', style: TextStyle(fontSize: 18)),
          const Gap(18),
          Expanded(
            child: ListView.separated(
              physics: AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final category = categories[index];

                return InkWell(
                  onTap: () {
                    ref.read(categoryProvider.notifier).state = category;
                  },
                  child: CircleContainer(
                    // color: category.color,

                    color: category == selectedCategory
                        ? category.color.withOpacity(0.3)
                        : category.color,
                    child: Icon(
                      category.icon,

                      // color: Colors.white,
                      color: category == selectedCategory
                          ? category.color
                          : Colors.white,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Gap(5);
              },
              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
