import httpclient

let hook_url = "https://hooks.slack.com/services/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"
#let payload = "{\"text\": \"Time to kill some bugs!.\"}"

proc cheesy_json(key: string, value: string): string =
  "\"" & key & "\":" & "\"" & value & "\""

proc post_message*(message: string, channel: string) = 
  var payload = "{"
  payload.add(cheesy_json("channel", "#" & channel))
  payload.add(",")
  payload.add(cheesy_json("text", message))
  payload.add("}")
  echo payload
  discard postContent(hook_url, body=payload)
#echo payload
#echo encode_url(payload)
#echo postContent(hook_url, body=payload)

