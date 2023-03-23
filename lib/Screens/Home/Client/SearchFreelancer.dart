import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Modals/Users/Usermodelapi.dart';
import 'package:perhour_flutter/Modals/Users/Usertop3.dart';
import 'package:perhour_flutter/Screens/FreelancerProfile/FreelancerProfile.dart';
import 'package:perhour_flutter/Screens/ListBids/ListBids.dart';

class SearchFreelancer extends StatefulWidget {
   SearchFreelancer({required this.st,Key? key}) : super(key: key);
  String st;
  @override
  State<SearchFreelancer> createState() => _SearchFreelancerState();
}

class _SearchFreelancerState extends State<SearchFreelancer> {

  bool _isloading = true;
  late List<User3> _getdeals;
  @override
  void initState() {
    super.initState();
    getDeals();
  }

  Future<void> getDeals() async {
    _getdeals = await Userapi.search(widget.st);
    setState(() {
      _isloading = false;
    });
    print(_getdeals);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox
        (constraints:BoxConstraints(
          minHeight: MediaQuery.of(context).size.height),
        child: _isloading?Center(child: CircularProgressIndicator(),): Container(
          color: backgroundwhite,
          width: MediaQuery.of(context).size.width,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Topbar(
              title: "Freelancers",
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text("Your Search Results"),
                  ),
              
              _getdeals.length==0?Container(height: MediaQuery.of(context).size.height*0.7,child: Center(child: Text("No Freelancer Found"))):
              ListView.separated(
                shrinkWrap: true,
                itemCount: _getdeals.length,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                FreelancerProfile(id: _getdeals[index].id),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all( 10),
                        width: MediaQuery.of(context).size.width*0.9,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                        ),child: Row(
                        children: [
                           _getdeals[index].photo!=null?
                           CircleAvatar(
                             backgroundImage: NetworkImage(
                                 _getdeals[index].photo.toString()
                             ),radius: MediaQuery.of(context).size.width*0.08,
                           )
                               :
                           CircleAvatar(
                             backgroundImage: AssetImage(
                                 "assets/images/Man2.png"
                             ),
                             radius: MediaQuery.of(context).size.width*0.08,
                           ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Padding(
                                padding: const EdgeInsets.only(left:8.0),
                                child: Text(_getdeals[index].name.toUpperCase(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:8.0),
                                child: Text(_getdeals[index].tagline.toUpperCase(),style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400),),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text("Rs",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.green),),

                              Text("${_getdeals[index].rate.toString()}/hr",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color:Colors.green),),

                            ],
                          ),

                        ],
                        ),
                      ),
                    ),
                  );
                },
              )
                ],
              ),
            )
          ],
          ),
        ),
      ),
    );
  }
}
