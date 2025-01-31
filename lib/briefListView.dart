 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'adlist.dart';

class BriefListLayoutView extends StatelessWidget {
  final String categoryName;
  final String subCategoryName;
  BriefListLayoutView(this.categoryName, this.subCategoryName);

  bool retrieveData = true;

  final _allServicesList = Get.put(ServicesAdList());

  @override
  Widget build(BuildContext context) {
    retrieveData == true
        ? _allServicesList.fetchData(categoryName, subCategoryName)
        : null;
    retrieveData = false;
    return Obx(() {
      return Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: ListView.separated(
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: _allServicesList.allServicesList.length,
              itemBuilder: (context, int index) {
                return Container(
                    height: 115,
                    child: Stack(
                      children: [
                        Positioned(
                            top: 0,
                            left: 0,
                            width: 134,
                            height: 115,
                            child: Image.asset('assets/car-horizontal.png')),
                        Positioned(
                            top: 5,
                            left: 114,
                            child: SvgPicture.asset(
                              'assets/favoritesIcon.svg',
                              width: 18,
                              height: 18,
                            )),
                        Positioned(
                          left: 150,
                          top: 0,
                          right: 0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 4,
                              ),
                              Container(
                                height: 19,
                                child: Text(
                                    'AED ' +
                                        _allServicesList
                                            .allServicesList[index].Price
                                            .toString(),
                                    style: TextStyle(
                                        color: Color(0xFF1877F2),
                                        fontSize: 14,
                                        fontFamily: 'Roboto')),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                height: 16,
                                child: Text(
                                  _allServicesList.allServicesList[index].Title,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 16,
                                child: Text(
                                  categoryName + ' · ' + subCategoryName,
                                  style: TextStyle(
                                      color: Color(0xFF6D6E70), fontSize: 10),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/locationIcon.svg'),
                                        SizedBox(width: 3.71),
                                        Text(
                                          _allServicesList
                                              .allServicesList[index].Location,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Color(0xFF6D6E70)),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset('assets/daysIcon.svg'),
                                        SizedBox(width: 5.6),
                                        Text(
                                          ((DateTime.now().millisecondsSinceEpoch -
                                              _allServicesList
                                                  .allServicesList[
                                              index]
                                                  .PostedOn
                                                  .millisecondsSinceEpoch) /
                                              (1000 * 86400))
                                              .floor()
                                              .toString() +
                                              ' days ago',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Color(0xFF6D6E70)),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ));
              }));
    });
  }
}
