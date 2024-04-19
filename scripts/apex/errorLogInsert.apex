String logDetails = 'An issue was found while updating Renting Agent Object.';
String processName = 'Update Renting Agent';
ErrorLogInsertion.insertNewErrorLogRecord(Datetime.now(), logDetails, processName);I