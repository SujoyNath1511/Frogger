#####################################################################
#
# CSC258H5S Winter 2022 Assembly Final Project
# University of Toronto, St. George
#
# Student: Sujoy Deb Nath, 1007067451
#
# Bitmap Display Configuration:
# - Unit width in pixels: 4
# - Unit height in pixels: 4
# - Display width in pixels: 256
# - Display height in pixels: 256
# - Base Address for Display: 0x10008000 ($gp)
#
# Which milestone is reached in this submission?
# (See the assignment handout for descriptions of the milestones)
# - Milestone () 1/2/3/4/5 (choose the one the applies)
#
# Which approved additional features have been implemented?
# (See the assignment handout for the list of additional features)
# 1. None
#
# Any additional information that the TA needs to know:
# - Nothing yet.
#
#####################################################################
# Demo for painting
#
# Bitmap Display Configuration:
# - Unit width in pixels: 8
# - Unit height in pixels: 8
# - Display width in pixels: 256
# - Display height in pixels: 256
# - Base Address for Display: 0x10008000 ($gp)
#
.data
	# Display Address
	displayAddress: .word 0x10008000
	
	# Display Buffer
	displayBuffer: .space 65536
	
	# Road Color
	road_col: .word 0x25282e
	
	# Water Color
	water_col: .word 0x264687
	
	# Goal zone color
	goal_col: .word 0x518757
	
	# Start zone and safe zone color
	start_col: .word 0x0f4d16
	
	#------------------------------------------------------------------------------------------------------------------
	# FROG
	#------------------------------------------------------------------------------------------------------------------
	
	# Frog. The frog's size will always be 8 by 8.
	frog_x: .word 28  			# Store the frog x coordinate
	frog_y: .word 56			# Store the frog's starting y coordinate.
	frog_color: .word 0x29912e 	# Create a variable to store the frog's color
	
	#------------------------------------------------------------------------------------------------------------------
	# VEHICLES
	#------------------------------------------------------------------------------------------------------------------
	
	# Vehicle Large Size
	car_large_w: .word 16				# Store the large car's width
	car_large_h: .word 8				# Store the large car's height
	
	# Vehicle Small size
	car_small_w: .word 12				# Store the small car's width
	car_small_h: .word 8				# Store the small car's height
	
	# Vehicle Large 1
	car_large_1_x: .word 36				# Store the large car's x coordinate
	car_large_1_y: .word 48				# Store the large car's y coordinate
	car_large_1_col: .word 0x000000 	# The color of the car 
	
	# Vehicle Large 2
	car_large_2_x: .word 16				# Store the large car's x coordinate
	car_large_2_y: .word 40				# Store the large car's y coordinate
	car_large_2_col: .word 0x000000 	# The color of the car  
	
	# Vehicle Small 1
	car_small_1_x: .word 8				# Store the small car's x coordinate
	car_small_1_y: .word 48				# Store the small car's y coordinate
	car_small_1_col: .word 0x000000 	# The color of the car 
	
	# Vehicle Small 2
	car_small_2_x: .word 44				# Store the small car's x coordinate
	car_small_2_y: .word 40				# Store the small car's y coordinate
	car_small_2_col: .word 0x000000 	# The color of the car

	#------------------------------------------------------------------------------------------------------------------
	# LOGS
	#------------------------------------------------------------------------------------------------------------------
			
	# Large Log size
	log_large_w: .word 24
	log_large_h: .word 8
	
	# Small Log size
	log_small_w: .word 16
	log_small_h: .word 8
	
	# Log color:
	log_col_1: .word 0xa52a2a
	log_col_2: .word 0x524e09
	
	# Log 1
	log_1_x: .word 4				# Store the car's x coordinate
	log_1_y: .word 24				# Store the car's y coordinate
	
	# Log 2
	log_2_x: .word 40				# Store the car's x coordinate
	log_2_y: .word 24				# Store the car's y coordinate
	
	# Log 3
	log_3_x: .word 4				# Store the car's x coordinate
	log_3_y: .word 8				# Store the car's y coordinate
	
	# Log 4
	log_4_x: .word 32				# Store the car's x coordinate
	log_4_y: .word 8				# Store the car's y coordinate
	
	#------------------------------------------------------------------------------------------------------------------
	# TURTLE
	#------------------------------------------------------------------------------------------------------------------
	# Turtle size:
	turtle_size: .word 8 				# Store the size of the turtle. Since it's a square, we only need one size.
	
	# Turtle color
	turtle_col:.word 0x008000		# The color of the turtle. 
	
	# Turtle 1
	turtle_1_x: .word 8					# Store the turtle's x
	turtle_1_y: .word 16					# Store the turtle's y
	
	# Turtle 2
	turtle_2_x: .word 40					# Store the turtle's x
	turtle_2_y: .word 16					# Store the turtle's y
	
	# Turtle 3
	turtle_3_x: .word 24					# Store the turtle's x
	turtle_3_y: .word 16					# Store the turtle's y
	
	
.text

# MAIN Program =================================================================================================================
	main:
		# INTIALIZE ALL THE VARIABLES:
		lw $t0, displayAddress # $t0 stores the base address for display
		la $s0, displayBuffer  # $s0 stores the base address for the buffer.
		
		game_loop_start:
		
			# CHECK FOR KEYBOARD INPUT: ----------------------------------------------------------------------------------------
		
			# UPDATE THE LOCATIONS OF ITEMS ----------------------------------------------------------------------------------------
				
			# Move Car Large 1:
			lw $a0, car_large_1_x 
			li $a1, -1
			la $a2, car_large_1_x
				
			jal MOVE_RECT 
			
			# Move Car Large 2:
			lw $a0, car_large_2_x 
			li $a1, 1
			la $a2, car_large_2_x
				
			jal MOVE_RECT
			
			# Move Car Small 1:
			lw $a0, car_small_1_x 
			li $a1, -1
			la $a2, car_small_1_x
				
			jal MOVE_RECT
			
			# Move Car Small 2:
			lw $a0, car_small_2_x 
			li $a1, 1
			la $a2, car_small_2_x
				
			jal MOVE_RECT
			
			# Move Log 1:
			lw $a0, log_1_x 
			li $a1, -1
			la $a2, log_1_x
				
			jal MOVE_RECT
			
			# Move Log 2:
			lw $a0, log_2_x 
			li $a1, -1
			la $a2, log_2_x
				
			jal MOVE_RECT
			
			# Move Log 3:
			lw $a0, log_3_x 
			li $a1, -1
			la $a2, log_3_x
				
			jal MOVE_RECT
			
			# Move Log 4:
			lw $a0, log_4_x 
			li $a1, -1
			la $a2, log_4_x
				
			jal MOVE_RECT
			
			# Move Turtle 1:
			lw $a0, turtle_1_x 
			li $a1, 1
			la $a2, turtle_1_x
				
			jal MOVE_RECT
			
			# Move Turtle 2:
			lw $a0, turtle_2_x 
			li $a1, 1
			la $a2, turtle_2_x
				
			jal MOVE_RECT
			
			# Move Turtle 3:
			lw $a0, turtle_3_x 
			li $a1, 1
			la $a2, turtle_3_x
				
			jal MOVE_RECT
		
			# REDRAW THE SCREEN INTO THE BUFFER ----------------------------------------------------------------------------------------
		
			# Draw the start region
			addi $a0, $zero, 0		# Left corner x
			addi $a1, $zero, 56		# Left corner y
			addi $a2, $zero, 64		# width
			addi $a3, $zero, 8		# height
			lw $t4, start_col 		# color
			addi $sp, $sp, -4		
			sw $t4, 0($sp)
		
			jal DRAW_RECT		# Draw the region
		
			# Draw the road
			addi $a0, $zero, 0		# Left corner x
			addi $a1, $zero, 40		# Left corner y
			addi $a2, $zero, 64		# width
			addi $a3, $zero, 16		# height
			lw $t4, road_col 		# color
			addi $sp, $sp, -4		
			sw $t4, 0($sp)
		
			jal DRAW_RECT		# Draw the region
		
			# Draw the safe zone
			addi $a0, $zero, 0		# Left corner x
			addi $a1, $zero, 32		# Left corner y
			addi $a2, $zero, 64		# width
			addi $a3, $zero, 8		# height
			lw $t4, start_col 		# color
			addi $sp, $sp, -4		
			sw $t4, 0($sp)
		
			jal DRAW_RECT		# Draw the region
		
			# Draw the Water zone
			addi $a0, $zero, 0		# Left corner x
			addi $a1, $zero, 8		# Left corner y
			addi $a2, $zero, 64		# width
			addi $a3, $zero, 24		# height
			lw $t4, water_col 		# color
			addi $sp, $sp, -4		
			sw $t4, 0($sp)
			
			jal DRAW_RECT		# Draw the region
			
			# Draw the Goal zone
			addi $a0, $zero, 0		# Left corner x
			addi $a1, $zero, 0		# Left corner y
			addi $a2, $zero, 64		# width
			addi $a3, $zero, 8		# height
			lw $t4, goal_col 		# color
			addi $sp, $sp, -4		
			sw $t4, 0($sp)
		
			jal DRAW_RECT		# Draw the region
		
			# Draw the Vehicles onto the road:
		
			# 	Large Vehicle 1:
			lw $a0, car_large_1_x		# Left corner x
			lw $a1, car_large_1_y		# Left corner y
			lw $a2, car_large_w			# width
			lw $a3, car_large_h			# height
			lw $t4, car_large_1_col 	# color
			addi $sp, $sp, -4		
			sw $t4, 0($sp)
			
			jal DRAW_RECT		# Draw the vehicle
			
			# 	Small Vehicle 1:
			lw $a0, car_small_1_x		# Left corner x
			lw $a1, car_small_1_y		# Left corner y
			lw $a2, car_small_w			# width
			lw $a3, car_small_h			# height
			lw $t4, car_small_1_col 	# color
			addi $sp, $sp, -4		
			sw $t4, 0($sp)
			
			jal DRAW_RECT		# Draw the vehicle
		
			# 	Large Vehicle 2:
			lw $a0, car_large_2_x		# Left corner x
			lw $a1, car_large_2_y		# Left corner y
			lw $a2, car_large_w			# width
			lw $a3, car_large_h			# height
			lw $t4, car_large_2_col 	# color
			addi $sp, $sp, -4		
			sw $t4, 0($sp)
		
			jal DRAW_RECT		# Draw the vehicle
		
			# 	Small Vehicle 2:
			lw $a0, car_small_2_x		# Left corner x
			lw $a1, car_small_2_y		# Left corner y
			lw $a2, car_small_w			# width
			lw $a3, car_small_h			# height
			lw $t4, car_small_2_col 	# color
			addi $sp, $sp, -4		
			sw $t4, 0($sp)
		
			jal DRAW_RECT		# Draw the vehicle
		
			
			# Draw the Logs
		
			# 	Log 1:
			lw $a0, log_1_x				# Left corner x
			lw $a1, log_1_y				# Left corner y
			lw $a2, log_large_w			# width
			lw $a3, log_large_h			# height
			lw $t4, log_col_1 			# color
			addi $sp, $sp, -4		
			sw $t4, 0($sp)
			
			jal DRAW_RECT		# Draw the log
	
			# 	Log 2:
			lw $a0, log_2_x				# Left corner x
			lw $a1, log_2_y				# Left corner y
			lw $a2, log_large_w			# width
			lw $a3, log_large_h			# height
			lw $t4, log_col_1 			# color
			addi $sp, $sp, -4		
			sw $t4, 0($sp)
			
			jal DRAW_RECT		# Draw the log
			
			# 	Log 3:
			lw $a0, log_3_x				# Left corner x
			lw $a1, log_3_y				# Left corner y
			lw $a2, log_small_w			# width
			lw $a3, log_small_h			# height
			lw $t4, log_col_2 			# color
			addi $sp, $sp, -4		
			sw $t4, 0($sp)
			
			jal DRAW_RECT		# Draw the log
				
			# 	Log 4:
			lw $a0, log_4_x				# Left corner x
			lw $a1, log_4_y				# Left corner y
			lw $a2, log_large_w			# width
			lw $a3, log_large_h			# height
			lw $t4, log_col_1 			# color
			addi $sp, $sp, -4		
			sw $t4, 0($sp)
			
			jal DRAW_RECT		# Draw the log
			
			# Draw the Turtles:
			
			# 	Turtle 1
			lw $a0, turtle_1_x				# Left corner x
			lw $a1, turtle_1_y				# Left corner y
			lw $a2, turtle_size			# width
			lw $a3, turtle_size			# height
			lw $t4, turtle_col 			# color
			addi $sp, $sp, -4		
			sw $t4, 0($sp)
			
			jal DRAW_RECT		# Draw the log
			
			# 	Turtle 2
			lw $a0, turtle_2_x				# Left corner x
			lw $a1, turtle_2_y				# Left corner y
			lw $a2, turtle_size			# width
			lw $a3, turtle_size			# height
			lw $t4, turtle_col 			# color
			addi $sp, $sp, -4		
			sw $t4, 0($sp)
		
			jal DRAW_RECT		# Draw the log
		
			# 	Turtle 3
			lw $a0, turtle_3_x				# Left corner x
			lw $a1, turtle_3_y				# Left corner y
			lw $a2, turtle_size			# width
			lw $a3, turtle_size			# height
			lw $t4, turtle_col 			# color
			addi $sp, $sp, -4		
			sw $t4, 0($sp)
			
			jal DRAW_RECT		# Draw the log
			
			# Draw the frog
			lw $a0, frog_x			# Left corner x
			lw $a1, frog_y			# Left corner y
			addi $a2, $zero, 8		# width
			addi $a3, $zero, 8		# height
			lw $t4, frog_color 		# color
			addi $sp, $sp, -4		
			sw $t4, 0($sp)
			
			jal DRAW_FROG		# Draw the frog
			
			# DRAW ONTO THE BITMAP DISPLAY ----------------------------------------------------------------------------------------
			
			jal PAINT
			
			# SLEEP ----------------------------------------------------------------------------------------
			li $v0, 32
			li $a0, 2
			syscall
			
			# GO BACK TO THE BEGINNING ----------------------------------------------------------------------------------------
			j game_loop_start 
		
		game_loop_end:
		 
		j Exit 

#==== Update Item Locations ======================================================================================================
	MOVE_RECT:
		# This is a function meant to move rectangles left or right, based on a set of values.
		# a0 is the x coordinate. a1 is the offset value that must be added to the coordinate.
		# a2 is the address of the x coordinate in memory.
		# This is because the cars, logs and turtles only ever move horizontally.
		
		# Add the offset to x. (i.e. add a0 and a1 and store it in a0)
		add $a0, $a0, $a1
		
		# Check if x (a0) is less than 0:
		bltz $a0, if_x_less_than_0
		bge $a0, 63, else_if_x_greater_than_63
		j end_if_x_less_than_0_or_greater_than_63
		
		if_x_less_than_0:
		
			# set x (a0) to 64 + x
			addi $a0, $a0, 64
			
			j end_if_x_less_than_0_or_greater_than_63
		
		# Check if x (a0) is greater than 63:
		else_if_x_greater_than_63:
			# set x (a0) to 64 - x
			li $t1, 64
			
			sub $a0, $t1, $a0
			
		# End if
		end_if_x_less_than_0_or_greater_than_63:
		
		# Write to memory 
		sw $a0, 0($a2)
		
		jr $ra
	
	MOVE_FROG:
		# This is a function used to update the frog's location.
		# a0 is the x coordinate, a1 is the y coordinate. a2 is the new x offset to be added. a3 is the y offset to be added.
		
		# Add the offset to x (add $a0 and $a2 and store it in $a0)
		
		# Add the offset to y (add $a1 and $a3 and store it in $a1)
		
		# If x is less than 0:
		
		# Else if x is greater than 63
		
		
		# IF x < 0 body ($a0 < 0)
		
		# IF x > 63 body ($a0 > 63)
		
		# End if
		
		# If y is less than 0: ($a1 < 0)
		
		# Else if y is greater than 63 ($a1 > 63)
		
		# IF x < 0 body
		
		# IF x > 63 body
		
		# End if
		
		# Store $a0 in frog_x
		
		# Store $a1 in frog_y
		
		
#==== Draw Items into the Buffer =================================================================================================	
	DRAW_RECT:
		# $a0 and $a1 are the starting x and y. $a2 and $a3 are the width and height. $sp stores the color.
		# Set the start of drawing:
		la $s0, displayBuffer
		
		# Set x
		addi $t1, $zero, 4
		mult $a0, $t1
		mflo $t1
		
		# Set y
		addi $t2, $zero, 256
		mult $a1, $t2
		mflo $t2
		
		add $s0, $s0, $t1
		add $s0, $s0, $t2
		
		# pop a word off the stack
		lw $t1, 0($sp)
		
		# move stack pointer a word.
		addi $sp, $sp, 4
		
		# Initialize i to 0
		add $t2, $zero, $zero
		
		# Start the first for loop.
		draw_loop_down:
			# Stop when i == $a3.
			beq $t2, $a3, end_loop_down
			
			# Initialize j to 0
			add $t3, $zero, $zero
			
			# Start the second for loop.
			draw_loop_across:
				# Stop when j == $a2
				beq $t3, $a2, end_loop_across
				
				# Check if x + j is more than 63. If so, then subtract 256 from $s0
				add $t6, $a0, $t3
				
				bgt $t6, 63, move_up_a_row
				j dont_move_up_a_row
				
				move_up_a_row:
					 # Move up a row
					addi $s0, $s0, -256
					
					# Draw a pixel onto the screen.
					sw $t1, 0($s0)
					
					# Move back down:
					addi $s0, $s0, 256
					
					# Jump down to the increment stage:
					j increment
					
				dont_move_up_a_row:
				
				# Otherwise draw a pixel onto the same row.
				sw $t1, 0($s0)
				
				increment:
				# move one pixel 
				addi $s0, $s0, 4
				# Increment j 
				addi $t3, $t3, 1
				# jump to the start of this loop
				j draw_loop_across
			
			end_loop_across:
			# Reset the display buffer to the start
			addi $t4, $zero, 4
			mult $a2, $t4
			mflo $t4
			
			sub $s0, $s0, $t4
			
			# Go to the next row:
			addi $s0, $s0, 256
			
			# Increment i
			addi $t2, $t2, 1
			
			# jump to the start of this loop
			j draw_loop_down
		# End of the drawing loop
		end_loop_down:
		# Return;
		jr $ra
		
	DRAW_FROG:
		# $a0 and $a1 are the starting x and y. $sp stores the color.
		# Set the start of drawing:
		la $s0, displayBuffer
		
		# Set x
		addi $t1, $zero, 4
		mult $a0, $t1
		mflo $t1		# Stores x
		
		# Set y
		addi $t2, $zero, 256
		mult $a1, $t2
		mflo $t2		# Stores Y
		
		# Move the buffer pointer to (x, y)
		add $s0, $s0, $t1
		add $s0, $s0, $t2
		
		# pop a word off the stack
		lw $t1, 0($sp)			# Stores the color
		
		# move stack pointer a word.
		addi $sp, $sp, 4
		
		# Draw row 0 ---------------------------------------------------------
		sw $t1, 0($s0)
		sw $t1, 28($s0)
		
		# Go to the next row:
		addi $s0, $s0, 256
			
		# Draw row 1 ---------------------------------------------------------
		sw $t1, 0($s0)
		sw $t1, 12($s0)
		sw $t1, 16($s0)
		sw $t1, 28($s0)
	
		# Go to the next row:
		addi $s0, $s0, 256
		
		# Draw row 2 ---------------------------------------------------------
		sw $t1, 0($s0)
		sw $t1, 4($s0)
		sw $t1, 8($s0)
		sw $t1, 12($s0)
		sw $t1, 16($s0)
		sw $t1, 20($s0)
		sw $t1, 24($s0)
		sw $t1, 28($s0)
		
		# Go to the next row:
		addi $s0, $s0, 256
		
		# Draw row 3 ---------------------------------------------------------
		sw $t1, 8($s0)
		sw $t1, 12($s0)
		sw $t1, 16($s0)
		sw $t1, 20($s0)
		
		# Go to the next row:
		addi $s0, $s0, 256
		
		# Draw row 4 ---------------------------------------------------------
		sw $t1, 8($s0)
		sw $t1, 12($s0)
		sw $t1, 16($s0)
		sw $t1, 20($s0)
			
		# Go to the next row:
		addi $s0, $s0, 256
		
		# Draw row 5 ---------------------------------------------------------
		sw $t1, 0($s0)
		sw $t1, 4($s0)
		sw $t1, 8($s0)
		sw $t1, 12($s0)
		sw $t1, 16($s0)
		sw $t1, 20($s0)
		sw $t1, 24($s0)
		sw $t1, 28($s0)
		
		# Go to the next row:
		addi $s0, $s0, 256
		
		# Draw row 6 ---------------------------------------------------------
		sw $t1, 0($s0)
		sw $t1, 28($s0)
		
		# Go to the next row:
		addi $s0, $s0, 256
		
		# Draw row 7 ---------------------------------------------------------
		sw $t1, 4($s0)
		sw $t1, 24($s0)
		
		# Go to the next row:
		addi $s0, $s0, 256
		
		# Return
		jr $ra
	
#==== Draw onto the Bitmap Display =====================================================================================
	
	PAINT:
		# Ensure the $t0 is the display address and $s0 is the buffer:
		#lw $t0, displayAddress # $t0 stores the base address for display
		la $s0, displayBuffer  # $s0 stores the base address for the buffer. 
		
		# Initialize the counter.
		add $t1, $zero, $zero
		addi $t2, $zero, 65536
		
		buffer_to_screen:
			# If the counter is equal to the end value, then exit the loop.
			beq $t1, $t2, end_buffer_to_screen
			
			# Set address of displayBuffer[i] to t3
			add $t3, $s0, $t1
			
			# Set address of displayAddress[i] to t5
			add $t5, $t0, $t1
			
			# Set t4 to be the actual value of displayBuffer[i]
			lw $t4, 0($t3)
			
			# Copy that value into the displayAddress
			sw $t4, 0($t5)
			
			addi $t1, $t1, 4
			
			j buffer_to_screen 
		end_buffer_to_screen:
		
		# Return
		jr $ra
	


#==== Exit the program =================================================================================================	
	Exit:
		li $v0, 10 # terminate the program gracefully
		syscall
