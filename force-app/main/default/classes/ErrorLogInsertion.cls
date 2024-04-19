public class ErrorLogInsertion {
    public static void insertNewErrorLogRecord(Datetime dt, String logDetails, String processName){
        
        Error_Log__c errorLog = new Error_Log__c(
            Log_Date_Time__c = dt,
            Log_Details__c = logDetails,
            Process_Name__c	= processName
        );
    
        insert errorLog;
    }
}