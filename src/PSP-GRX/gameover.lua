-- Lua Player Euphoria

-- Background
backgroundSprite = Image.load("bg_game.png")

-- Font
White = Color.new(255, 255, 255)
DarkGray = Color.new(100, 100, 100, 128)
font = IntraFont.load("font.pgf", 0)
font:setStyle(0.35, White, DarkGray, IntraFont.CACHE_ALL)

-- Main Loop
while true do

	pad = Controls.readPeek()

	System.draw()
	
	screen:clear()

	screen:blit(0, 0, backgroundSprite)

	font:print(325, 10, "PSP-GRX Alpha By DoR")

	font:print(5, 10, "Lives:")
	font:print(50, 10, lives)

	font:print(65, 10, "Highscore:")
	font:print(145, 10, highscore)

	font:print(200, 220, "Gameover!")
	font:print(180, 235, "Press X To Play!")

	if pad:cross() then
		dofile("grx.lua")
	end

	System.endDraw();
	screen.waitVblankStart();
	screen.flip();
end

System.quit();