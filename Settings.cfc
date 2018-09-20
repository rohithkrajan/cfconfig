component name="Settings" hint="read conifigsettings from ini file"
{	
  	public any function init() {
  		var metadata = getComponentMetaData("Settings"); 
  		if(!structKeyExists(metadata,"staticStore")){    
   			lock name="metadata.staticStore" timeout="10"{
    			metadata.staticStore = initStoreFromINI();
   			}	
  		}   
  		return this;      	
  	}
  
	private struct function initStoreFromINI()
	{
		
		store={};
		iniFile = expandPath('/config/configSettings.ini');	
		sections = getProfileSections(iniFile);
		
		
	 	for(section in sections){	 		
	 		for (key in sections[section]){	 			
	 			if (!StructKeyExists(store, section)) {
	 				store[section] = {};      				
    			}	
    			sectionStruct = store[section];
    			sectionStruct[key]=getProfileString(iniFile,section,key);
	 		}
	 	}
	 	writeDump(var="#now()#");
	 	writeDump(var="#store#");
	 	return store;
	}	
	public any function onChange(required struct cfevent)
	{
		getComponentMetaData("Settings").staticStore=initStoreFromINI();
	}
	public string function getValue(required string key,section)
	{
		if (IsDefined('arguments.section')) {			
      		return getComponentMetaData("Settings").staticStore[section][key];
    	}
    	else {    		
    		return getComponentMetaData("Settings").staticStore['default'][key];
    	}
	}

}