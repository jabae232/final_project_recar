import 'package:car_m/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate{
  final TabBar tabBar;
  final double expandedHeigth;
  CustomSliverAppBarDelegate({required this.expandedHeigth,required this.tabBar});
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.transparent,
      child: tabBar,
    );
  }
  Widget buildAppBar(double shrinkOffset) => AppBar(
    title: Text('23232'),
  );

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    throw UnimplementedError();
  }
  
}