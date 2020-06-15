function [PP] = hybrid_beamforming_P_w(Vrf,H,K,P,sigma2,beta_K)
    H_Vrf=H*Vrf;
    VD_hat = H_Vrf'*inv(H_Vrf*H_Vrf');
    H_Vrf=Vrf*VD_hat;
    Q_hat = H_Vrf'*H_Vrf;   %��ʽ��23�������Q_hat
    C=0;
    [zz]= waterfill(P,beta_K); 
%     for k=1:K%(beta_K(k)/lamada)
%         C=C+max(beta_K(k)-Q_hat(k,k)*sigma2,0);
%     end
%   Lmd = sum(beta_K)/(sum(diag(Q_hat*sigma2))+sum(beta_K));
    for pp = 1:K  %����ʽ��23�����Pk
%         PP(pp,pp) = (1/Q_hat(pp,pp))*max(((beta_K(pp)/lamada)-(Q_hat(pp,pp)*sigma2)),0);
        PP(pp,pp) = (1/Q_hat(pp,pp))*zz(pp);
    end
end


