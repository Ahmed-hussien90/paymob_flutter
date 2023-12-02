class Constants{
  static const String baseUrl = "https://accept.paymob.com/api";
  static const String getAuthToken = "/auth/tokens";
  static const String paymentApiKey = "your payment apikey";  //get it from https://accept.paymob.com/portal2/en/settings
  static const String getOrder = "/ecommerce/orders";
  static const String getPaymentId = "/acceptance/payment_keys";
  static const String getRefCode = "/acceptance/payments/pay";
  static String paymentFirstToken = "";
  static String paymentOrderId = "";
  static String integrationIdKiosk = "id kiosk"; //get it from https://accept.paymob.com/portal2/en/PaymentIntegrations
  static String integrationIdCard = "id card"; //get it from https://accept.paymob.com/portal2/en/PaymentIntegrations
  static String finalToken = "";
  static String refCode = "";
  static String frameUrl = "https://accept.paymob.com/api/acceptance/iframes/806185?payment_token=$finalToken";


}