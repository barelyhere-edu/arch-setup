function fish_greeting

    printf (set_color 9370db)"ᓚ₍ ^. .^₎\n"

	# Greeting messages
	set powered_msgs \
		"the void." \
		"rubber bands." \
		"a black cat." \
		"no logic." \
		"a cat lady."

	# Randomly pick a message
	set chosen_msg (random)"%"(count $powered_msgs)
	set chosen_msg $powered_msgs[(math $chosen_msg"+1")]

	# Output it to the console
	printf (set_color 9370db)"Hi! This terminal session is powered by %s\n" $chosen_msg

end
