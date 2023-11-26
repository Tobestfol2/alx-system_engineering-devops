class ssh_client_config {
  # Ensure password authentication is disabled
  file_line { 'disable_password_auth':
    path   => '/etc/ssh/sshd_config',
    line   => 'PasswordAuthentication no',
    match  => '^#?PasswordAuthentication',
    ensure => present,
  }

  # Ensure the IdentityFile is configured
  file_line { 'configure_identity_file':
    path   => '~/.ssh/config',
    line   => 'IdentityFile ~/.ssh/school',
    match  => '^#?IdentityFile',
    ensure => present,
  }
}

class { 'ssh_client_config': }
