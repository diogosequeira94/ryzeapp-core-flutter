import 'package:firebaseblocryze/features/account/model/card_model.dart';
import 'package:firebaseblocryze/features/account/presentation/widgets/wallet/credit_card_widget.dart';
import 'package:firebaseblocryze/features/account/presentation/widgets/wallet/operations_slider.dart';
import 'package:firebaseblocryze/features/account/presentation/widgets/section_header_widget.dart';
import 'package:firebaseblocryze/features/user_profile/bloc/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final _userBloc = context.read<UserBloc>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          'My Wallet',
          style: TextStyle(color: Theme.of(context).textTheme.headline6.color),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed('/add-card');
              }),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFF00CCFF),
              const Color(0xFF3366FF),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Balance',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.white)),
                      const SizedBox(height: 10.0),
                      Text('100,00€',
                          style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 0.0),
                        child: OperationsSlider(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              _recentActivity(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cards() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        height: 200.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(right: 8.0),
            itemCount: cards.length,
            itemBuilder: (context, index) {
              return Container(
                height: 200,
                width: 320,
                child: CreditCardWidget(
                    cardNumber: cards[index].cardNumber,
                    cardHolder: cards[index].user,
                    cardExpirationDate: cards[index].cardExpired,
                    cardColor: index % 2 == 0 ? Colors.blue : Colors.black),
              );
            }),
      ),
    );
  }

  Widget _recentActivity(BuildContext context) {
    final myJobsMock = ['Bartender', 'Restaurant', 'Bartender', 'Restaurant'];
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      padding: const EdgeInsets.fromLTRB(15, 30, 15, 30),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(45.0),
          topRight: Radius.circular(45.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 4.0, left: 8.0, right: 8.0, bottom: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Activity',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                      fontSize: 14.0, color: Theme.of(context).accentColor),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: myJobsMock.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 1,
                  margin: const EdgeInsets.symmetric(vertical: 4.0),
                  child: ListTile(
                    leading: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: index % 2 == 0
                              ? Colors.red.withOpacity(0.4)
                              : Colors.blue.withOpacity(0.4),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: index % 2 == 0 ? Icon(Icons.local_drink) : Icon(Icons.restaurant),
                        )),
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
          ),
        ],
      ),
    );
  }
}
