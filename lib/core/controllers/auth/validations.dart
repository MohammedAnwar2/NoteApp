import 'package:get/get.dart';

validInput({required String value, required int min, required int max, required String type}){
  if(type=="username")
  {
    if(!GetUtils.isUsername(value))
    {
      return "not vaild username";
    }
  }

  if(type=="email")
  {
    if(!GetUtils.isEmail(value))
    {
      return "not vaild email";
    }
  }

/*  if(type=="password")
  {
    if(!GetUtils.is(value))
    {
      return "fsdf";
    }
  }*/

  if(value.length<min)
  {
    return "can't be less than $min";
  }

  if(value.length>max)
  {
    return "can't be larger than $max";
  }

  if(value.isEmpty)
  {
    return "can't be Empty";
  }

}