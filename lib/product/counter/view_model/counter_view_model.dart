import 'package:mobx/mobx.dart';
part 'counter_view_model.g.dart';

class CounterViewModel = _CounterViewModelBase with _$CounterViewModel;

abstract class _CounterViewModelBase with Store{

  @observable
  int number = 0;

  @computed
  bool get isEven => number % 2 == 0;

  @action
  void incrementNumber(){
    number++;
  }

  @action
  void decrementNumber(){
    number--;
  }

}