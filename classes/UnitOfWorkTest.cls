@IsTest
public with sharing class UnitOfWorkTest {
    @IsTest
    public static void challengeComplete(){
        List<Schema.SObjectType> objects = new List<Schema.SObjectType>();
        objects.add(Account.SObjectType);
        objects.add(Contact.SObjectType);
        objects.add(Note.SObjectType);
        fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(objects);
        
        for(Integer i = 0; i < 100; i++){
            Account a = new Account();
            a.Name = 'Test ' + i;
            uow.registerNew(a);
            for(Integer j = 0; j < 5; j++){
                Contact c = new Contact();
                c.LastName = 'Test' + i + '_' + j;
                uow.registerNew(c, Contact.AccountId, a);
                
                Note n = new Note(Title = 'Test ' + i + '_' + j,
                                  Body = 'Test message ' + i + '-' + j);
                uow.registerRelationship(n, Note.ParentId, c);
                uow.registerNew(n, Note.ParentId, c);
            }
        }
        
        
        uow.commitWork();
        
        System.assertEquals(100, [Select Id from Account].size());
        System.assertEquals(500, [Select Id from Contact].size());
        System.assertEquals(500, [Select Id from Note].size());
    }
}