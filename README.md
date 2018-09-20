# cfconfig
a demo of reading config settings from ini file in coldfusion

in coldfusion application,there are no elegant way of reading from config files. This implementation has following features

 - Read the config from the ini file and then store in a static variable.
 - Once the file is read,it never reads from file aystsme again
 - the cache can be automaticaly  refreshed when  ini file changes. this is acheved using event gateays. 
  -There is also a file called refreshSettings.cfm which can be used to refresh the cache if ini file is changed.
  - also contains testbox tests
  
