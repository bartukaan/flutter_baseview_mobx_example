
import 'package:baseview_mobx_counter/core/base/base_state/base_state.dart';
import 'package:baseview_mobx_counter/core/base/base_view/base_view.dart';
import 'package:baseview_mobx_counter/product/counter/view_model/counter_view_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';

class CounterScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<CounterScreen> {
  CounterViewModel viewModel;

  @override
  Widget build(BuildContext context) {

    return BaseView<CounterViewModel>(
      viewModel: CounterViewModel(),
      onModelReady: (model) => viewModel = model,
      onPageBuilder: (context, viewModel) => scaffoldBody,
    );
  }

  Widget get scaffoldBody => Scaffold(
    appBar: buildAppBar,
    body: Center(
      child: Column(
        children: [
          buildText,
          buildCounterText,
          Observer(builder: (BuildContext context)=> viewModel.isEven ? Text('Çift') : Text('Tek')),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildCounterIncrease,
              buildCounterDecrease,
            ],
          ),
        ],
      ),
    ),
  );

  AppBar get buildAppBar {
    return AppBar(title: Text('Counter via Mobx'),
      centerTitle:true ,);
  }

  IconButton get buildCounterDecrease {
    return IconButton(
                icon: Icon(Icons.exposure_minus_1,size: context.dynamicWidth(0.1),),
                onPressed: () => viewModel.decrementNumber());
  }

  IconButton get buildCounterIncrease {
    return IconButton(
                icon: Icon(Icons.exposure_plus_1,size: context.dynamicWidth(0.1),),
                onPressed: () => viewModel.incrementNumber());
  }

  Observer get buildCounterText {
    return Observer(
          builder: (BuildContext context) => Text(
            viewModel.number.toString(),
            style: context.textTheme.headline2,
          ),
        );
  }

  Text get buildText {
    return Text(
          'COUNTER',
          style: context.textTheme.headline1,
        );
  }
}
