#!/bin/bash
#This bash script checks if the httpd and mysqld services are active or not (inactive or failed), if any of them is not active, the script starts it and writes the restart date to a log file.
#This script is created by Hadi Alnabriss (alnabris@gmail.com), it can be used, modified or redistributed freely


if [ $(systemctl is-active httpd) != "active" ]
then


        ##Add some delay to the start operation to avoid overlapping with other manual restart operations from the shell
        sleep 10

        if [ $(systemctl is-active httpd) != "active" ]
        then
                mydate=$(date)
                echo "$mydate restarted httpd service " >> /tmp/hadi
                systemctl start httpd
        fi


fi


if [ $(systemctl is-active mysqld) != "active" ]
then

        ##Add some delay to the start operation to avoid overlapping with other manual restart operations from the shell
        sleep 10

        if [ $(systemctl is-active mysqld) != "active" ]
        then
                mydate=$(date)
                echo "$mydate restarted mysqld service " >> /tmp/hadi

                systemctl start mysqld
        fi


fi
