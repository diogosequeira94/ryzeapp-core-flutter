import 'package:firebaseblocryze/features/settings/model/card_model.dart';
import 'package:firebaseblocryze/features/settings/presentation/widgets/section_header_widget.dart';
import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
  //Handle Indicator
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'My Wallet',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text('Welcome Back,',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    )),
              ),
              Text('Sara Vieira',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Container(
                  height: 200.0,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(right: 8.0),
                      itemCount: cards.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 8.0),
                          height: 200,
                          width: 350,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28.0),
                              color: Color(cards[index].cardBackground)),
                          child: Stack(
                            children: [
                              Positioned(
                                  left: 30.0,
                                  top: 48.0,
                                  child: Text(
                                    'Card Number',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  )),
                              Positioned(
                                  left: 30.0,
                                  top: 65.0,
                                  child: Text(
                                    cards[index].cardNumber,
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  )),
                              Positioned(
                                  left: 30.0,
                                  bottom: 45.0,
                                  child: Text(
                                    'Cardholder Name',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  )),
                              Positioned(
                                  left: 30.0,
                                  bottom: 22.0,
                                  child: Text(
                                    cards[index].user,
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  )),
                              Positioned(
                                  left: 202.0,
                                  bottom: 45.0,
                                  child: Text(
                                    'Expiry date',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  )),
                              Positioned(
                                  left: 202.0,
                                  bottom: 22.0,
                                  child: Text(
                                    cards[index].cardExpired,
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  )),
                            ],
                          ),
                        );
                      }),
                ),
              ),
              SectionHeader(title: 'Operations'),
              Container(
                height: 120,
                child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          width: 120.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.white70,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.attach_money),
                              const SizedBox(height: 8.0),
                              Text(
                                'Withdraw',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(height: 8.0),
              SectionHeader(title: 'Recent Activity'),
              _myJobPosts(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _myJobPosts(BuildContext context) {
    final myJobsMock = ['Bartender', 'Cleaner', 'Bartender', 'Cleaner'];
    return Padding(
      padding: const EdgeInsets.only(right: 4.0),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: myJobsMock.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(myJobsMock[index]),
              subtitle: Text('28/12/2020'),
              trailing: Text(
                '+ 15€',
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
