arr = randperm(9, 9); % 1부터 9까지의 중복되지 않는 랜덤한 숫자 배열 생성

fig = figure;
axis([1 3 1 3]);
axis off;

a = 0;

% 초기 숫자 표시
for i = 3:-1:1
    for k = 1:3
        a = a + 1;
        hold on;
        text(k, i, num2str(arr(a)), 'HorizontalAlignment', 'center', 'FontSize', 30);
    end
end

% 타이머 설정
t = timer;
t.Period = 1;
t.ExecutionMode = 'fixedRate';
t.TimerFcn = @change_num;
t.StopFcn = @(~,~) delete(fig); % 창이 닫힐 때 타이머를 멈추기 위해 설정
set(fig, 'CloseRequestFcn', @(~,~) stop(t));
% 타이머 시작
start(t);

% 숫자 변경 함수
function change_num(~, ~)
    a = 0;
    arr = randperm(9, 9);
    
    % 숫자 업데이트
    ax = gca; % 현재 축 가져오기
    cla(ax); % 현재 축 지우기
    
    axis(ax, [1 3 1 3]);
    axis(ax, 'off');
    
    for i = 3:-1:1
        for k = 1:3
            a = a + 1;
            hold on;
            text(ax, k, i, num2str(arr(a)), 'HorizontalAlignment', 'center', 'FontSize', 30);
        end
    end
end

