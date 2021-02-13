
bool checkData(DateTime date)
{
  DateTime dateTime = DateTime.now();
  // print("${dateTime.year}-${dateTime.month}-${dateTime.day}");
  if(date.isAfter(dateTime))
  {
    return false;
  }
  else {
    return true;
  }

}