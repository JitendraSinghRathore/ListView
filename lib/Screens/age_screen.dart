import 'dart:convert';
import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:practical_interview/controller/age_controller.dart';
import '../model/model_age_response.dart';
import 'package:http/http.dart' as http;

import '../resource/app_theme.dart';
class AgeScreen extends StatefulWidget {
  const AgeScreen({Key? key}) : super(key: key);

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  List<String> age=['20-30','30-40','40-50','50-60'];
 // AgeController controller = Get.put(AgeController());
  List leaveList = [];

  @override
  void initState() {
    getToolRequestList();
    super.initState();
  }



  getToolRequestList() async {

    try {
      var response = await http.get(
        Uri.parse('https://dummy.restapiexample.com/api/v1/employees'),
      );
      var dataAll = json.decode(response.body);
      log(response.body);
      if (dataAll['status'] == "success") {
        leaveList = dataAll['data'];
        leaveList = dataAll['data'];
        setState(() {});
      } else {

      }
    } catch (e) {

      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: ListView.builder(
               itemCount: age.length,
                itemBuilder: (context, index)
            {
              return Card(
                child: ExpansionTile(
                  title: Text(age[index].toString()
                  ),
                  children: [
                    Container(
                      height:150,
                      child: ListView.builder(
                        itemCount: leaveList.isEmpty ? 0 : leaveList.length,
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 14),
                        itemBuilder: (context, i) {
                          return Card(
                            elevation: 0,
                            margin: const EdgeInsets.only(bottom: 16.0),
                            child: ListTile(
                                onTap: () {

                                },
                                leading: CircleAvatar(
                                  radius: 28,
                                  // backgroundColor: AppTheme.primaryColor.withOpacity(0.2),
                                  // backgroundImage: ,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100000),
                                    child: CachedNetworkImage(
                                      imageUrl: "https://cdn-icons-png.flaticon.com/512/4974/4974985.png",
                                      imageBuilder: (context, imageProvider) => Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                            // colorFilter: const ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                                          ),
                                        ),
                                      ),
                                      placeholder: (context, url) => const CircularProgressIndicator(),
                                      errorWidget: (context, url, error) => const Icon(Icons.error),
                                    ),
                                  ),
                                ),

                                trailing: Container(
                                  padding: EdgeInsets.only(left: 10,right: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,

                                    children: [


                                       Text("Name"+"("+leaveList[i]["employee_name"]+")",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                                      Text("Salary"+"("+leaveList[i]["employee_salary"].toString()+")",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                                      Text("Age "+"("+leaveList[i]["employee_age"].toString()+")",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),

                                    ],
                                  ),
                                )
                            ),
                          );
                        },),
                    )
                  ],
                ),
              );
            }))
          ],
        )
      ),

    );
  }
  Widget uiMessageList(Data data) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        onTap: () {

        },
        leading: CircleAvatar(
          radius: 28,
          // backgroundColor: AppTheme.primaryColor.withOpacity(0.2),
          // backgroundImage: ,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100000),
            child: CachedNetworkImage(
              imageUrl: "https://cdn-icons-png.flaticon.com/512/4974/4974985.png",
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    // colorFilter: const ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                  ),
                ),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),

         trailing: Container(
           padding: EdgeInsets.only(left: 10,right: 10),
           child: Column(
             children: [
              /* Text(data.employeeSalary.toString(),style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
               Text(data.employeeSalary.toString(),style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
               Text(data.employeeSalary.toString(),style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
               Text(data.employeeSalary.toString(),style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),*/
             ],
           ),
         )
      ),
    );
  }
}
