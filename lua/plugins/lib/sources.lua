local gitserver = function(remote)
  return function(repo)
    return remote .. repo
  end
end

return {
  gh = gitserver 'https://github.com/'
}
