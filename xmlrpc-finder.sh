source color.sh

path="/root/recon/saved-target/$1"
#loop
for k in $(cat $path/working-subdomains.txt)
do

echo -e "$YELLOW Checking$RESET$WHITE $k" $RESET

#------------------------------------------------------------------------------------------------------------------------------------
if curl --silent --connect-timeout 5 https://www.$k/xmlrpc.php | grep "XML-RPC server accepts POST requests only"
then

   echo  ""
   echo -e "$LPURPLE$BOLD[*] xmlrpc.php found at $k." $RESET
   echo  ""
   echo "$k/xmlrpc.php" >> $path/xmlrpc-scan.txt



if curl --silent -H "text/xml" -d "<?xml version="1.0" encoding="utf-8"?><methodCall><methodName>system.listMethods</methodName><params></params></methodCall>" https://www.$k/xmlrpc.php | grep "<value><string>pingback.ping</string></value>"
then

   echo  ""
   echo -e "$RED$BOLD[*] pingback.ping method found" $RESET
   echo  ""
 

  #statements

else

       echo  ""
       echo -e "$BOLD pingback.ping method not found! Not vunerable!"
       echo  ""
fi

#-----------------------------------------------------------------------------------------------------------------------------------
elif curl --silent --connect-timeout 5 https://$k/xmlrpc.php | grep "XML-RPC server accepts POST requests only"
then

   echo  ""
   echo -e "$LPURPLE$BOLD [*] xmlrpc.php found at $k. " $RESET
   echo  ""


if curl --silent -H "text/xml" -d "<?xml version="1.0" encoding="utf-8"?><methodCall><methodName>system.listMethods</methodName><params></params></methodCall>" https://$k/xmlrpc.php | grep "<value><string>pingback.ping</string></value>"
then

   echo  ""
   echo -e "$RED$BOLD[*] pingback.ping method found" $RESET
      echo "$k/xmlrpc.php" >> $path/xmlrpc-scan.txt
   echo  ""
 

else

	   echo  ""
       echo -e "$BOLD pingback.ping method not found! Not vunerable!"
       echo  ""

fi
#---------------------------------------------------------------------------------------------------------------------------

elif curl --silent --connect-timeout 5 https://$k/blog/xmlrpc.php | grep "XML-RPC server accepts POST requests only"
then
	
echo  ""
   echo -e "$LPURPLE$BOLD[*] xmlrpc.php found at $k/blog/xmlrpc.php." $RESET
   echo  ""
   echo "$k/xmlrpc.php" >> $path/xmlrpc-scan.txt



if curl --silent -H "text/xml" -d "<?xml version="1.0" encoding="utf-8"?><methodCall><methodName>system.listMethods</methodName><params></params></methodCall>" https://$k/blog/xmlrpc.php | grep "<value><string>pingback.ping</string></value>"
then

   echo  ""
   echo -e "$RED$BOLD[*] pingback.ping method found" $RESET
   echo  ""
 

else

	 echo  ""
    echo -e "$BOLD pingback.ping method not found! Not vunerable!"
    echo  ""


fi

#--------------------------------------------------------------------------------------------------------------------------------

#---------------------------------------------------------------------------------------------------------------------------

elif curl --silent --connect-timeout 5 https://$k/site/xmlrpc.php | grep "XML-RPC server accepts POST requests only"
then
  
echo  ""
   echo -e "$LPURPLE$BOLD[*] xmlrpc.php found at $k/site/xmlrpc.php." $RESET
   echo  ""
   echo "$k/xmlrpc.php" >> $path/xmlrpc-scan.txt



if curl --silent -H "text/xml" -d "<?xml version="1.0" encoding="utf-8"?><methodCall><methodName>system.listMethods</methodName><params></params></methodCall>" https://$k/site/xmlrpc.php | grep "<value><string>pingback.ping</string></value>"
then

   echo  ""
   echo -e "$RED$BOLD[*] pingback.ping method found" $RESET
   echo  ""
 

else

   echo  ""
    echo -e "$BOLD pingback.ping method not found! Not vunerable!"
    echo  ""


fi

#--------------------------------------------------------------------------------------------------------------------------------

#---------------------------------------------------------------------------------------------------------------------------

elif curl --silent --connect-timeout 5 https://$k/wordpress/xmlrpc.php | grep "XML-RPC server accepts POST requests only"
then
  
echo  ""
   echo -e "$LPURPLE$BOLD[*] xmlrpc.php found at $k/wordpress/xmlrpc.php." $RESET
   echo  ""
   echo "$k/xmlrpc.php" >> $path/xmlrpc-scan.txt



if curl --silent -H "text/xml" -d "<?xml version="1.0" encoding="utf-8"?><methodCall><methodName>system.listMethods</methodName><params></params></methodCall>" https://$k/wordpress/xmlrpc.php | grep "<value><string>pingback.ping</string></value>"
then

   echo  ""
   echo -e "$LPURPLE$BOLD[*] pingback.ping method found" $RESET
   echo  ""
 

else

   echo  ""
    echo -e "$BOLD pingback.ping method not found! Not vunerable!"
    echo  ""


fi

#--------------------------------------------------------------------------------------------------------------------------------



elif curl --silent --connect-timeout 5 https://$k/wp/xmlrpc.php | grep "XML-RPC server accepts POST requests only"
then
	

   echo  ""
   echo -e "$LPURPLE$BOLD[*] xmlrpc.php found at $k/wp/xmlrpc.php." $RESET
   echo  ""
   echo "$k/xmlrpc.php" >> $path/xmlrpc-scan.txt



if curl --silent -H "text/xml" -d "<?xml version="1.0" encoding="utf-8"?><methodCall><methodName>system.listMethods</methodName><params></params></methodCall>" https://$k/wp/xmlrpc.php | grep "<value><string>pingback.ping</string></value>"
then

   echo  ""
   echo -e "$LPURPLE$BOLD[*] pingback.ping method found" $RESET
   echo  ""
 

else


       echo  ""
       echo -e "$BOLD$YELLOW [*] not vunerable"$RESET 
       echo  ""


fi


else


  echo  ""
       echo -e "$BOLD$LGREEN [*] not vunerable"$RESET 
       echo  ""



fi


   echo -e "$YELLOW Moving to next domain!" $RESET
   echo  



echo ""
done

