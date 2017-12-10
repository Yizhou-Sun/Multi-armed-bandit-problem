% draw figures
stepsize = 100;t = (10:stepsize:3000);

figure(1); hold on;
% plot(t, optPercentTSGau, 'LineWidth', 2);
% plot(t, optPercentTSUni, 'LineWidth', 2);
plot(t, optPercentTSBen, 'LineWidth', 2);
% plot(t, optPercentepsGau, 'LineWidth', 2);
% plot(t, optPercentepsUni, 'LineWidth', 2);
plot(t, optPercentepsBen, 'LineWidth', 2);
plot(t, optPercentTS, 'LineWidth', 2);
legend({'TS:assume-Gau','eps','TS:assume-Bern'});
%legend({'TS:reward-Gau','TS:reward-Uni','TS:reward-Bern','eps:reward-Gau','eps:reward-Uni','eps:reward-Bern'});
axis tight; grid on;
xlabel('Total Period T'); ylabel('% of Optimal Arm Plays');

figure(2); hold on;
% plot(t, avgStepRewardTSGau, 'LineWidth', 2);
% plot(t, avgStepRewardTSUni, 'LineWidth', 2);
plot(t, avgStepRewardTSBen, 'LineWidth', 2);
% plot(t, avgStepRewardepsGau, 'LineWidth', 2);
% plot(t, avgStepRewardepsUni, 'LineWidth', 2);
plot(t, avgStepRewardepsBen, 'LineWidth', 2);
plot(t, avgStepRewardTS, 'LineWidth', 2);
legend({'TS:assume-Gau','eps','TS:assume-Bern'});
% legend({'TS:reward-Gau','TS:reward-Uni','TS:reward-Bern','eps:reward-Gau','eps:reward-Uni','eps:reward-Bern'});
axis tight; grid on;
xlabel('Total Period T'); ylabel('Total Reward/Step');

figure(3); hold on;
% plot(t, avgStepRegretTSGau, 'LineWidth', 2);
% plot(t, avgStepRegretTSUni, 'LineWidth', 2);
plot(t, avgStepRegretTSBen, 'LineWidth', 2);
% plot(t, avgStepRegretepsGau, 'LineWidth', 2);
% plot(t, avgStepRegretepsUni, 'LineWidth', 2);
plot(t, avgStepRegretepsBen, 'LineWidth', 2);
plot(t, avgStepRegretTS, 'LineWidth', 2);
legend({'TS:assume-Gau','eps','TS:assume-Bern'});
% legend({'TS:reward-Gau','TS:reward-Uni','TS:reward-Bern','eps:reward-Gau','eps:reward-Uni','eps:reward-Bern'});
axis tight; grid on;
xlabel('Total Period T'); ylabel('Regret/Step');