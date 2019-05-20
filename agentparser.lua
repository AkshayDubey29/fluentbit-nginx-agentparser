function defineOS(tag, timestamp, record)
------------PARSE WINDOWS FAMILY-------------
    if string.match(record["agent"], "Windows")=="Windows"     
        then 
            new_record = record 
            new_record["Client.OS.family"]="Windows"

            if string.match(record["agent"], "NT 6.1")=="NT 6.1"     
            then 
                new_record["Client.OS.full"]="Windows 7"
                new_record["Client.OS.version"]="7"    
                return 1, timestamp, new_record
    
            elseif  string.match(record["agent"], "NT 10.0")=="NT 10.0"    
            then 
                new_record["Client.OS.full"]="Windows 10"
                new_record["Client.OS.version"]="10"    
                return 1, timestamp, new_record
            
            elseif  string.match(record["agent"], "NT 6.3")=="NT 6.3"     
            then 
                new_record["Client.OS.full"]="Windows 8.1"
                new_record["Client.OS.version"]="8.1"    
                return 1, timestamp, new_record

            elseif  string.match(record["agent"], "NT 6.2")=="NT 6.2"     
            then 
                new_record["Client.OS.full"]="Windows 8"
                new_record["Client.OS.version"]="8"      
                return 1, timestamp, new_record

            elseif  string.match(record["agent"], "NT 10.0")=="NT 10.0"    
            then 
                new_record["Client.OS.full"]="Windows 7"
                new_record["Client.OS.version"]="7"    
                return 1, timestamp, new_record
            
            elseif  string.match(record["agent"], "Windows NT 6.0")=="Windows NT 6.0"    
            then 
                new_record["Client.OS.full"]="Windows Vista"
                new_record["Client.OS.version"]="Vista"
                return 1, timestamp, new_record
            else
                new_record["Client.OS.full"]="Windows (Legacy)"
                new_record["Client.OS.version"]="< XP"
                return 1, timestamp, new_record
            end
        ------------PARSE OS X FAMILY-------------
        elseif  string.match(record["agent"], "Mac OS X")=="Mac OS X"          
        then new_record = record
            new_record["Client.OS.family"]="Mac OS X"

            if (string.match(record["agent"], "10.11")=="10.11" or string.match(record["agent"], "10_11")=="10_11")
            then 
                new_record["Client.OS.full"]="Mac OS X 10. 11 (El Capitan)"
                new_record["Client.OS.version"]="10.11"    
                return 1, timestamp, new_record

            elseif  string.match(record["agent"], "10_12")=="10_12"    
            then 
                new_record["Client.OS.full"]="Mac OS X 10.12 (Sierra)"
                new_record["Client.OS.version"]="10.12"
                return 1, timestamp, new_record

            elseif  string.match(record["agent"], "10_13")=="10_13"    
            then 
                new_record["Client.OS.full"]="Mac OS X 10.13 (High Sierra)"
                new_record["Client.OS.version"]="10.13"
                return 1, timestamp, new_record

            elseif  string.match(record["agent"], "10_14")=="10_14"    
            then 
                new_record["Client.OS.full"]="Mac OS X 10.14 (Mojave)"
                new_record["Client.OS.version"]="10.14"
                return 1, timestamp, new_record

            else
                new_record["Client.OS.full"]="Mac OS X (Legacy)"
                new_record["Client.OS.version"]="< 10.11"
                return 1, timestamp, new_record
            end

        ------------PARSE LINUX FAMILY----------
        elseif  string.match(record["agent"], "Linux x86_64")=="Linux x86_64"          
        then new_record = record
            new_record["Client.OS.family"]="Linux"

            if string.match(record["agent"], "Ubuntu")=="Ubuntu"
            then 
                new_record["Client.OS.full"]="Ubuntu Linux" 
                return 1, timestamp, new_record
            else
                new_record["Client.OS.full"]="Linux"
                return 1, timestamp, new_record
            end

        
        ------------PARSE ANDROID FAMILY-------------
        elseif  string.match(record["agent"], "Andorid")=="Andorid"  
        then new_record = record
            new_record["Client.OS.family"]="Andorid"
            if string.match(record["agent"], "Android 4.4")=="Android 4.4"
		then
                new_record["Client.OS.full"]="Andorid 4.4 (KitKat)"
                new_record["Client.OS.version"]="4.4"
                return 1, timestamp, new_record

            	elseif (string.match(record["agent"], "Android 8.0")=="Android 8.0" or string.match(record["agent"], "Android 8.1.0")=="Android 8.1.0")
                	then new_record["Client.OS.full"]="Andorid 8 (Oreo)"
                	new_record["Client.OS.version"]="8.x"
                	return 1, timestamp, new_record

            	elseif (string.match(record["agent"], "Android 9.0")=="Android 9.0" or string.match(record["agent"], "Android 9.0.0")=="Android 9.0.0")
			then new_record["Client.OS.full"]="Andorid 9 (Pie)"
                	new_record["Client.OS.version"]="9.x"
                	return 1, timestamp, new_record
            
            	elseif (string.match(record["agent"], "Android 6.0")=="Android 6.0" or string.match(record["agent"], "Android 6.0.1")=="Android 6.0.1")
                	then new_record["Client.OS.full"]="Andorid 6"
                	new_record["Client.OS.version"]="6.0"
                	return 1, timestamp, new_record

            	elseif (string.match(record["agent"], "Android 7.0")=="Android 7.0" or string.match(record["agent"], "Android 7.1")=="Android 7.1")
                	then new_record["Client.OS.full"]="Andorid 7 (Nougat)"
                	new_record["Client.OS.version"]="7.x"
                	return 1, timestamp, new_record

            	elseif (string.match(record["agent"], "Android 5.0")=="Android 5.0" or string.match(record["agent"], "Android 5.1")=="Android 5.1")
                	then new_record["Client.OS.full"]="Andorid 5 (Nougat)"
                	new_record["Client.OS.version"]="5.x"
                	return 1, timestamp, new_record

            else
                new_record["Client.OS.full"]="Android (Legacy)"
                new_record["Client.OS.version"]="< 4.4"
                return 1, timestamp, new_record
         end

        ------------PARSE iOS FAMILY-------------
        elseif  string.match(record["agent"], "iPhone")=="iPhone"  
        then new_record = record
            new_record["Client.OS.family"]="iOS"
            if string.match(record["agent"], "CPU iPhone OS 12")=="CPU iPhone OS 12"
		then
                new_record["Client.OS.full"]="iOS 12"
                new_record["Client.OS.version"]="12.x"
                return 1, timestamp, new_record

            elseif string.match(record["agent"], "CPU iPhone OS 11")=="CPU iPhone OS 11"
                then
		new_record["Client.OS.full"]="iOS 11"
                new_record["Client.OS.version"]="11.x"
                return 1, timestamp, new_record

            else
                new_record["Client.OS.full"]="iOS (Legacy)"
                new_record["Client.OS.version"]="< 11.0"
                return 1, timestamp, new_record
            end

        else
            new_record = record
            new_record["Client.OS"]="Other"
            return 1, timestamp, new_record
    end    
end


function defineBrowser(tag, timestamp, record)
    if (string.match(record["agent"], "YaBrowser")=="YaBrowser" or string.match(record["agent"],"Yowser")=="Yowser")
    then new_record = record
        new_record["Client.Browser"]="Yandex Browser"
        return 1, timestamp, new_record

    elseif  string.match(record["agent"], "OPR")=="OPR"
    then new_record = record
        new_record["Client.Browser"]="Opera"
        return 1, timestamp, new_record
    
    elseif  string.match(record["agent"], "Firefox")=="Firefox"
    then new_record = record
        new_record["Client.Browser"]="Firefox"
        return 1, timestamp, new_record

    elseif  string.match(record["agent"], "Edge")=="Edge"
    then new_record = record
        new_record["Client.Browser"]="Edge"
        return 1, timestamp, new_record

    elseif  (string.match(record["agent"], "Safari")=="Safari" and string.match(record["agent"], "Chrome")~="Chrome")  
    then new_record = record
        new_record["Client.Browser"]="Safari"
        return 1, timestamp, new_record
        
    elseif  string.match(record["agent"], "Chrome")~="Chrome"
    then new_record = record
        new_record["Client.Browser"]="Internet Explorer"
        return 1, timestamp, new_record
        
    else 
        new_record = record
        new_record["Client.Browser"]="Chrome"
        return 1, timestamp, new_record
    end    
end
