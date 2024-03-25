pragma solidity >=0.5.0 <0.9.0;


contract SupplyChain {


  string public productCode;  

  // Define a struct 'Item' with the following fields:
  struct Item {
    //farmer 
    string  productName;
    string  productCode;        // ma san pham    
    string  farmName;
    string  farmGLN;                
    string  haverstDate;
    string  shipDateFarm;       // ngay chuyen hang  

    //Packing 
    string  packingName;
    string  packingGLN;
    string  expireDate;
    string  manufactureDate;
    string  shipDatePacking;

    //Retailer
    string retailerName;
    string retailerGLN;
    string  receivedDateRetailer;
  }

  mapping (string => Item) items;

  function addInfoByFarmer(
    string memory _productName,
    string memory _farmGLN,
    string memory _productCode, 
    string memory _farmName,
    string memory _haverstDate,
    string memory _shipDateFarm
    ) public 
    {
    Item memory newProduce; 
    newProduce.productName =_productName;
    newProduce.productCode = _productCode; 
    newProduce.farmName = _farmName;
    newProduce.farmGLN = _farmGLN;
    newProduce.haverstDate = _haverstDate;
    newProduce.shipDateFarm = _shipDateFarm;
    items[_productCode] = newProduce; 
  }



  
  function addInfoByPacking
  (string memory _productCode,
   string memory _packingName,
   string memory _packingGLN,
   string memory _expireDate,  
   string memory _shipDatePacking,
   string memory _manufactureDate

   ) public
    {
    items[_productCode].packingName = _packingName;
    items[_productCode].packingGLN = _packingGLN;
    items[_productCode].expireDate = _expireDate;
    items[_productCode].shipDatePacking = _shipDatePacking;
    items[_productCode].manufactureDate = _manufactureDate;
  }

  

  function addInfoByRetailer
  (string memory _productCode, 
   string memory _retailerName,
   string memory _retailerGLN,
   string memory _receivedDateRetailer
   ) public
{
    items[_productCode].retailerName = _retailerName;
    items[_productCode].retailerGLN = _retailerGLN;
    items[_productCode].receivedDateRetailer = _receivedDateRetailer;
  }
 

function fetchItem(string memory _productCode) internal view returns
(string memory, 
 string memory,
 string memory, 
 string memory, 
 string memory, 
 string memory ,
 string memory,
 string memory,
 string memory,
 string memory ,
 string memory,
 string memory,
 string memory,
 string memory


) {
   Item memory item = items[_productCode];
    return(
      item.productName,
      item.productCode,
      item.farmName,
      item.farmGLN,
      item.haverstDate,
      item.shipDateFarm,
      item.packingName,
      item.packingGLN,
      item.expireDate,
      item.manufactureDate,
      item.shipDatePacking,
      item.retailerName,
      item.retailerGLN,
      item.receivedDateRetailer
    );
}

}