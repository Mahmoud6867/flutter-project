import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class GController extends GetxController{
  var count = 0;
  increment() {
     count++;
      update();
  }
  decrement() {
    count--;
 update();
  }
  counterDisplayed() {
    update();
    return count;
    
    }
}