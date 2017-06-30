# Webhook Monitor Console

The purpose of this project is to simplify viewing of webhook posts. It's goal is to be super simple and to be able to easily test webhook posts on a system that does not have access to the outside world.

This is an alternative to the Node.JS [webhook_monitor](https://github.com/yepher/webhook_monitor). 


## Simple Post Test

```
curl -X POST \
  http://localhost:8082/webhookViewer \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -H 'postman-token: f70659d7-9c75-151f-b987-c40e15feae89' \
  -d '{
	"blah":[
		"one",
		"two",
		"three"
	]
}'

```

## Setup on isolated server with only SSH shell access

How to get this on your server without the ability to download it form GitHub or ability to SCP it to the host:

1. Get binary from here [Releases](https://github.com/yepher/webhook_monitor_console/releases)
2. Base64 the binary for the target architecture
	* `openssl base64 -in webhook_monitor_console -out output.txt`
3. Paste Base64 content of output.txt into a text file on the target system named `output.txt`
4. Convert base64 file back into an executable binary file
	* `openssl base64 -d -in output.txt -out webhook_monitor_console`
	* `chmod +x webhook_monitor_console`



# TODO

* Add ability to specify response type for a given POST request
* Enable HTTPS support
* Enable ability to write to log instead or in addition to console output

