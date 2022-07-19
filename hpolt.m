clc;
clear;
  R=rand(3,3)
            G=rand(3,3)
             B=rand(3,3)
 R=randi([0.5 1],3,3)
            G=randi([0 1],3,3)
             B=randi([0 1],3,3)
hold on;
plot(0.005,1,'-s','MarkerSize',100,...
    'MarkerFaceColor',[1 0 0]);

plot(0.006,1,'-s','MarkerSize',100,...
    'MarkerFaceColor',[0 1 0]);

plot(0.007,1,'-s','MarkerSize',100,...
    'MarkerFaceColor',[0 0 1]);

plot(0.005,1.05,'-s','MarkerSize',100,...
    'MarkerFaceColor',[0 1 0]);

plot(0.006,1.05,'-s','MarkerSize',100,...
    'MarkerFaceColor',[0 0 1]);

plot(0.007,1.05,'-s','MarkerSize',100,...
    'MarkerFaceColor',[1 0 0]);

plot(0.005,1.1,'-s','MarkerSize',100,...
    'MarkerFaceColor',[0 0 1]);

plot(0.006,1.1,'-s','MarkerSize',100,...
    'MarkerFaceColor',[1 0 0]);

plot(0.007,1.1,'-s','MarkerSize',100,...
    'MarkerFaceColor',[0 1 0]);
hold off;