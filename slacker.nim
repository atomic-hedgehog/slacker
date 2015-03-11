import jester, asyncdispatch, htmlgen, webhook, rolls

routes:
 get "/":
   resp p("Slacker is running")
 post "/roll":
   let channel = request.params["channel_name"]
   let user = request.params["user_name"]
   let roll_text = request.params["text"]
   let message = user & " rolls " & roll_text & ":\\n" & roll(roll_text)

   if validate(roll_text):
     post_message(message, channel)
     status = Http200
   else:
     status = Http400

runForever()
