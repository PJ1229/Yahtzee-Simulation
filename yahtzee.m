% function to run a yahtzee simulation and return number of attempts to win
function attempts = yahtzee_sim()
    dice_num = 5; % used to count number of dice rolled
    attempts = 0; % counts how many times needed to get dice to 0
    while(dice_num > 0)
        rolls = randi([1,6],1,dice_num,"int8"); % simulates a rolling some number of dice
        count = [0, 0, 0, 0, 0, 0]; % initialzes count variable
        for i = 1:size(rolls, 2)
            count(rolls(i)) = count(rolls(i)) + 1; % increases count of each number
        end
        if attempts == 0 % check if first attempt
            target = find(count == max(count)); % find target dice roll based on most common roll
            if size(target,2) > 1 % check if more than one most common roll
                target = dice_num(size(dice_num,2)); % set to the highest roll
            end
            dice_num = sum(rolls ~= target); % change the number of dice
        else
            dice_num = sum(rolls ~= target); % change the number of dice
        end
        attempts = attempts + 1; % change the number of attempts
    end

end

% run a yahtzee simulation
test = yahtzee_sim();

