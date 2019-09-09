@isTest
public class TestDataFactoryTest{
    @isTest
    public static void test(){
        List<Case> cases = TestDataFactory.createMaintRequests(400);
        insert cases;
        
        System.debug('New Requests: ' + [SELECT Count() FROM Case WHERE Status = 'New']);
        System.assertEquals(400, [SELECT Count() FROM Case]);
    }
}