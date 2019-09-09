public class MaintenanceRequestHelper {
    public static Boolean firstRun = true;
    
    public static void updateWorkOrders(List<Case> cases){
        List<Case> oldCases = cases;
        List<Case> insertCases = new List<Case>();
        for(Case c : oldCases){
            if(c.Status == 'Closed'){
                if(c.Type == 'Repair' || c.Type == 'Routine Maintenance'){
                    Case newCase = new Case(Subject = 'New ' + c.Subject,
                                            Vehicle__c = c.Vehicle__c,
                                            Equipment__c = c.Equipment__c,
                                            Type = 'Routine Maintenance',
                                            Date_Reported__c = date.today()/*,
                                            Date_Due__c = date.today().addDays((Integer)[SELECT Maintenance_Cycle__c FROM Product2 WHERE Id = :c.Equipment__c].Maintenance_Cycle__c)*/);
                    insertCases.add(newCase);
                }
            }
        }
        //BatchMaintRequest batch = new BatchMaintRequest(insertCases);
        //Database.executeBatch(batch, 400);
        //System.debug();
        upsert insertCases;
    }
}