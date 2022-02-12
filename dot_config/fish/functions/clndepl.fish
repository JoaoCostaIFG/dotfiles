function clndepl
  yes | clndep
  while [ "$status" -eq 0 ]
    yes | clndep
  end
end

