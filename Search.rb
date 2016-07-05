  $basedir=Tk.chooseDirectory('initialdir'=>'C:\\')
  if $searchtype == 'file'
    b = $searchdeep.to_i
    files1 = 1.times.flat_map {Dir.glob("#{$basedir}#{$pattern}").select {|f| File.file? f}}#исключительный случай
    files2 = b.times.flat_map {|level| Dir.glob("#{$basedir}*#{'/*' *level}/#{$pattern}").select {|f| File.file? f}}
    f3 = files1 + files2
    puts $sql_name = f3
    puts $line22
    puts $sql_size = f3.map {|f| File.size? f}
    puts $line23
    puts $sql_md5 =  f3.map {|f| Digest::MD5.hexdigest f}
    #puts f3.map {|f| File.stat f} #В теории должно показать права доступа, но лень проверять в Debian
  end
  if $searchtype == 'folder'
    b = $searchdeep.to_i
    folders1 = 1.times.flat_map {Dir.glob("#{$basedir}#{$pattern}").select {|f| File.directory? f}}
    folders2 =  b.times.flat_map {|level| Dir.glob("#{$basedir}*#{'/*' *level}/#{$pattern}").select {|f| File.directory? f}}
    fold3 = folders1 + folders2
    puts $sql_fname = fold3
  end

load 'mysql.rb'


