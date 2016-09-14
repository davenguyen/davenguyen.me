namespace :example_data do
  namespace :load do
    desc 'Load example jobs data'
    task :jobs => :environment do |task|
      ActiveRecord::Base.transaction do
        jobs = YAML.load_file('lib/data/jobs.yml')
        jobs.each do |job|
          j = Job.create(job.except('skills'))

          job['skills'].each_with_index do |skill, i|
            JobSkill.create(
              job: j,
              skill: Skill.find_by(name: skill),
              sequence: i
            )
          end
        end
      end
    end

    desc 'Load example skills data'
    task :skills => :environment do |task|
      ActiveRecord::Base.transaction do
        categories = YAML.load_file('lib/data/skills.yml')

        categories.each_with_index do |category, i|
          c = Skill.create(name: category['name'], sequence: i)

          next unless category['skills'].present?
          category['skills'].each_with_index do |skill, j|
            Skill.create(name: skill['name'], parent: c, sequence: j)
          end
        end
      end
    end
  end
end
