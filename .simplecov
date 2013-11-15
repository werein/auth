SimpleCov.start('rails') do
  add_group "Cells", "app/cells"
  add_group "Dummy", "test/dummy"
  add_group "Config", "#{SimpleCov.root}/config"
  filters.clear
  add_filter do |src|
    !(src.filename =~ /^#{SimpleCov.root}/) unless src.filename =~ /\/auth\//
  end
end