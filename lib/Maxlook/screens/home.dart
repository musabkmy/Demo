import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:test3/Maxlook/data/data.dart';
import 'package:test3/Maxlook/models/prdouct.dart';
import 'package:test3/Maxlook/providers/products_provider.dart';
import 'package:test3/Maxlook/widgets/ads.dart';
import 'package:test3/Maxlook/utils/constants.dart';

import '../shared/shared_funtions.dart';
import '../utils/enums.dart';
import '../widgets/product_card.dart';

class MaxlookHome extends StatelessWidget {
  static String id = 'MaklookHome';
  const MaxlookHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment(-3, 0),
            // begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [orangeGradientColor, lightColor]),
      ),
      child: Scaffold(
        body: _MaxlookBody(),
      ),
    );
  }
}

class _MaxlookBody extends StatefulWidget {
  _MaxlookBody({Key? key}) : super(key: key);

  @override
  State<_MaxlookBody> createState() => _MaxlookBodyState();
}

class _MaxlookBodyState extends State<_MaxlookBody>
    with SingleTickerProviderStateMixin {
  late ProductsProvider _productsProvider;
  late TabController tabController;
  late ScrollController scrollController;
  late Conststants conststants;
  late List<ProductsTab> tabs = [];
  // Color tabBarColor = Colors.transparent;

  @override
  void initState() {
    scrollController = ScrollController();

    // scrollController.addPostFrameCallback;
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   scrollController.addListener(() {
    //     print('scrolling');
    //   });
    //   scrollController.position.isScrollingNotifier.addListener(() {
    //     if (!scrollController.position.isScrollingNotifier.value &&
    //         scrollController.position.atEdge) {
    //       setState(() {
    //         tabBarColor = orangeGradientColor;
    //       });
    //     } else {
    //       setState(() {
    //         tabBarColor = Colors.transparent;
    //       });
    //     }
    //   });
    // });
    tabController = TabController(length: noOfTabsAvailable(), vsync: this);
    tabController.addListener(() {
      tabController.animateTo(
        tabController.index,
        duration: Duration(microseconds: 300),
        curve: Curves.ease,
      );
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _productsProvider = Provider.of<ProductsProvider>(context);
    conststants = Conststants(context: context);

    return SafeArea(
      child: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (context, value) => [
                SliverToBoxAdapter(
                  child: Container(
                    height: 260.0,
                    child: Column(
                      children: [
                        _appBar(context),
                        SizedBox(height: minPadding),
                        Ads(),
                      ],
                    ),
                  ),
                ),
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverPersistentHeader(
                    pinned: true,
                    delegate: _SliverAppBarDelegate(
                      minHeight: conststants.fullHeight() * 0.05,
                      maxHeight: conststants.fullHeight() * 0.05,
                      child: Container(
                        color: orangeGradientColor,
                        child: TabBar(
                            controller: tabController,
                            isScrollable: true,
                            splashFactory: NoSplash.splashFactory,
                            padding:
                                EdgeInsets.symmetric(horizontal: minPadding),
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorWeight: 2.0,
                            indicatorPadding:
                                EdgeInsets.symmetric(vertical: 12),
                            indicatorColor: darkColor,
                            tabs: _tabBarTitles()),
                      ),
                    ),
                  ),
                ),
              ],
          body:
              TabBarView(controller: tabController, children: _tabBarBodies())),
    );
  }

  Widget _appBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: minPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Maxlook',
            style: Theme.of(context).textTheme.headlineLarge,
          ).animate().fade().scale().shader()
          // .blur()
          ,
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search)),
              SizedBox(width: minPadding / 2),
              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.bell)),
            ],
          )
        ],
      ),
    );
  }

  List<Widget> _tabBarTitles() {
    late List<Widget> _titles = [];
    int nextIndex = 1;

    // List<ProductsTab> _tempTabs = [];
    _titles.add(_tabBarTitle('All', 0));
    tabs.add(ProductsTab.all);
    if (productsHasNew()) {
      _titles.add(_tabBarTitle('Newest', nextIndex));
      tabs.add(ProductsTab.newest);
      nextIndex++;
    }
    if (productsHasPopular()) {
      _titles.add(_tabBarTitle('Popular', nextIndex));
      tabs.add(ProductsTab.popular);
      nextIndex++;
    }
    if (productsHasMan()) {
      _titles.add(_tabBarTitle('Man', nextIndex));
      tabs.add(ProductsTab.man);
      nextIndex++;
    }
    if (productsHasWoman()) {
      _titles.add(_tabBarTitle('Woman', nextIndex));
      tabs.add(ProductsTab.woman);
      nextIndex++;
    }

    // tabs = _tempTabs;
    // print('tabs length ${tabs.length}');

    return _titles;
  }

  Widget _tabBarTitle(String title, int index) {
    return Tab(
      child: Text(title,
          style: tabController.index == index
              ? TextStyle(
                  color: darkColor, fontSize: 16.0, fontWeight: FontWeight.bold)
              : TextStyle(
                  color: darkColor.withOpacity(0.5),
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal)),
    );
  }

  List<Widget> _tabBarBodies() {
    List<Widget> _bodies = [];
    // print(
    //     '_tabs[tabController.index]: ${tabs[tabController.index]} in tabController.index');
    print('tabs length: ${tabs.length}');
    // if (tabs.length <= tabController.index) return [];

    // late ProductsTab _tabSelected = tabs[tabController.index];
    // late List<Product> _productsSelected = [];
    // print('tab selected: ${_tabSelected}');

    _bodies.add(_tabBarBody(productsData));
    if (productsHasNew()) {
      _bodies.add(_tabBarBody(newProducts()));
    }
    if (productsHasPopular()) {
      _bodies.add(_tabBarBody(popularProducts()));
    }
    if (productsHasMan()) {
      _bodies.add(_tabBarBody(manProducts()));
    }
    if (productsHasWoman()) {
      _bodies.add(_tabBarBody(womanProducts()));
    }
    print('bodies length: ${_bodies.length}');
    return _bodies;
  }

  Widget _tabBarBody(List<Product> products) {
    // late List<Widget> _bodies = [];
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: minPadding / 2)
          .copyWith(top: conststants.fullHeight() * 0.05),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              (_productsProvider.isTablet(conststants.fullWidth()) &&
                      _productsProvider.getSelectedProduct == null)
                  ? 4
                  : 2,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
          // width / height: fixed for *all* items
          childAspectRatio: 0.5,
          mainAxisExtent: (_productsProvider.isTablet(conststants.fullWidth()))
              ? conststants.fullWidth() / 2.5
              : conststants.fullWidth() - minPadding * 2),
      // shrinkWrap: true,
      // crossAxisCount: 2,
      itemCount: products.length,
      itemBuilder: (context, index) => ProductCard(products[index]),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
