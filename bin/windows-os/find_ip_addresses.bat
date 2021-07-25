rem Scan all addresses on the 192.168.0.xxx subnet
rem and redirect the ping results for all addresses
rem to ip_addresses.txt
rem
rem Look for results with "Received = 1" 
cls

for /L %i in (0,1,255) do ping -n 1 -w 250 192.168.0.%i>>ip_addresses.txt