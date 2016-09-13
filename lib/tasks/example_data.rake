namespace :example_data do
  namespace :load do
    desc 'Load example jobs data'
    task :jobs => :environment do |task|
      jobs = YAML.load_file('lib/data/jobs.yml')
      Job.create(jobs)
    end
  end
end
