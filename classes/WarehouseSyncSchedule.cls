global class WarehouseSyncSchedule implements Schedulable{
    // implement scheduled code here
    
    public static final String CRON_EXPR = '0 0 1 ? * *';
    
    global void execute(SchedulableContext ctx){
        createSchedule();
    }
    
    global static void createSchedule(){
        WarehouseCalloutService.runWarehouseEquipmentSync();
    }
}