@isTest
public class MaintenanceRequestTest {
    @isTest
    public static void test(){
        List<Case> cases = TestDataFactory.createMaintRequests(400);
        insert cases;
        
        List<Case> upCases = new List<Case>();
        for(Case c : cases){
            c.Status = 'Closed';
            upCases.add(c);
        }
        test.startTest();
        update upCases;
        test.stopTest();
        
        System.debug('Requests Closed: ' + [SELECT Count() FROM Case WHERE Status = 'Closed']);
        System.debug('New Requests: ' + [SELECT Count() FROM Case WHERE Status = 'New']);
        System.debug('Requests with Equipment: ' + [SELECT Count() FROM Case WHERE Equipment__c = '01t0b00000FdvJ1AAJ']);
    }
}