@isTest
public class WarehouseSyncScheduleTest {
    @isTest
    public static void test(){
        Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock());
        Test.startTest();
        WarehouseSyncSchedule sh1 = new WarehouseSyncSchedule();
        String jobId = System.schedule('Warehouse Sync', WarehouseSyncSchedule.CRON_EXPR, sh1);
        sh1.execute(null);
        Test.stopTest();
    }
}