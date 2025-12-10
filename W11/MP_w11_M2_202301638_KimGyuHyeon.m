figure;
%타워의 높이에 따른 반지름을 계산하기위한 벡터 y2를 정의
y2 = linspace(0,23.4,24);

%y2와 같은 사이즈의 영벡터 r을 정의하고 
%for loop를 이용하여 계산한 반지름 값을 r에다가 저장
r = zeros(size(y2));
for i = 1:length(y2)
    r(i) = ui_tower_radius(y2(i));
end

%실린더 함수를 이용해 타워 그리기
[X, Y, Z] = cylinder(r, 24);
%높이 10으로 맞추기
Z=Z*10;
%지붕을 평평하게 하기 위해 별도로 좌표를 하나 더 찍어준다.
X(25,:)=0;
Y(25,:)=0;
Z(25,:)=10;
surf(X, Y, Z);
xlabel('x'); ylabel('y'); zlabel('z');
colormap jet;
axis equal;