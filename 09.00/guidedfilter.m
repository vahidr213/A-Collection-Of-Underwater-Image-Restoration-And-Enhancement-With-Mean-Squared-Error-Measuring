
function q = guidedfilter(I, p, r, eps)
 %   GUIDEDFILTER   O(1) time implementation of guided filter.
 %
 %   - guidance image: I (should be a gray-scale/single channel image)ָ��ͼ��
 %   - filtering input image: p (should be a gray-scale/single channel image)�˲�������ͼ��
 %   - local window radius: r �ֲ����ڰ뾶
 %   - regularization parameter: eps  ��һ������
 %   - filtering output image: q


 [hei, wid] = size(I);
 N = boxfilter(ones(hei, wid), r); % the size of each local patch; N=(2r+1)^2 except for boundary pixels.


 mean_I = boxfilter(I, r) ./ N; %��˺͵������Ӧλ�ô���Ԫ�س˳�����ͬ�ھ���ĳ˳�
 mean_p = boxfilter(p, r) ./ N;
 mean_Ip = boxfilter(I.*p, r) ./ N;
 cov_Ip = mean_Ip - mean_I .* mean_p; % this is the covariance of (I, p) in each local patch.


 mean_II = boxfilter(I.*I, r) ./ N;
 var_I = mean_II - mean_I .* mean_I;


 a = cov_Ip ./ (var_I + eps); % Eqn. (5) in the paper;
 b = mean_p - a .* mean_I; % Eqn. (6) in the paper;


 mean_a = boxfilter(a, r) ./ N;
 mean_b = boxfilter(b, r) ./ N;


 q = mean_a .* I + mean_b; % Eqn. (8) in the paper;
end
