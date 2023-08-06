import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moleculas_ar/shared/models/molecules_category_model.dart';
import 'package:moleculas_ar/shared/utils/app_state.dart';
import 'package:moleculas_ar/modules/home_molecules/home_molecules_provider.dart';
import 'package:moleculas_ar/modules/molecule_category/molecule_category_page.dart';
import 'package:moleculas_ar/shared/res/app_res.dart';
import 'package:moleculas_ar/shared/shimmers/item_list/item_list_shimmer.dart';
import 'package:moleculas_ar/shared/widgets/shared_widgets.dart';

class HomeMoleculesPage extends StatefulWidget {
  const HomeMoleculesPage({Key? key}) : super(key: key);

  @override
  State<HomeMoleculesPage> createState() => _HomeMoleculesPageState();
}

class _HomeMoleculesPageState extends State<HomeMoleculesPage> {
  final provider = HomeMoleculesProvider();

  @override
  void initState() {
    super.initState();
    provider.getMoleculesCategories();
    provider.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return (provider.state == AppState.success)
        ? ListView.separated(
            itemCount: provider.moleculesCategories!.length,
            itemBuilder: (context, i) => IconTextOutlinedButtonWidget(
              imagePath:
                  (provider.moleculesCategories![i].iconPath).isNotEmpty
                      ? provider.moleculesCategories![i].iconPath
                      : AppRes.images.iconThreeMolecules,
              title: provider.moleculesCategories![i].title,
              onPressed: () {
                goToMoleculeCategoryPage(
                  context: context,
                  appBarTitle: provider.moleculesCategories![i].title,
                  category: provider.moleculesCategories![i].category,
                );
              },
            ),
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 24.w),
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(height: 20.h),
          )
        : ItemListShimmer(listLength: provider.moleculesCategories?.length);
  }

  void goToMoleculeCategoryPage({
    required dynamic context,
    required String appBarTitle,
    required MoleculeCategories category
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MoleculeCategoryPage(
          appBarTitle: appBarTitle,
          category: category,
        ),
      ),
    );
  }
}
