local remote_from = function(remote)
  return function(repo)
    return remote .. repo
  end
end

return {
  gh = remote_from 'https://github.com/',
}
