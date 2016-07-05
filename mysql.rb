client = Mysql2::Client.new(
    host: 'localhost',
    username: 'root',
    database: 'my_db',
    password: 'rootpass')

client.query('CREATE TABLE IF NOT EXISTS info (id INT PRIMARY KEY AUTO_INCREMENT,
      type VARCHAR(300), name VARCHAR(300), size INT, md5 VARCHAR(300))')

if $searchtype == 'file'
  $sql_name.length.times do |i|
     client.query ("INSERT INTO INFO VALUES ( 0, 'file', '#{$sql_name[i]}', #{$sql_size[i]}, '#{$sql_md5[i]}')")
  end end
if $searchtype == 'folder'
  $sql_fname.length.times do |i|
     client.query ("INSERT INTO INFO VALUES ( 0, 'folder', '#{$sql_fname[i]}', '0', '-')")
  end end

puts client.query('SELECT * FROM info')

STDIN.getc