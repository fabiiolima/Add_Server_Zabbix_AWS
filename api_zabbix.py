from pyzabbix import api
import os

server = "http://54.227.231.156/zabbix"
user = "Admin"
passw = "zabbix"

zapi = api.ZabbixAPI(server)
zapi.login(user,passw)

win_user = os.environ['USERNAME']
file = open(f"C:\\Users\\{win_user}\\Documents\\Terraform\\Projetos\\Add_New_Servers\\hosts.txt" , "r")

for server in file:
    server = server.strip()
    print (server)
    try:
        zapi.host.create (
            host=server,
            interfaces={"type": 1,"main": 1, "useip": 1,"ip": server, "dns": "", "port": "10050"},
            groups={"groupid": "2"},
            templates={"templateid": "10186"},
            inventory_mode=-1
        )

    except api.ZabbixAPIException as e:
        print("Error", e)
