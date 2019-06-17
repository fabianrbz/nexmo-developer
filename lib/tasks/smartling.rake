namespace :smartling do

  desc 'Update a translation file for a given locale'
  task :update_translation, [:file, :locale] => [:environment] do |t, args|
    smartling = SmartlingAPI.new(
      user_id: ENV['SMARTLING_USER_ID'],
      user_secret: ENV['SMARTLING_USER_SECRET'],
      project_id: ENV['SMARTLING_PROJECT_ID'],
    )

    puts 'Updating the file...'
    smartling.download_translated(filename: args[:file], locale: args[:locale])
    puts 'Done!'
  end

  desc 'Upload a file'
  task :upload_file, [:file, :locale] => [:environment] do |t, args|
    #be rake "smartling:upload_file[_documentation/en/messages/overview.md,en]"
    smartling = SmartlingAPI.new(
      user_id: ENV['SMARTLING_USER_ID'],
      user_secret: ENV['SMARTLING_USER_SECRET'],
      project_id: ENV['SMARTLING_PROJECT_ID'],
    )

    puts 'Uploading the file...'
    smartling.upload(args[:file])
    puts 'Done!'
  end

  desc 'Downloading a translation for a given locale'
  task :download_translation, [:file, :locale, :type] => [:environment] do |t, args|
    #be rake "smartling:download_translation[_documentation/en/messages/overview.md,en-US,pseudo]"
    smartling = SmartlingAPI.new(
      user_id: ENV['SMARTLING_USER_ID'],
      user_secret: ENV['SMARTLING_USER_SECRET'],
      project_id: ENV['SMARTLING_PROJECT_ID'],
    )

    puts 'Downloading the translation...'
    data = smartling.download_translated(filename: args[:file], locale: args[:locale], type: args[:type])
    # TODO: store response in disk
    puts 'Done!'
  end

  desc 'Find documents that need translations'
  task :translations_due => :env do
  end

end
