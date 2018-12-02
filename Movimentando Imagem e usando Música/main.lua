--[[
    AQUI
    vamos fazer uma imagem presente na pasta da main se locomover pela tela
    criaremos uma tabela chamada player que contará com
    px
    py
    imagem que representa o player
    velocidade de locomoção(vel)
--]]


function love.load()
    -- Criando tabela player -- 
    player = {
        img = love.graphics.newImage("imagem.png"), -- imagem que representa o player
        px = 100,
        py = 250,
        vel = 100
    }
    
    -- declarando uma musica para ficar tocando no fundo -- 
    music = {
        tema = love.audio.newSource("tema.mp3", "static")
    }

end



function love.update(dt)
--[[
    AQUI
    vamos movimentar a imagem pela tela lembrando que a mesma é desprovidade de qualquer fisica!!!
    usando a função love.keyboard.isDown("***teclapressionada*** ex: *up ou  w*")
--]]
    music.tema:play()

    if love.keyboard.isDown("up", "w") then -- Checando se o usuário está pedindo para a imagem se movimentar para cima!!!
        player.py = player.py - player.vel * dt --Se tecla pressionada for cima ou w então : posição no eixo Y recebe um decremento de 100 em 100 enquanto o user estiver pressionando a tecla. 
    elseif love.keyboard.isDown("left", "a") then -- Checando se o usuário está pedindo para a imagem se movimentar para esquerda!!!       
        player.px = player.px - player.vel * dt --Se tecla pressionada for left ou a então : posição no eixo X recebe um decremento de 100 em 100 enquanto o user estiver pressionando a tecla.
    elseif love.keyboard.isDown("right", "d") then -- Checando se o usuário está pedindo para a imagem se movimentar para direita!!!
        player.px = player.px + player.vel * dt--Se tecla pressionada for right ou d então : posição no eixo X recebe um incremento de 100 em 100 enquanto o user estiver pressionando a tecla.
    elseif love.keyboard.isDown("down", "s") then -- Checando se o usuário está pedindo para a imagem se movimentar para baixo!!!
        player.py = player.py + player.vel * dt --Se tecla pressionada for down ou s então : posição no eixo Y recebe um incremento de 100 em 100 enquanto o user estiver pressionando a tecla.
    end

    music.tema:setLooping(false)
    
end

function love.draw()
    love.graphics.draw(player.img, player.px, player.py)
end
