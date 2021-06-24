import 'package:firebaseblocryze/features/account/model/card_model.dart';
import 'package:firebaseblocryze/features/account/presentation/widgets/wallet/credit_card_widget.dart';
import 'package:firebaseblocryze/features/account/presentation/widgets/wallet/operations_slider.dart';
import 'package:firebaseblocryze/features/account/presentation/widgets/section_header_widget.dart';
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
                    )),
              ),
              Text('Walter White',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
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
                          height: 200,
                          width: 320,
                          child: CreditCardWidget(
                              cardNumber: cards[index].cardNumber,
                              cardHolder: cards[index].user,
                              cardExpirationDate: cards[index].cardExpired,
                              cardColor:
                                  index % 2 == 0 ? Colors.blue : Colors.black),
                        );
                      }),
                ),
              ),
              SectionHeader(title: 'Operations'),
              OperationsSlider(),
              const SizedBox(height: 8.0),
              SectionHeader(title: 'Recent Activity'),
              _recentActivity(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _recentActivity(BuildContext context) {
    final myJobsMock = ['Bartender', 'Cleaner', 'Bartender', 'Cleaner'];
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: myJobsMock.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 4.0),
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
