import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/app_color/app_color.dart';
import 'package:travel_app/widgets/AppBigText.dart';
import 'package:get/get.dart';

import '../../controller/api_controller.dart';
import '../details_page/details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  with TickerProviderStateMixin{
  var SelectedIndex=0;
  List<String> IconImage=['balloning.png','hiking.png','kayaking.png','snorkling.png'];
  List<String> IconName=['balloning','hiking','kayaking','snorkling'];


  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child:Column(
          children: [
            _buildTopSearch(),
             Padding(
               padding: EdgeInsets.only(left: 20.w,top:10.h,bottom:10.h),
             child:  Align(
               alignment: Alignment.centerLeft,
               child: AppBigText(text:'Discover', size: 30.sp, weight:FontWeight.bold, textColor: AppColors.mainColor, maxLine: 1),
             ),
           ),
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  labelPadding: EdgeInsets.only(left: 20.w,right: 20.w),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  controller: _tabController,
                  indicator: CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                  tabs: [
                    Tab(text: 'Places',),
                    Tab(text: 'Inspiration'),
                    Tab(text: 'Emotions'),
                  ],
                ),
              ),
            ),
            Container(
              height: 300,
              width: double.maxFinite,
              margin: EdgeInsets.only(left: 20.w,top: 20.h),
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildMountain(),
                  Text('Tab 2'),
                  Text('tab 3')
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.w,top: 15.h,bottom: 15.h, right:10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppBigText(text: 'Explore more', size: 22.sp, weight: FontWeight.bold, textColor: AppColors.mainColor, maxLine: 1),
                  AppBigText(text: 'See all', size: 14.sp, weight: FontWeight.normal, textColor: AppColors.mainColor, maxLine: 1),
                ],
              ),
            ),
            Container(
              height: 95.h,
              margin: EdgeInsets.only(left: 20.w),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder:(_,index){
                    return _buildIconList(
                        IconImage[index],IconName[index]
                    );
                  }
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            SelectedIndex=index;
          });
        },
        currentIndex: SelectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 0,
        selectedFontSize: 0,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            label: 'app',
              icon:Icon(Icons.apps,)
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.bar_chart,),
            label: 'bar'
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.search,),
            label: 'search'
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.person,),
            label: 'person'
          ),
        ],
      ),
    );
  }

  _buildTopSearch(){
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         GestureDetector(
           onTap: ()=>Get.back(),
           child:  Icon(Icons.menu_sharp, size: 30.sp, color: AppColors.mainColor,),
         ),
          Container(
            width: 45.w,
            height: 45.h,
            decoration: BoxDecoration(
              color:AppColors.mainColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(Icons.search, size: 30.sp,),
          )
        ],
      ),
    );
  }
  _buildMountain(){
    return GetBuilder<DataController>(
        builder:(controller){
          return ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: controller.Apidata.length==null ? 1 : controller.Apidata.length,
              itemBuilder:(_,index){
                return GestureDetector(
                  onTap: (){
                    Get.to(()=>DetailsPage(PastIndex: index, ));
                  },
                  child: Container(
                    width: 200.w,
                    height: 300.h,
                    margin: EdgeInsets.only(right: 10.w),
                    child: Stack(
                      children: [
                        Positioned(
                            child:Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        'http://mark.bslmeiyu.com/uploads/' +
                                            controller.Apidata[index].img.toString(),
                                      )
                                  )
                              ),
                            )
                        ),
                        Positioned(
                            bottom: 20.h,
                            left: 10.sp,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppBigText(text:  controller.Apidata[index].name.toString(), size:16.sp, weight: FontWeight.w800, textColor: Colors.white, maxLine: 1),
                                SizedBox(height:5.h,),
                                Row(
                                  children: [
                                    Icon(Icons.location_on_sharp,color: Colors.white,size: 16.sp,),
                                    AppBigText(text:controller.Apidata[index].location.toString(), size:12.sp, weight: FontWeight.w400, textColor: Colors.white, maxLine: 1)
                                  ],
                                )
                              ],
                            )
                        )
                      ],
                    ),
                  ),
                );
              }
          );
        }
    );
  }
  _buildIconList(String img, name){
    return Container(
      margin: EdgeInsets.only(right:30.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('img/'+img)
              )
            ),
          ),
         SizedBox(height:7.h,),
         Center(child:  AppBigText(text: name, size:14.sp, weight:FontWeight.w500, textColor: AppColors.textColor1, maxLine: 1),)
        ],
      ),
    );
  }

}

class CircleTabIndicator extends Decoration{
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color:color, radius:radius);
  }

}

class _CirclePainter extends BoxPainter{
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset,
      ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color=color;
    _paint.isAntiAlias=true;
    final Offset circleOffset = Offset(configuration.size!.width/2-radius/2, configuration.size!.height-radius);
    canvas.drawCircle(offset+circleOffset, radius, _paint);
  }

}
