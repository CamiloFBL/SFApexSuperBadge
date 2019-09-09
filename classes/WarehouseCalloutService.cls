public with sharing class WarehouseCalloutService {
    
    private static final String WAREHOUSE_URL = 'https://th-superbadge-apex.herokuapp.com/equipment';
    
    // complete this method to make the callout (using @future) to the
    // REST endpoint and update equipment on hand.
    @future(callout=true)
    public static void runWarehouseEquipmentSync(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(WAREHOUSE_URL);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        if (response.getStatusCode() == 200) {
            
            List<JSON2Apex> equipments = new List<JSON2Apex>();
            equipments = JSON2Apex.parse(response.getBody());
            
            List<Product2> warehouseUpdate = new List<Product2>();
            
            for (Integer i = 0; i < equipments.size(); i++) {
                System.debug(i);
                Product2 p = new Product2(Name = equipments[i].name,
                                          Replacement_Part__c = true,
                                          Cost__c = equipments[i].cost,
                                          Current_Inventory__c = equipments[i].quantity,
                                          Lifespan_Months__c = equipments[i].lifespan,
                                          Maintenance_Cycle__c = equipments[i].maintenanceperiod,
                                          Warehouse_SKU__c = equipments[i].sku);
                warehouseUpdate.add(p);
            }
            
            upsert warehouseUpdate;
        }
    }
}