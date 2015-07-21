result=1
while [ $result -eq 1 ] 
do
  sqlplus -s / as sysdba << EOF
    var status number;
    begin 
      select 
        case status when 'OPEN' then 0 else 1 end 
      into :status 
      from v\$instance; 
    end;
    /
    exit :status
EOF
  result=$? 
  echo "database open check is $result "
  sleep 1
done
