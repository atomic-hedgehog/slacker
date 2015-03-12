import jester, asyncdispatch, htmlgen, webhook, rolls

routes:
 get "/":
   resp p("Slacker is running")
 post "/roll":
   let channel = request.params["channel_name"]
   let user = request.params["user_name"]
   let roll_text = request.params["text"]

   if validate(roll_text):
     let message = user & " rolls " & roll_text & ":\\n" & roll(roll_text)
     post_message(message, channel)
     resp("")
   else:
     resp(Http400, "The die roll string was malformed")

runForever()
