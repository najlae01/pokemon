--[[
    GD50
    Pokemon

    Author: Najlae Abarghache
]]

LevelUpStats = Class{__includes = BaseState}

function LevelUpStats:init(stats, onClose)

    self.stats = stats

    self.onClose = onClose or function() end

    self.LevelUpStatsMenu = Menu {
        x = VIRTUAL_WIDTH - 170,
        y = 6,
        width = 170,
        height = 128,
        cursorEnabled = false,
        items = 
        {
            {
                text = 'HP: '.. stats.startingHP .. '+' .. stats.HPIncrease .. '=' .. stats.playerPokemon.HP
            },
            {
                text = 'Attack: '.. stats.startingAtk .. '+' .. stats.AtkIncrease .. '=' .. stats.playerPokemon.attack
            },
            {
                text = 'Defense: '.. stats.startingDf .. '+' .. stats.DfIncrease .. '=' .. stats.playerPokemon.defense
            },
            {
                text = 'Speed: '.. stats.startingSpeed .. '+' .. stats.SpeedIncrease .. '=' .. stats.playerPokemon.speed
            },
        }
    }
end

function LevelUpStats:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('space') or love.keyboard.wasPressed('return') then
        gStateStack:pop()
        self.onClose()
    end
    self.LevelUpStatsMenu:update(dt)
end

function LevelUpStats:render()
    self.LevelUpStatsMenu:render()
end