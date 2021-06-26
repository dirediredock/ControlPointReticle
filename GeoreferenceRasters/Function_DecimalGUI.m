function outText=DecimalGUI(~,event)

pos=get(event,'Position');
  if length(pos)==3 % For scatter3 or plot3
    outText={sprintf('X: %.10f',pos(1)), ...
             sprintf('Y: %.10f',pos(2)), ...
             sprintf('Z: %.10f',pos(3))};
  else % For any other non-3D use
    outText={sprintf('X: %.10f',pos(1)), ...
             sprintf('Y: %.10f',pos(2))};
  end
end