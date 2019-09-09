@isTest
private class WarehouseCalloutServiceTest {
    // implement your mock callout test here
    @isTest
    private static void test(){
        // Create the mock response based on a static resource
        //StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock());
        /*mock.setStaticResource('GetEquipmentResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');*/
        // Associate the callout with a mock response
        //Test.setMock(HttpCalloutMock.class, mock);
        WarehouseCalloutService.runWarehouseEquipmentSync();
    }
}