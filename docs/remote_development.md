# Remote development

## Mutagen sync Remote to Local

Update properties `config/dockergento/properties`. Add path to the folder on your local machine and specify SSH host.

```
WORKDIR_PHP="/path/to/project/root/locally"
WORKDIR_HOST="local-server"
```

## Add SSH config locally

```
Host remote-server
   User myuser
   Hostname remote-ip
   ForwardAgent yes
   RemoteForward 2222 localhost:22
   RemoteForward 9003 localhost:9003
```

## Add SSH config on remote
	
```
Host local-server
   User myuser
   HostName 127.0.0.1
   Port 2222
   IdentityFile /home/myuser/.ssh/id_rsa
```
	
	
