//دي هي الرساله اللي برجع ليها لليوزر في حاله الابرور عشان اعرضها فالابلكيشن 
//عشان لو خصل مثلا server exception هيظهر هذا الexception وهكذا

class Failure {
  final String errMessage;
  Failure({required this.errMessage});
}
