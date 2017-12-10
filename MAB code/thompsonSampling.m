function [optPerct,stepReward,regret] = thompsonSampling(nA,T,sigma,a,b)

if(nargin<1) % number of arms
    nA = 10;
end
if(nargin<2) % time period
    T = 2000;
end
if(nargin<3) % standard deviation of distribution each arm
    sigma = 1.0;
end
if(nargin<4) % interval of the mean of each arms
    a=0;b=1;
end
% nA = 10;T = 2000;sigma = 1.0;a=-2;b=2;
% rng(1);
% initialize the mean distribution of each arm
QStar = a + (b-a).*rand(nA,1);

[~,optArm] = max(QStar);    % record optimal arm
totalOpt = 0;               % number of optimal choose
totalReward = 0;            % number of total reward
totalExpReward = 0;         % number of the expected reward
timesPlayed = ones(nA,1);   % record number of plays of each arm
avgReward = zeros(nA,1);    % record average reward of each arm
sampleReward = zeros(nA,1); % sample the result


% first play every arm once to get knowledge
for i=1:nA
    % avgReward(i) = normrnd(QStar(i),sigma);  % Gaussian
    % avgReward(i) = QStar(i)-1.5+3.0*rand(1); % Uniform
    if rand(1) < QStar(i)                     % Bernoulli
        avgReward(i) = 1;
    else
        avgReward(i) = 0;
    end
end

% play for T times
for i=nA+1:T
    % sample from distribution
    for j=1:nA
        sampleReward(j) = normrnd(avgReward(j), 1/(timesPlayed(j) + 1));
    end
    [~,pickedArm] = max(sampleReward);
    % get reward random from distribution
    % reward = normrnd(QStar(pickedArm),sigma);
    % reward = QStar(pickedArm) - 1.5 + 3.0*rand(1);
    if rand(1) < QStar(pickedArm)
        reward = 1;
    else
        reward = 0;
    end
    totalExpReward = totalExpReward+QStar(pickedArm);
    % update our knowledge
    timesPlayed(pickedArm) = timesPlayed(pickedArm)+1;
    avgReward(pickedArm) = avgReward(pickedArm) + (reward-avgReward(pickedArm))/timesPlayed(pickedArm);
    totalReward = totalReward+reward;
    % check if it's the optimal arm
    if (pickedArm == optArm)
        totalOpt = totalOpt+1;
    end
end

regret = (QStar(optArm)*T - totalExpReward)/T;
optPerct = totalOpt/T;
stepReward = totalReward/T;