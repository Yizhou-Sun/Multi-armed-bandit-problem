% run e-greedy/boltzmann/UCB with differetn parameters
stepsize = 100;
nA = 10;
epsArr = [0,0.01,0.2,0.5];
tauArr = [0.01,0.1,1];
cArr = [0.1,1,5];
ntimes = 10;
t = (10:stepsize:3000);

% optPercent = zeros(length(epsArr),length(t));
% avgStepReward = zeros(length(epsArr),length(t));
% avgStepRegret = zeros(length(epsArr),length(t));
% 
% for i=1:length(epsArr)
%     for j=1:length(t)
%         T = t(j);
%         sumPercent = 0;sumStepReward = 0;sumRegret = 0;
%         fprintf("Run T = %d parameter = %f\n",T,epsArr(i));
%         for k=1:ntimes
%             [percentage,stepreward,stepregret] = epsilonGreedy(nA,T,epsArr(i),1,0,1);
%             %[percentage,stepreward,stepregret] = boltzmannExplora(nA,T,tauArr(i),1,0,1);
%             %[percentage,stepreward,stepregret] = UCB1(nA,T,cArr(i),1,0,1);
%             sumRegret = sumRegret+stepregret;
%             sumPercent = sumPercent+percentage;
%             sumStepReward = sumStepReward+stepreward;
%         end
%         optPercent(i,j) = sumPercent/ntimes;
%         avgStepReward(i,j) = sumStepReward/ntimes;
%         avgStepRegret(i,j) = sumRegret/ntimes;
%     end
% end
% 
% figure(1); hold on;
% plot(t, optPercent(1,:), 'LineWidth', 2);
% plot(t, optPercent(2,:), 'LineWidth', 2);
% plot(t, optPercent(3,:), 'LineWidth', 2);
% plot(t, optPercent(4,:), 'LineWidth', 2);
% axis tight; grid on;
% xlabel('Total Period T'); ylabel('% of Optimal Arm Plays');
% 
% figure(2); hold on;
% plot(t, avgStepReward(1,:), 'LineWidth', 2);
% plot(t, avgStepReward(2,:), 'LineWidth', 2);
% plot(t, avgStepReward(3,:), 'LineWidth', 2);
% plot(t, avgStepReward(4,:), 'LineWidth', 2); 
% axis tight; grid on;
% xlabel('Total Period T'); ylabel('Total Reward/Step');
% 
% figure(3); hold on;
% plot(t, avgStepRegret(1,:), 'LineWidth', 2);
% plot(t, avgStepRegret(2,:), 'LineWidth', 2);
% plot(t, avgStepRegret(3,:), 'LineWidth', 2);
% plot(t, avgStepRegret(4,:), 'LineWidth', 2); 
% axis tight; grid on;
% xlabel('Total Period T'); ylabel('Regret/Step');

% run ThompsonSampling
optPercentTS = zeros(1,length(t));
avgStepRewardTS = zeros(1,length(t));
avgStepRegretTS = zeros(1,length(t));

for j=1:length(t)
    T = t(j);
    sumPercent = 0;sumStepReward = 0;sumRegret = 0;
    fprintf("Run T = %d\n",T);
    for k=1:ntimes
        [percentage,stepreward,stepregret] = thompsonSamplingnew(nA,T,1,0,1);
        sumRegret = sumRegret+stepregret;
        sumPercent = sumPercent+percentage;
        sumStepReward = sumStepReward+stepreward;
    end
    optPercentTS(j) = sumPercent/ntimes;
    avgStepRewardTS(j) = sumStepReward/ntimes;
    avgStepRegretTS(j) = sumRegret/ntimes;
end

figure(1); hold on;
plot(t, optPercentTS, 'LineWidth', 2);
axis tight; grid on;
xlabel('Total Period T'); ylabel('% of Optimal Arm Plays');

figure(2); hold on;
plot(t, avgStepRewardTS, 'LineWidth', 2);
axis tight; grid on;
xlabel('Total Period T'); ylabel('Total Reward/Step');

figure(3); hold on;
plot(t, avgStepRegretTS, 'LineWidth', 2); 
axis tight; grid on;
xlabel('Total Period T'); ylabel('Regret/Step');
