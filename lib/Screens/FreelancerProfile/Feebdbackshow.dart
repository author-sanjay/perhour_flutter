import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Screens/ListBids/ListBids.dart';

class Feedbackshow extends StatefulWidget {
  Feedbackshow({required this.username, required this.stars,required this.givenby, required this.Projectname,required this.review ,Key? key}) : super(key: key);
  String username;
  String givenby;
  String Projectname;
  String review;
  double stars;

  @override
  State<Feedbackshow> createState() => _FeedbackshowState();
}

class _FeedbackshowState extends State<Feedbackshow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ConstrainedBox(
      constraints:BoxConstraints(
        maxWidth:MediaQuery.of(context).size.width ,
          minHeight: MediaQuery.of(context).size.height),
      child: Container(
        color: kblue,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            children: [
              Topbar(title: "Feedback"),
              Container(
           padding: EdgeInsets.only( top: 18, left: MediaQuery.of(context).size.width*0.2),
                child: Row(children: [
                  for(double i=0;i<widget.stars;i++)
                    Image(image: AssetImage("assets/images/Star1.png"),width: MediaQuery.of(context).size.width*0.1,)
                ],),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 38.0, left: 20, right: 20),
                child: Container(width: MediaQuery.of(context).size.width*0.8,decoration: BoxDecoration(color: Color.fromARGB(
                    247, 245, 223, 123), borderRadius: BorderRadius.circular(20)), child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                          Container(child: Row(children: [
                            Image(image: AssetImage("assets/images/stamp.jpg"),height: MediaQuery.of(context).size.height*0.12,),
                            Spacer(),Text("Postcard",style: TextStyle(fontSize: 18),),Spacer()
                          ],),),
                          Padding(
                            padding: const EdgeInsets.only(top:18.0),
                            child: Container( width: MediaQuery.of(context).size.width*0.7,
                              child: Row(
                                children: [
                                  Text("To: ",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                                  Text("${widget.username.toUpperCase()}")
                                ],
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: Container(width: MediaQuery.of(context).size.width*0.7,
                              child: Row(
                                children: [
                                  Text("Subject: ",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                                  Flexible(child: Text("Showering You with Gratitude"))
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:18.0),
                            child: Text("Review:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                          ),
                          Container(width: MediaQuery.of(context).size.width*0.7,
                            child: Row(
                              children: [

                                Flexible(child: Text("\n${widget.review}"))
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: Container(width: MediaQuery.of(context).size.width*0.7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text("Thanking You",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                                  Text("${widget.givenby.toUpperCase()}",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),)
                                ],
                              ),
                            ),
                          ),

                        ],),
                      ),
                    ),),
              )

            ],
          ),
        ),
      ),
    ),
    );
  }
}
