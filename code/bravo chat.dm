obj
	_message
		var
			alpha=510
			color="#ffffff"
			m_text=""
			face="arial"

		New(mt="",life=m_life,co="#ffffff")
			alpha=255+life*100
			color=co
			m_text=mt
			message_list.Add(src) //this adds the message to the list.
			message_log+="<br><font color=[color]><font face=[face]>[m_text]" //this adds the message to the log.
			..()

	_chatbox
		screen_loc="10,1:16"  //can be changed to locate it anywhere on the screen.
	//	icon='chatbox.dmi' //this icon can be edited to include borders. Make sure to keep the icon the same size as the maptext limit.
		maptext_height=128
		maptext_width=240
		layer=FLY_LAYER+1005

		New()
			..()

			update() //we want the chatbox to start updating as soon as it's available.

		proc
			update()

				spawn() //we want this to wait for other procs
					while(src) //but we also want this to loop indefinitely.
						sleep(world.tick_lag) //for best appearance, we loop this once per tick. It's pretty light on the CPU .
						var/final_text="" //this is a temporary variable just so we don't fiddle with maptext till we're all settled.
						var/final_text2="" //this is a temporary variable just so we don't fiddle with maptext till we're all settled.

						for(var/obj/_message/m in message_list) //check for the messages
							m.alpha-=world.tick_lag*10 //this is used to lower the alpha level as well as count down before deletion.
							if(m.alpha<=15) //I noticed a horrible flickering that occurs when the alpha of text is <15 so it stops here.
								message_list.Remove(m) //first we remove it from the list
								del(m) //then we delete it.
								continue //skip the next part of the loop
							if(message_list.len>max_list) message_list=message_list.Copy(message_list.len-max_list)
							var/m_alpha=m.alpha //this is used because we want the max alpha to be 255 without modifying the base
							if(m_alpha>255) m_alpha=255 //make sure to lower the temporary alpha value to match 255
							final_text+="\n <font color=#000000[dec2base(m_alpha,16)]><font face=[m.face]>[m.m_text]"//add the message
							final_text2+="\n <font color=#ffffff[dec2base(m_alpha,16)]><font face=[m.face]>[m.m_text]"//add the message

						maptext=final_text2 //apply the messages

						underlays=null

						global.chatbox2.maptext = final_text
						global.chatbox3.maptext = final_text
						global.chatbox4.maptext = final_text
						global.chatbox5.maptext = final_text

						underlays+=global.chatbox5
						underlays+=global.chatbox4
						underlays+=global.chatbox3
						underlays+=global.chatbox2

	_chatbox2
	//	icon='chatbox.dmi' //this icon can be edited to include borders. Make sure to keep the icon the same size as the maptext limit.
		maptext_height=128
		maptext_width=240
		layer=FLY_LAYER+1000

		pixel_y = -1
		pixel_x = -1


	_chatbox3
	//	icon='chatbox.dmi' //this icon can be edited to include borders. Make sure to keep the icon the same size as the maptext limit.
		maptext_height=128
		maptext_width=240
		layer=FLY_LAYER+1000

		pixel_y = 1
		pixel_x = 1

	_chatbox4
	//	icon='chatbox.dmi' //this icon can be edited to include borders. Make sure to keep the icon the same size as the maptext limit.
		maptext_height=128
		maptext_width=240
		layer=FLY_LAYER+1000

		pixel_y = -1
		pixel_x = 1
	_chatbox5
	//	icon='chatbox.dmi' //this icon can be edited to include borders. Make sure to keep the icon the same size as the maptext limit.
		maptext_height=128
		maptext_width=240
		layer=FLY_LAYER+1000

		pixel_y = 1
		pixel_x = -1

var
	obj/_chatbox/chatbox = new
	obj/_chatbox2/chatbox2 = new
	obj/_chatbox3/chatbox3 = new
	obj/_chatbox4/chatbox4 = new
	obj/_chatbox5/chatbox5 = new
	list/message_list = new
	message_log="" //this is a log of all text displayed
	m_life=30 //this is the value for the time it takes for text to start to disappear, in seconds.
	max_list=10 //the maximum number of messages in the message_list at any given time



mob



	proc
		showchat() //Use this proc to add the chatbox to the clients screen.
			if(!client) return
			client.screen+= chatbox


		hidechat() //use this proc to remove the chat from a players screen.
			if(!client) return
			client.screen-= chatbox



	proc
		chatbox(t,life,co) //this proc is used to create a simple message on the chatbox.
			new/obj/_message(t,life,co)
world
	proc
		messagee(t,life,co)
			new/obj/_message(t,life,co)
//This procedure provided by YMIHere's Base Converter
proc/dec2base(dec,base)
	if(base>36 || base<2)
		return
	var/num
	while(dec >= base)
		if(dec % base > 9)
			num="[ascii2text(dec % base + 87)][num]"
		else
			num="[dec % base][num]"
		dec=round(dec / base)
	if(dec > 9)
		num="[ascii2text(dec + 87)][num]"
	else
		num="[dec][num]"
	return num





