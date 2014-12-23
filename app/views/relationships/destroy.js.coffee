$("#<%=@user.follow_form_id%>").html("<%= j render partial:'users/follow',locals:{user:@user} %>")
