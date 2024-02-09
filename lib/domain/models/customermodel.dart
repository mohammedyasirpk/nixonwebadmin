class DealersModel{
   String? customername;
  int productCount;
  int maxProducCount;
  int totalUserCount;
  
  DealersModel({ this.customername , this.maxProducCount = 0, this.productCount = 0,this.totalUserCount = 0});
  @override
  String toString() {
   
    return "$customername $productCount";
  }
}