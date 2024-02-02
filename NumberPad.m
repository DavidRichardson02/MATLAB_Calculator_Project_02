classdef NumberPad
    % NumberPad creates and manages the number pad for the calculator.
    % It initializes buttons for digits and handles their event callbacks,
    % allowing users to input numbers into the calculator by clicking buttons.

    properties
        Parent % Parent UI container
        InputExpr % Reference to the input expression field
    end

    methods
        function obj = NumberPad(parent, inputExpr)
            % Constructor for the NumberPad class. Initializes number buttons.
            obj.Parent = parent;
            obj.InputExpr = inputExpr;
            %% Create number buttons
            obj.createButtons();
        end
        
        function createButtons(obj)
            % Dynamically creates buttons for digits 1-9, 0, '.', and '-' on the calculator UI.
            %% Initial setup for button positioning
            % Assuming initPos is the bottom-left starting point for the first button
            initPos = [75, 125, 55, 45]; % Move up to be just below the display
            xOffset = 57.5; % Horizontal offset between buttons
            yOffset = 50; % Vertical offset between buttons
            numbers = '7894561230.-'; % Arrange as on a calculator
            
            %% Create buttons in a 4x3 grid
            for row = 1:4
                for col = 1:3
                    num = numbers((row-1)*3 + col);
                    pos = [initPos(1) + (col - 1) * xOffset, ...
                           initPos(2) + (3 - row) * yOffset, ...
                           initPos(3), initPos(4)];
                    %% Button creation with callback to append number
                    uibutton(obj.Parent, 'Text', num, 'Position', pos, ...
                             'ButtonPushedFcn', @(btn,event) obj.appendToExpression(num));
                end
            end
        end
        
        function appendToExpression(obj, char)
            % Appends the clicked number or character to the calculator's input expression.
            %% Append character to input field
            currentExpr = obj.InputExpr.Value;
            obj.InputExpr.Value = [currentExpr, char];
        end
    end
end




