figure;
x1 = [ 0 5 5 0]'*[1 1 1];
y1 = [ 0 0 0 0]'+[-2 0 2];
z1 = [-1 -1 1 1]'*[1 1 1];
c1 = [ 1 1 1 1]'*[1 1 1];
N = 100;
t = linspace(0, 2*pi, N)';
x0 = 4+cos(t);
z0 = sin(t);
y0 = zeros(size(x0));

patch(x1, y1, z1, c1, 'FaceAlpha', 0.1); hold on;
plot3(x0, y0, z0, 'b-', 'LineWidth', 2); hold off;
xlabel('x'); ylabel('y'); zlabel('z');
axis equal; grid on; view(-37.5,30);
%% 
figure;
K = 50; % 회전각의 갯수
r = linspace(0, 2*pi, K); % 회전 각도
c = cos(r);
s = sin(r);
X = x0 * c;
Y = x0 * s;
Z = repmat(z0, 1,K);
plot3(X,Y,Z);
xlabel('x'); ylabel('y'); zlabel('z');
axis equal; grid on;
%%
figure;
s = surf( X, Y, Z, 'EdgeColor',"None" );
grid on; axis equal;
xlabel('x'); ylabel('y'); zlabel('z');
%% 도넛 90도로 세우면서 색깔 유지하기
figure;
%CData(컬러값)을 Z로 설정함으로써 색깔을 유지한다. 
surf( X, Z, Y, 'EdgeColor',"None",'CData',Z );
grid on; axis equal;
xlabel('x'); ylabel('y'); zlabel('z');

%% 도넛 45도로 기울이기
figure;
%각을 45도로 지정 후 x축을 기준으로 돌리기 위한 회전행렬 정의 
th= pi/4; 
R = [0 cos(th) -sin(th); 1 0 0; 0 sin(th) cos(th)];
%행렬곱 연산을 하기 위해 행렬V를 새롭게 정의하여 원래 도넛에다가 곱한다.
V = [X(:) Y(:) Z(:)];
V = V * R;
%원래 도넛 사이즈와 동일하게 맞춰주기 위한 reshape
Xr = reshape(V(:,1), size(X));
Yr = reshape(V(:,2), size(Y));
Zr = reshape(V(:,3), size(Z));

surf(Xr, Zr, Yr, 'EdgeColor', 'None');
xlabel('x'); ylabel('y'); zlabel('z');
%% 도넛 위에 도넛 올리기
figure;

surf( X, Y, Z, 'EdgeColor',"None",'CData',Z);
hold on;
%도넛의 높이가 2이므로 2만큼 위로 올려서 도넛을 하나 더 만든다.
surf( X, Y, Z+2, 'EdgeColor',"None",'CData',Z);
grid on; axis equal;
xlabel('x'); ylabel('y'); zlabel('z');
%% 도넛안에 작은 도넛 넣기
figure;

surf( X, Y, Z, 'EdgeColor',"None");
hold on;
%원래 도넛 크기 절반에 해당하는 도넛을 만든다. 
surf( X/2, Y/2, Z/2, 'EdgeColor',"None",'CData',Z);
grid on; axis equal;
xlabel('x'); ylabel('y'); zlabel('z');