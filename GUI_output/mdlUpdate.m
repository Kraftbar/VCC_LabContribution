
%=============================================================================
% mdlUpdate
% Handle discrete state updates, sample time hits, and major time step
% requirements.
%=============================================================================

function sys = mdlUpdate(t, u, ~, block)

% always return empty, there are no states
sys = [];

% Locate the figure window associated with this block.  If it's not a valid
% handle (it may have been closed by the user), then return.
FigHandle = Get_3GFigure(block);
if ~ishandle(FigHandle)
   return;
end

% get UserData of the figure
ud = get(FigHandle, 'UserData');

if ~isnumeric(ud.G1_Line)    % HG2
  % plot the input lines
  addpoints(ud.G1_Line, t, u(1));
  addpoints(ud.G2_Line, t, u(2));
  addpoints(ud.G3_Line, t, u(3));

else                         % HG1
  % store data points to UserData
  if isempty(ud.XData)
    x_data  = [t t];
    y1_data = [u(1) u(1)];
    y2_data = [u(2) u(2)];
    y3_data = [u(3) u(3)];
  else
    x_data  = [ud.XData(end) t];
    y1_data = [ud.Y1Data(end) u(1)];
    y2_data = [ud.Y2Data(end) u(2)];
    y3_data = [ud.Y3Data(end) u(3)];
  end

  % plot the input lines
  set(ud.G1_Line, ...
      'Xdata', x_data, ...
      'Ydata', y1_data);

  set(ud.G2_Line, ...
     'Xdata', x_data, ...
     'Ydata', y2_data);

  set(ud.G3_Line, ...
     'Xdata', x_data, ...
     'Ydata', y3_data);

  % update the stored data points
  ud.XData(end+1)  = t;
  ud.Y1Data(end+1) = u(1);
  ud.Y2Data(end+1) = u(2);
  ud.Y3Data(end+1) = u(3);
  set(FigHandle, 'UserData', ud);

  % flush event queue
  drawnow;

end

% end mdlUpdate
