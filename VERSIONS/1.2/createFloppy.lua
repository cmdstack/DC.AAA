term.clear()
term.setCursorPos(1,1)
write('username: ')
user = read()
write('\npassword: ')
pass = read('*')
write('\n\n       [top,bottom,left,right,front,back]\n\nside:')
side = read()
write('\n\n              (Enter for default)\n\nkeyPath[disk/]:')
path = read()
if not path or path == nil or path == "" then path = 'aaa.dc' end
print('\n\n        user: '..user..' @ '..side..':disk/'..path..'\n')
disk.setLabel(side,user)
local tbl = {authentication = pass}
local file = fs.open(disk.getMountPath(side)..'/'..path,'w')
file.write(textutils.serialize(tbl))
file.close()
disk.eject(side)