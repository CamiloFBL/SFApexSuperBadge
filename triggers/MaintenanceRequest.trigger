trigger MaintenanceRequest on Case (before update, after update) {
    System.debug('Trigger requests: ' + Trigger.new.size());
    if(/*MaintenanceRequestHelper.firstRun*/Trigger.isAfter){
        System.debug('Running updateWorkOrders()...');
        MaintenanceRequestHelper.updateWorkOrders(Trigger.New);
    }
}