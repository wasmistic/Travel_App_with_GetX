import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/app_color/app_color.dart';
import 'package:travel_app/controller/api_controller.dart';
import 'package:travel_app/modal/app_modal.dart';
import 'package:travel_app/widgets/AppBigText.dart';
import 'package:travel_app/widgets/app_btn.dart';

class DetailsPage extends StatefulWidget {
  final int PastIndex;
  const DetailsPage({Key? key, this.PastIndex=0, }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var SelectedIndex=0;
  var Starnum=4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child:Stack(
          children: [
            Positioned(child:_buildTopImage()),
            Positioned(
               bottom: 0,
                top: 280.h,
                left: 0,
                right: 0,
                child:_buildContent()
            ),
            Positioned(
              bottom: 0,
                left: 20.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: AppColors.mainColor.withOpacity(0.3),
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child:  Icon(Icons.favorite_border,size: 20,color: AppColors.mainColor.withOpacity(0.3),),
                      ),
                    ),
                    SizedBox(width: 10.w,),
                   Container(
                     child: AppButton(text: 'Book Trip Now', isResponsive: true,),
                   )
                  ],
                ),
            ),
            Positioned(
              top: 40.h,
                left: 20.w,
                child:GestureDetector(
              onTap: ()=>Get.back(),
              child: Icon(Icons.menu_sharp, size: 35.sp, color: Colors.white,),
            )),
          ],
        ) ,
      ),
    );
  }

  _buildTopImage(){
    return GetBuilder<DataController>(
        builder:(controller){
          return Container(
            width:double.infinity,
            height: 320.h,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage( 'http://mark.bslmeiyu.com/uploads/' +controller.Apidata[widget.PastIndex].img.toString())
                )
            ),
          );
        }
    );
  }

  _buildContent(){
    return GetBuilder<DataController>(
        builder: (controller){
      return Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 20.h,left: 20.w,right: 20.w),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40.r),
              topLeft: Radius.circular(40.r),
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppBigText(text: controller.Apidata[widget.PastIndex].name.toString(), size: 25.sp, weight: FontWeight.bold, textColor:AppColors.bigTextColor, maxLine:1),
                AppBigText(text: '\$' +controller.Apidata[widget.PastIndex].price.toString(), size: 25.sp, weight: FontWeight.bold, textColor:AppColors.mainColor, maxLine:1)
              ],
            ),
            SizedBox(height:12.h,),
            Row(
              children: [
                Icon(Icons.location_on_sharp,color: AppColors.mainColor,size: 16.sp,),
                SizedBox(width:3,),
                AppBigText(text:controller.Apidata[widget.PastIndex].location.toString(), size:12.sp, weight: FontWeight.w400, textColor:AppColors.bigTextColor, maxLine: 1)
              ],
            ),
            SizedBox(height:15.h,),
            Row(
              children: [
                Row(
                  children: List.generate(controller.Apidata[widget.PastIndex].stars!.toInt(), (index) =>  Icon(Icons.star,color:index < Starnum ? AppColors.starColor :  AppColors.buttonBackground,size: 25.sp,),),
                ),
                SizedBox(width:5,),
                AppBigText(text:'(${controller.Apidata[widget.PastIndex].stars.toString()}.0)', size:18.sp, weight: FontWeight.bold, textColor: AppColors.textColor1, maxLine: 1)
              ],
            ),
            SizedBox(height:15.h,),
            AppBigText(text:'People', size:18.sp, weight: FontWeight.bold, textColor:Colors.black, maxLine: 1),
            SizedBox(height:6,),
            AppBigText(text:'Number of people in your group', size:12.sp, weight: FontWeight.w400, textColor:AppColors.mainTextColor, maxLine: 1),
            SizedBox(height:15.h,),
            Row(
              children: List.generate(controller.Apidata[widget.PastIndex].people!.toInt(), (index) => GestureDetector(
                onTap: (){
                  setState(() {
                    SelectedIndex=index;
                  });
                },
                child: Container(
                  width: 50.w,
                  height: 50.h,
                  margin: EdgeInsets.only(right: 10.w),
                  decoration: BoxDecoration(
                    color: SelectedIndex==index? AppColors.bigTextColor: AppColors.mainColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Center(
                    child: AppBigText(text: '${index+1}',maxLine: 1,size: 14.sp,weight: FontWeight.w600,textColor:SelectedIndex==index? Colors.white : Colors.black),
                  ),
                ),
              )),
            ),
            SizedBox(height:15.h,),
            AppBigText(text:'Description', size:18.sp, weight: FontWeight.bold, textColor:Colors.black, maxLine: 1),
            SizedBox(height:10.h,),
            AppBigText(text:controller.Apidata[widget.PastIndex].description.toString(), size:12.sp, weight: FontWeight.w400, textColor:AppColors.mainTextColor, maxLine: 5),
          ],
        ),
      );
    });
  }
}
