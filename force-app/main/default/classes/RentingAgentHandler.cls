public class RentingAgentHandler {
   
    public static void rejectDuplicateBooking( List<Renting_Agent__c> triggerNew ){

        // Get current list of Renting Agents in use
        List<Renting_Agent__c> rentAgentList = [select id, name, Renting_Agent__c.Agent__c from Renting_Agent__c];
        
        for (Integer i = 0; i < triggerNew.size(); i++) {

            Id id = triggerNew.get(i).Agent__c;

            if (!rentAgentList.isEmpty()) {
             
                if (rentAgentList.get(i).Agent__c == (id)) {

                    triggerNew.get(i).Agent__c.addError('This Agent is already in use. Please pick another Agent. Thank you!');
    
                }
            }
            
        }

    }
}
