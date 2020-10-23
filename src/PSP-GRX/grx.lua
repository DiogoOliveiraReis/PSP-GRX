-- Lua Player Euphoria

-- Background
backgroundSprite = Image.load("bg_game.png")

-- Font
White = Color.new(255, 255, 255)
DarkGray = Color.new(100, 100, 100, 128)
font = IntraFont.load("font.pgf", 0)
font:setStyle(0.35, White, DarkGray, IntraFont.CACHE_ALL)

-- Player
katSprite = Image.load("kat.png")
player = {}
player.x = 40
player.y = 200

-- Highscore
highscore = 0

-- Enemies
neviSprite = Image.load("nevi.png")
nevi1 = {}
nevi1.x = 490
nevi1.speed = 1
nevi2 = {}
nevi2.x = 490
nevi2.speed = 2
nevi3 = {}
nevi3.x = 490
nevi3.speed = 3

-- Lives
lives = 5

at = 1
aj = 0
r = 0
z = 1
function jump()
	if aj == 0 and math.abs(player.y) > 199 then
		r = 1
	else r = 0
	end

	if pad:cross() and r == 1 then
		aj = 1
	end

	if aj == 1 and math.abs(at) < 100 and z == 1 then
		player.y = player.y - 5
		at = at + 1
	elseif aj == 1 and math.abs(at) < 100 and z == 2 then
		player.y = player.y - 5
		at = at + 1
	end

	if at == 20 then
		aj = 0
		at = 1
	end

	if aj == 0 and math.abs(player.y) < 200 then
		player.y = player.y + 5
	end
end

-- Main Loop
while true do

	pad = Controls.readPeek()

	System.draw()
	
	screen:clear()

	screen:blit(0, 0, backgroundSprite)

	screen:blit(nevi1.x, 200, neviSprite)
	nevi1.x = nevi1.x - nevi1.speed
	if nevi1.x < -40 then
		nevi1.speed = math.random(1,4)
		nevi1.x = math.random(490, 510)
	end
	if nevi1.x <= 195 and player.y >= 200 and nevi1.x <= 45 and nevi1.x >= 35 then
		nevi1.x = math.random(490, 510)
		lives = lives - 1
	end

	screen:blit(nevi2.x, 200, neviSprite)
	nevi2.x = nevi2.x - nevi2.speed
	if nevi2.x < -40 then
		nevi2.speed = math.random(1,4)
		nevi2.x = math.random(490, 510)
	end
	if nevi2.x <= 195 and player.y >= 200 and nevi2.x <= 45 and nevi2.x >= 35 then
		nevi2.x = math.random(490, 510)
		lives = lives - 1
	end

	screen:blit(nevi3.x, 200, neviSprite)
	nevi3.x = nevi3.x - nevi3.speed
	if nevi3.x < -40 then
		nevi3.speed = math.random(1,4)
		nevi3.x = 490
	end
	if nevi3.x <= 195 and player.y >= 200 and nevi3.x <= 45 and nevi3.x >= 35 then
		nevi3.x = math.random(490, 510)
		lives = lives - 1
	end

	font:print(325, 10, "PSP-GRX Alpha By DoR")

	font:print(5, 10, "Lives:")
	font:print(50, 10, lives)

	font:print(65, 10, "Highscore:")
	font:print(145, 10, highscore)
	highscore = highscore + 1

	screen:blit(player.x, player.y, katSprite)
	jump()

	if lives == 0 then
		dofile("gameover.lua")
	end

	System.endDraw();
	screen.waitVblankStart();
	screen.flip();
end

System.quit();