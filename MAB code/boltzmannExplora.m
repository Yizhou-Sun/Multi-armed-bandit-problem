function [optPerct,stepReward,regret]= boltzmannExplora(nA,T,tau,sigma,a,b)

if(nargin<1) % number of arms
    nA = 10;
end
if(nargin<2) % time period
    T = 2000;
end
if(nargin<3) % temperature parameter
    tau = 0.1;
end
if(nargin<4) % standard deviation of distribution each arm
    sigma = 1.0;
end
if(nargin<5) % interval of the mean of each arms
    a=0;b=1;
end

% initialize the mean distribution of each arm
QStar = a + (b-a).*rand(nA,1);

armArr = (1:1:nA);

[~,optArm] = max(QStar);    % record optimal arm
totalOpt = 0;               % number of optimal choose
totalReward = 0;            % number of total reward
totalExpReward = 0;         % number of the expected reward
timesPlayed = ones(nA,1);   % record number of plays of each arm
avgReward = zeros(nA,1);    % record average reward of each arm
prob = zeros(nA,1);         % computed UCB quantity of each arm

% first play every arm once to get knowledge
for i=1:nA
    avgReward(i) = normrnd(QStar(i),sigma);
end

% play for T times
for i=nA+1:T
    % compute the Boltzmann distribution at time t
    sum = 0;
    for j=1:nA
        sum = sum+exp(avgReward(j)/tau);
    end
    for j=1:nA
        prob(j) = exp(avgReward(j)/tau)/sum;
    end
    % choose the arm based on their prob
    pickedArm = randsample(armArr,1,true,prob');
    % get reward random from distribution
    reward = normrnd(QStar(pickedArm),sigma);

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