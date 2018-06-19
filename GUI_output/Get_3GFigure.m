%=============================================================================
% Get_3GFigure
% Retrieves the figure window associated with this S-function block
% from the block's parent subsystem's UserData.
%=============================================================================

function FigHandle = Get_3GFigure(block)

  block = get_param(block, 'Parent');

FigHandle = get_param(block, 'UserData');
if isempty(FigHandle)
  FigHandle = -1;
end

% end Get_3GFigure

