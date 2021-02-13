import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icon_shadow/icon_shadow.dart';
import 'package:movies_app_with_provider/ProviderServices/MoviesProvider.dart';
import 'package:movies_app_with_provider/DataLayer/constants/constants.dart';
import 'package:movies_app_with_provider/Ui/HomeScreen/appBar/ChangeCategory.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Size size;
  final String title;
  final TabController  tabController;

  CustomAppBar({Key key, this.size, this.title, this.tabController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MoviesProvider>(context, listen: false);
    return AppBar(
      title: Text(title,style: Theme.of(context).textTheme.headline5.copyWith(
        color: Colors.white
      ),),
      actions: [ChangeCategory()],
      bottom: TabBar(
        controller: tabController,
        indicatorColor: Colors.white,
        tabs: List.generate(
            categoriesNames.length,
            (index) => Tab(
                  icon: IconShadowWidget(
                    iconsList[index],
                    shadowColor: Colors.orangeAccent,
                  ),
                  child: Text(
                    categoriesNames[index],
                    style: TextStyle(fontSize: 10.4),
                  ),
                )).toList(),
      ),
    );
  }

  @override
  Size get preferredSize => size;
}
