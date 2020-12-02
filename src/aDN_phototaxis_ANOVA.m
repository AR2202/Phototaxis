filelist1=["aDN_A_5min_phototaxis_PImeans_PI.mat","aDN_B_5min_phototaxis_PImeans_PI","aDN_C_5min_phototaxis_PImeans_PI","aDN_D_5min_phototaxis_PImeans_PI.mat"];
[p,p2,p3]= nested_anova_any(filelist1,'PIsingles');
[~,p4,~]= nested_anova_any(filelist1,'cellPImeans');
disp("nested ANOVA:")
disp(p)
disp("comparing genotypes individual flies:")
disp(p2)
disp("comparing chamber averages:")
disp(p4)