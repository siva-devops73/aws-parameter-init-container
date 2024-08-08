for param in ${PARAMETERS} ; do
  SHELL_VAR=$(echo $param | gawk -F , '{print $1}')
  PARAM=$(echo $param | gawk -F '{print $2}')
  PASS=$(aws ssm get-parameter --name $PARAM --with-decryption --query 'Parameter.value' --output.text)
  echo export $SHELL_VAR=$PASS  >>params
done

cat params