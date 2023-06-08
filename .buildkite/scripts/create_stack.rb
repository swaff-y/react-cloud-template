#!/usr/local/bin/ruby -w

require 'yaml'

def check_results(data)
  return if data.nil?

  application = ENV.fetch('APPLICATION', 'react-cloud-template')
  stage = ENV.fetch('STAGE', 'dev')
  region = ENV.fetch('REGION', 'ap-southeast-2')
  branch = ENV.fetch('BUILDKITE_BRANCH', 'dev')
  bucket_name = "#{application}-#{branch.downcase}" if stage == 'dev'
  bucket_name = application if stage == 'prod'

  data['service'] = application unless stage == 'dev'
  data['service'] = "application-#{branch}" if stage == 'dev'
  data['provider']['stage'] = stage
  data['provider']['region'] = region
  data['custom']['bucketName'] = bucket_name

  File.write('serverless.yml', data.to_yaml)
rescue StandardError => e
  puts "Error: #{e.message}"
  exit(1)
end

#read file contents
if ARGV[0]
  file = File.read("./#{ARGV[0]}")
  check_results(YAML.parse(file)&.to_ruby)
else
  raise StandardError, 'A data file is required'
  exit(1)
end