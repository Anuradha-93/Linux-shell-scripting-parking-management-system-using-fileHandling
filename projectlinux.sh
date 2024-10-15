add()
{
while 
echo "Enter Vechicle Number:"
		
do 
			
read vn
			
case "$vn" in 		
"") echo "it cannot be blank"
					
continue;;
				
*) break;;
			
esac
		
done

		
while 
echo  "Enter Name of Owner"
		
do 
			
read name
			
case "$name" in
				
*[!\a-zA-Z]*) echo "name of owner cannnot contain numbers"
					
continue;;
				
"") echo "it cannot be blank"
					
continue;;
				
*) break;;
			
esac
		
done	
while 
echo "Type of Vechicle" 
		
do 
			
read ty
			
case "$ty" in
				
*[!\a-zA-Z]*) echo "Type of Vechicle cannot contain numbers"
					
continue;;
				
"") echo "it cannot be blank"
					
continue;;
				
*) break;;
			
esac
		
done		
while 
echo  "Enter Phone Number"
		
do 			
read phone			
case "$phone" in			
[!0-9][!0-9]) echo "phone number cannot contain alphabets"
continue;;
				
"") echo "it cannot be blank"
					
continue;;
				
*)break;;		
esac	
done
echo  "$vn\t\t\t\t$name\t\t\t\t$phone\t\t\t\t$ty\t\t\t\t$(date)&">> file1
echo "\n One Vechicle Add suceessful"
echo "Arrival date and Time of Vechice:-$(date)"
echo "\n"
}	
	
seachData()
{			#search case
echo "\t\t\tEnter the Vechicle No. you want to search" 
		
read s
	
ct=` grep -c -i "^$s" file1 `;
 		
if [ $ct -eq 0 ]
		
then
			
echo "record doesn't exist"
 		
else
			
grep -i ^$s file1
		
fi
}	
deleteData()
{	
echo "\t\t\t\t************************************"
echo "\t\t\t\t*** Menu to delete Data ****"
echo "\t\t\t\t************************************"
echo "\t\t\t\t1. for delete all data"
echo "\t\t\t\t2. To delete data by Vechicle"
echo "\t\t\t\t3. Exit"
echo "\t\t\t\tEnter yours"
read  d
case $d in 
    1)
    deleteAll;;
    2)
    deletenum;;
    3)
    exit;;
    *)
    echo "You Press Wrong Option ! Try Again"
esac
deletenum()
{
echo "\t\t\tEnter Vechicle \t"
read bd
				
gf=` grep ^$bd file1 `
				
echo $gf
				
if [ ! -z "$gf" ]
				
then 
					
echo ` grep -v "^$bd" file1`> tmpfile
					
tr '&' '\n' < tmpfile > file1
					
echo "Data is deleted Sucessfully "
fi
}
deleteAll()
{
    >file1
    echo "Data is deleted Sucessfully "
}
}	#delete student detail	                                                                       
Display()	#view 
{			
echo  "Vechicle No.\t Owners Names\t Contact No.\t Type \tDate\n"
			
cat file1
}	
menu()		
{
clear
while true;do
echo "\n"
echo "\t\t\t\t************************************"
echo "\t\t\t\t*** Menu for parking Management ****"
echo "\t\t\t\t************************************"
echo "\t\t\t\t1. Add Vehicles "
echo "\t\t\t\t2. Search Data"
echo "\t\t\t\t3. Delete Data"
echo "\t\t\t\t4. Display"
echo "\t\t\t\t5. Exit"
echo "\n"
echo "\t\t\t\tEnter Your choice?"
read ch
case $ch in 
    1)
    add;;
    2)
    seachData;;
    3)
    deleteData;;
    4)
    Display;;
    5)
    exit 0;;
    *)
    echo "You Press Wrong Option ! Try Again"
esac
done
}
menu


