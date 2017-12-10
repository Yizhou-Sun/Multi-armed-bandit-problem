figure(); hold on;
plot(t, egreedyR(1,:), 'LineWidth', 2);
plot(t, egreedyR(2,:), 'LineWidth', 2);
plot(t, egreedyR(3,:), 'LineWidth', 2);

legend({'\epsilon = 0','\epsilon = 0.01','\epsilon = 0.1'});
axis tight; grid on;
xlabel( 'Total Period T' ); ylabel( '% Optimal Arm Plays' );
