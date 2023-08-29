#setup nginx

package {
    'nginx':
    ensure => installed,
}

file {'/var/www/html/index.html':
    content => 'Hello World!',
    owner   => '/var/www'
    user    => '/var/www'
}

file_line {'configure redirection':
    path  =>  '/etc/nginx/sites-available/default',
    after =>  'server_name _;',
    line  =>  "\n\tlocation /redirect_me {\n\t\treturn 301 https://youtu.be/dQw4w9WgXcQ;\n\t}\n",
}

service {'nginx':
    ensure => running,
}