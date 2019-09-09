global class BatchUpdateMaintDate implements Database.Batchable<sobject>{
    global Database.QueryLocator start (Database.BatchableContext BC){
        return Database.getQueryLocator([SELECT (SELECT Id FROM Work_Parts__r) FROM Case LIMIT 200]);
    }
    global void execute (Database.BatchableContext BC, List<sobject> scope){
        insert scope;
    }
    global void finish(Database.BatchableContext BC){
        System.debug('Done');
    }
}