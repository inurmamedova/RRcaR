@isTest
public class RentingAgentTest {

    @TestSetup
    static void createData(){

        Renting_Number__c rentNum = insertRentingNumber('Manager1');
        Agent__c agent = insertAgent('Agent1');

        Renting_Agent__c rentingAgent1 = new Renting_Agent__c(
            Renting__c = rentNum.id, 
            Agent__c = agent.id
        );

        List<Renting_Agent__c> rentAgentList = new List<Renting_Agent__c>();
        rentAgentList.add(rentingAgent1);

        insert rentAgentList;
    }
  
    /**
     * Test to verify Duplicated Booking is not Allowed
     */
    @isTest
    public static void rejectDuplicateBookingTest(){

        List<Renting_Agent__c> insertedRentAgentsList = [SELECT id, name FROM Renting_Agent__c];

        try {
            Test.startTest();
            RentingAgentHandler.rejectDuplicateBooking(createRentingAgent());
            Test.stopTest();
        } catch (Exception ex) {
            System.assert(ex.getMessage().contains('DUPLICATES_DETECTED'));
        }

        Assert.areNotEqual(2, insertedRentAgentsList.size());
        Assert.areEqual(1, insertedRentAgentsList.size());

    }

    public static List<Renting_Agent__c> createRentingAgent(){

        Renting_Number__c rentNum = insertRentingNumber('Manager2');
        Agent__c agent = insertAgent('Agent2');

        Renting_Agent__c rentingAgent1 = new Renting_Agent__c(
            Renting__c = rentNum.id, 
            Agent__c = agent.id
        );

        List<Renting_Agent__c> rentAgentList = new List<Renting_Agent__c>();
        rentAgentList.add(rentingAgent1);

        insert rentAgentList;
        return rentAgentList;

    }

    private static Manager__c insertManager(String name){

        Manager__c manager = new Manager__c(
            Name = name,
            Email__c = name + '@rrcar.com',
            Phone__c = '2232212321'
        );

        insert manager;
        return manager;
    }

    private static Renting_Location__c insertLocation(){

        Renting_Location__c location = new Renting_Location__c(
            Name = 'Universal',
            Street__c = '123 ABC St',
            City__c = 'Orlando',
            State__c = 'FL',
            Postal_Code__c = '77777',
            Country__c = 'USA'
        );

        insert location;
        return location;
    }

    private static Renting_Number__c insertRentingNumber(String managerName){

        Renting_Number__c rent = new Renting_Number__c(
            Manager__c = insertManager(managerName).id,
            Make__c = 'Ford',
            Status__c = 'In Progress',
            Model__c = 'Focus - Taurus',
            Start_Date_Time__c = date.today() + 1,
            End_Date_Time__c = date.today() + 5,
            Are_Renting_Start_and_End_Locations_Same__c = true,
            Renting_Start_Location__c = insertLocation().id,
            Location__c = insertLocation().id
        );

        insert rent;
        return rent;
    }

    private static Agent__c insertAgent(String agentName){
        Agent__c agent = new Agent__c(
             Name = agentName,
             Email__c = agentName + '@rrcar.com',
            Phone__c = '6665554433'
        );

        insert agent;
        return agent;

    }

    // Manager__c manager = new Manager__c(
        //     Name = 'Test Manager',
        //     Email__c = 'tmanager@rrcar.com',
        //     Phone__c = '2232212321'
        // );

        // insert manager;

        // Renting_Location__c location = new Renting_Location__c(
        //     Name = 'Universal',
        //     Street__c = '123 ABC St',
        //     City__c = 'Orlando',
        //     State__c = 'FL',
        //     Postal_Code__c = '77777',
        //     Country__c = 'USA'
        // );

        // insert location;

        // Renting_Number__c rent = new Renting_Number__c(
        //     Manager__c = manager.id,
        //     Make__c = 'Ford',
        //     Status__c = 'In Progress',
        //     Model__c = 'Focus - Taurus',
        //     Start_Date_Time__c = date.today() + 1,
        //     End_Date_Time__c = date.today() + 5,
        //     Are_Renting_Start_and_End_Locations_Same__c = true,
        //     Renting_Start_Location__c = location.id,
        //     Location__c = location.id
        // );

        // insert rent;

        // Agent__c agent = new Agent__c(
        //     Name = 'Test Agent',
        //     Email__c = 'tagent@rrcar.com',
        //     Phone__c = '6665554433'
        // );

         // insert agent;
        // insertManager(managerName);
        // insertLocation();
        // Renting_Number__c rentNum = insertRentingNumber('Manager2');
        // Agent__c agent = insertAgent();

        // Renting_Agent__c rentingAgent1 = new Renting_Agent__c(
        //     Renting__c = rentNum.id, 
        //     Agent__c = agent.id
        // );

        // List<Renting_Agent__c> rentAgentList = new List<Renting_Agent__c>();
        // rentAgentList.add(rentingAgent1);

        // insert rentAgentList;
        // return rentAgentList;
}