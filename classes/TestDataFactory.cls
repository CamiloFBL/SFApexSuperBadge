@isTest
public class TestDataFactory {
    public static List<Case> createMaintRequests(Integer numReq){
        List<Case> cases = new List<Case>();
        Date requestStart = date.today();
        requestStart.addDays(-5);
        for(Integer i = 0; i < numReq; i++){
            Case a = new Case(Subject = 'Request ' + i,
                              Date_Reported__c = date.today(),
                              Date_Due__C = requestStart,
                              Type = 'Repair',
                              Status = 'New',
                              Vehicle__c = 'a000b00001BTRZrAAP',
                              Equipment__c = '01t0b00000FdvJ1AAJ');
            cases.add(a);
        }
        return cases;
    }
}