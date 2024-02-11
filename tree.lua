local tree ={}
tree.open = function ()
   require'bufferline.state'.set_offset(31, 'FileTree')
   require'chadtree'.find_file(true)
end

tree.close = function ()
   require'bufferline.state'.set_offset(0)
   require'chadtree'.close()
end

return tree 
