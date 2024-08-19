cd /opt/lists

wget --no-if-modified-since -N https://antifilter.download/list/ipsum.lst https://antifilter.download/list/subnet.lst
curl https://www.gstatic.com/ipranges/goog.json | jq -r '.prefixes[].ipv4Prefix | select( . != null)' > youtube.lst
if [ -e ./md5.txt ]
then
  old=$(cat ./md5.txt);
else
  old=''
fi

new=$(cat ./*.lst | md5sum | head -c 32);

if [ "$old" != "$new" ]
then
  cat ./ipsum.lst | sed 's_.*_route & reject;_' > ./ipsum.txt
  cat ./subnet.lst | sed 's_.*_route & reject;_' > ./subnet.txt
  cat ./youtube.lst | sed 's_.*_route & reject;_' > ./youtube.txt
  /usr/sbin/birdc -s /var/run/bird/bird.ctl configure;
  logger "RKN list reconfigured";
  echo $new >./md5.txt;
fi
