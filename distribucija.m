function [distr] = distribucija (post,velicinaPopulacije)
distr=zeros(velicinaPopulacije,1);
distr(1)=post(1);
for i=2:velicinaPopulacije
    distr(i)=distr(i-1)+post(i);
end
end