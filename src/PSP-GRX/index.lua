-- Lua Player Euphoria

-- Background
backgroundSprite = Image.load("bg_game.png")

-- Font
White = Color.new(255, 255, 255)
DarkGray = Color.new(100, 100, 100, 128)
font = IntraFont.load("font.pgf", 0)
font:setStyle(0.35, White, DarkGray, IntraFont.CACHE_ALL)

-- Music
Mp3.load("pleasure_quarter.mp3", 0)

-- Set CPU Speed
System.setCpuSpeed(222)

-- Main Loop
while true do

	Mp3.play(true, 0)

	pad = Controls.readPeek()

	System.draw()
	
	screen:clear()

	screen:blit(0, 0, backgroundSprite)

	font:print(325, 10, "PSP-GRX Alpha By DoR")

	font:print(180, 235, "Press X To Play!")
	if pad:cross() then
		dofile("grx.lua")
	end

	System.endDraw();
	screen.waitVblankStart();
	screen.flip();
end

System.quit();