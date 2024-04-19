trigger RentingAgentTrigger on Renting_Agent__c (before insert, before update) {

    if (trigger.isBefore) {

        if (trigger.isInsert) {

            RentingAgentHandler.rejectDuplicateBooking(trigger.new);
            
        }
        
    }
}