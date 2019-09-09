public class Accounts extends fflib_SObjectDomain{
    public Accounts(List<Account> sObjectList){
        super(sObjectList);
    }
    
    public class Constructor implements fflib_SObjectDomain.IConstructable{
        public fflib_SObjectDomain construct(List<SObject> sObjectList){
            return new Accounts(sObjectList);
        }
    }
    
    /*public override void onBeforeInsert(){
        List<Account> accs = new List<Account>();
        for(Account acc : (List<Account>) Records){
            acc.Description = 'Domain Classes rock!';
            accs.add(acc);
        }
        
        fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(new Schema.SObjectType[] {Account.SObjectType});
        uow.registerNew(accs);
    }*/
    
    public override void onBeforeUpdate(Map<Id,SObject> existingRecords){
        String description = 'Domain classes rock!';
        List<Account> accs = new List<Account>();
        for(Account acc : (List<Account>) Records){
            acc.AnnualRevenue = description.getLevenshteinDistance(acc.Description);
            //accs.add(acc);
        }
        
        //fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(new Schema.SObjectType[] {Account.SObjectType});
        //uow.registerDirty(accs);
    }
    
    public override void onApplyDefaults(){
        List<Account> accs = new List<Account>();
        for(Account acc : (List<Account>) Records){
            acc.Description = 'Domain classes rock!';
        }
        
        //fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(new Schema.SObjectType[] {Account.SObjectType});
        //uow.registerDirty(accs);
        //uow.commitWork();
    }
}