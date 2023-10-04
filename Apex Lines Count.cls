List<ApexClass> classes = [select ApiVersion,body, CreatedById, CreatedDate, Id, IsValid, LastModifiedById, LastModifiedDate, LengthWithoutComments, Name, NamespacePrefix, Status, SystemModstamp from ApexClass where NamespacePrefix = null and (NOT Name like '%Test%') and CreatedDate > 2023-01-01T00:00:00Z];


map<String,Integer> classLOCmap = new map<String,Integer>();
for (ApexClass cls : classes){
	if(cls.body != '(hidden)'){
		String[] lines = cls.body.split('\n');
		
		integer inte = 0;
		for(String str:lines){
			if(String.isNotBlank(str)){
				if(!str.trim().startsWith('//')){
					if(!str.containsIgnoreCase('System.debug')){
						inte += 1;
					}
					//System.debug(str);
				}
			}
		}
		system.debug(inte);
		classLOCmap.put(cls.Name,inte);
	}
}

System.debug(json.serialize(classLOCmap));