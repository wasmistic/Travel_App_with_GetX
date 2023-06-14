import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/app_color/app_color.dart';
import 'package:get/get.dart';
import '../../widgets/AppBigText.dart';
import '../../widgets/app_btn.dart';
import '../home_page/home_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List<String> Image=['welcome-one.png','welcome-two.png','welcome-three.png'];
  List<String> ListOfText=['Mountain','Forest','Desert',];
  var ScrollIndex =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: PageView.builder(
          onPageChanged:(index){
                setState(() {
                  ScrollIndex=index;
                });
          },
          scrollDirection: Axis.vertical,
          itemCount: 3,
            itemBuilder:(_,index){
            return _buildPage(Image[index],ListOfText[index]);
            }
        ),
      ),
    );
  }

  _buildPage(String img, text){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(top: 80.h, left: 25.w, right: 25.w),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('img/'+img)
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBigText(text: 'Trips', size: 30.sp, weight: FontWeight.bold, textColor: Colors.black, maxLine: 1,),
              AppBigText(text: text, size: 30.sp, weight: FontWeight.normal, textColor: Colors.black54, maxLine: 1,),
              SizedBox(height:15.h,),
              AppBigText(text: '${text} hikes give you an incredible', size: 14.sp, weight: FontWeight.normal, textColor:AppColors.textColor2, maxLine: 1,),
              AppBigText(text: 'sense of freedom along with endurance test.', size: 14.sp, weight: FontWeight.normal, textColor:AppColors.textColor2, maxLine: 1,),
              SizedBox(height:20.h,),
              GestureDetector(
                onTap: ()=>Get.to(()=>HomePage()),
                child: SizedBox(
                  width: 120.w,
                  child: AppButton(text: 'welcome page',),
                ),
              )
            ],
          ),
          Column(
            children:List.generate(3, (index) => Container(
              width: 8.w,
              height:ScrollIndex==index ? 25.h : 8.h,
              margin: EdgeInsets.only(bottom:3.h),
              decoration: BoxDecoration(
                  color:ScrollIndex==index ? AppColors.mainColor :AppColors.mainColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(25.r)
              ),
            )),
          )
        ],
      ),
    );
  }
}
