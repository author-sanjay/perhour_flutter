import 'package:flutter/material.dart';

class FreelancersList extends StatelessWidget {
  const FreelancersList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 20,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, int index) {
        return Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 20),
          child: GestureDetector(
            onTap: () {},
            child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: EdgeInsets.all(10),
                // color: Colors.white,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                        width: 60,
                        height: 60,
                        child:
                            Image(image: AssetImage("assets/images/Man2.png")),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sanjay Kumar",
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              "UI Designer",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "Price",
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            "\$ 20/hr",
                            style: TextStyle(fontSize: 18, color: Colors.green),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ),
        );
      },
    );
  }
}
