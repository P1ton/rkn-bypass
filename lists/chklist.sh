cd /opt/bypass/lists
wget --no-if-modified-since -N https://antifilter.download/list/ipsum.lst https://antifilter.download/list/subnet.lst
old=$(cat ./md5.txt);
new=$(cat ./*.lst | md5sum | head -c 32);
if [ "$old" != "$new" ]
then
cat ./ipsum.lst | sed 's_.*_route & reject;_' > ./ipsum.txt
cat ./subnet.lst | sed 's_.*_route & reject;_' > ./subnet.txt
#$/usr/sbin/birdc configure;
logger "RKN list reconfigured";
echo $new >./md5.txt;
fi
