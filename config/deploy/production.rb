# conohaのサーバーのIP、ログインするユーザー名、サーバーの役割
# xxxの部分はサーバーのIPアドレス
# 10022はポートを変更している場合。通常は22
server '118.27.37.130', user: 'taka', roles: %w{app db web}, port: 10022

#デプロイするサーバーにsshログインする鍵の情報。サーバー編で作成した鍵のパス
set :ssh_options, keys: '~/.ssh/conoha/id_rsa'

set :stage, :production
set :rails_env, 'production'

set :branch, 'master'

set :migration_role, 'db'