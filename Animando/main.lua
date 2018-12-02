local anim = require("anim8"); -- Requisitando a lib ANIM8
largura = love.graphics.getWidth(); -- Pegando a largura da tela e armazenando numa variavel --
altura = love.graphics.getHeight(); -- Pegando a largura da tela e armazenando numa variavel --
--Importando Lib Anim8--
--Para implementar as animações--
function love.load()
	player = {}
		player.px = 100 -- Posição no eixo X
		player.py = 175 -- Posição no eixo Y
		player.vel = 100 -- Velocidade de locomoção no eixo X
		player.imagem = love.graphics.newImage("Sprites/Simon_Andando.png") -- diretorio da imagem a ser utilizada
		player.grid = anim.newGrid(26, 38, player.imagem:getWidth(), player.imagem:getHeight()) -- Tamanho Exato de cada frame(os dois primeiros parametros) da animação selecionada
		--[[Parametros da função acima:
			#1 e #2= altura e largura de cada frame, ou seja
			Largura da imagem
			Numeros de frames na horizontal
			logo a largura do frame será  = LarguradaImagem/nFrames(horizontal)
			logo a altura do frame será = AlturadaImagem/nFrames(vertical)
			#3 e #4 função que obtem a lagura e altura da imagem para obter o frames de maneira correta
			--]]
		player.anim = anim.newAnimation(player.grid("1-3", 1), 0.1) -- Animação do sprite 1 ao 3 da primeira linha na velociade de 0.1
		--[[Parametros da função acima:
		#1 Grid
		variavel que acabamos de definir contém os frames cortados e separados para o uso
		#2 Frames
		em um string coloque quais frames você deseja, ou seja,
		"1(frame 1)-7(frame 7"
		isso significa que você deseja que a animação vá do primeiro ao sétimo frame, e fique nesse loop.
		#3 Linha do frame
		Alguns sprites podem ter mais de um linha com varios frames esse parametro é para definir de que linha você quer esses sprites
		Se for linha == 1 então:
		pegue do primeiro ao setimo frame da primeira linha.
		#4 Velociade
			Quanto menor o valor
				Maior velociade
			Quanto maior o valor 
				Menor velocidade
		--]]	
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