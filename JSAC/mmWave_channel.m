function [h,power_matrix,A_BS,A_MS,Fopt,Wopt]=mmWave_channel(Nr,Nt,Ns,L,lamada)
%�������ŵ������ʵ��
count = 0;
power=sqrt(Nr*Nt/L);
alpha=(randn(1,L)+1i*randn(1,L))/sqrt(2);
power_matrix=power*diag(alpha);
AoA=2*pi*rand(1,L)-pi;   %�����
AoD=2*pi*rand(1,L)-pi;   %ƫ���
% AoA=(pi/3)*rand(1,L)-pi/6;
% AoD=(pi/3)*rand(1,L)-pi/6;
d=lamada/2;
for l=1:L
    A_BS(:,l)=array_respones(AoD(l),Nt,d,lamada);    %��վ��������Ӧ
    A_MS(:,l)=array_respones(AoA(l),Nr,d,lamada);    %�ƶ��豸��������Ӧ
end
h=A_MS*power_matrix*A_BS';    %�ŵ�����
% if(rank(h(:,:))>=Ns)
%     count = count + 1;
    [U,S,V] = svd(h(:,:));
    Fopt(:,:) = V([1:Nt],[1:Ns]);
    Wopt(:,:) = U([1:Nr],[1:Ns]);
% end