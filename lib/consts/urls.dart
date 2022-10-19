class Urls {

  static const String DOMAIN = 'https://cater-me.azurewebsites.net/api/';
  static const String BASE_API = DOMAIN + '';

  static const String ACCOUNTS = DOMAIN + 'Accounts/';
  static const String OCCASIONS = DOMAIN + 'Occasions/';
  static const String FRIENDS = DOMAIN + 'Friends/';
  static const String CARDS = DOMAIN + 'CreditCards/';
  static const String ADDRESS = DOMAIN + 'Addresses/';
  static const String ORDERS = DOMAIN + 'Orders/';
  static const String CHECKOUT = DOMAIN + 'Checkout/';

  //-------------Auth------------
  static const String LOGIN = ACCOUNTS + 'Login';
  static const String GET_PROFILE = ACCOUNTS + 'GetProfile';
  static const String UPDATE_PROFILE = ACCOUNTS + 'UpdateProfile';

//-----------Home-----------
  static const String GET_HOME_PAGE = DOMAIN + 'HomePage/GetHomePage';

  //-----------OCCASIONS-----------
  static const String GET_OCCASIONS = OCCASIONS + 'GetAllOccasions';
  static const String CREATE_OCCASION = OCCASIONS + 'CreateOccasion';
  static const String UPDATE_OCCASION = OCCASIONS + 'UpdateOccasion';
  static const String DELETE_OCCASION = OCCASIONS + 'DeleteOccasion/';


  //-----------FRIENDS-----------
  static const String GET_FRIENDS = FRIENDS + 'GetAllFriends';
  static const String CREATE_FRIEND = FRIENDS + 'CreateFriend';
  static const String UPDATE_FRIEND = FRIENDS + 'UpdateFriend';
  static const String DELETE_FRIEND = FRIENDS + 'DeleteFriend/';

  //-----------CREDITS-----------
  static const String GET_CREDITS = CARDS + 'GetAllCreditCards';
  static const String CREATE_CREDITS = CARDS + 'CreateCreditCard';
  static const String DELETE_CREDITS = CARDS + 'DeleteCreditCard/';


  //-----------ADDRESS-----------
  static const String GET_ADDRESSES = ADDRESS + 'GetAllAddresses';
  static const String CREATE_ADDRESS = ADDRESS + 'CreateAddress';
  static const String UPDATE_ADDRESS = ADDRESS + 'UpdateAddress';
  static const String DELETE_ADDRESS = ADDRESS + 'DeleteAddress/';

  //----------ORDERS----------
  static const String GET_ORDERS = ORDERS + 'GetAllOrders';
  static const String GET_ORDER = ORDERS + 'GetOrder/';

  static const String PLACE_ORDER = ORDERS + 'PlaceOrder';

  //------------REQUEST---------------
  static const String REQUEST_PAYMENT = CHECKOUT + 'RequestPayment';

}
