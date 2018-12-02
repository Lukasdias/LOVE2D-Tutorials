local anim = require("anim8");
largura = love.graphics.getWidth();
altura = love.graphics.getHeight();
--Importando Lib Anim8--
--Para implementar as animações--
function love.load()
	player = {}
		player.px = 100
		player.py = 175
		player.vel = 100
		player.imagem = love.graphics.newImage("Sprites/Simon_Andando.png") -- diretorio da imagem a ser utilizada
		player.grid = anim.newGrid(26, 38, player.imagem:getWidth(), player.imagem:getHeight()) -- Tamanho Exato de cada frame(os dois primeiros parametros) da animação selecionada
		player.anim = anim.newAnimation(player.grid("1-3", 1), 0.1) -- Animação do sprite 1 ao 3 da primeira linha na velociade de 0.1
end

function love.update( dt )
	sentido = true -- Direção inicial
	player.anim:update(dt) -- atualizar a animação
	if love.keyboard.isDown("d", "right") then
		if player.px <= largura then
			sentido = true -- true (para direita), false (para esquerda)
			player.anim:resume(); -- resume a animação que está pausada enquanto nenhuma tecla é utilizada;
			player.px = player.px + player.vel * dt -- movimenta o sprite para direita
		end
	elseif love.keyboard.isDown("a", "left") then
		if player.px >= 0  then
			sentido = false -- true (para direita), false (para esquerda)
			player.anim:resume(); -- resume a animação que está pausada enquanto nenhuma tecla é utilizada;
			player.px = player.px - player.vel * dt -- movimenta o sprite para direita
		end
	else 
		player.anim:pause(); -- pausa a animação enquanto nenhuma tecla é digitada
	end
end

function love.draw()
	if sentido then
		player.anim:draw(player.imagem, player.px, player.py, 0 , -1 , 1, 13); -- desenha animação para direita
	elseif not sentido then
		player.anim:draw(player.imagem, player.px, player.py, 0 , 1 , 1, 13); -- desenha animação para esquerda
	end
end



--[[
player = {}
largura = love.graphics.getWidth();
altura = love.graphics.getHeight();
player.x = largura/2;
player.y = altura/2;
player.speed = 100;
function love.update(dt)
	if love.keyboard.isDown('d') then
		--Isso garante  que o player não atravesse a parede quando estiver indo para direita--
		if player.x < (love.graphics.getWidth() - player.img:getWidth()) then
			player.x = player.x + (player.speed * dt)
		end
	elseif love.keyboard.isDown('a') then
		--mesma coisa que antes só que agora para a esquerda--
		if player.x > 0 then 
			player.x = player.x - (player.speed * dt)
		end
	end
end
--]]