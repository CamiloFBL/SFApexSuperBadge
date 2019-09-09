global class BatchMaintRequest implements Database.Batchable<sobject>{
    global List<Case> batch;
    
    global BatchMaintRequest(){
    }
    
    global BatchMaintRequest(List<Case> clist){
        batch = clist;
    }
    
    global List<Case> start (Database.BatchableContext BC){
        return batch;
    }
    
    global void execute (Database.BatchableContext BC, List<Case> scope){
        upsert scope;
    }
    
    global void finish(Database.BatchableContext BC){
    }
}