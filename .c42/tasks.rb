DB_NAME = 'demo'.freeze
URL = 'demo.test'.freeze

SHELL = '/bin/bash'.freeze
COMPOSER = 'docker-compose run --rm composer'.freeze
CAKE_SHELL = 'docker-compose run --rm web bin/cake'.freeze
TEST = 'docker-compose run --rm web vendor/bin/phpunit'.freeze

desc 'mysql:console', 'Lance la console mysql'
DB_EXEC = 'docker exec -i $(docker-compose ps -q db | sed -n 1p) /bin/bash -c '.freeze
shell_task 'mysql:console', "#{DB_EXEC} 'mysql -uroot -proot #{DB_NAME}'"

desc 'docker:run', 'Lance docker-compose up'
shell_task 'docker:run', 'docker-compose up -d'

desc 'docker:restart', 'Lance docker-compose restart'
shell_task 'docker:restart', 'docker-compose restart'

desc 'composer', 'Lance composer'
shell_task 'composer', COMPOSER

desc 'cu', 'Lance composer'
shell_task 'composer', "#{COMPOSER} update"

desc 'cake', 'Lance bin/cake'
shell_task 'cake', CAKE_SHELL

desc 'cake:migrate', 'Execute les migrations de cake'
shell_task 'cake:migrate', "#{CAKE_SHELL} migrations migrate"

desc 'cake:cache:clean', 'Vide le cache'
task 'cake:cache:clean' do
  %w[persistent models views twigView].each { |f|
    run("sudo rm -rf tmp/cache/#{f}/*")
  }
  run("sudo rm -rf tmp/debug_kit.sqlite")
end

desc 'tests', 'Lance les tests unitaire de cake'
shell_task 'tests', TEST

desc 'install', 'Installe le projet'
task :install do
    info('Start docker')
    invoke 'docker:run', []

    info('Composer install')
    invoke 'composer', ['install']
end
